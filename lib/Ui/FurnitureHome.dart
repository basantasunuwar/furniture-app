import 'package:flutter/material.dart';

class FurnitureHome extends StatefulWidget {
  @override
  _FurnitureHomeState createState() => _FurnitureHomeState();
}

class _FurnitureHomeState extends State<FurnitureHome>
    with SingleTickerProviderStateMixin {
  TabController controller;

  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.32,
                    width: double.infinity,
                    color: Color(getColorHexFromStr('#ba8c63')),
                  ),
                  Positioned(
                      bottom: 50.0,
                      right: 100.0,
                      child: Container(
                          height: 400.0,
                          width: 400.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200.0),
                              color: Color(getColorHexFromStr('#eebc91'))
                                  .withOpacity(0.08)))),
                  Positioned(
                      bottom: 100.0,
                      left: 150.0,
                      child: Container(
                          height: 300.0,
                          width: 300.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(150.0),
                              color: Color(getColorHexFromStr('#eebc91'))
                                  .withOpacity(0.09)))),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.0),
                      Row(
                        children: [
                          SizedBox(width: 15.0),
                          Container(
                              alignment: Alignment.topLeft,
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  border: Border.all(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: 2.0,
                                  ),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/chris.jpeg')))),
                          SizedBox(
                              width: MediaQuery.of(context).size.width - 120.0),
                          Container(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                icon: Icon(Icons.menu),
                                onPressed: () {},
                                color: Colors.white,
                                iconSize: 30.0,
                              )),
                          SizedBox(height: 50.0),
                        ],
                      ),
                      SizedBox(height: 50.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text('Hello, Basn',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 50.0,
                                fontWeight: FontWeight.bold,
                                color: Color(getColorHexFromStr('#e0e0e0')))),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text('What do you want to buy?',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 23.0,
                                fontWeight: FontWeight.bold,
                                color: Color(getColorHexFromStr('#e0e0e0')))),
                      ),
                      SizedBox(height: 25.0),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Material(
                          elevation: 9.0,
                          borderRadius: BorderRadius.circular(5.0),
                          child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.search,
                                      color:
                                          Color(getColorHexFromStr('#ba8c63')),
                                      size: 30.0),
                                  contentPadding:
                                      EdgeInsets.only(left: 15.0, top: 15.0),
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Quicksand'))),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Stack(
                        children: [
                          SizedBox(height: 10.0),
                          Material(
                            elevation: 1.0,
                            child: Container(height: 75.0, color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _fornitureType(
                                  'assets/images/sofas.png', 'Sofas'),
                              _fornitureType(
                                  'assets/images/wardrobe.png', 'Wardrobe'),
                              _fornitureType('assets/images/desks.png', 'Desk'),
                              _fornitureType(
                                  'assets/images/dresser.png', 'Dresser'),
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              _itemCard('FinnNavian', 'assets/images/ottoman.jpeg', false),
              _itemCard('LavinChair', 'assets/images/anotherchair.jpeg', false),
              _itemCard('FinnNavian', 'assets/images/ottoman.jpeg', false),
              _itemCard('FinnNavian', 'assets/images/chair.jpeg', false),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Material(
          color: Colors.white,
          child: TabBar(
            controller: controller,
            indicatorColor: Colors.yellow,
            tabs: [
              Tab(
                  icon: Icon(Icons.event_seat,
                      color: Color(getColorHexFromStr('#ba8c63')))),
              Tab(
                  icon: Icon(Icons.timer,
                      color: Color(getColorHexFromStr('#eebc91')))),
              Tab(
                  icon: Icon(Icons.shopping_cart,
                      color: Color(getColorHexFromStr('#eebc91')))),
              Tab(
                  icon: Icon(Icons.person_outline,
                      color: Color(getColorHexFromStr('#eebc91')))),
            ],
          )),
    );
  }

  Widget _fornitureType(String forniturImage, String name) {
    return Column(
      children: [
        Container(
            height: 75.0,
            width: MediaQuery.of(context).size.width / 4,
            child: Column(
              children: [
                Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                        image:
                            DecorationImage(image: AssetImage(forniturImage)))),
                Text(name, style: TextStyle(fontFamily: 'Quicksand'))
              ],
            ))
      ],
    );
  }

  Widget _itemCard(String title, String imgPath, bool isFavorite) {
    return Padding(
        padding: EdgeInsets.only(left: 15.0, right: 5.0, top: 15.0),
        child: Container(
            height: 150.0,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.37,
                  height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(imgPath), fit: BoxFit.cover)),
                ),
                SizedBox(width: 20.0),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(title,
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 17.9,
                                fontWeight: FontWeight.bold)),
                        SizedBox(width: 45.0),
                        Material(
                            elevation: isFavorite ? 0.0 : 2.0,
                            borderRadius: BorderRadius.circular(20.0),
                            child: Container(
                                height: 40.0,
                                width: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: isFavorite
                                      ? Colors.grey.withOpacity(0.2)
                                      : Colors.white,
                                ),
                                child: Center(
                                    child: isFavorite
                                        ? Icon(Icons.favorite_border)
                                        : Icon(Icons.favorite,
                                            color: Colors.red))))
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      width: 175.0,
                      child: Text(
                          'Scandinavian small sized double sofa imported full leather / Dale Italia oil wax leather black',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.grey,
                              fontSize: 12.0)),
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      children: [
                        SizedBox(
                          width: 35.0,
                        ),
                        Container(
                            height: 40.0,
                            width: 50.0,
                            color: Color(getColorHexFromStr('#ba8c63')),
                            child: Center(
                                child: Text('\$248',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.bold)))),
                        Container(
                            height: 40.0,
                            width: 100.0,
                            color: Color(getColorHexFromStr('#eebc91')),
                            child: Center(
                                child: Text('Add to Cart',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.bold))))
                      ],
                    )
                  ],
                )
              ],
            )));
  }
}
