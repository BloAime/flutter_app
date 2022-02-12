
import 'package:application_exo/Pages/login_page.dart';
import 'package:application_exo/Pages/profil_page.dart';
import 'package:application_exo/Pages/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget/button_page.dart';
import '../Test/connect_page.dart';



class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       //backgroundColor: Colors.redAccent,
       body: SingleChildScrollView(
         child: Container(
            height: 1000,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage("images/flowersani_zWDLlfff.gif"),
           fit:BoxFit.cover
                      )
                  ),
           padding: const EdgeInsets.only(
              top: 50,
              left: 10,
              right: 10,
            ),
           child: Column(
             children: [
               Row(
                 children: [
                   Container(
                     width: 100,
                     height: 100,
                     //color: Colors.redAccent,
                     child: ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         elevation: 0,
                         primary: Color.fromARGB(255, 252, 252, 252),
                         shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),),
                       onPressed: () {  },
                     child: Text('A',
                     style: TextStyle(
                       color: Colors.black,
                       fontSize: 50,
                     ),
                     ),),
                   )
                 ],
               ),
               SizedBox(height: 10,),
               Row(
                 children: [
                   Container(
                     padding: const EdgeInsets.only(right: 10,left: 10),
                     width: 100,
                     height: 100,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text('Hello',
                         style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 255, 255, 255),
                         ),
                         ),
                         Text('Stacy',
                         style: TextStyle(
                           fontSize: 25,
                           fontWeight: FontWeight.w800,
                           color: Color.fromARGB(255, 255, 255, 255),
                         ),
                         )
                       ],
                     ),
                     ),
                 ],
               ),
               SizedBox(height: 300,),
               Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(right: 60,left: 60),
                     child: Container(
                       width: 230,
                       height: 50,
                       child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                           elevation: 0,
                           primary: Color.fromARGB(236, 241, 198, 183),
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(30) ,
                           )
                         ),
                         onPressed: () {
                           Navigator.push(context, 
                           MaterialPageRoute(builder: (context){
                             return LoginPage();
                           }
                           ),
                           );
                         },
                       child: Text('Sign up',
                       style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 233, 48, 48),
                         ),
                       ), 
                       ),
                     ),
                   )
                 ],
               ),
               SizedBox(height: 10,),
               Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(right: 60,left: 60),
                     child: Container(
                       width: 230,
                       height: 50,
                       child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                           elevation: 0,
                           primary: Color.fromARGB(236, 241, 198, 183),
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(30) ,
                           )
                         ),
                         onPressed: () { 
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Registerpage();
                            } 
                            ),
                          );
                          },
                       child: Text('Sign up',
                       style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 241, 56, 56),
                         ),
                       ), 
                       ),
                     ),
                   )
                 ],
               ),
                SizedBox(height: 5,),
                Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(right: 50,left: 50),
                     child: Container(
                       width: 250,
                       height: 60,
                       child: Column(children: [
                         TextButton(
                          onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return ProfiPage();
                            } 
                            ),
                          );
                        },child: Text('Forget Pass',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),),
                        ),
                       ]),
                     ),
                   )
                 ],
               ),  
             ],
           ) ,
         ),
       ),
    );
  }
}