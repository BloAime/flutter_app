import 'package:application_exo/Pages/register_page.dart';
import 'package:application_exo/widget/text_field_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controllers/FirebaseHelper_page.dart';
import '../widget/button_page.dart';
import 'cover_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _addressMail = TextEditingController();
  TextEditingController _password = TextEditingController();
  double MAX_SIZE = 150;
  bool _secureText = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: MyAppBar(),
          backgroundColor: Color.fromARGB(255, 196, 167, 4),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                height: 550,
                width: MediaQuery.of(context).size.width - 30,
                child: Stack(
                  children: [
                    Positioned(
                        bottom: 0,
                        child: Container(
                          padding: EdgeInsets.only(right: 10, left: 10),
                          height: 500,
                          width: MediaQuery.of(context).size.width - 30,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 23, 78, 85),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Column(children: [
                            SizedBox(height: 20),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 241, 198, 6),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.person_outlined,
                                color: Colors.white,
                                size: 30,
                              )),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Connection',
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            ),
                            SizedBox(height: 15),
                            SizedBox(
                              height: 59,
                              child: TextfieldWidget(
                                hintText: 'Entrez votre Pseudo ou Email,',
                                labelText: 'Pseudo or Email',
                                icon1: Icon(
                                  Icons.person,
                                  size: 40,
                                ),
                                keyboard: TextInputType.text,
                                icon: null,
                                obscureText: false,
                                controllersTextfield: _addressMail,
                              ),
                            ),
                            SizedBox(height: 15),
                            SizedBox(
                                height: 59,
                                child: TextfieldWidget(
                                  hintText: 'Entrez votre Pseudo ou Email,',
                                  icon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _secureText = !_secureText;
                                      });
                                    },
                                    icon: Icon(_secureText
                                        ? Icons.remove_red_eye
                                        : Icons.remove_red_eye),
                                  ),
                                  labelText: 'Mot de passe',
                                  icon1: Icon(
                                    Icons.edit,
                                    size: 40,
                                  ),
                                  keyboard: TextInputType.text,
                                  obscureText: _secureText,
                                  controllersTextfield: _password,
                                )),
                            SizedBox(height: 35),
                            buttonWidget(
                              num2: 350,
                              Color: Color.fromARGB(255, 241, 198, 6),
                              saint: () {
                                print("j'ai clique");
                                _handleLog();
                              },
                              child: 'Connexion',
                            ),
                            SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text(
                                    'Mot de passe oublie?',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 45,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(right: 20, left: 10),
                                  child: Text(
                                    'Pas de compte?',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                Expanded(child: Container()),
                                Container(
                                  padding: EdgeInsets.only(right: 10),
                                  child: InkWell(
                                    onTap:(){
                                      Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return Registerpage();
                                      } 
                                      ),
                                    );
                                    },
                                    child: Text(
                                      'Creer un compte',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 31, 151, 231),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ]),
                        ))
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  _handleLog() {
    if (_addressMail.text != "") {
      if (_password.text != "") {
        //connexion
        print("${_addressMail.text}, ${_password.text}");
        FirebaseHelper()
            .handleSignIn(_addressMail.text, _password.text)
            .then((user) => {})
            .catchError((error) {
          alerte(error.toString());
        });
      }
    }
  }

  Future<void> alerte(String message) async {
    Text title = Text("Erreur");
    Text msg = Text(message);
    TextButton okButton = TextButton(
        onPressed: () => Navigator.of(context).pop(), child: Text("OK"));
    return showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return (Theme.of(context).platform == TargetPlatform.iOS)
              ? CupertinoAlertDialog(
                  title: title,
                  content: msg,
                  actions: [okButton],
                )
              : AlertDialog(
                  title: title,
                  content: msg,
                  actions: [okButton],
                );
        });
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
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MyHomePage();
          }));
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
