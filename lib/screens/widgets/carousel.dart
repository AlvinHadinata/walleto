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
              Text('Klik untuk detail',
                style: whiteTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: bold,
                ),)
            ],
          ),
        ),
      ),
    );
  }
}

class Carousel2 extends StatelessWidget {
  final AllWallet allwallet;

  const Carousel2({required this.allwallet});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 100,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              allwallet.allname,
              style: blackTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              allwallet.allsaldo,
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
