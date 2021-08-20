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
                            Text('Lorem Ipsum',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            SizedBox(height: 20),
                            Text(
                              'Lorem ipsum dolor sit\n amet, consectetur\n adipiscing elit',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal),
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
                            Text('dolor sit amet'),
                            SizedBox(height: 20),
                            Text(
                              'sed do eiusmod tempor\n incididunt ut labore et\n dolore magna aliqua.',
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
                            Text('consectetur adipiscing'),
                            SizedBox(height: 20),
                            Text(
                              'quis nostrud exercitation\n ullamco laboris nisi ut\n aliquip ex',
                              textAlign: TextAlign.center,
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
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
