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
      onTap: () {},
      child: Container(
        // margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 50.0,
                    height: 40.0,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue.withOpacity(.8),
                        shape: BoxShape.rectangle),
                    child: Icon(
                      category.icon,
                      size: 20.0,
                      color: Colors.amber,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "RP. " + category.nominal.toString(),
                        style: whiteTextStyle.copyWith(
                            fontSize: 15, fontWeight: regular),
                      )
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      category.name,
                      style: whiteTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      category.description,
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: regular,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
