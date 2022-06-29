import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_app/models/login_karyawan.dart';
import 'package:training_app/providers/auth_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AuthProvider authProvider = Provider.of<AuthProvider>(context);
    // LoginKaryawanModel loginKaryawanModel = authProvider.loginKaryawanModel;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        children: <Widget>[
          SizedBox(height: 75),
          CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage('images/img_profile.png'),
          ),
          SizedBox(height: 20),
          Column(
            children: <Widget>[
              Text('Salim'
                  // loginKaryawanModel.namaKaryawan!,
                  ),
              Text('status'
                  // loginKaryawanModel.status!,
                  )
            ],
          ),
          SizedBox(height: 75),
          buttonProfile(
              Icons.update_outlined, 'Update Profile', Icons.arrow_forward_ios),
          SizedBox(height: 20),
          buttonProfile(Icons.change_circle_outlined, 'Update Password',
              Icons.arrow_forward_ios),
          SizedBox(height: 20),
          InkWell(
              onTap: () {
                showDialog(
                    context: (context),
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text('Keluar'),
                        content: Text('Serius Bro ?'),
                        actions: [
                          CupertinoDialogAction(
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Ga Jadi',
                                      style: TextStyle(
                                        color: Colors.black45,
                                      )))),
                          CupertinoDialogAction(
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/sign-in');
                                  },
                                  child: Text('Gas',
                                      style: TextStyle(
                                        color: Colors.red,
                                      )))),
                        ],
                      );
                    });
              },
              child: buttonProfile(
                  Icons.exit_to_app, 'Keluar', Icons.arrow_forward_ios)),
        ],
      ),
    );
  }

  Widget buttonProfile(IconData iconFirst, String title, IconData secondIcon) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      height: 67,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.black38),
      child: Row(
        children: <Widget>[
          Icon(iconFirst),
          SizedBox(
            width: 20,
          ),
          Expanded(child: Text(title)),
          Icon(secondIcon)
        ],
      ),
    );
  }
}
