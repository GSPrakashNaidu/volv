import 'package:assignment_volv/utils/constants.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController buttonCarouselController = CarouselController();
  int _current = 0;
  List<String> imageList = [
    assetPathToFlights,
    assetPathToJerry,
    assetPathToPizza
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  var item = imageList[_current];
                  return Container(
                    height: MediaQuery.of(context).size.height / 1.7,
                    child: Image.asset(item, fit: BoxFit.cover),
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 20,
            right: 20,
            child: Container(
              child: CarouselSlider(
                carouselController: buttonCarouselController,
                items: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2.4,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 6,
                      child: Container(
                        margin: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 10),
                                Text(
                                    'Boeing 737 Max cleared to fly by the Federal Aviation Authority',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 20),
                                Text(
                                  'Jeff Bezos named 16 environmental organizations as the first beneficiaries of '
                                  'his \$10B Earth fund. They will receive \$791M collectively. '
                                  'Bezos said he was inspired by the organizations\' work and added, '
                                  '"We can all protect Earth\'s future by taking bold action now." '
                                  'Why it matters? Less than 2% of global philanthropy is currently directed '
                                  'at solving climate change. As such, Bezos\' donations could be instrumental '
                                  'in tackling the climate crisis.',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.all(12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.access_time,
                                          color: Colors.black26),
                                      SizedBox(width: 5),
                                      Text('Today',
                                          style:
                                              TextStyle(color: Colors.black26))
                                    ],
                                  ),
                                  Container(
                                    child: Text('CHECK IT OUT',
                                        style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Row(
                                    children: [
                                      Text('Share',
                                          style:
                                              TextStyle(color: Colors.black26)),
                                      SizedBox(width: 5),
                                      Icon(Icons.ios_share,
                                          color: Colors.black26),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2.4,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 6,
                      child: Container(
                        margin: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 16),
                                Text(
                                    'This vegan cheese claims to taste like real cheese',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 20),
                                Text(
                                  'While plant-based milk has become mainstream, vegan cheese has struggled '
                                  'to get as much endorsement as it\'s challenging to replicate the taste '
                                  'and texture of cheese made from cow milk. Israel-based startup Remilk is '
                                  'trying to offer a solution by creating lab-made dairy protein using '
                                  'microbial fermentation. The protein can help make a vegan, lactose-free, '
                                  'cholesterol-free cheese that tastes like milk cheese.'
                                  'The company recently completed an \$11.3M funding round.',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.all(12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.access_time,
                                          color: Colors.black26),
                                      SizedBox(width: 5),
                                      Text('Today',
                                          style:
                                              TextStyle(color: Colors.black26))
                                    ],
                                  ),
                                  Container(
                                    child: Text('CHECK IT OUT',
                                        style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Row(
                                    children: [
                                      Text('Share',
                                          style:
                                              TextStyle(color: Colors.black26)),
                                      SizedBox(width: 5),
                                      Icon(Icons.ios_share,
                                          color: Colors.black26),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2.4,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 6,
                      child: Container(
                        margin: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 20),
                                Text(
                                    '1 in 4 delivery workers say they have tried your food',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 20),
                                Text(
                                  '1-in-4 delivery workers admit they have tried your food, according to 500 delivery '
                                  'workers surveyed by US Foods. 28% said they\'d '
                                  '\"taken food from an order," while 54% revealed that they\'ve been \"tempted by the smell of the food.\" '
                                  ' Adults who order online suggested that restaurants use \'tamper-proof\' packaging to prevent'
                                  'deliverers from sampling food. This has raised a cause for concern as many rely on food delivery for sustenance.',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.all(12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.access_time,
                                          color: Colors.black26),
                                      SizedBox(width: 5),
                                      Text('Today',
                                          style:
                                              TextStyle(color: Colors.black26))
                                    ],
                                  ),
                                  Container(
                                    child: Text('CHECK IT OUT',
                                        style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Row(
                                    children: [
                                      Text('Share',
                                          style:
                                              TextStyle(color: Colors.black26)),
                                      SizedBox(width: 5),
                                      Icon(Icons.ios_share,
                                          color: Colors.black26),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  aspectRatio: 2 / 2,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                  viewportFraction: 1,
                  initialPage: 0,
                  height: MediaQuery.of(context).size.height / 2.4,
                  enableInfiniteScroll: false,
                  reverse: false,
                  autoPlay: false,
                  pageSnapping: true,
                  disableCenter: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.vertical,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
