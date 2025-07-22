import 'package:flutter/material.dart';
import '../models/clinic.dart';
import '../widgets/clinic_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Clinic> allClinics = [
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
    Clinic(
      name: 'Primecare Nairobi',
      address: 'Thika Road',
      price: 'KES 1500',
      rating: 4.2,
    ),
  ];

  String selectedFilter = 'All';

  List<String> filters = ['All', 'Free', 'Affordable'];

  List<Clinic> get filteredClinics {
    if (selectedFilter == 'Free') {
      return allClinics.where((clinic) => clinic.price.toLowerCase() == 'free').toList();
    } else if (selectedFilter == 'Affordable') {
      return allClinics.where((clinic) {
        if (clinic.price.toLowerCase() == 'free') return true;
        final amount = int.tryParse(clinic.price.replaceAll(RegExp(r'[^\d]'), '')) ?? 9999;
        return amount <= 1000;
      }).toList();
    } else {
      return allClinics;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Clinic Finder')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dropdown Filter
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButton<String>(
              value: selectedFilter,
              items: filters.map((filter) {
                return DropdownMenuItem<String>(
                  value: filter,
                  child: Text(filter),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedFilter = value;
                  });
                }
              },
            ),
          ),

          // Clinic List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredClinics.length,
              itemBuilder: (context, index) {
                return ClinicCard(clinic: filteredClinics[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
