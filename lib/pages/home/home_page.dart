import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:training_app/models/login_karyawan.dart';
import 'package:training_app/providers/auth_provider.dart';
import 'package:training_app/providers/theme_provider.dart';
import 'package:training_app/theme/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.amber
            : primarycolor;

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    LoginKaryawanModel? loginKaryawanModel = authProvider.loginKaryawanModel;

    return Container(
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey, spreadRadius: 3, blurRadius: 5),
                    ],
                    image: DecorationImage(
                        image: AssetImage('images/img_home.png'),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 155),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.grey,
                        // offset: Offset(5, 5) -> optional
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selamat Datang',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: color,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            // 'Fulan',
                            loginKaryawanModel.namaKaryawan!,
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: color,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600)),
                          )
                        ],
                      ),
                      Spacer(),
                      // SizedBox(width: 63),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Gaji Bulan ini',
                            // overflow: TextOverflow.clip,
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: color,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Rp. 1000.000',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: color,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Konten Harian',
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                color: kwhitecolor,
                fontSize: 15,
              )),
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                  height: 200,
                  enlargeCenterPage: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  viewportFraction: 0.7,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800)),
              items: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage('images/img_konten.jpg'),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Judul Konten',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontSize: 20, color: Color(0xffFD7014))),
                      ),
                      Text(
                        'Isi Konten',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontSize: 20, color: Color(0xffFD7014))),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Karyawan',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width - 30,
            height: MediaQuery.of(context).size.width - 30,
            child: GridView.count(
                primary: false,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
                childAspectRatio: 0.8,
                children: <Widget>[
                  buildCard('', '', '', context),
                  buildCard('', '', '', context),
                  buildCard('', '', '', context),
                  buildCard('', '', '', context),
                ]),
          ),
        ],
      ),
    );
  }

  Widget buildCard(
      String name, String imgPath, String employe, BuildContext context) {
    final color =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.amber
            : primarycolor;
    return Padding(
      padding: EdgeInsets.only(top: 15, bottom: 5, left: 3, right: 3),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(blurRadius: 5, color: Colors.grey.withOpacity(0.2)),
            ],
            color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Backend Developer',
              style: TextStyle(color: color),
            ),
            SizedBox(height: 10),
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/img_person.png'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(height: 10),
            Text(
              'Fulan',
              style: TextStyle(color: color),
            )
          ],
        ),
      ),
    );
  }
}
