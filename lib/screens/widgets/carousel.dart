import 'package:flutter/material.dart';
import 'package:walleto/data/model/wallet.dart';
import 'package:walleto/screens/wallet/wallet_detail_page.dart';
import 'package:walleto/shared/theme.dart';

class Carousel extends StatelessWidget {
  final Wallet wallet;

  const Carousel({required this.wallet});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WalletDetailPage();
        }));
      },
      child: Container(
        // margin: EdgeInsets.only(right: 20),
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
                  Icon(
                    Icons.attach_money_rounded,
                    size: 20.0,
                    color: Colors.amber,
                  ),
                  Text(
                    "RP. " + wallet.nominal.toString(),
                    style: whiteTextStyle.copyWith(
                        fontSize: 15, fontWeight: regular),
                  )
                ],
              ),
              SizedBox(height: 10),
              Text(
                wallet.name,
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
