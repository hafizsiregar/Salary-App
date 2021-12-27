import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:salary/models/login_karyawan.dart';
import 'package:salary/providers/auth_provider.dart';
import 'package:salary/providers/theme_provider.dart';
import 'package:salary/theme/theme.dart';
import 'package:salary/widget/button_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    LoginKaryawanModel? loginKaryawanModel = authProvider.loginKaryawanModel;

    final color =  Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    ? kAmber : primaryColor;

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('images/ic_profile.png'),
              radius: 50,
            ),
            SizedBox(height: 20),
            Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama: ${loginKaryawanModel!.namaKaryawan}',
                  // '',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(color: color),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Status: ${loginKaryawanModel.status}',
                  // '',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(color: color),
                  ),
                ),
              ],
            )),
            SizedBox(height: 20),
            ButtonProfile(iconData: Icons.update, title: 'Update Profile', icon: Icons.arrow_forward_ios_outlined),
            SizedBox(height: 20),
           ButtonProfile(iconData: Icons.change_circle, title: 'Update Password', icon: Icons.arrow_forward_ios_outlined),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text('Keluar'),
                        content: Text('Apakah anda yakin untuk keluar?'),
                        actions: [
                          CupertinoDialogAction(
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Batal',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ),
                          CupertinoDialogAction(
                            child: TextButton(
                              onPressed: () async {
                                // SharedPreferences preferences =
                                //     await SharedPreferences.getInstance();
                                // await preferences.clear();
                                Navigator.of(context).pushNamed('/sign-in');
                              },
                              child: Text('Yakin'),
                            ),
                          ),
                        ],
                      );
                    });
              },
              child: ButtonProfile(iconData: Icons.exit_to_app_outlined, title: 'Keluar', icon: Icons.arrow_forward_ios_outlined)
            ),
          ],
        ),
    );
  }
}
