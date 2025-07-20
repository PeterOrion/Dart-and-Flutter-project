import 'package:flutter/material.dart';
import '../models/clinic.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ClinicCard extends StatelessWidget {
  final Clinic clinic;

  const ClinicCard({required this.clinic});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(clinic.name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(clinic.address),
            SizedBox(height: 4),
            Row(
              children: [
                RatingBarIndicator(
                  rating: clinic.rating,
                  itemCount: 5,
                  itemSize: 20,
                  itemBuilder: (_, __) => Icon(Icons.star, color: Colors.amber),
                ),
                SizedBox(width: 10),
                Text(clinic.price, style: TextStyle(color: Colors.green)),
              ],
            ),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Navigate to detail screen (coming later)
        },
      ),
    );
  }
}
