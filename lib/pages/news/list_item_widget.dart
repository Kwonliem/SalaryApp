import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training_app/models/news.dart';
import 'package:training_app/pages/news/list_item_news.dart';

Widget listItem(BeritaModel itemNews) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Card(
      elevation: 5,
      margin: EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 80,
              height: 59,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          NetworkImage('https://picsum.photos/id/237/200/300'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(itemNews.judulBerita!),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.person),
                      Text(itemNews.penerbit!),
                      SizedBox(width: 30),
                      Icon(Icons.date_range),
                      Text(itemNews.tanggalTerbit!)
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
