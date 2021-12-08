import 'package:flutter/material.dart';
import 'package:walleto/shared/theme.dart';

class Category {
  String name;
  String description;
  int nominal;
  Color color;
  IconData icon;

  Category(
      {required this.name,
      required this.description,
      required this.nominal,
      required this.color,
      required this.icon});

  static List<Category> categories = [
    Category(
      name: 'Makanan',
      description: 'Test',
      nominal: 10,
      color: kBlueColor,
      icon: Icons.fastfood
    ),
    Category(
        name: 'Elektronik',
        description: 'Test',
        nominal: 10,
        color: kBlueColor,
        icon: Icons.phone_android
    ),
    Category(
        name: 'Kesehatan',
        description: 'Test',
        nominal: 10,
        color: kBlueColor,
        icon: Icons.medical_services
    ),
    Category(
        name: 'Kendaraan',
        description: 'Test',
        nominal: 10,
        color: kBlueColor,
        icon: Icons.car_rental
    ),
    Category(
        name: 'Lainnnya',
        description: 'Test',
        nominal: 10,
        color: kBlueColor,
        icon: Icons.category
    )
  ];
}
