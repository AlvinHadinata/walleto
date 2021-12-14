import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:walleto/data/model/wallet.dart';
import 'package:walleto/screens/wallet/wallet_detail_page.dart';
import 'package:walleto/shared/theme.dart';

class Carousel extends StatelessWidget {
  final Wallet wallet;
  final Function()? onTap;
  const Carousel({required this.wallet, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: kBlueColor,
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
                  SvgPicture.asset(
                    wallet.category.icon,
                    width: 30.0,
                    height: 30.0,
                  ),
                  Text(
                    "RP. " + wallet.nominal.toString(),
                    style: whiteTextStyle.copyWith(
                        fontSize: 15, fontWeight: regular),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text(
                wallet.name,
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
              ),
              Text(
                'Klik untuk detail',
                style: whiteTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
