import 'package:flutter/material.dart';

import 'foodMenu_Page.dart';
import 'foodOrders_Page.dart';

class Home_Page extends StatefulWidget {
  static const routeName = '/homepage';
  const Home_Page({Key? key}) : super(key: key);

  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  int currentPage = 1;
  int currentFoodPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(currentPage == 1 ? 'Food' : 'Profile'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 180.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                        Colors.teal[900]!,
                        Colors.teal[300]!,
                      ])),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(40.0),
                          child: Container(
                            width: 80.0,
                            height: 80.0,
                            child: Image.asset('assets/images/profile01.jpg'),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Thatchapol Orsuwan',
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Orsuwan_T@silpakorn.edu',
                          style: TextStyle(color: Colors.white, fontSize: 12.0),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              listTile(Icons.fastfood, 'Foods', 1),
              listTile(Icons.person, 'Profile', 0)
            ],
          ),
        ),
        body: Container(
          child: currentPage == 1
              ? currentFoodPage == 0
                  ? foodMenu_Page()
                  : foodOrders_Page()
              : ProfilePage(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentFoodPage,
          onTap: (index) {
            setState(() {
              currentFoodPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(label: "menu", icon: Icon(Icons.menu_book)),
            BottomNavigationBarItem(
                label: "your orders", icon: Icon(Icons.card_travel))
          ],
        ));
  }

  Widget foodButton(IconData icons, String title, int page) => Card(
        child: InkWell(
          onTap: () => setState(() => currentFoodPage = page == 0 ? 0 : 1),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50.0,
              child: Column(
                children: [
                  Icon(
                    icons,
                    color: page == currentFoodPage
                        ? Colors.teal[700]
                        : Colors.grey,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: page == currentFoodPage
                          ? Colors.teal[700]
                          : Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );

  Widget listTile(IconData icons, String title, int page) => ListTile(
        onTap: () => setState(() {
          currentPage = page == 0 ? 0 : 1;
          Navigator.of(context).pop();
        }),
        title: Row(
          children: [
            Icon(
              icons,
              color: page == currentPage ? Colors.teal[700] : Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: page == currentPage ? Colors.teal[700] : Colors.black,
                ),
              ),
            ),
          ],
        ),
      );
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(178.6),
            child: Container(
              height: 178.6,
              width: 178.6,
              child: Image.asset('assets/images/profile01.jpg'),
            ),
          ),
          Text(
            'Thatchaphon Orsuwan',
            style: TextStyle(fontSize: 33.3),
          ),
          Text(
            'Orsuwan_T@silpakorn.edu',
            style: TextStyle(color: Colors.teal[700], fontSize: 22.4),
          )
        ],
      ),
    );
  }
}
