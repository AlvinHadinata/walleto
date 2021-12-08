import 'package:flutter/material.dart';

class Category {
  String name;
  String description;
  String imgUrl;
  int nominal;
  Color color;
  IconData icon;

  Category(
      {required this.name,
      required this.description,
      required this.imgUrl,
      required this.nominal,
      required this.color,
      required this.icon});

  static List<Category> categories = [
    Category(
      name: 'Makanan',
      description: 'Test',
      imgUrl: 'https://awsimages.detik.net.id/community/media/visual/2021/04/22/5-makanan-enak-dari-indonesia-dan-malaysia-yang-terkenal-enak-5.jpeg?w=700&q=90',
      nominal: 10,
      color: Colors.red,
      icon: Icons.category
    ),
    Category(
        name: 'Makanan',
        description: 'Test',
        imgUrl: 'https://awsimages.detik.net.id/community/media/visual/2021/04/22/5-makanan-enak-dari-indonesia-dan-malaysia-yang-terkenal-enak-5.jpeg?w=700&q=90',
        nominal: 10,
        color: Colors.red,
        icon: Icons.category
    ),
    Category(
        name: 'Makanan',
        description: 'Test',
        imgUrl: 'https://awsimages.detik.net.id/community/media/visual/2021/04/22/5-makanan-enak-dari-indonesia-dan-malaysia-yang-terkenal-enak-5.jpeg?w=700&q=90',
        nominal: 10,
        color: Colors.red,
        icon: Icons.category
    ),
    Category(
        name: 'Makanan',
        description: 'Test',
        imgUrl: 'https://awsimages.detik.net.id/community/media/visual/2021/04/22/5-makanan-enak-dari-indonesia-dan-malaysia-yang-terkenal-enak-5.jpeg?w=700&q=90',
        nominal: 10,
        color: Colors.red,
        icon: Icons.category
    ),
    Category(
        name: 'Makanan',
        description: 'Test',
        imgUrl: 'https://awsimages.detik.net.id/community/media/visual/2021/04/22/5-makanan-enak-dari-indonesia-dan-malaysia-yang-terkenal-enak-5.jpeg?w=700&q=90',
        nominal: 10,
        color: Colors.red,
        icon: Icons.category
    )
  ];
}
