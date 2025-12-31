import 'package:flutter/material.dart';

class AssignmentsPage extends StatelessWidget {
  final assignments = [
    {"title": "Maths Worksheet", "subject": "Mathematics", "due": "15 Jan"},
    {"title": "Physics Lab File", "subject": "Physics", "due": "18 Jan"},
    {"title": "English Essay", "subject": "English", "due": "20 Jan"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        title: const Text("Assignments",style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: const Color.fromARGB(255, 34, 99, 239),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: assignments.length,
        itemBuilder: (context, index) {
          final a = assignments[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 5))
              ],
            ),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.assignment, color: Color.fromARGB(255, 34, 99, 239),),
              ),
              title: Text(
                a["title"]!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(a["subject"]!),
              trailing: Chip(
                label: Text("Due ${a["due"]}"),
                backgroundColor: Colors.red.shade50,
                labelStyle: const TextStyle(color: Colors.red),
              ),
            ),
          );
        },
      ),
    );
  }
}
