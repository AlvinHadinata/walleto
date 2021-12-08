import 'package:flutter/material.dart';
import 'package:walleto/data/model/category.dart';
import 'package:walleto/screens/category/add_page.dart';
import 'package:walleto/shared/theme.dart';

class Carousel extends StatelessWidget {
  final Category category;

  const Carousel({required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AddPage(category: category);
        }));
      },
      child: Container(
        // margin: EdgeInsets.only(right: 20),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    category.icon,
                    size: 20.0,
                    color: Colors.amber,
                  ),
                  Text(
                    "RP. " + category.nominal.toString(),
                    style: whiteTextStyle.copyWith(
                        fontSize: 15, fontWeight: regular),
                  )
                ],
              ),
              SizedBox(height: 10),
              Text(
                category.name,
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
              ),
              // Text(
              //   category.description,
              //   style: whiteTextStyle.copyWith(
              //     fontSize: 16,
              //     fontWeight: regular,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
