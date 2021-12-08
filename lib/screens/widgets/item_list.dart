import 'package:flutter/material.dart';
import 'package:walleto/shared/theme.dart';

class ItemList extends StatelessWidget {
  // final Function() onPressed;

  // const ItemList(
  //     {
  //     required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Material(
        color: kWhiteColor,
        shadowColor: Colors.grey[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 14.0,
            horizontal: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Icon(
                      Icons.arrow_upward_rounded,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Investasi",
                          style: blackTextStyle.copyWith(
                              fontSize: 18.0,
                              fontWeight: bold,
                              decoration: TextDecoration.none),
                        ),
                        Text(
                          "22-10-2020",
                          style: blackTextStyle.copyWith(
                              fontSize: 16.0,
                              fontWeight: regular,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "200.0000",
                      style: blueTextSyle.copyWith(
                          fontSize: 18.0,
                          fontWeight: bold,
                          decoration: TextDecoration.none),
                    ),
                    Text(
                      "Cash In",
                      style: blackTextStyle.copyWith(
                          fontSize: 16.0,
                          fontWeight: regular,
                          decoration: TextDecoration.none),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
