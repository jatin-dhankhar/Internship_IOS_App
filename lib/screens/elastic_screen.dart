
import 'package:elasto_india/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import '../Widgets/product_item.dart';

class   ElasticScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context, listen: false)
        .findByName('Elastics')
        .reversed
        .toList();
    // return
      // GridView.builder(
      //   padding: const EdgeInsets.all(10),
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     // childAspectRatio: MediaQuery.of(context).size.height > 1000
      //     //     ? 2 / 1.59
      //     //     : MediaQuery.of(context).size.height < 575
      //     //         ? 1.55 / 1.75
      //     //         :(MediaQuery.of(context).size.width/450)/(MediaQuery.of(context).size.height/800),
      //     crossAxisSpacing: 30,
      //     mainAxisSpacing: 30,
      //   ),
      //   itemBuilder: (ctx, i) => ProductItem(
      //         products[i].key,
      //         products[i].category,
      //         products[i].price,
      //         products[i].title,
      //         products[i].ImageUri,
      //       ),
      //   itemCount: products.length);
    return StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        crossAxisSpacing: 25,
        mainAxisSpacing: 25,
        padding: EdgeInsets.all(5),
        itemCount: products.length,
        itemBuilder:  (ctx, i) => Container(
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
        staggeredTileBuilder: (index) {
          return  StaggeredTile.fit(1
              // , index.isEven ? 1.11: 1.11
          );
        }
    );
  }
}
