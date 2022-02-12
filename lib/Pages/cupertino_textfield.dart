import 'package:flutter/material.dart';
import 'cover_page.dart';
import 'calandar_page.dart';
void main() {
  runApp(
    MaterialApp(
      title: 'Named Routes Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstScreens(),
        '/second': (context) => const SecondScreen(),
      },
    ),
  );
}
const d_green = Color(0xFF54D3C2);
class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'blo',
      home: FirstScreens(),
    );
  }
}
class FirstScreens extends StatelessWidget {
  const FirstScreens({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Seachsection(),
              Hotelsaction(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return SecondScreen();
                      }),
                    );
                  },
                  child: const Text('Voir autre'),
                ),
              ),
            ],
          ),
        )
        );
  }
}
class Seachsection extends StatelessWidget {
  const Seachsection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 8, 6, 5),
      height: 120,
      color: Color.fromARGB(36, 187, 207, 224),
      child: Column(children: [
        Row(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.only(left: 20),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                keyboardAppearance: Brightness.light,
                keyboardType:TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Entrez le mot cle',
                  labelText: 'Recherche',
                  contentPadding: EdgeInsets.all(7),
                  border: InputBorder.none,
                ),
              ),
            )),
            Container(
              height: 50,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  primary: d_green,
                ),
                child: Icon(Icons.search),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CalendarPage();
                     },
                    ),
                  );
                },
              ),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choisis la date',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    '12-decembre 2021',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choisis la date',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    '12-decembre 2021',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}
class Hotelsaction extends StatelessWidget {
  final List hotelList = [
     {
      'title': 'Grand Royl Hotel',
      'place': 'wembley, London',
      'distance': 2,
      'review': 36,
      'picture': 'images/hotel_1.png',
      'price': '180',
    },
    {
      'title': 'Queen Hotel',
      'place': 'wembley, London',
      'distance': 3,
      'review': 13,
      'picture': 'images/hotel_2.png',
      'price': '220',
    },
    {
      'title': 'Grand Mal Hotel',
      'place': 'wembley, London',
      'distance': 6,
      'review': 88,
      'picture': 'images/hotel_3.png',
      'price': '400',
    },
    {
      'title': 'Hilton',
      'place': 'wembley, London',
      'distance': 11,
      'review': 34,
      'picture': 'images/hotel_4.png',
      'price': '910',
    },
     {
      'title': 'Grand Royl Hotel',
      'place': 'wembley, London',
      'distance': 2,
      'review': 36,
      'picture': 'images/hotel_1.png',
      'price': '180',
    },
    {
      'title': 'Queen Hotel',
      'place': 'wembley, London',
      'distance': 3,
      'review': 13,
      'picture': 'images/hotel_2.png',
      'price': '220',
    },
    {
      'title': 'Grand Mal Hotel',
      'place': 'wembley, London',
      'distance': 6,
      'review': 88,
      'picture': 'images/hotel_3.png',
      'price': '400',
    },
    {
      'title': 'Hilton',
      'place': 'wembley, London',
      'distance': 11,
      'review': 34,
      'picture': 'images/hotel_4.png',
      'price': '910',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '550 hotels foundsFilters',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
                ),
                Row(
                  children: [
                    Text(
                      'Filter',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
                    ),
                    IconButton(
                      icon: Icon(Icons.filter_list_outlined),
                      onPressed: null,
                    )
                  ],
                )
              ],
            ),
          ),
          Column(
            children: hotelList.map((hotel) {
              return Hotelcard(hotel);
            }).toList(),
          )
        ],
      ),
    );
  }
}
class Hotelcard extends StatelessWidget {
  final Map hotelData;
  Hotelcard(this.hotelData);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      height: 270,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 235, 233, 233),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 4,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ]),
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(hotelData['picture']), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 4,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ]),
            child: Stack(children: [
              Positioned(
                  top: 5,
                  right: -15,
                  child: MaterialButton(
                    color: Color.fromARGB(214, 173, 156, 1),
                    shape: CircleBorder(),
                    onPressed: () {},
                    child: Icon(
                      Icons.favorite_outline_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ))
            ]),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(hotelData['title']),
                Text('\$' + hotelData['price'].toString())
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(hotelData['place']),
                Row(
                  children: [
                    Icon(Icons.place),
                    Text(hotelData['distance'].toString() + 'km to city'),
                  ],
                ),
                Text('pere night'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => new Size.fromHeight(50);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.grey[800],
          size: 20,
        ),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
             return MyHomePage();
          }));
        },
      ),
      title: Text('Explor',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600)),
      actions: [
        IconButton(
          icon: Icon(
            Icons.favorite_outline_rounded,
            color: Colors.grey[800],
            size: 20,
          ),
          onPressed: null,
        ),
        IconButton(
          icon: Icon(
            Icons.place,
            color: Colors.grey[800],
            size: 20,
          ),
          onPressed: null,
        ),
      ],
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}
class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('page2'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
