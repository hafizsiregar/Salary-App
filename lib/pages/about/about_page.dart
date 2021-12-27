import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:salary/providers/theme_provider.dart';
import 'package:salary/theme/theme.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final color =  Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    ? kAmber : primaryColor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text('Tentang Kami',
        style: GoogleFonts.montserrat()),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 40,
                  backgroundColor: color,
                  child: Image.asset('images/ic_splash.png',
                  height: 50),
                ),
                SizedBox(width: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Salariy.id',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 25,
                        color: color,
                        fontWeight: semiBold
                      ),
                    ),),
                    Text('v 2.5.8',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 15,
                        color: color
                      ),
                    ),),
                  ],
                ),
                Spacer(),
                IconButton(
                  iconSize: 30,
                  icon: Icon(Icons.help),
                  color: Colors.grey,
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Aplikasi Salariy.id ini merupakan aplikasi pengelolaan gaji yang memudahkan anda dalam mengatur gaji anda',
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 15,
                color: color
              ),
            )),
            SizedBox(height: 20),
            Text('Developed by Hafiz',
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 15,
                color: color
              ),
            ),),
            SizedBox(height: 7),
            Divider(thickness: 2),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Icon(Icons.mobile_friendly_rounded,
                size: 30,
                color: Colors.grey,),
                SizedBox(width: 20),
                Text('Rate on Google Play',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 15,
                    color: color
                  ),
                ),),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Icon(Icons.code,
                size: 30,
                color: Colors.grey,),
                SizedBox(width: 20),
                Text('Rate on Github',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 15,
                    color: color
                  ),
                ),),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Icon(Icons.bug_report,
                size: 30,
                color: Colors.grey,),
                SizedBox(width: 20),
                Text('Report issue on Github',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 15,
                    color: color
                  ),
                ),),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Icon(Icons.ios_share_outlined,
                size: 30,
                color: Colors.grey,),
                SizedBox(width: 20),
                Text('Visit my website',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 15,
                    color: color
                  ),
                ),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}