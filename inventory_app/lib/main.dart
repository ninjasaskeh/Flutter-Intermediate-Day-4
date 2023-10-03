import 'package:flutter/material.dart';
import 'package:inventory_app/helper/shared_pref.dart';
import 'package:inventory_app/provider/item_provider.dart';
import 'package:inventory_app/ui/pages/login_page.dart';
import 'package:inventory_app/ui/pages/search_page.dart';
import 'package:provider/provider.dart';

import 'ui/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPref sharedPref = SharedPref();
  bool loginPref =  await sharedPref.read('login');
  runApp(MyApp(
    loginPref: loginPref,
  ));
}

class MyApp extends StatelessWidget {
  final bool loginPref;
  const MyApp({super.key, required this.loginPref});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        home: loginPref ? const HomePage() : const LoginPage(),
        routes: {
          LoginPage.route:(context) => const LoginPage(),
          HomePage.route:(context) => const HomePage(),
          SearchPage.route:(context) => const SearchPage()
        },
      ),
    );
  }
}
