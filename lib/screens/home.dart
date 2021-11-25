import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  @override
  _homePagePageState createState() => _homePagePageState();

}

class _homePagePageState extends State<homePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        margin: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 20),
        child: ListView(
          children: <Widget>[
            Container(
                height: 90,
                child: DefaultTabController(
                    length: 2,
                    child: Scaffold(
                      appBar: AppBar(
                        backgroundColor: Colors.grey[200],
                        elevation: 0,
                        bottom: TabBar(
                            unselectedLabelColor: Color(0xFF47536d),
                            indicatorSize: TabBarIndicatorSize.label,
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xFF47536d),),
                            tabs: [
                              Tab(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(color: Color(0xFF47536d), width: 1)),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text("Список"),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(color: Color(0xFF47536d), width: 1)),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text("На карте"),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ))),
            Container(
              height: 100,
              margin: EdgeInsets.only(top: 20, bottom: 3),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 30, top: 10, bottom: 10),
                    ),
                    Container(
                      child: Column(
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Бекешева 78', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                )
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 30, bottom: 10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Наурызбайский район,\nмикрорайон Акжар,\nулица Бекешева, 79/2',
                                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey)),
                                ))]),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 60),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.chevron_right_rounded, size: 50, color: Color(0xFF47536d),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 100,
              margin: EdgeInsets.only(bottom: 3),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 30, top: 10, bottom: 10),
                        child: Image.asset('images/asu.png')
                    ),
                    Container(
                      child: Column(
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Тастак 3', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                )
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 30, bottom: 10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('микрорайон Тастак-3,\nулица Артёма',
                                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey)),
                                ))]),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 65),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.chevron_right_rounded, size: 50, color: Color(0xFF47536d),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 100,
              margin: EdgeInsets.only(bottom: 3),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 30, top: 10, bottom: 10),
                        child: Image.asset('images/asu.png')
                    ),
                    Container(
                      child: Column(
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('№8 мкр. 25', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                )
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 30, bottom: 10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('8-й микрорайон, 25',
                                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey)),
                                ))]),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 80),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.chevron_right_rounded, size: 50, color: Color(0xFF47536d),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}