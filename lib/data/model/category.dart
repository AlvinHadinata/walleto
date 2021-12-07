import 'package:flutter/material.dart';

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
}
