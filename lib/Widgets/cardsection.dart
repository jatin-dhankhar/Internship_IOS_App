import 'dart:typed_data';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'data.dart';
import 'carddetails.dart';
class CardSection extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Center(
          child: Container(
            height: 275,
            width: 498,
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: primaryColor,
              ),
              child: Stack(children: [
                Positioned.fill(
                  child: Container(
                    child: Image.asset("assets/images/imagecard.JPG", fit: BoxFit.fill,),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () async {
                        final ByteData bytes = await rootBundle.load('assets/images/sharecard.jpeg');
                        await Share.file('esys image', 'esys.png', bytes.buffer.asUint8List(), 'image/png',);
                      },
                      child: IconButton(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*.19, right: MediaQuery.of(context).size.width*.12, ),
                        icon: Icon(Icons.share, color: Colors.transparent,size: MediaQuery.of(context).size.width*.08,),
                      ),
                    ),
                  ),
                ),
              ],),
            ),
          ),
        )
      ],
    );
  }
}