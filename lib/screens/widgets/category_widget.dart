import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:walleto/data/model/category.dart';
import 'package:walleto/shared/theme.dart';

class CategoryWidget extends StatelessWidget {
  Category category;
  Function() onPressed;
  CategoryWidget({required this.category, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 80.0,
          height: 80.0,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: kBlueColor,
              shape: BoxShape.rectangle),
          child: ElevatedButton(
            child: SvgPicture.asset(
              category.icon,
              width: 35,
              height: 35,
            ),
            style: ElevatedButton.styleFrom(
              primary: kBlackSecondary,
              onPrimary: kBlueColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 14.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: onPressed,
          ),
        ),
        const SizedBox(
          height: 6.0,
        ),
        Text(
          category.name,
          style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
        )
      ],
    );
  }
}
