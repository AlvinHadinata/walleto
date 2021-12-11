import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:walleto/data/model/category.dart';
import 'package:walleto/data/model/history_target.dart';
import 'package:walleto/data/model/history_wallet.dart';
import 'package:walleto/data/model/saving_target.dart';
import 'package:walleto/data/model/wallet.dart';
import 'package:walleto/screens/category/category_page.dart';
import 'package:walleto/screens/home_page.dart';
import 'package:walleto/screens/notes/note_page.dart';
import 'package:walleto/screens/target/target_detail_page.dart';
import 'package:walleto/screens/target/target_add_page.dart';
import 'package:walleto/screens/target/target_list_page.dart';
import 'package:walleto/screens/wallet/wallet_detail_page.dart';
import 'package:walleto/screens/wallet/wallet_add_page.dart';
import 'package:walleto/screens/wallet/wallet_list_page.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:hive/hive.dart';

import 'data/model/note.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var appDocumentDirectory =
      await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  Hive.registerAdapter<SavingTarget>(SavingTargetAdapter());
  Hive.registerAdapter<HistoryTarget>(HistoryTargetAdapter());
  Hive.registerAdapter<Wallet>(WalletAdapter());
  Hive.registerAdapter<HistoryWallet>(HistoryWalletAdapter());
  Hive.registerAdapter<Note>(NoteAdapter());
  Hive.registerAdapter<Category>(CategoryAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        NotesPage.routeName: (context) => NotesPage(),
        WalletAddPage.routeName: (context) => WalletAddPage(),
        WalletDetailPage.routeName: (context) => WalletDetailPage(),
        WalletListPage.routeName: (context) => WalletListPage(),
        TargetAddPage.routeName: (context) => TargetAddPage(),
        TargetDetailPage.routeName: (context) => TargetDetailPage(),
        TargetListPage.routeName: (context) => TargetListPage(),
        CategoryPage.routeName: (context) => CategoryPage(
            isWallet: ModalRoute.of(context)!.settings.arguments as bool)
      },
    );
  }
}
