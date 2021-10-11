import 'package:flutter/material.dart';
import 'package:hw04/pages/foodMenu_Page.dart';

class food_page extends StatefulWidget {
  const food_page({Key? key}) : super(key: key);

  static const routeName = '/food';

  @override
  _food_pageState createState() => _food_pageState();
}

class _food_pageState extends State<food_page> {
  @override
  Widget build(BuildContext context) {
    var item = ModalRoute.of(context)!.settings.arguments as FoodItem;

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            // Image.asset(
            //   'assets/images/foods/${item.image}.jpg',
            //   fit: BoxFit.cover,
            // ),
            FittedBox(
              child: Image.asset('assets/images/foods/${item.image}.jpg'),
              fit: BoxFit.fill,
            ),
            Text("ชื่อเมนู : ${item.name}"),
            Text("ราคา : ${item.price}"),
          ],
        ),
      ),
    );
  }
}
