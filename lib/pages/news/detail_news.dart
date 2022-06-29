import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:training_app/models/news.dart';
import 'package:training_app/pages/news/list_item_news.dart';
import 'package:training_app/theme/theme.dart';

class DetailNews extends StatelessWidget {
  final BeritaModel itemNews;
  const DetailNews({required this.itemNews});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.network(
                    'https://picsum.photos/id/237/200/300',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    itemNews.judulBerita!,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                      fontSize: 25,
                      color: Color(0xffFD7014),
                    )),
                  ),
                  SizedBox(height: 25),
                  Text(
                    itemNews.penerbit!,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                      fontSize: 18,
                    )),
                  ),
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
                    child: Text(
                      itemNews.isiBerita!,
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                        height: 2,
                        fontSize: 18,
                      )),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
