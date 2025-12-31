import 'package:flutter/material.dart';

class FeesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
     appBar: AppBar(
        title: const Text("Fees Overview",style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: const Color.fromARGB(255, 34, 99, 239),
        centerTitle: true,
      ),
       
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _feeCard("Total Fees", "₹60,000", Colors.blue),
            _feeCard("Paid Amount", "₹30,000", Colors.green),
            _feeCard("Pending Dues", "₹30,000", Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _feeCard(String title, String amount, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [color.withOpacity(0.5), color.withOpacity(1.0)]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(color: Colors.white, fontSize: 16)),
          Text(amount,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
