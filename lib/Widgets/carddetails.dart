import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'data.dart';

class CardDetails extends StatelessWidget {
  CardDetails({@required this.number});
  final int number;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
              margin: EdgeInsets.all(20),
              child: Text(
                "ELASTO INDIA",
                style: TextStyle(color: Colors.white, fontSize: 23),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 30.0, top: 10),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 20),
                    width: 120,
                    child: Image.asset(
                      "assets/images/logo_elasto.png",
                      color: Colors.white,
                    )),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(left: 50),
                  child: IconButton(
                    onPressed: () async {
                      final ByteData bytes = await rootBundle.load('assets/images/sharecard.jpeg');
                      await Share.file('esys image', 'esys.png', bytes.buffer.asUint8List(), 'image/png',);
                    },
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset("assets/images/qr_code.png"),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 30.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.people,
                      color: Colors.white,
                      size: 25,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Puneet Jain",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(Icons.call, color: Colors.white, size: 25),
                    Column(
                      children: [
                        Text(
                          "+91-11-27048582",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "+91-11-27058582",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(Icons.ac_unit_rounded, color: Colors.white, size: 25),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Puneet Jain",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(Icons.mail, color: Colors.white, size: 25),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "elastoindia98@yahoo.com",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
