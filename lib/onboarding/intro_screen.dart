import 'dart:async';

import 'package:assignment_volv/utils/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_screen.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  CarouselController buttonCarouselController = CarouselController();
  int _current = 0;
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (_current == 0)
          ? Colors.amberAccent.shade400
          : (_current == 1)
              ? Colors.blueGrey
              : Colors.white60,
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CarouselSlider(
                carouselController: buttonCarouselController,
                items: [
                  Container(
                    margin: EdgeInsets.only(top: 120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset(assetPathToIntro1),
                            SizedBox(height: 20),
                            Text(
                                'Boeing 737 Max cleared to fly by the Federal Aviation Authority',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(height: 20),
                            Text(
                              'Jeff Bezos named 16 environmental organizations as the first beneficiaries of '
                              'his \$10B Earth fund. They will receive \$791M collectively. Bezos said he was '
                              'inspired by the organizations\' work and added, "We can all protect Earth\'s " '
                              '"future by taking bold action now." Why it matters? Less than 2% of global '
                              'philanthropy is currently directed at solving climate change. As such, Bezos\' donations'
                              'could be instrumental in tackling the climate crisis.',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset(assetPathToIntro2),
                            SizedBox(height: 20),
                            Text(
                                'This vegan cheese claims to taste like real cheese',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(height: 20),
                            Text(
                              'While plant-based milk has become mainstream, '
                              'vegan cheese has struggled to get as much endorsement '
                              'as it\'s challenging to replicate the taste and texture '
                              'of cheese made from cow milk. Israel-based startup Remilk is '
                              'trying to offer a solution by creating lab-made dairy protein '
                              'using microbial fermentation. The protein can help make a vegan, '
                              'lactose-free, cholesterol-free cheese that tastes like milk cheese. '
                              'The company recently completed an \$11.3M funding round.',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset(assetPathToIntro3),
                            SizedBox(height: 20),
                            Text(
                                '1 in 4 delivery workers say they have tried your food',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(height: 20),
                            Text(
                              '1-in-4 delivery workers admit they have tried your food, '
                              'according to 500 delivery workers surveyed by US Foods. '
                              '28% said they\'d "taken food from an order," while 54% revealed that '
                              ' they\'ve been "tempted by the smell of the food." Adults who order online '
                              ' suggested that restaurants use \'tamper-proof\' packaging to '
                              'prevent deliverers from sampling food. This has raised a '
                              'cause for concern as many rely on food delivery for sustenance.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
                options: CarouselOptions(
                  aspectRatio: 16 / 10,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                  viewportFraction: 0.8,
                  initialPage: 0,
                  height: MediaQuery.of(context).size.height / 1.5,
                  enableInfiniteScroll: false,
                  reverse: false,
                  autoPlay: false,
                  pageSnapping: true,
                  disableCenter: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: ['', '', ''].asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () =>
                        buttonCarouselController.animateToPage(entry.key),
                    child: Container(
                      width: 6.0,
                      height: 6.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
              getButtonsContainer(),
            ],
          ),
          isLoading
              ? Center(
                  child: Container(
                    height: 60,
                    margin: EdgeInsets.only(right: 20, left: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(width: 40),
                        Text('Logging in')
                      ],
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  getButtonsContainer() {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40,
            margin: EdgeInsets.only(left: 40, right: 40),
            child: RaisedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  SizedBox(width: 15),
                  getSvg(assetPathToAppleLogo, 20, 20),
                  SizedBox(width: 40),
                  Text('Sign in with Apple',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 40,
            margin: EdgeInsets.only(left: 40, right: 40),
            child: RaisedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                bool? isLoggedIn = prefs.getBool('login');

                if (isLoggedIn == true) {
                  print('Sign in Done');
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                } else {
                  print('Sign in pending');
                  signup(context);
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  SizedBox(width: 15),
                  getSvg(assetPathToGoogleLogo, 20, 20),
                  SizedBox(width: 40),
                  Text('Sign in with Google',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?',
                    style: TextStyle(color: Colors.black38)),
                SizedBox(width: 10),
                Text('Sign up', style: TextStyle()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onDonePress() {
    // Do what you want
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => HomeScreen()),
    // );
  }

  Widget renderNextBtn() {
    return Container();
  }

  Widget renderDoneBtn() {
    return Container();
  }

  Widget renderSkipBtn() {
    return Container();
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(Color(0x33F3B4BA)),
      overlayColor: MaterialStateProperty.all<Color>(Color(0x33FFA8B0)),
    );
  }

  getSvg(String asset, double height, double width) {
    return SvgPicture.asset(
      asset,
      height: height,
      width: width,
    );
  }

  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    setState(() {
      isLoading = true;
    });
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;
      SharedPreferences prefs = await SharedPreferences.getInstance();

      if (result != null) {
        prefs.setBool('login', true);
        setState(() {
          isLoading = false;
        });
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    }
  }
}
