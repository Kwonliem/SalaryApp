import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_app/pages/Auth/signin_page.dart';
import 'package:training_app/pages/home/home_page.dart';
import 'package:training_app/pages/main_page.dart';
import 'package:training_app/pages/salary/detail_salary.dart';
import 'package:training_app/pages/splash/splash_screen.dart';
import 'package:training_app/providers/auth_provider.dart';
import 'package:training_app/providers/news_provider.dart';
import 'package:training_app/providers/salary_provider.dart';
import 'package:training_app/providers/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthProvider()),
          ChangeNotifierProvider(create: (context) => BeritaProvider()),
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(create: (context) => SalaryProvider()),
        ],
        builder: (context, _) {
          final changeTheme = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: changeTheme.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            // theme: ThemeMode(
            //   primarySwatch: Colors.blue,
            // ),
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => SplashScreen(),
              '/home-page': (context) => HomePage(),
              '/sign-in': (context) => SignInPage(),
              '/main-page': (context) => MainPage(),
              '/detail-salary': (context) => DetailSalaryPage(),
            },
          );
        });
  }
}
