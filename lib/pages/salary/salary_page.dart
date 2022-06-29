import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:training_app/providers/salary_provider.dart';
import 'package:training_app/theme/theme.dart';

class SalaryPage extends StatelessWidget {
  const SalaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SalaryProvider salaryProvider = Provider.of<SalaryProvider>(context);

    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Data Karyawan',
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(fontSize: 20, color: primarycolor))),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(15),
            height: 67,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [BoxShadow(color: Colors.grey)],
              color: Colors.white,
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              children: <Widget>[
                Text(
                  salaryProvider.data.namaKaryawan!,
                ),
                SizedBox(width: 50),
                Text(
                  salaryProvider.data.tanggalMasuk!,
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/detail-salary');
                  },
                  icon: Icon(Icons.view_agenda_outlined),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
