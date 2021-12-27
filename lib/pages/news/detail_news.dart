import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:salary/models/news.dart';
import 'package:salary/pages/news/list_item_news.dart';
import 'package:salary/providers/theme_provider.dart';
import 'package:salary/theme/theme.dart';

class DetailNews extends StatelessWidget {
  final BeritaModel itemNews;
  DetailNews({required this.itemNews});

  @override
  Widget build(BuildContext context) {

    final color = Provider.of<ThemeProvider>(context)
    .themeMode == ThemeMode.dark ? Colors.amber
    : primaryColor;

    return Scaffold(
      // backgroundColor: color,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.network(
                    'https://picsum.photos/200/300?grayscale',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 15),
                  Text(itemNews.judulBerita!,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: color,
                      fontWeight: semiBold
                    )
                  ),),
                  SizedBox(height: 25),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.person),
                        Text(itemNews.penerbit!),
                        SizedBox(width: 40),
                        Icon(Icons.date_range),
                        Text(itemNews.tanggalTerbit!)
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(itemNews.isiBerita!,
                    style: TextStyle(
                      fontSize: 30)
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
