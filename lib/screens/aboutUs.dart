
import 'package:elasto_india/Widgets/cardsection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  static const routeName = 'about-us';

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> with WidgetsBindingObserver {
  bool isBackButtonActivated = false;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    convert();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
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

  String url =
      Uri.encodeFull("https://api.whatsapp.com/send?phone=919899717933");
  String text = Uri.encodeFull(
      "&text=Hey! I want an android application to be build");

  void _launchURLIndialove() async => await launch(url);
  final _urlphone = Uri.encodeFull('tel:+919582961360');
  final _urlphone1 = Uri.encodeFull('tel:+919315962134');
  final _urlphone2 = Uri.encodeFull('tel:01127048582');
  final _urlphone3 = Uri.encodeFull('tel:+919899717933');
  final _urlMail = Uri.encodeFull(
      'mailto:elastoindia98@yahoo.com?subject=Enquiry&body=I would like to');
  final _urlWeb = Uri.encodeFull('http://www.elastoindia.com');
  final maps_url = Uri.encodeFull("http://maps.google.com/maps?daddr" +
      "=Plot No. 1146,Rithala Industrial Area, Rohini, Delhi-110085");
  final maps_url2 = Uri.encodeFull("http://maps.google.com/maps?daddr" +
      "=PLOT NO. 1236, HSIDC RAI INDUSTRIAL AREA, PHASE-1, SONEPAT 131029(HR.)");
  static const String homeLat = "28.933028";
  static const String homeLng = "77.087028";
  static const String homeiLat = "28.721639";
  static const String homeiLng = "77.104861";
  static final String googleMapslocationUrl2 = Uri.encodeFull(
      "https://www.google.com/maps/search/?api=1&query=$homeiLat,$homeiLng");

  static final String googleMapslocationUrl = Uri.encodeFull(
      "https://www.google.com/maps/search/?api=1&query=$homeLat,$homeLng");

  void _launchURLPhone() async => await launch(_urlphone);

  void _launchURLPhone3() async => await launch(_urlphone3);

  void _launchURLPhone1() async => await launch(_urlphone1);

  void _launchURLPhone2() async => await launch(_urlphone2);

  void _launchURLMaps() async => await launch(maps_url);

  void _launchURLMaps2() async => await launch(googleMapslocationUrl2);

  void _launchURLMail() async => await launch(_urlMail);

  void _launchURLMap() async => await launch(googleMapslocationUrl);

  void _launchURLWeb() async => await launch(_urlWeb);

  @override
  String s = "";

  void convert() {
    const int flagOffset = 0x1F1E6;
    const int asciiOffset = 0x41;

    final codeToCountryEmoji = (code) {
      final char1 = code.codeUnitAt(0) - asciiOffset + flagOffset;
      final char2 = code.codeUnitAt(1) - asciiOffset + flagOffset;
      return String.fromCharCode(char1) + String.fromCharCode(char2);
    };

    s = codeToCountryEmoji("IN");
    // print(s);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .25,
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/knittedfive.jpg",
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                        colorBlendMode: BlendMode.modulate,
                        color: Color.fromRGBO(255, 255, 255, 0.7),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                              icon: Icon(
                                Icons.chevron_left,
                                color: Colors.white,
                                size: 40,
                              ),
                              onPressed: () {
                                // Navigator.of(context)
                                //     .pushNamed('home',);
                                Navigator.of(context).pop();
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .75,
                  child: ListView(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            contact(
                                name: "Head Office",
                                address:
                                    "Plot No. 1146, RITHALA INDUSTRIAL AREA,\nDELHI- 11085",
                                imageaddress: "assets/images/map.png",
                                ontap: () {
                                  _launchURLMaps2();
                                }),
                            contact(
                                name: "Production Unit",
                                address:
                                    "PLOT NO 1236,HSIDC RAI INDUSTRIAL AREA ,\nPHASE-1,SONEPAT 131029 (HR.)",
                                imageaddress: "assets/images/map.png",
                                ontap: () {
                                  _launchURLMap();
                                }),
                            contact(
                                name: "Email",
                                address: "elastoindia98@yahoo.com",
                                imageaddress: "assets/images/mail-128.png",
                                ontap: () async {
                                  String uri = Uri.encodeFull('mailto:elastoindia98@yahoo.com?subject=Enquiry&body=I would like to');
                                  await launch(uri);
                                }),
                            contact(
                                name: "Website",
                                address: "www.elastoindia.com",
                                imageaddress: "assets/images/global.png",
                                ontap: () {
                                  _launchURLWeb();
                                }),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap:(){
                                            _launchURLPhone();
                                          },
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.15,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xffB7DC00),
                                                  width: 3),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                "assets/images/phone.png",
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.25,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .25 *
                                                    .18),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Phone",
                                                  style: TextStyle(
                                                      color: Color(0xff3F51B5),
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.25 *
                                                              .15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                FittedBox(
                                                  fit: BoxFit.fill,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          _launchURLPhone();
                                                        },
                                                        child: Text(
                                                          "Mr Ramjan Ali : 9582961360",
                                                          style: TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.25 *
                                                                  .10),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          _launchURLPhone1();
                                                        },
                                                        child: Text(
                                                          "Mr Chandresh Kumar : 9315962134",
                                                          style: TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.25 *
                                                                  .10),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          _launchURLPhone2();
                                                        },
                                                        child: Text(
                                                          "Landline : 01127048582,27058582",
                                                          style: TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.25 *
                                                                  .10),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 0),
                                      child: const MySeparator(),
                                    )
                                  ],
                                ),
                              ),
                            )
                            // contact(
                            //   name: "Phone",
                            //   address:
                            //       "Mr Ramjan Ali : 9582961360 \nMr Chandresh Kumar : 9315962134 \nLandline : 01127048582,27058582 ",
                            //   imageaddress: "assets/images/phone.png",
                            //   ontap: () {
                            //     _launchURLPhone();
                            //   }
                            // ),
                          ],
                        ),
                      ),
                      Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10),
                            child: Text(
                              "About Us",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.25 *
                                      .25),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              "Who we are?",
                              style: TextStyle(
                                  color: Color(0xff3F51B5),
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.25 *
                                      .20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "We Elasto India  are renowned organisation in manufacturing premium quality range of Designer Elastic and Designer Webbings etc",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.25 *
                                      .15),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              "Our Infrastructure",
                              style: TextStyle(
                                  color: Color(0xff3F51B5),
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.25 *
                                      .20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "We have technologically advanced infrastructural and that is installed with modern tools and machinery. this infrastructural unit help us to design these products as per clients needs.Our infrastructure provides functional departments such as procurement, designing, quality control, research and development, warehousing and packaging and transport and logistics. These work processes are supervised under the direction of our experienced professionals.",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.25 *
                                      .15),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              "Our Strengths",
                              style: TextStyle(
                                  color: Color(0xff3F51B5),
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.25 *
                                      .20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "We have attained a strong presence in the industry due to our quality range of Tapes and Elastics. Apart from quality, our products are known among clients for various other attributes which are as follows: \n\n  •Extensive R and D efforts \n\n  •On time delivery \n\n •Highest quality standards",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.25 *
                                      .15),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              "Why Us?",
                              style: TextStyle(
                                  color: Color(0xff3F51B5),
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.25 *
                                      .20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "As a recognized name in the industry, we are offering high quality products. Some of the features that help us to stay ahead of our competitors are as follows:\n\n  •Experienced team of professionals\n\n  •Well-furnished infrastructural facility\n\n  •Ethical business policies\n\n  •Complete client satisfaction\n\n  •Total Quality Management\n\n  •Competitive pricing \n\n  •Immediate delivery",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.25 *
                                      .15),
                            ),
                          ),
                          CardSection(),
                          GestureDetector(
                            onTap: () {
                              url += text;
                              _launchURLIndialove();
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: Center(
                                child: Text(
                                  "Made with ❤ in $s",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.25 *
                                              .15),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _launchURLPhone3();
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: Center(
                                child: Text(
                                  "Designed by Jatin (+91-9999600589)",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.25 *
                                              .15),
                                ),
                              ),
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * .15),
            child: Container(
                color: Color(0xffB7DC00),
                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * .15,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Image.asset(
                            "assets/images/elastologowithball.png",
                          ),
                        )),
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Image.asset(
                                  "assets/images/elast_logo_dark.jpg",
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Text(
                                      "Epitome of Excellence",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        // Column(
                        //   children: [
                        //     Expanded(),
                        //     Expanded(
                        //         child: Text("Epitome of Excellence", style: TextStyle(
                        //           fontSize: 18,
                        //           color: Colors.white
                        //         ),)
                        //     )
                        //   ],
                        // ),
                        )
                  ],
                )),
          )
        ],
      ),
    );
  }
}

class contact extends StatelessWidget {
  contact({this.name, this.address, this.imageaddress, this.ontap});

  String name;
  String address;
  String imageaddress;
  Function ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical:
                            MediaQuery.of(context).size.width * 0.25 * .20),
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.width * 0.15,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffB7DC00), width: 3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "$imageaddress",
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.width * 0.25,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * .25 * .18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$name",
                            style: TextStyle(
                                color: Color(0xff3F51B5),
                                fontSize: MediaQuery.of(context).size.width *
                                    0.25 *
                                    .15,
                                fontWeight: FontWeight.bold),
                          ),
                          FittedBox(
                            fit: BoxFit.fill,
                            child: Text(
                              "$address",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.25 *
                                      .10),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                child: const MySeparator(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MySeparator extends StatelessWidget {
  final double height;
  final Color color;

  const MySeparator({this.height = 1, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 15.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
