import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:salary/providers/konten_provider.dart';
import 'package:salary/providers/news_provider.dart';
import 'package:salary/providers/salary_provider.dart';
import 'package:salary/providers/theme_provider.dart';
import 'package:salary/theme/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  getInit() async {
    await Provider.of<BeritaProvider>(context, listen: false).getAllBerita();
    await Provider.of<KontenProvider>(context, listen: false).getAllKonten();
    await Provider.of<SalaryProvider>(context, listen: false).getPenggajian();
    Timer(Duration(seconds: 5), 
    () => Navigator.pushNamed(context, '/sign-in'));
  }

  @override
  void initState() {
    super.initState();
    getInit();
  }

  @override
  Widget build(BuildContext context) {

    // variable untuk menampung data color apakah light atau dark
    final color = Provider.of<ThemeProvider>(context)
    .themeMode == ThemeMode.dark ? Colors.grey.shade900
    : primaryColor;

    return Scaffold(
      backgroundColor: color,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 93,
              height: 114,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/ic_splash.png'),
                ),
              ),
            ),
            SizedBox(height: 60),
            Text('Salary.id',
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 24,
                fontWeight: semiBold,
                color: kWhiteColor
              ),
            ),),
          ],
        ),
      ),
    );
  }
}