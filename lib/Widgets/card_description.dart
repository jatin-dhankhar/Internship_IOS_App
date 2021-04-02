
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data.dart';

class CardDescription extends StatelessWidget {
  final String price;
  final List imageUrl;
  List<TransformationController> t = [
    TransformationController(),
    TransformationController(),
    TransformationController()
  ];
  TapDownDetails _doubleTapDetails;

  CardDescription(
    this.price,
    this.imageUrl,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Card(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ListView.builder(
                itemCount: imageUrl.length,
                itemBuilder: (ctx, i) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 3, color: Colors.green.shade700),
                      ),
                      child: GestureDetector(
                        onDoubleTapDown: (details) {
                          _doubleTapDetails = details;
                        },
                        onDoubleTap: () {
                          if (t[i].value != Matrix4.identity()) {
                            t[i].value = Matrix4.identity();
                          } else {
                            final position = _doubleTapDetails.localPosition;
                            // For a 3x zoom
                            t[i].value = Matrix4.identity()
                              ..translate(-position.dx * 2, -position.dy * 2)
                              ..scale(2.0);
                          }
                        },
                        child: InteractiveViewer(
                          transformationController: t[i],
                          boundaryMargin: EdgeInsets.all(80),
                          panEnabled: false,
                          child: Image.network(
                            imageUrl[i],
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.fill,
                            // colorBlendMode: BlendMode.modulate,
                            // color: Color.fromRGBO(255, 255, 255, 0.55),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                scrollDirection: Axis.horizontal, // <-- Like so
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              children: [
                Text(
                  'Colors',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.25 * .22,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                Container(
                  width: MediaQuery.of(context).size.width * 0.55,
                  height: 40,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, i) {
                        return Container(
                          margin: EdgeInsets.all(3),
                          width: MediaQuery.of(context).size.width * 0.08,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            color: pieColors[i],
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                ),
                // Expanded(child:  Container(
                //   margin: EdgeInsets.all(3),
                //   width: MediaQuery.of(context).size.width * 0.08,
                //   height: MediaQuery.of(context).size.height * 0.06,
                //   decoration: BoxDecoration(
                //     color: pieColors[0],
                //     shape: BoxShape.circle,
                //   ),
                // ),),
                // Expanded(child:  Container(
                //   margin: EdgeInsets.all(3),
                //   width: MediaQuery.of(context).size.width * 0.08,
                //   height: MediaQuery.of(context).size.height * 0.06,
                //   decoration: BoxDecoration(
                //     color: pieColors[1],
                //     shape: BoxShape.circle,
                //   ),
                // ),),
                // Expanded(child:  Container(
                //   margin: EdgeInsets.all(3),
                //   width: MediaQuery.of(context).size.width * 0.08,
                //   height: MediaQuery.of(context).size.height * 0.06,
                //   decoration: BoxDecoration(
                //     color: pieColors[2],
                //     shape: BoxShape.circle,
                //   ),
                // ),),
                // Expanded(child:  Container(
                //   margin: EdgeInsets.all(3),
                //   width: MediaQuery.of(context).size.width * 0.08,
                //   height: MediaQuery.of(context).size.height * 0.06,
                //   decoration: BoxDecoration(
                //     color: pieColors[3],
                //     shape: BoxShape.circle,
                //   ),
                // ),),
                // Expanded(child:  Container(
                //   margin: EdgeInsets.all(3),
                //   width: MediaQuery.of(context).size.width * 0.08,
                //   height: MediaQuery.of(context).size.height * 0.06,
                //   decoration: BoxDecoration(
                //     color: pieColors[4],
                //     shape: BoxShape.circle,
                //   ),
                // ),),
                // Expanded(child:  Container(
                //   margin: EdgeInsets.all(3),
                //   width: MediaQuery.of(context).size.width * 0.08,
                //   height: MediaQuery.of(context).size.height * 0.06,
                //   decoration: BoxDecoration(
                //     color: pieColors[5],
                //     shape: BoxShape.circle,
                //   ),
                // ),),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              children: [
                Text(
                  'Size',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.25 * .22,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.green.shade700),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 55,
                    ),
                    child: Text(
                      '${price}mm',
                      style: TextStyle(
                        fontSize:
                            MediaQuery.of(context).size.width * 0.25 * .22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }

  void _handleDoubleTapDown(TapDownDetails details) {
    _doubleTapDetails = details;
  }

  void _handleDoubleTap() {
    if (t[0].value != Matrix4.identity()) {
      t[0].value = Matrix4.identity();
    } else {
      final position = _doubleTapDetails.localPosition;
      // For a 3x zoom
      t[0].value = Matrix4.identity()
        ..translate(-position.dx * 2, -position.dy * 2)
        ..scale(2.0);
      // Fox a 2x zoom
      // ..translate(-position.dx, -position.dy)
      // ..scale(2.0);
    }
  }
}
