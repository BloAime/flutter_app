import 'package:application_exo/widget/text_field_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget/button_page.dart';
import 'connect_page.dart';


class MyAppes extends StatefulWidget {
  MyAppes({Key? key}) : super(key: key);

  @override
  State<MyAppes> createState() => _MyAppesState();
}

class _MyAppesState extends State<MyAppes> {
   double MAX_SIZE = 30;
   bool _secureText = true;
   bool isChecked = false;
   bool isChecked1 = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Color.fromARGB(255, 111, 54, 244);
    }
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(235, 255, 255, 255),
          elevation: 0,
        ),
       body: Container(
          child: Column(children: [
            Text('Bonjour je suis dans la page 3')
          ]),
        ),
      ),
    );
  }
}
