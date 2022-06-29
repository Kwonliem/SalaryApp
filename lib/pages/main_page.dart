import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:training_app/models/login_karyawan.dart';
import 'package:training_app/pages/home/home_page.dart';
import 'package:training_app/pages/news/news_page.dart';
import 'package:training_app/pages/profile/profile_page.dart';
import 'package:training_app/pages/salary/salary_page.dart';
import 'package:training_app/providers/auth_provider.dart';
import 'package:training_app/providers/theme_provider.dart';
import 'package:training_app/theme/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  var appBarTitle = 'Salim.id';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this)
      ..addListener(() {
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

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    LoginKaryawanModel loginKarywanModel = authProvider.loginKaryawanModel;

    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        title: Text(
          appBarTitle,
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              fontSize: 18,
              fontWeight: semiBold,
            ),
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Material(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[
              SizedBox(height: 60),
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('images/img_profile.png'),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        loginKarywanModel.namaKaryawan!,
                        // "Fulan",
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: semiBold,
                            color: primarycolor,
                          ),
                        ),
                      ),
                      Text(
                        loginKarywanModel.status!,
                        // "Status",
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: 16,
                            color: primarycolor,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Divider(
                thickness: 2,
              ),
              ListTile(
                leading: Icon(
                  Icons.help_center_rounded,
                  color: primarycolor,
                ),
                title: Text(
                  'Tentang Kami',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: primarycolor,
                    ),
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.dark_mode_rounded,
                  color: primarycolor,
                ),
                title: Text(
                  'Mode Dark',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Kblackcolor,
                    ),
                  ),
                ),
                trailing: CupertinoSwitch(
                    value: themeProvider.isDarkMode,
                    onChanged: (value) {
                      themeProvider.toogleTheme(value);
                    }),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomePage(),
          SalaryPage(),
          NewsPage(),
          ProfilePage(),
        ],
        controller: _tabController,
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: primarycolor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          labelPadding: EdgeInsets.symmetric(horizontal: 0),
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.white, width: 0),
          ),
          tabs: <Widget>[
            Tab(text: 'Home', icon: Icon(Icons.home)),
            Tab(text: 'Penggajian', icon: Icon(Icons.transform_rounded)),
            Tab(text: 'Berita', icon: Icon(Icons.now_widgets_sharp)),
            Tab(text: 'Profile', icon: Icon(Icons.person)),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}
