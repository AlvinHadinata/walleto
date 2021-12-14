import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:walleto/data/model/history_target.dart';
import 'package:walleto/data/model/history_wallet.dart';
import 'package:walleto/shared/theme.dart';

class ItemList extends StatelessWidget {
  final HistoryTarget target;

  const ItemList({required this.target});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Material(
        color: kGradasi,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: kGreenColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: SvgPicture.asset(
                      "assets/ic_other.svg",
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          target.nameTarget,
                          style: blueTextSyle.copyWith(
                            fontSize: 16.0,
                            fontWeight: bold,
                          ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          target.description,
                          style: greyTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(
                flex: 1,
              ),
              Container(
                margin: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      NumberFormat.currency(
                        locale: 'id_ID',
                        decimalDigits: 0,
                        symbol: "Rp ",
                      ).format(target.nominal),
                      style: greyTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                        color: kGreenColor,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      target.createdAt.toString(),
                      style: greyTextStyle.copyWith(
                        fontSize: 12,
                      ),
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
