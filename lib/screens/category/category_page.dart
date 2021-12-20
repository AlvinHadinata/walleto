import 'package:flutter/material.dart';
import 'package:walleto/data/model/category.dart';
import 'package:walleto/screens/target/target_add_page.dart';
import 'package:walleto/screens/wallet/wallet_add_page.dart';
import 'package:walleto/screens/widgets/category_widget.dart';
import 'package:walleto/shared/theme.dart';

class CategoryPage extends StatelessWidget {
  static const routeName = "/category_page";
  final bool isWallet;
  CategoryPage({required this.isWallet});

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryWidget(
                  category: Category.electronic,
                  onPressed: () {
                    if (!isWallet) {
                      Navigator.pushNamed(
                        context,
                        TargetAddPage.routeName,
                        arguments: Category.electronic,
                      );
                    } else {
                      Navigator.pushNamed(
                        context,
                        WalletAddPage.routeName,
                        arguments: Category.electronic,
                      );
                    }
                  },
                ),
                CategoryWidget(
                  category: Category.food,
                  onPressed: () {
                    if (!isWallet) {
                      Navigator.pushNamed(
                        context,
                        TargetAddPage.routeName,
                        arguments: Category.food,
                      );
                    } else {
                      Navigator.pushNamed(
                        context,
                        WalletAddPage.routeName,
                        arguments: Category.food,
                      );
                    }
                  },
                ),
                CategoryWidget(
                  category: Category.building,
                  onPressed: () {
                    if (!isWallet) {
                      Navigator.pushNamed(
                        context,
                        TargetAddPage.routeName,
                        arguments: Category.building,
                      );
                    } else {
                      Navigator.pushNamed(
                        context,
                        WalletAddPage.routeName,
                        arguments: Category.building,
                      );
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryWidget(
                  category: Category.vehicle,
                  onPressed: () {
                    if (!isWallet) {
                      Navigator.pushNamed(
                        context,
                        TargetAddPage.routeName,
                        arguments: Category.vehicle,
                      );
                    } else {
                      Navigator.pushNamed(
                        context,
                        WalletAddPage.routeName,
                        arguments: Category.vehicle,
                      );
                    }
                  },
                ),
                CategoryWidget(
                  category: Category.vocation,
                  onPressed: () {
                    if (!isWallet) {
                      Navigator.pushNamed(
                        context,
                        TargetAddPage.routeName,
                        arguments: Category.vocation,
                      );
                    } else {
                      Navigator.pushNamed(
                        context,
                        WalletAddPage.routeName,
                        arguments: Category.vocation,
                      );
                    }
                  },
                ),
                CategoryWidget(
                  category: Category.gift,
                  onPressed: () {
                    if (!isWallet) {
                      Navigator.pushNamed(
                        context,
                        TargetAddPage.routeName,
                        arguments: Category.gift,
                      );
                    } else {
                      Navigator.pushNamed(
                        context,
                        WalletAddPage.routeName,
                        arguments: Category.gift,
                      );
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryWidget(
                  category: Category.education,
                  onPressed: () {
                    if (!isWallet) {
                      Navigator.pushNamed(
                        context,
                        TargetAddPage.routeName,
                        arguments: Category.education,
                      );
                    } else {
                      Navigator.pushNamed(
                        context,
                        WalletAddPage.routeName,
                        arguments: Category.education,
                      );
                    }
                  },
                ),
                CategoryWidget(
                  category: Category.health,
                  onPressed: () {
                    if (!isWallet) {
                      Navigator.pushNamed(
                        context,
                        TargetAddPage.routeName,
                        arguments: Category.health,
                      );
                    } else {
                      Navigator.pushNamed(
                        context,
                        WalletAddPage.routeName,
                        arguments: Category.health,
                      );
                    }
                  },
                ),
                CategoryWidget(
                  category: Category.clothes,
                  onPressed: () {
                    if (!isWallet) {
                      Navigator.pushNamed(context, TargetAddPage.routeName,
                          arguments: Category.clothes);
                    } else {
                      Navigator.pushNamed(context, WalletAddPage.routeName,
                          arguments: Category.clothes);
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryWidget(
                  category: Category.pets,
                  onPressed: () {
                    if (!isWallet) {
                      Navigator.pushNamed(
                        context,
                        TargetAddPage.routeName,
                        arguments: Category.pets,
                      );
                    } else {
                      Navigator.pushNamed(
                        context,
                        WalletAddPage.routeName,
                        arguments: Category.pets,
                      );
                    }
                  },
                ),
                CategoryWidget(
                  category: Category.other,
                  onPressed: () {
                    if (!isWallet) {
                      Navigator.pushNamed(
                        context,
                        TargetAddPage.routeName,
                        arguments: Category.other,
                      );
                    } else {
                      Navigator.pushNamed(
                        context,
                        WalletAddPage.routeName,
                        arguments: Category.other,
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          backgroundColor: kBlueColor,
          elevation: 0.0,
          titleSpacing: 24.0,
          centerTitle: true,
          toolbarHeight: 80,
          title: Text(
            "Pilih Kategori",
            style: whiteTextStyle.copyWith(
              fontSize: 24,
              fontWeight: bold,
            ),
          ),
        ),
      ),
      body: SafeArea(child: _buildContent(context)),
    );
  }
}
