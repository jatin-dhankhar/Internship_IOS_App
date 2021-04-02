import 'package:elasto_india/screens/product_detail_screen.dart';

import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String category;
  final String price;
  final String title;
  final List imageUrl;

  ProductItem(
    this.id,
    this.category,
    this.price,
    this.title,
    this.imageUrl,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ProductDetailScreen.routeName, arguments: id);
        },
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.18,
                  child: Image.network(
                    // 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Wikipedia-logo-v2.svg/225px-Wikipedia-logo-v2.svg.png',
                    imageUrl[0],
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 15, 0, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize:  MediaQuery.of(context).size.width * 0.25 * .15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.004,
                      ),
                      Text(
                        category,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.25 * .10,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            MediaQuery.of(context).size.height > 1000
                ? Positioned(
                    top: MediaQuery.of(context).size.height * 0.18 - (MediaQuery.of(context).size.height * 0.11/2),
                    // MediaQuery.of(context).size.width * 0.15,
                    right: MediaQuery.of(context).size.width * 0.02,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: MediaQuery.of(context).size.height * 0.11,
                      decoration: BoxDecoration(
                        color: Color(0xffB7DC00),
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            price,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width *
                                  0.25 *
                                  .13,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          // SizedBox(
                          //   height: MediaQuery.of(context).size.height * 0.004,
                          // ),
                          Text(
                            'mm',
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width *
                                  0.25 *
                                  .13,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Positioned(
                    top: MediaQuery.of(context).size.height * 0.18 - (MediaQuery.of(context).size.height * 0.14/2),
                    right: MediaQuery.of(context).size.width * 0.02,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.12,
                      height: MediaQuery.of(context).size.height * 0.14,
                      decoration: BoxDecoration(
                        color: Color(0xffB7DC00),
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            price,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          // SizedBox(
                          //   height: MediaQuery.of(context).size.height * 0.004,
                          // ),
                          Text(
                            'mm',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
      // footer: GridTileBar(
      //   backgroundColor: Colors.white,
      //   leading: Text(
      //     'title',
      //     textAlign: TextAlign.start,
      //     style: TextStyle(
      //       color: Colors.black,
      //       fontWeight: FontWeight.w500,
      //       fontSize: 18,
      //     ),
      //   ),
      // ),
    );
    Card(
      elevation: 5,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacementNamed(
              ProductDetailScreen.routeName,
              arguments: id);
        },
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.10,
                  child: Image.network(
                    // 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Wikipedia-logo-v2.svg/225px-Wikipedia-logo-v2.svg.png',
                    imageUrl[0],
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 10, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.004,
                      ),
                      Text(
                        category,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.width * 0.01,
              right: MediaQuery.of(context).size.width * 0.02,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.14,
                height: MediaQuery.of(context).size.height * 0.14,
                decoration: BoxDecoration(
                  color: Colors.lightGreenAccent.shade700,
                  shape: BoxShape.circle,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * 0.004,
                    // ),
                    Text(
                      'mm',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // footer: GridTileBar(
      //   backgroundColor: Colors.white,
      //   leading: Text(
      //     'title',
      //     textAlign: TextAlign.start,
      //     style: TextStyle(
      //       color: Colors.black,
      //       fontWeight: FontWeight.w500,
      //       fontSize: 18,
      //     ),
      //   ),
      // ),
    );
  }
}
