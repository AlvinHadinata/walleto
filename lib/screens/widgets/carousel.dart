import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:walleto/data/model/wallet.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    NumberFormat.currency(
                      locale: 'id_ID',
                      decimalDigits: 0,
                      symbol: "Rp ",
                    ).format(wallet.nominal),
                    style: whiteTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    wallet.name,
                    style: whiteTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    'Klik untuk detail',
                    style: lightGreyTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: medium,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
