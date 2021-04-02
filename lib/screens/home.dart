
import 'package:elasto_india/Widgets/search.dart';
import 'package:elasto_india/providers/product.dart';
import 'package:elasto_india/providers/products.dart';
import 'package:elasto_india/screens/webbings_screen.dart';
import 'package:elasto_india/screens/whats_new_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:search_widget/search_widget.dart';

import 'elastic_screen.dart';

class Home extends StatefulWidget {
  static const routeName = 'home';
  List<Product> products;

  Home({this.products});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isBackButtonActivated = false;

  // @override
  // void dispose() {
  //   WidgetsBinding.instance.removeObserver(this);
  //   super.dispose();
  // }
  // @override
  // didPopRoute() {
  //   bool override;
  //   if(isBackButtonActivated)
  //     override = false;
  //   else
  //     override = true;
  //   return new Future<bool>.value(override);
  // }
  int _page = 0;
  PageController _pageController;
  List<Product> products;

  @override
  void initState() {
    // WidgetsBinding.instance.addObserver(this);
    _pageController = PageController(initialPage: _page);
    super.initState();
  }

  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (products == null) {
      // print("Khali");
      setState(() {
        products = Provider.of<Products>(context, listen: false).items;
      });
    }
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
            iconSize: MediaQuery.of(context).size.height > 1000
                ? MediaQuery.of(context).size.height * 0.035
                : MediaQuery.of(context).size.height < 575
                    ? MediaQuery.of(context).size.height * 0.03
                    : MediaQuery.of(context).size.height * 0.035,
            // MediaQuery.of(context).size.height * 0.03,
            selectedFontSize: MediaQuery.of(context).size.height > 1000
                ? 18
                : MediaQuery.of(context).size.height < 575
                    ? 12
                    : 15,
            // 12,
            unselectedFontSize: MediaQuery.of(context).size.height > 1000
                ? 16
                : MediaQuery.of(context).size.height < 575
                    ? 10
                    : 13,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "What's New ",
              ),
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
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .20,
                  child: Stack(
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.8), BlendMode.dstATop),
                        child: Image.asset(
                          "assets/images/wovenone.jpg",
                          width: MediaQuery.of(context).size.width,
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
                        top: MediaQuery.of(context).size.height * 0.08,
                        left: MediaQuery.of(context).size.width * 0.04,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              // padding: EdgeInsets.all(value),
                              child: Image.asset(
                                "assets/images/apptext.png",
                                width: MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                fit: BoxFit.fill,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Epitome of Excellence",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.25 *
                                      .15,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      Positioned(
                        top: MediaQuery.of(context).size.height > 1000
                            ? MediaQuery.of(context).size.height * 0.07
                            : MediaQuery.of(context).size.height < 575
                                ? MediaQuery.of(context).size.height * 0.04
                                : MediaQuery.of(context).size.height * 0.06,
                        // MediaQuery.of(context).size.height * 0.07,
                        right: MediaQuery.of(context).size.width * 0.04,
                        child: Column(
                          children: [
                            IconButton(
                                iconSize:
                                    MediaQuery.of(context).size.height * 0.05,
                                icon: ImageIcon(
                                  AssetImage(
                                    'assets/images/shop.png',
                                  ),
                                  color: Colors.white,
                                  size:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushNamed('about-us');
                                  // print("back");
                                }),
                            Text(
                              "About Us",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width *
                                    0.25 *
                                    .12,
                              ),
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
                        WhatsNewScreen(
                          count: count,
                        ),
                        ElasticScreen(),
                        WebbingsScreen(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height > 1000
                  ? MediaQuery.of(context).size.height * 0.185
                  : MediaQuery.of(context).size.height < 575
                      ? MediaQuery.of(context).size.height * 0.16
                      : MediaQuery.of(context).size.height * 0.17,
              // MediaQuery.of(context).size.height * 0.17,
              left: MediaQuery.of(context).size.width * 0.12,
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

class LeaderBoard {
  LeaderBoard(this.username, this.score);

  final String username;
  final String score;
}

class NoItemsFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          Icons.folder_open,
          size: 24,
          color: Colors.grey[900].withOpacity(0.7),
        ),
        const SizedBox(width: 10),
        Text(
          "No Items Found",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[900].withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}

class PopupListItemWidget extends StatelessWidget {
  const PopupListItemWidget(this.item);

  final LeaderBoard item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Text(
        item.username,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField(this.controller, this.focusNode);

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x4437474F),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          suffixIcon: Icon(Icons.search),
          border: InputBorder.none,
          hintText: "Search here...",
          contentPadding: const EdgeInsets.only(
            left: 16,
            right: 20,
            top: 14,
            bottom: 14,
          ),
        ),
      ),
    );
  }
}

class SelectedItemWidget extends StatelessWidget {
  const SelectedItemWidget(this.selectedItem, this.deleteSelectedItem);

  final LeaderBoard selectedItem;
  final VoidCallback deleteSelectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 4,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
                bottom: 8,
              ),
              child: Text(
                selectedItem.username,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete_outline, size: 22),
            color: Colors.grey[700],
            onPressed: deleteSelectedItem,
          ),
        ],
      ),
    );
  }
}
