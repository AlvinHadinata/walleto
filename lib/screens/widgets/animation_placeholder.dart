import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:walleto/shared/theme.dart';

class AnimationPlaceholder extends StatelessWidget {
  final String animation;
  final String text;
  AnimationPlaceholder({
    required this.animation,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            animation,
            width: 150.0,
            height: 150.0,
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(
                fontSize: 18.0,
                fontWeight: bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
