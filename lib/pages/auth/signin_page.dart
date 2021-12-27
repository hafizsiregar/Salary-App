import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salary/providers/auth_provider.dart';
import 'package:salary/providers/theme_provider.dart';
import 'package:salary/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:salary/widget/loading_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final TextEditingController usernameController = 
    TextEditingController(text: '');

   final TextEditingController passwordController = 
    TextEditingController(text: '');  

    bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    final color = Provider.of<ThemeProvider>(context)
    .themeMode == ThemeMode.dark ? Colors.amber
    : primaryColor;

    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleLogin() async {

      setState(() {
        isLoading = true;
      });

      if( await authProvider.login(
        username: usernameController.text,
        password: passwordController.text)) {
        Navigator.pushNamed(context, '/main-page');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: primaryColor,
            content: Text('Gagal Login',
            textAlign: TextAlign.center,))
        );

        setState(() {
          isLoading = false;
        });
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 129),
            Center(
                child: Text(
              'Masuk',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    fontSize: 36,
                    fontWeight: semiBold,
                    color: color),
              ),
            )),
            SizedBox(
              height: 85,
            ),
            Text(
              'Username',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(fontSize: 14, fontWeight: semiBold),
              ),
            ),
            SizedBox(height: 4),
            Container(
              padding: EdgeInsets.only(left: 20),
              height: 43,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: kGreyColor)),
              child: Center(
                child: TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Tulis username kamu'),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              'Password',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(fontSize: 14, fontWeight: semiBold),
              ),
            ),
            SizedBox(height: 4),
            Container(
              padding: EdgeInsets.only(left: 20),
              height: 43,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: kGreyColor)),
              child: Center(
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Tulis password kamu'),
                ),
              ),
            ),
            SizedBox(height: 4),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                'Lupa Password?',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: semiBold,
                      color: color),
                ),
              ),
            ),
            SizedBox(height: 40),
            InkWell(
              onTap: handleLogin,
              child: isLoading ? LoadingButton() :
              Container(
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: color
                ),
                child: Center(
                  child: Text('Masuk',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: semiBold,
                      color: kWhiteColor
                    )
                  )
                  ),
                ),  
              ),
            ),
          ],
        ),
      ),
    );
  }
}
