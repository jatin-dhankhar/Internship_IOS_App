
import 'package:elasto_india/Widgets/card_about_product.dart';
import 'package:elasto_india/Widgets/card_description.dart';
import 'package:elasto_india/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = 'product-detail-screen';

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    with WidgetsBindingObserver {
  bool isBackButtonActivated = false;

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  didPopRoute() {
    bool override;
    if (isBackButtonActivated)
      override = false;
    else
      override = true;
    return new Future<bool>.value(override);
  }

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .30,
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
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.2,
                    top: MediaQuery.of(context).size.height * .12,
                    child: Text(
                      loadedProduct.title,
                      style: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.width * 0.25 * .30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.24),
                    CardDescription(
                        loadedProduct.price, loadedProduct.ImageUri),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    CardAboutProduct(loadedProduct.category),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    IconButton(
                        iconSize: MediaQuery.of(context).size.height > 1000
                            ? 100
                            : 40,
                        icon: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: MediaQuery.of(context).size.height > 1000
                              ? 100
                              : 40,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Text(
                        'Elasto',
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.width * 0.25 * .24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xffB7DC00),
                  child: InkWell(
                      splashColor: Color(0xffB7DC00),
                      onTap: () {
                        // print('a');
                      },
                      child: GestureDetector(
                        onTap: () async {
                          final Uri params = Uri(
                            scheme: 'mailto',
                            path: 'elastoindia98@yahoo.com',
                            query: 'subject=Enquiry Regarding ${loadedProduct.title} &body=I would like to', //add subject and body here
                          );
                          String uri = Uri.encodeFull('mailto:elastoindia98@yahoo.com?subject=Enquiry Regarding ${loadedProduct.title}&body=I would like to');
                          await launch(uri);

                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/gmail.png'),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.05),
                            Text(
                              "ENQUIRY",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.25 *
                                      .28,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }



}
