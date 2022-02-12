import 'package:application_exo/Pages/register_page.dart';
import 'package:application_exo/widget/text_field_page.dart';
import 'package:flutter/material.dart';

import '../widget/button_page.dart';
import '../Pages/cover_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double MAX_SIZE = 150;
   bool _secureText = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      
      children: [
     Scaffold(
       appBar: MyAppBar(),
       backgroundColor: Color.fromARGB(255, 196, 167, 4),
       body: Container(
          child: Column(children: [
            Text('Bonjour je suis dans la page 1')
          ]),
        ),
       )
      ],
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => new Size.fromHeight(50);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.grey[800],
          size: 25,
        ),
        onPressed: (){
          Navigator.push(context, 
          MaterialPageRoute(builder: (context){
            return MyHomePage();
          })
          );
        },
      ),
      title: Text('Connexion',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600)),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}