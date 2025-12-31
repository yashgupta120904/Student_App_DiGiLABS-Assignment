import 'package:flutter/material.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance',style:TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 37, 99, 235),
        elevation: 0,
        centerTitle: true,
      
        
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Summary Stats
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF10B981), Color(0xFF059669)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF10B981).withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatColumn('Total Classes', '48', Colors.white),
                  _buildStatColumn('Present', '44', Colors.green[200]!),
                  _buildStatColumn('Absent', '4', Colors.red[200]!),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Subject-wise Attendance
            const Text(
              'Subject-wise Attendance',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ..._buildAttendanceList(),
            const SizedBox(height: 24),
            // Recent Records
            const Text(
              'Recent Records',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ..._buildRecentRecords(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildAttendanceList() {
    final subjects = [
      {'subject': 'Mathematics', 'attendance': 95},
      {'subject': 'Physics', 'attendance': 88},
      {'subject': 'Chemistry', 'attendance': 92},
      {'subject': 'English', 'attendance': 85},
    ];

    return subjects
        .map((item) {
          int attendance = item['attendance'] as int;
          Color progressColor = attendance >= 90
              ? Colors.green
              : attendance >= 75
                  ? Colors.orange
                  : Colors.red;

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item['subject'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '${attendance}%',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: attendance / 100,
                    minHeight: 8,
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                  ),
                ),
              ],
            ),
          );
        })
        .toList();
  }
List<Widget> _buildRecentRecords() {
    final records = [
      {'date': '28 Dec', 'subject': 'Mathematics', 'status': 'Present'},
      {'date': '27 Dec', 'subject': 'Physics', 'status': 'Absent'},
      {'date': '26 Dec', 'subject': 'Chemistry', 'status': 'Present'},
      {'date': '25 Dec', 'subject': 'English', 'status': 'Present'}
    ];

    return records
        .map((record) {
          bool isPresent = record['status'] == 'Present';
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[200]!),
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      record['subject'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      record['date'] as String,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isPresent
                        ? Colors.green[100]
                        : Colors.red[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    record['status'] as String,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: isPresent ? Colors.green[700] : Colors.red[700],
                    ),
                  ),
                ),
              ],
            ),
          );
        })
        .toList();
  }
}