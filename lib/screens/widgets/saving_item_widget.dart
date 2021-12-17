import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:walleto/data/model/category.dart';
import 'package:walleto/data/model/saving_target.dart';
import 'package:walleto/shared/theme.dart';
import 'package:walleto/utils/helpers_utils.dart';

class SavingItemWidget extends StatelessWidget {
  final SavingTarget saving;
  final Function()? onTap;

  SavingItemWidget({
    required this.saving,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    String nominalString = NumberFormat.currency(
      locale: 'id_ID',
      decimalDigits: 0,
      symbol: "Rp ",
    ).format(
      getNominalPerDay(
        saving.nominal,
        saving.period,
        saving.durationType,
      ),
    );

    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                        color: kBlueColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: SvgPicture.asset(
                        saving.category.icon,
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
                            saving.nameTarget,
                            style: blueTextSyle.copyWith(
                              fontSize: 16.0,
                              fontWeight: bold,
                            ),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Row(
                            children: [
                              Text(
                                (saving.currentMoney == saving.nominal)
                                    ? "Completed"
                                    : "On Progress",
                                style: blackTextStyle.copyWith(
                                  fontSize: 12,
                                  color: (saving.currentMoney == saving.nominal)
                                      ? kGreenColor
                                      : kYellowColor,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: 3,
                                height: 3,
                                decoration: const BoxDecoration(
                                  color: kLightGreyColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${saving.period}, ${saving.durationType}",
                                style: greyTextStyle.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                            ],
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
                        ).format(saving.nominal),
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
                        generateZeroDigit(nominalString),
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
      ),
    );
  }
}


//   return Container(
  //     margin: const EdgeInsets.only(bottom: 8.0),
  //     child: Material(
  //       color: kWhiteColor,
  //       shadowColor: Colors.grey[100],
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(15.0),
  //       ),
  //       child: Container(
  //         padding: const EdgeInsets.symmetric(
  //           vertical: 14.0,
  //           horizontal: 16.0,
  //         ),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Row(
  //               children: [
  //                 Container(
  //                   width: 45,
  //                   height: 45,
  //                   padding: const EdgeInsets.all(6.0),
  //                   decoration: BoxDecoration(
  //                     color: Colors.green,
  //                     borderRadius: BorderRadius.circular(10.0),
  //                   ),
  //                   child: SvgPicture.asset(
  //                     saving.category.icon,
  //                     width: 50,
  //                     height: 50,
  //                   ),
  //                 ),
  //                 Container(
  //                   margin: const EdgeInsets.only(left: 8.0),
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     mainAxisSize: MainAxisSize.min,
  //                     children: [
  //                       Text(
  //                         saving.nameTarget,
  //                         style: blueTextSyle.copyWith(
  //                           fontSize: 16.0,
  //                           fontWeight: bold,
  //                         ),
  //                       ),
  //                       const SizedBox(
  //                         height: 4.0,
  //                       ),
  //                       Row(
  //                         children: [
  //                           Text(
  //                             (saving.currentMoney == saving.nominal)
  //                                 ? "Completed"
  //                                 : "On Progress",
  //                             style: blackTextStyle.copyWith(
  //                               fontSize: 11,
  //                               color: (saving.currentMoney == saving.nominal)
  //                                   ? kGreenColor
  //                                   : kYellowColor,
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             width: 5,
  //                           ),
  //                           Container(
  //                             width: 3,
  //                             height: 3,
  //                             decoration: const BoxDecoration(
  //                               color: kLightGreyColor,
  //                               shape: BoxShape.circle,
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             width: 5,
  //                           ),
  //                           Text(
  //                             "$saving.period $saving.durationType",
  //                             style: greyTextStyle.copyWith(
  //                               fontSize: 11,
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             const Spacer(
  //               flex: 1,
  //             ),
  //             Container(
  //               margin: const EdgeInsets.only(left: 8.0),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   Text(
  //                     NumberFormat.currency(
  //                       locale: 'id_ID',
  //                       decimalDigits: 0,
  //                       symbol: "Rp ",
  //                     ).format(saving.nominal),
  //                     style: greyTextStyle.copyWith(
  //                       fontSize: 14,
  //                       color: kGreenColor,
  //                     ),
  //                   ),
  //                   const SizedBox(
  //                     height: 4,
  //                   ),
  //                   Text(
  //                     generateZeroDigit(nominalString),
  //                     style: greyTextStyle.copyWith(
  //                       fontSize: 11,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
