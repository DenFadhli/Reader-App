import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:reader_app/onboard/onboard_model.dart';
import 'package:reader_app/size_config.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentPage = 0;
  // late PageController _pageController;

  final PageController _pageController = PageController(initialPage: 0);

  // @override
  // void initState() {
  //   _pageController = PageController(initialPage: 0);
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 5),
      duration: const Duration(milliseconds: 400),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: currentPage == index
            ? Colors.blue
            : const Color.fromRGBO(202, 202, 202, 100),
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    // double sizeW = SizeConfig.blockSizeH!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 4,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: onboardingContents.length,
              itemBuilder: (context, index) => Column(
                children: [
                  SizedBox(
                    height: sizeV * 5,
                  ),
                  Text(
                    onboardingContents[index].text,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                      color: const Color.fromRGBO(48, 196, 243, 100),
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  SizedBox(
                    height: sizeV * 5,
                  ),
                  // ignore: sized_box_for_whitespace
                  Container(
                    height: sizeV * 40,
                    child: Image.asset(
                      onboardingContents[index].img,
                      width: 500.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: sizeV * 9,
                    width: 300.0,
                    child: Text(
                      onboardingContents[index].lisc,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        color: const Color.fromRGBO(0, 175, 175, 100),
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90.0,
                    width: 352.0,
                    child: Text(
                      onboardingContents[index].desc,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        color: const Color.fromRGBO(48, 196, 243, 100),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OnBoardNavBtn(
                  name: 'Skip',
                  onPressed: () {},
                ),
                Row(
                  children: List.generate(
                    onboardingContents.length,
                    (index) => dotIndicator(index),
                  ),
                ),
                OnBoardNavBtn(
                  name: 'Next',
                  onPressed: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  },
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class OnBoardNavBtn extends StatelessWidget {
  const OnBoardNavBtn({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);

  final String name;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(6),
      splashColor: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          name,
          style: GoogleFonts.lato(
            color: const Color.fromARGB(156, 0, 194, 252),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

// class TextButton extends StatelessWidget {
//   final String buttonName;
//   TextStyle textStyle, buttonTextStyle;
//   final VoidCallback onPressed;

//   const TextButton({
//     Key? key,
//     required this.buttonName,
//     required this.buttonTextStyle,
//     required this.onPressed,
//   }) : super(key: key);

  
//   @override
//   Widget build(BuildContext context) {
//     return (FlatButton);
//   }
// }
