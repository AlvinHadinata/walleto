import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walleto/notification/notification_helper.dart';
import 'package:walleto/notification/scheduling_provider.dart';
import 'package:walleto/screens/category/category_page.dart';
import 'package:walleto/screens/notes/note_add_page.dart';
import 'package:walleto/screens/settings_page.dart';
import 'package:walleto/screens/wallet/wallet_list_page.dart';
import 'package:walleto/shared/theme.dart';
import 'main_menu_page.dart';
import 'notes/note_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final NotificationHelper _notificationHelper = NotificationHelper();
  final autoSizeGroup = AutoSizeGroup();
  int _bottomNavIndex = 0;
  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;

  final List<Widget> _listWidget = [
    MainMenuPage(),
    NotePage(),
    WalletListPage(),
    SettingsPage()
  ];

  final List<IconData> _listIcon = [
    Icons.dashboard_rounded,
    Icons.sticky_note_2_rounded,
    Icons.history_rounded,
    Icons.settings
  ];

  final List<String> _listName = [
    "Dashboard",
    "Note",
    "History",
    "Setting",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _listWidget[_bottomNavIndex],
      floatingActionButton: ScaleTransition(
        scale: animation,
        child: FloatingActionButton(
          elevation: 0,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(41),
              ),
              color: kBlueColor,
            ),
            child: const Icon(
              Icons.add_rounded,
              color: kGradasi,
            ),
          ),
          onPressed: () {
            _showButtonAdd(context);
            _animationController.reset();
            _animationController.forward();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        backgroundColor: kGradasi,
        itemCount: _listIcon.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? kBlueColor : kGreyColor;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _listIcon[index],
                size: 24,
                color: color,
              ),
              const SizedBox(
                height: 4,
              ),
              Visibility(
                visible: isActive,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: AutoSizeText(
                    _listName[index],
                    maxLines: 1,
                    style: blackTextStyle.copyWith(color: color, fontSize: 12),
                    group: autoSizeGroup,
                  ),
                ),
              )
            ],
          );
        },
        activeIndex: _bottomNavIndex,
        splashColor: kBlueColor,
        splashSpeedInMilliseconds: 300,
        notchAndCornersAnimation: animation,
        notchSmoothness: NotchSmoothness.softEdge,
        gapLocation: GapLocation.center,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    curve = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );

    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      const Duration(seconds: 1),
      () => _animationController.forward(),
    );
  }

  @override
  void dispose() {
    // _animationController.dispose();
    super.dispose();
  }

  void _showButtonAdd(context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return Container(
          width: double.infinity,
          height: 250,
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Column(
            children: [
              Container(
                width: 135,
                height: 4.5,
                decoration: BoxDecoration(
                  color: kBlueColor,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: FloatingActionButton(
                          backgroundColor: kBlueColor,
                          child: const Icon(
                            Icons.savings_rounded,
                            size: 30.0,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, CategoryPage.routeName,
                                arguments: false);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Buat Target Baru",
                        style: blackTextStyle.copyWith(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: FloatingActionButton(
                          backgroundColor: kBlueColor,
                          child: const Icon(Icons.add_rounded),
                          onPressed: () {
                            Navigator.pushNamed(context, CategoryPage.routeName,
                                arguments: true);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Tambah Wallet",
                        style: blackTextStyle.copyWith(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: FloatingActionButton(
                          backgroundColor: kBlueColor,
                          child: const Icon(
                            Icons.note_add_rounded,
                            size: 30.0,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, NoteAddPage.routeName);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Buat Catatan Baru",
                        style: blackTextStyle.copyWith(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
