import 'package:flutter/material.dart';

class TimetablePage extends StatelessWidget {
  final timetable = [
    {"time": "08:00 - 09:00", "subject": "Mathematics", "teacher": "Mr. Sharma"},
    {"time": "09:00 - 10:00", "subject": "Physics", "teacher": "Ms. Verma"},
    {"time": "10:15 - 11:15", "subject": "English", "teacher": "Mrs. Gupta"},
    {"time": "11:30 - 12:30", "subject": "Computer", "teacher": "Mr. Jain"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: const Text("Today's Timetable",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 34, 99, 239),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: timetable.length,
        itemBuilder: (context, index) {
          final item = timetable[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.indigo.shade400,const Color.fromARGB(255, 34, 99, 239),],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.indigo.withOpacity(0.3),
                  blurRadius: 12,
                  offset: Offset(0, 6),
                )
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.book, color: Colors.indigo),
              ),
              title: Text(
                item["subject"]!,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "${item["time"]} • ${item["teacher"]}",
                style: const TextStyle(color: Colors.white70),
              ),
            ),
          );
        },
      ),
    );
  }
}
