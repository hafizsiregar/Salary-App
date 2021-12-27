import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:salary/models/login_karyawan.dart';
import 'package:salary/pages/home/home_page.dart';
import 'package:salary/pages/news/news_page.dart';
import 'package:salary/pages/profile/profile_page.dart';
import 'package:salary/pages/salary/salary_page.dart';
import 'package:salary/providers/auth_provider.dart';
import 'package:salary/providers/theme_provider.dart';
import 'package:salary/theme/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> 
with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this)..addListener(() { 
      setState(() {
        switch (_tabController!.index) {
          case 0:
          appBarTitle = 'Salary.id';
          break;
          case 1:
          appBarTitle = 'Penggajian';
          break;
          case 2:
          appBarTitle = 'Berita';
          break;
          case 3:
          appBarTitle = 'Profile';
          break;
        }
      });
     });
  }

  TabController? _tabController;
  var appBarTitle = 'Salary.id';

  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    LoginKaryawanModel? loginKaryawanModel = authProvider.loginKaryawanModel;

    ThemeProvider themeProvider = 
    Provider.of<ThemeProvider>(context);

    final color =  Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    ? kAmber : primaryColor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(appBarTitle,
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight: semiBold
          ),
        ),),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Material(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[
              SizedBox(height: 50),
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      'images/ic_profile.png'
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        // 'Fulan',
                        loginKaryawanModel!.namaKaryawan!,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 15,
                          color: color
                        ),
                      ),),
                      Text(
                        // 'Status',
                        loginKaryawanModel.status!,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 15,
                          color: color
                        ),
                      ),)
                    ],
                  ),
                ],
              ),
              SizedBox(height: 50),
              Divider(thickness: 2),
              ListTile(
                leading: Icon(
                  Icons.help_center_outlined,
                  color:  color,
                ),
                title: Text(
                  'Tentang Kami',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: color
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/about-page');
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.dark_mode_outlined,
                  color: color,
                ),
                title: Text(
                  'Mode Gelap',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: color
                    ),
                  ),
                ),
                trailing: CupertinoSwitch(
                  value: themeProvider.isDarkMode,
                  onChanged: (value) {
                    themeProvider.toogleTheme(value);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        // physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomePage(),
          SalaryPage(),
          NewsPage(),
          ProfilePage()
        ],
        controller: _tabController,
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50)
        ),
        child: TabBar(
          labelColor: kWhiteColor,
          unselectedLabelColor: Colors.grey,
          labelPadding: EdgeInsets.symmetric(horizontal: 0),
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: kWhiteColor, width: 0)
          ),
          tabs: <Widget>[
            Tab(text: 'Home', icon: Icon(Icons.home)),
            Tab(text: 'Penggajian', icon: Icon(Icons.transform_rounded)),
            Tab(text: 'Berita', icon: Icon(Icons.now_wallpaper_sharp)),
            Tab(text: 'Profile', icon: Icon(Icons.person)),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}