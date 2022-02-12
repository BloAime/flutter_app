import 'package:application_exo/controllers/FirebaseHelper_page.dart';
import 'package:application_exo/widget/text_field_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Test/connect_page.dart';
import '../Test/login_page.dart';
import '../Test/tresd.dart';
import '../widget/button_page.dart';
import '../Pages/register_page.dart';

class ProfiPage extends StatefulWidget {
  ProfiPage({Key? key}) : super(key: key);
  final User? user = FirebaseHelper().auth.currentUser;

  @override
  State<ProfiPage> createState() => _ProfiPageState();
}

class _ProfiPageState extends State<ProfiPage> {
  @override
  Widget build(BuildContext context) {
    final se = Theme.of(context).platform;
    if (se == TargetPlatform.iOS) {
      return CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            backgroundColor: Colors.blue,
            activeColor: Colors.black,
            inactiveColor: Colors.white,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.message)),
              BottomNavigationBarItem(icon: Icon(Icons.supervisor_account)),
              BottomNavigationBarItem(icon: Icon(Icons.account_circle)),
            ],
          ),
          tabBuilder: (BuildContext ctx, int index) {
            Widget controllerSelected = controllers()[index];
            return Scaffold(
              appBar: AppBar(
                title: Text("Kozon Chat"),
              ),
              body: controllerSelected,
            );
          });
    } else {
      return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Kozon Chat"),
              bottom: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.message),
                  ),
                  Tab(
                    icon: Icon(Icons.supervisor_account),
                  ),
                  Tab(
                    icon: Icon(Icons.account_circle),
                  )
                ],
              ),
            ),
            body: TabBarView(
              children: controllers(),
            ),
          ));
    }
  }

  List<Widget> controllers() {
    return [MyAppe(), LoginPage(), MyAppes()];
  }
}
