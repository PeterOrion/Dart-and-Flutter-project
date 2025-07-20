import 'package:flutter/material.dart';
import '../models/clinic.dart';
import '../widgets/clinic_card.dart';

class HomeScreen extends StatelessWidget {
  final List<Clinic> clinics = [
    Clinic(
      name: 'Hope Medical Center',
      address: 'Kahawa West, Nairobi',
      price: 'Free',
      rating: 4.5,
    ),
    Clinic(
      name: 'Sunrise Clinic',
      address: 'Githurai 45',
      price: 'KES 500',
      rating: 4.0,
    ),
    Clinic(
      name: 'Healing Hands Hospital',
      address: 'Zimmerman',
      price: 'KES 800',
      rating: 3.8,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Clinic Finder')),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: clinics.length,
        itemBuilder: (context, index) {
          return ClinicCard(clinic: clinics[index]);
        },
      ),
    );
  }
}
