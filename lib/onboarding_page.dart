// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:reader_app/home_page.dart';
// ignore: unused_import
import 'package:reader_app/widget/button_widget.dart';

// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  // const _OnBoardingPageState({Key? key}) : super(key: key);

  bool agree = false;

  void _doSomething() {
    goToHome(context);
  }

  @override
  Widget build(BuildContext context) => SafeArea(
          child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'Welcome to Reader App',
            image: buildImage('assets/images/png3.jpg'),
            body:
                'Reader App was designed for those of you who want to open and read document files on your mobile device.',
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Easy & Simple For You',
            body:
                'You can select from a variety of documents, which are Word, PDF, PowerPoint, Excel, and Text. You can read your documents easily, whichever document you want.',
            image: buildImage('assets/images/png2.png'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'TERMS & CONDITIONS',
            bodyWidget: buildContainer(context),
            footer: Center(
              child: Container(
                transform: Matrix4.translationValues(0.0, -25.0, 0.0),
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Material(
                          child: Checkbox(
                              shape: const CircleBorder(),
                              value: agree,
                              onChanged: (value) {
                                setState(() {
                                  agree = value ?? false;
                                });
                              }),
                        ),
                        const Text(
                          'I have read and accept terms and conditions',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'Lato',
                              color: Color.fromARGB(255, 44, 44, 44)),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: ButtonTheme(
                        child: ElevatedButton(
                          child: const Text('Get Started'),
                          onPressed: agree ? _doSomething : null,
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                const StadiumBorder(),
                              ),
                              fixedSize: MaterialStateProperty.all(
                                const Size(250, 50),
                              ),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(10)),
                              textStyle:
                                  MaterialStateProperty.all(const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Rubik',
                              ))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            decoration: getPageDecoration(),
          )
        ],
        // showSkipButton: true,
        // skip: const Text('Skip',
        //     style: TextStyle(
        //       fontSize: 18,
        //       fontWeight: FontWeight.bold,
        //       fontFamily: 'Lato',
        //       color: Color.fromARGB(245, 48, 198, 243),
        //     )),
        next: const Text('Next',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
              color: Color.fromARGB(245, 48, 198, 243),
            )),
        dotsDecorator: getDotDecoration(),
        // onChange: (index) => print('Page $index selected'),
        globalBackgroundColor: Colors.white,
        animationDuration: 1000,
        showDoneButton: false,
        showBackButton: true,
        back: const Icon(Icons.arrow_back),
      ));

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const MyHomePage()),
      );

  Widget buildImage(String path) => Center(
        child: Image.asset(
          path,
          width: 350,
        ),
      );

  Widget buildContainer(context) => Center(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(5, 20, 5, 0),

          // height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                " By downloading the Licensed Application from Google's software distribution paltform ('Play Store'), and any update therote (as permitted by this License Agreement), You indicate that You agree to bound by all of the terms and conditions of this License Agreement, and that You accept this Licence Agreement. Play Store is reffered to in this License Agreement as 'Services.'",
                style: TextStyle(
                    fontSize: 13.5,
                    fontFamily: 'Lato',
                    color: Color.fromARGB(255, 44, 44, 44)),
                textAlign: TextAlign.justify,
              ),
              Text(
                " The parties of this License Agreement acknowledge that the Service are not a Party to this License Agreement and are not bound by any provisions or obligations with regard to the Licensed Application, such as warranty, liability, maintenance and support thereof. BALADAR, not the Services, is solely responsible for the Licensed Application and the content thereof.",
                style: TextStyle(
                    fontSize: 13.5,
                    fontFamily: 'Lato',
                    color: Color.fromARGB(255, 44, 44, 44)),
                textAlign: TextAlign.justify,
              ),
              Text(
                " Reader App when purchased or downloaded through the Services, is licensed to You for use only under the terms of this License Agreement. The Licensor reserves all rights not expressly granted to You. Reader App is to be used on devices that operate with Google's operating system('Androind')",
                style: TextStyle(
                    fontSize: 13.5,
                    fontFamily: 'Lato',
                    color: Color.fromARGB(255, 44, 44, 44)),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.transparent,
              width: 0,
            ),
            // borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        ),
      );

  DotsDecorator getDotDecoration() => DotsDecorator(
      color: const Color(0XFFBDBDBD),
      activeColor: const Color.fromARGB(245, 48, 198, 243),
      size: const Size(12, 12),
      activeSize: const Size(25, 10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ));

  PageDecoration getPageDecoration() => const PageDecoration(
        imagePadding: EdgeInsets.only(top: 50.0),
        titlePadding: EdgeInsets.only(top: 20.0),
        titleTextStyle: TextStyle(
            fontSize: 28,
            fontFamily: 'Rubik',
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(245, 48, 198, 243)),
        bodyTextStyle: TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(48, 196, 243, 100),
            fontFamily: 'Lato'),
        bodyPadding: EdgeInsets.all(10),
        pageColor: Colors.white,
      );
}
