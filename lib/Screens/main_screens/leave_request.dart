import 'package:flutter/material.dart';

class LeaveRequestPage extends StatelessWidget {
  final reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
       appBar: AppBar(
        title: const Text("Leave Application",style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: const Color.fromARGB(255, 34, 99, 239),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: reasonController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Enter reason for leave",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16)),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  backgroundColor: const Color.fromARGB(255, 34, 99, 239),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Leave Request Submitted")),
                  );
                },
                child: const Text(
                  "Submit Request",
                  style: TextStyle(fontSize: 16,color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
