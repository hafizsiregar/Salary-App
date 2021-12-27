import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:salary/providers/theme_provider.dart';
import 'package:salary/theme/theme.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final color = Provider.of<ThemeProvider>(context)
    .themeMode == ThemeMode.dark ? Colors.amber
    : primaryColor;

    return Container(
      height: 56,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), 
          color: color),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(
                  kWhiteColor
                ),
              )
            ),
            SizedBox(width: 5),
            Text(
              'Loading',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    fontSize: 18, fontWeight: semiBold, 
                    color: kWhiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
