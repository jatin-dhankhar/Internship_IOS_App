import 'dart:async';


import 'package:elasto_india/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../Widgets/product_item.dart';

class WhatsNewScreen extends StatefulWidget {
  int count;

  WhatsNewScreen({this.count});

  @override
  _WhatsNewScreenState createState() => _WhatsNewScreenState();
}

class _WhatsNewScreenState extends State<WhatsNewScreen> {
  bool val = true;

  startTime(int count) async {
    if (count == 0) {
      var duration = new Duration(seconds: 3);
      return Timer(duration, () {
        setState(() {
          val = false;
          print("done");
        });
      });
    } else {
      setState(() {
        val = false;
      });
    }
  }

  @override
  void initState() {
    startTime(widget.count);
    print(widget.count);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print((MediaQuery
        .of(context)
        .size
        .width / 400).toString());
    print((MediaQuery
        .of(context)
        .size
        .height / 400).toString());
    final products = Provider
        .of<Products>(context)
        .items
        .reversed
        .toList();
    // products.reversed;
    return val == false
        ?
    StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        padding: EdgeInsets.all(5),
        itemCount: products.length,
        itemBuilder: (ctx, i) =>
            Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(
                      Radius.circular(5))
              ),
              child: ProductItem(
                products[i].key,
                products[i].category,
                products[i].price,
                products[i].title,
                products[i].ImageUri,
              ),
            ),
        crossAxisSpacing: 25,
        mainAxisSpacing: 25,
        staggeredTileBuilder: (index) {
          return StaggeredTile.fit(1,
              // index.isEven ? MediaQuery
              // .of(context)
              // .size
              // .height > 1000 ? 1 : 1.11 : MediaQuery
              // .of(context)
              // .size
              // .height > 1000 ? 1 : 1.11
          );
        }
    )
    // GridView.builder(
    //         padding: const EdgeInsets.all(10),
    //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: 2,
    //           // childAspectRatio: MediaQuery.of(context).size.height > 1000
    //           //     ? 2 / 1.59
    //           //     : MediaQuery.of(context).size.height < 575
    //           //         ? 1.55 / 1.75
    //           //         :(MediaQuery.of(context).size.width/450)/(MediaQuery.of(context).size.height/800),
    //           crossAxisSpacing: 30,
    //           mainAxisSpacing: 30,
    //         ),
    //         itemBuilder: (ctx, i) => ProductItem(
    //               products[i].key,
    //               products[i].category,
    //               products[i].price,
    //               products[i].title,
    //               products[i].ImageUri,
    //             ),
    //         itemCount: products.length)
        : Shimmer.fromColors(
        direction: ShimmerDirection.rtl,
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        enabled: true,
        child:
        StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            padding: EdgeInsets.all(5),
            itemCount: products.length,
            itemBuilder: (ctx, i) =>
                Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(
                          Radius.circular(5))
                  ),
                  child: ProductItem(
                    products[i].key,
                    products[i].category,
                    products[i].price,
                    products[i].title,
                    products[i].ImageUri,
                  ),
                ),
            crossAxisSpacing: 25,
            mainAxisSpacing: 25,
            staggeredTileBuilder: (index) {
              return StaggeredTile.count(1, index.isEven ? MediaQuery
                  .of(context)
                  .size
                  .height > 1000 ? 2 : 1.11 : MediaQuery
                  .of(context)
                  .size
                  .height > 1000 ? 1.59 : 1.11);
            }
        )
    );}}
    //   GridView.builder(
    //       padding: const EdgeInsets.all(10),
    //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 2,
    //         // childAspectRatio: MediaQuery.of(context).size.height > 1000
    //         //     ? 2 / 1.59
    //         //     : MediaQuery.of(context).size.height < 575
    //         //         ? 1.55 / 1.75
    //         //         : (MediaQuery.of(context).size.width/450)/(MediaQuery.of(context).size.height/800),
    //         crossAxisSpacing: 30,
    //         mainAxisSpacing: 30,
    //       ),
    //       itemBuilder: (ctx, i) => ProductItem(
    //             products[i].key,
    //             products[i].category,
    //             products[i].price,
    //             products[i].title,
    //             products[i].ImageUri,
    //           ),
    //       itemCount: products.length),
    // );
//     GridView.builder(
//         padding: const EdgeInsets.all(10),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 1.55 / 1.65,
//           crossAxisSpacing: 30,
//           mainAxisSpacing: 30,
//         ),
//         itemBuilder: (ctx, i) => ProductItem(
//               products[i].key,
//               products[i].category,
//               products[i].price,
//               products[i].title,
//               products[i].ImageUri,
//             ),
//         itemCount: products.length);
//   }
// }

// StaggeredGridView.countBuilder(
// crossAxisCount: 2,
// padding:  EdgeInsets.all(5),
// itemCount: products.length,
// itemBuilder:  (ctx, i) => Container(
// decoration: BoxDecoration(
// color: Colors.transparent,
// borderRadius: BorderRadius.all(
// Radius.circular(5))
// ),
// child: ProductItem(
// products[i].key,
// products[i].category,
// products[i].price,
// products[i].title,
// products[i].ImageUri,
// ),
// ),
// crossAxisSpacing: 25,
// mainAxisSpacing: 25,
// staggeredTileBuilder: (index) {
// return  StaggeredTile.count(1, index.isEven ? 1.11: 1.11);
// }
// )
