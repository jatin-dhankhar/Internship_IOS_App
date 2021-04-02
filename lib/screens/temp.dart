import 'dart:async';


import 'package:elasto_india/Widgets/search.dart';
import 'package:elasto_india/providers/product.dart';
import 'package:elasto_india/providers/products.dart';
import 'package:elasto_india/screens/webbings_screen.dart';
import 'package:elasto_india/screens/whats_new_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:search_widget/search_widget.dart';

import 'elastic_screen.dart';
import 'home.dart';

class temp extends StatefulWidget {
  static const routeName = 'home';
  List<Product> products;
  temp({this.products});
  @override
  _tempState createState() => _tempState();
}

class _tempState extends State<temp> {
  List<Product> productvalues;
  int _page = 0;
  PageController _pageController;
  final TextEditingController _controller = new TextEditingController();
  List<Product> products;
  @override
  void initState() {
    _pageController = PageController(initialPage: _page);
    startTime();
    super.initState();
  }
  startTime() async {
    var duration = new Duration(seconds: 20);
    products =   Provider.of<Products>(context, listen: false).items;
    return Timer(duration, route);
  }
  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Home(products: products ,)
    )
    );
  }
  int count = 0;



  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _page,
            onTap: (index) {
              this._pageController.animateToPage(index,
                  duration: Duration(milliseconds: 200), curve: Curves.easeIn);
            },
            // selectedItemColor: Colors.black,
            // unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
            selectedItemColor: Color(0xffB7DC00),
            unselectedItemColor: Colors.grey,
            iconSize: MediaQuery
                .of(context)
                .size
                .height * 0.03,
            selectedFontSize: 12,
            unselectedFontSize: 10,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "What's New ", ),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/woolen.png')),
                  label: "Elastics"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/knitting.png')),
                  label: "Webbings")
            ]),
        body: Stack(
          children: [
            Column(
              children: [
                // Expanded(child: Container()),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * .20,
                  child: Stack(
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.8), BlendMode.dstATop),
                        child: Image.asset(
                          "assets/images/wovenone.jpg",
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          fit: BoxFit.fill,
                          colorBlendMode: BlendMode.modulate,
                          color: Color.fromRGBO(255, 255, 255, 0.55),
                        ),
                      ),
                      // Column(
                      //   // mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Container(
                      //       width: MediaQuery.of(context).size.width * 0.4,
                      //       height: MediaQuery.of(context).size.height * 0.2,
                      //       // flex: 3,
                      //       child: Image.asset(
                      //         "assets/images/apptext.png",
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //     Container(
                      //       // child: FittedBox(
                      //       //   fit: BoxFit.fill,
                      //         child: Text(
                      //           "Epitome of Excellence",
                      //           style: TextStyle(color: Colors.white),
                      //         ),
                      //       ),
                      // ),
                      //   ],
                      // ),

                      Positioned(
                        top: MediaQuery
                            .of(context)
                            .size
                            .height * 0.08,
                        left: MediaQuery
                            .of(context)
                            .size
                            .width * 0.04,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Image.asset(
                                "assets/images/apptext.png",
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.35,
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.05,
                                fit: BoxFit.fitWidth,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Epitome of Excellence",
                                style: TextStyle(
                                    color: Colors.white,fontSize: 16 ),

                              ),
                            )
                          ],
                        ),
                      ),

                      Positioned(
                        top: MediaQuery
                            .of(context)
                            .size
                            .height * 0.07,
                        right: MediaQuery
                            .of(context)
                            .size
                            .width * 0.04,
                        child: Column(
                          children: [
                            IconButton(
                                iconSize: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.04,
                                icon: ImageIcon(
                                  AssetImage(
                                    'assets/images/shop.png',
                                  ),
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed('about-us');
                                  // print("back");
                                }),
                            Text(
                              "About Us",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (newpage) {
                        setState(() {
                          this._page = newpage;
                          count++;
                          print(count);
                        });
                      },

                      children: [
                        WhatsNewScreen(count: count,),
                        ElasticScreen(),
                        WebbingsScreen(),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Positioned(
              top: MediaQuery.of(context).size.height*0.17,
              left: MediaQuery.of(context).size.width*0.16,
              child: Container(
                child: Search(products),
              ),
            ),

          ],

        ),
      ),
    );
  }
}

