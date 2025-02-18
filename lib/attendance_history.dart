import 'package:flutter/material.dart';
class AttendanceHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance History'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: 4, // Replace with the actual number of attendance records
        itemBuilder: (context, index) {
          return AttendanceCard();
        },
      ),
    );
  }
}

class AttendanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '[MMMMEEEEEd] - [name]', // Replace with actual date and name
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.login, color: Colors.green),
                        SizedBox(width: 8.0),
                        Text('CLOCK IN'),
                      ],
                    ),
                    Text('[jms]', style: TextStyle(color: Colors.grey)), // Replace with actual clock-in time
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.logout, color: Colors.red),
                        SizedBox(width: 8.0),
                        Text('CLOCK OUT'),
                      ],
                    ),
                    Text('-', style: TextStyle(color: Colors.grey)), // Replace with actual clock-out time
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
