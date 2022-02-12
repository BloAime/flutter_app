import 'package:application_exo/widget/text_field_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget/button_page.dart';
import '../Pages/register_page.dart';


class MyAppe extends StatefulWidget {
  MyAppe({Key? key}) : super(key: key);

  @override
  State<MyAppe> createState() => _MyAppeState();
}

class _MyAppeState extends State<MyAppe> {
   double MAX_SIZE = 150;
   bool _secureText = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Container(
          child: Column(children: [
            Text('Bonjour je suis dans la page 1')
          ]),
        ),
      ),
    );
  }
}
