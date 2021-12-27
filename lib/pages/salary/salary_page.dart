import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:salary/providers/salary_provider.dart';
import 'package:salary/providers/theme_provider.dart';
import 'package:salary/theme/theme.dart';

class SalaryPage extends StatelessWidget {  
  const SalaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SalaryProvider salaryProvider = 
    Provider.of<SalaryProvider>(context);

    final color =  Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    ? kAmber : primaryColor;

    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Data Karyawan',
            style: GoogleFonts.montserrat(fontSize: 20, color: color),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(15),
            height: 67,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color: Colors.grey)],
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey
              ),
            ),
            child: Expanded(
              child: Row(
                children: <Widget>[
                  Text('1.',
                  style: GoogleFonts.montserrat(
                            textStyle:
                                TextStyle(color: color, fontSize: 15))),
                  SizedBox(width: 15),
                  Text(
                    // 'Fulan'
                    salaryProvider.data.namaKaryawan!,
                    style: GoogleFonts.montserrat(
                            textStyle:
                                TextStyle(color: color, fontSize: 15))
                    ),
                         Spacer(),
                  Text(
                    // '1-12-2021'
                    salaryProvider.data.tanggalMasuk!,
                    style: GoogleFonts.montserrat(
                            textStyle:
                                TextStyle(color: color, fontSize: 15))
                    ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/detail-salary');
                    },
                    icon: Icon(Icons.view_agenda_outlined,
                    color: color,),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
