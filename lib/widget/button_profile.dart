import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:salary/providers/theme_provider.dart';
import 'package:salary/theme/theme.dart';

class ButtonProfile extends StatelessWidget {
  
  final IconData iconData;
  final String title;
  final IconData icon;

  ButtonProfile({
    required this.iconData,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {

    final color =  Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    ? kAmber : primaryColor;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xfff5f6f9)
      ),
      child: Row(
        children: <Widget>[
          Icon(iconData, color: color),
          SizedBox(width: 20),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: color
                ),
              ),
            ),
          ),
          Icon(icon, color: color)
        ],
      ),
    );
  }
}