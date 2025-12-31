import 'package:flutter/material.dart';

class MarksPage extends StatelessWidget {
  const MarksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marks',style:TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 37, 99, 235),
        elevation: 0,
        centerTitle: true,
      
        
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Overall Stats
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFA855F7), Color(0xFF9333EA)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFA855F7).withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatColumn('CGPA', '7.8', Colors.white),
                  _buildStatColumn('Average', '78%', Colors.purple[200]!),
                  _buildStatColumn('Grade', 'A', Colors.white),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Current Semester Marks
            const Text(
              'Current Semester Marks',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ..._buildMarksList(),
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
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildMarksList() {
    final marks = [
      {
        'subject': 'Mathematics',
        'internal': 38,
        'external': 68,
        'total': 106,
        'grade': 'A'
      },
      {
        'subject': 'Physics',
        'internal': 35,
        'external': 65,
        'total': 100,
        'grade': 'A'
      },
      {
        'subject': 'Chemistry',
        'internal': 36,
        'external': 70,
        'total': 106,
        'grade': 'A'
      },
      {
        'subject': 'English',
        'internal': 32,
        'external': 60,
        'total': 92,
        'grade': 'B+'
      },
    ];

    return marks
        .map((mark) {
          String grade = mark['grade'] as String;
          bool isGradeA = grade == 'A';

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[200]!),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      mark['subject'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${mark['total']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: isGradeA
                                ? Colors.green[100]
                                : Colors.blue[100],
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            grade,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: isGradeA
                                  ? Colors.green[700]
                                  : Colors.blue[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Internal (40)',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: (mark['internal'] as int) / 40,
                              minHeight: 6,
                              backgroundColor: Colors.grey[300],
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xFF3B82F6),
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${mark['internal']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'External (60)',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: (mark['external'] as int) / 60,
                              minHeight: 6,
                              backgroundColor: Colors.grey[300],
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xFFA855F7),
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${mark['external']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        })
        .toList();
  }
}
