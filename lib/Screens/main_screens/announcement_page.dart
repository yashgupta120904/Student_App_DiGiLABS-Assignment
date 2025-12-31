import 'package:flutter/material.dart';

class AnnouncementsPage extends StatelessWidget {
  final notices = [
    {"title": "Final Exams Schedule Released", "date": "12 Jan"},
    {"title": "School Reopens from Monday", "date": "10 Jan"},
    {"title": "Annual Sports Day Notice", "date": "08 Jan"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text("Announcments",style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: const Color.fromARGB(255, 34, 99, 239),
        centerTitle: true,
      ),
      
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notices.length,
        itemBuilder: (context, index) {
          final n = notices[index];
          return Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orange.shade100,
                child: Icon(Icons.campaign, color: const Color.fromARGB(255, 34, 99, 239),),
              ),
              title: Text(
                n["title"]!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Posted on ${n["date"]}"),
            ),
          );
        },
      ),
    );
  }
}
