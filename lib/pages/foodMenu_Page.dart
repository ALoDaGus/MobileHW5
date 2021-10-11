import 'package:flutter/material.dart';
import 'food_page.dart';
class foodMenu_Page extends StatefulWidget {
  const foodMenu_Page({Key? key}) : super(key: key);

  @override
  _foodMenu_PageState createState() => _foodMenu_PageState();
}

class _foodMenu_PageState extends State<foodMenu_Page> {
  var items = [
    FoodItem(id: 1, name: "ข้าวไข่เจียว", price: 30, image: "kao_kai_jeaw"),
    FoodItem(id: 2, name: "ข้าวหมูแดง", price: 30, image: "kao_moo_dang"),
    FoodItem(id: 3, name: "ข้าวมันไก่", price: 30, image: "kao_mun_kai"),
    FoodItem(id: 4, name: "ข้าวหน้าเป็ด", price: 30, image: "kao_na_ped"),
    FoodItem(id: 5, name: "ข้าวผัด", price: 30, image: "kao_pad"),
    FoodItem(id: 6, name: "ผัดซิอิ๊ว", price: 30, image: "pad_sie_eew"),
    FoodItem(id: 7, name: "ผัดไทย", price: 30, image: "pad_thai"),
    FoodItem(id: 8, name: "ราดหน้า", price: 30, image: "rad_na"),
    FoodItem(id: 9, name: "ส้มตำไก่ย่าง", price: 30, image: "som_tum_kai_yang"),
  ];
  
  Widget foodCard(FoodItem item) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
                  context,
                  food_page.routeName, //FoodDetails,
                  arguments: item,
                );
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              // height: 76.0,
              width: 76.0,
              child: Image.asset('assets/images/foods/${item.image}.jpg'),
            ),
          ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(item.name), Text("${item.price} บาท")],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          //Map<String, dynamic> item = items[index];
          var item = items[index];
          return Container(
            child: Column(
              children: [foodCard(item)],
            ),
          );
        },
      ),
    );
  }
}

class FoodItem {
  final int id;
  final String name;
  final int price;
  final String image;
  FoodItem(
      {required this.id,
      required this.name,
      required this.price,
      required this.image});

  @override
  String toString() {
    return "$name ราคา $price บาท";
  }
}
