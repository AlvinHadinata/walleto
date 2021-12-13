import 'package:flutter/material.dart';
import 'package:walleto/shared/theme.dart';

import 'category.dart';

class Wallet {
  final int? id;

  final String name;

  final int nominal;

  final int currentMoney;

  // final Category category;

  final String decription;

  // final int createdAt;

  Wallet({
    this.id,
    required this.name,
    required this.nominal,
    required this.currentMoney,
    // required this.category,
    required this.decription,
    // required this.createdAt,
  });

  static List<Wallet> wallet = [
    Wallet(
        name: "Investasi",
        nominal: 100000,
        currentMoney: 1000,
        decription: "Better Future"),
    Wallet(
        name: "Investasi",
        nominal: 100000,
        currentMoney: 1000,
        decription: "Better Future"),
    Wallet(
        name: "Investasi",
        nominal: 100000,
        currentMoney: 1000,
        decription: "Better Future"),
  ];
}

class AllWallet {
  final String allname;
  final String allsaldo;

  AllWallet({
    required this.allname,
    required this.allsaldo,
  });

  static List<AllWallet> allwallet = [
    AllWallet(
        allname: 'Saldo Wallet',
        allsaldo: 'Rp'
    ),
    AllWallet(
        allname: 'Saldo Saving',
        allsaldo: 'Rp')
  ];
}
