import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:training_app/providers/auth_provider.dart';
import 'package:training_app/providers/theme_provider.dart';
import 'package:training_app/theme/theme.dart';
import 'package:training_app/widget/loading_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController usernameCotroller =
      TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final color =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.white
            : primarycolor;
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleLogin() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.login(
          username: usernameCotroller.text,
          password: passwordController.text)) {
        Navigator.pushNamed(context, '/main-page');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: primarycolor,
            content: Text(
              'Gagal Login Bang',
              textAlign: TextAlign.center,
            )));
        setState(() {
          isLoading = false;
        });
      }
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 129),
              Center(
                child: Text(
                  'Masuk',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 36,
                      fontWeight: semiBold,
                      color: color,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 250,
              ),
              Text(
                'Username',
                style: GoogleFonts.montserrat(
                    textStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                height: 59,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
                child: Center(
                  child: TextFormField(
                    controller: usernameCotroller,
                    decoration:
                        InputDecoration.collapsed(hintText: 'Tulis Sini Bang'),
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                'Password',
                style: GoogleFonts.montserrat(
                    textStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                height: 59,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
                child: Center(
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration.collapsed(
                        hintText: 'Password Sini Bang'),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'Lupa Password ?',
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: color,
                  )),
                ),
              ),
              SizedBox(height: 40),
              InkWell(
                onTap: handleLogin,
                child: isLoading
                    ? LoadingButton()
                    : Container(
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: primarycolor),
                        child: Center(
                          child: Text(
                            'Masuk',
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ));
  }
}
