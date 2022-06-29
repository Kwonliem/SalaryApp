import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:training_app/providers/salary_provider.dart';
import 'package:training_app/theme/theme.dart';

class DetailSalaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SalaryProvider salaryProvider = Provider.of<SalaryProvider>(context);
    int totalGaji = int.parse(salaryProvider.data.gaji![0].totalGaji!);
    int potongan = int.parse(salaryProvider.data.gaji![0].potongan!);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        title: Text('Detail - Penggajian', style: GoogleFonts.montserrat()),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Bebas',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kwhitecolor,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2, color: primarycolor, spreadRadius: 1)
                    ]),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Data Karyawan',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(color: primarycolor),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Nama Lengkap',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(color: primarycolor),
                          ),
                        ),
                        Spacer(),
                        Text(
                          // 'Fulan'
                          salaryProvider.data.namaKaryawan!,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(color: primarycolor),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Jabatan',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(color: primarycolor),
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Backend Developer',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(color: primarycolor),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Status',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(color: primarycolor),
                          ),
                        ),
                        Spacer(),
                        Text(
                          // 'Kontrak'
                          salaryProvider.data.status!,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(color: primarycolor),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Nomor Handphone',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(color: primarycolor),
                          ),
                        ),
                        Spacer(),
                        Text(
                          // '0898121331415'
                          salaryProvider.data.nomorHp!,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(color: primarycolor),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Username',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(color: primarycolor),
                          ),
                        ),
                        Spacer(),
                        Text(
                          // 'fulan'
                          salaryProvider.data.username!,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(color: primarycolor),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Tanggal Penggajian',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(color: primarycolor),
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Nominal',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(color: primarycolor),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          // '2021-11-20'
                          salaryProvider.data.tanggalMasuk!,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(color: primarycolor),
                          ),
                        ),
                        Spacer(),
                        Text(
                          NumberFormat.currency(
                            symbol: 'Rp',
                            name: 'IDR',
                          ).format(totalGaji),
                          // 'Rp. 2,400,000'
                          // salaryProvider.data.gaji![0].totalGaji!,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(color: primarycolor),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          // '2021-11-20'
                          salaryProvider.data.gaji![0].tanggalGajian!,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(color: primarycolor),
                          ),
                        ),
                        Spacer(),
                        Text(
                          NumberFormat.currency(symbol: 'Rp.', name: "IDR")
                              .format(potongan),
                          // 'Rp. 400,000'
                          // salaryProvider.data.gaji![0].potongan!,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(color: primarycolor),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '2021-11-21',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(color: primarycolor),
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Rp. 2,580,000',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(color: primarycolor),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
