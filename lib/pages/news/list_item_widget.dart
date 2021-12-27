

import 'package:flutter/material.dart';
import 'package:salary/models/news.dart';
import 'package:salary/pages/news/list_item_news.dart';

Widget listItem(BeritaModel itemNews) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 80,
              height: 59,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://picsum.photos/200/300?grayscale'),
                  fit: BoxFit.cover
                )
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(itemNews.judulBerita!),
                SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    Icon(Icons.person),
                    Text(itemNews.penerbit!),
                    SizedBox(width: 50,),
                    Icon(Icons.date_range),
                    Text(itemNews.tanggalTerbit!),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}