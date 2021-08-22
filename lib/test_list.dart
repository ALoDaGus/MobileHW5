void main() {
  
  List list = [1, 2, 3, 4];
  list.forEach((element) {
    print(element);
  });

  List list2 = list.map((i) => {
    'data': i
  }).toList();

  print(list2);


  List<Map<String, dynamic>> reportList = [
    {'date': '1กค', 'case': 5533, 'death': 57},
    {'date': '2กค', 'case': 6087, 'death': 61},
    {'date': '3กค', 'case': 6230, 'death': 41},
    {'date': '4กค', 'case': 5916, 'death': 44},
    {'date': '5กค', 'case': 6166, 'death': 50},
  ];

  // reportList.forEach((Map<String, dynamic> i) => print('วันที่ ${i['date']}, ติดเชื้อ ${i['case']}, เสียชีวิต ${i['death']}'));

}
