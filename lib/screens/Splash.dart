import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:elasto_india/providers/product.dart';
import 'package:elasto_india/providers/products.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  AnimationController controller, controller2;
  Animation<Offset> offset, offset2;
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      lowerBound: 100,
      upperBound: 1010,
    );
    controller2.addListener(() {
      setState((){});
    });


    TickerFuture tickerFuture = controller2.repeat(reverse: true);
    tickerFuture.timeout(Duration(seconds: 3), onTimeout:  () {
      controller2.forward(from: 0);
      //controller2.stop(canceled: true);
    });
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1, milliseconds: 50),
    );
    offset = Tween<Offset>(
      end: Offset(0.0, 0.0),
      begin: Offset(0.0, 4.0),
    ).animate(controller);
    offset2 = Tween<Offset>(
      end: Offset(0.0, 0.0),
      begin: Offset(0.0, -4.0),
    ).animate(controller);
    controller.forward();
    values();
    startTime();
    // if(controller. && controller2.isCompleted){
    //   print("done");
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs() ));
    // }
  }
  List<Product> products ;
  void values(){
    Future.delayed(Duration.zero).then((value) {
      Provider.of<Products>(context, listen: false).fetchAndSetProduct();
    });
     products =   Provider.of<Products>(context, listen: false).items;

     for(int i = 0;i<products.length;i++)print(products[i].key);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context){
        return Home(products: products,);
        }
    )
    );
  }


  startTime() {
    var duration = new Duration(seconds: 4);
    return Timer(duration, route);

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs() ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff297045),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: BounceInDown(
                        delay: Duration(seconds: 2,),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*.50, right: MediaQuery.of(context).size.width*.43,bottom: MediaQuery.of(context).size.height*.21 ),
                            child: Image.asset("assets/images/ball.png",
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(child: Container())
              ],
            ),
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * .8,
              child: Column(
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(),
                  ),

                  // Expanded(
                  //   flex: 3,
                  //
                  //   child: Padding(
                  //     padding: EdgeInsets.only(
                  //         right: 25.0, top: 25, bottom: 25, left: 40),
                  //     child: SlideTransition(
                  //       position: Tween<Offset>(
                  //         end: Offset(0.0, controller2.value/10 + 0.1),
                  //         begin: Offset(0.0, 0.0),
                  //       ).animate(controller),
                  //       child: Image.asset("assets/images/ball.png",
                  //           color: Colors.white),
                  //     ),
                  //   ),
                  // ),
                  Expanded(
                      flex: 14,
                      child: Padding(
                        padding: EdgeInsets.all(50),
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: SlideTransition(
                                position: offset2,
                                child: Image.asset("assets/images/elastologo.png",
                                    color: Colors.white))),
                      )),
                  Expanded(
                      flex: 14,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: SlideTransition(
                              position: offset,
                              child: Image.asset(
                                "assets/images/apptext.png",
                                color: Colors.white,
                              )),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],

      ),
    );
  }
}
