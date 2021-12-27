import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salary/pages/about/about_page.dart';
import 'package:salary/pages/main_page.dart';
import 'package:salary/providers/auth_provider.dart';
import 'package:salary/providers/konten_provider.dart';
import 'package:salary/providers/news_provider.dart';
import 'package:salary/providers/salary_provider.dart';
import 'package:salary/providers/theme_provider.dart';
import 'pages/auth/signin_page.dart';
import 'pages/home/home_page.dart';
import 'pages/salary/detail_salary_page.dart';
import 'pages/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => BeritaProvider()),
        ChangeNotifierProvider(create: (context) => KontenProvider()),
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
        // ThemeData(
        //   primarySwatch: Colors.blue,
        // ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => SplashScreen(),
          '/home-page' : (context) => HomePage(),
          '/sign-in' : (context) => SignInPage(),
          '/main-page' : (context) => MainPage(),
          '/detail-salary' : (context) => DetailSalaryPage(),
          '/about-page' : (context) => AboutPage()
        },
      );
      },
    );
  }
}