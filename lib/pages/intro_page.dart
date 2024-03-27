import 'package:flutter/material.dart';
import 'package:intro_page/pages/home_page.dart';
import 'package:intro_page/utils/strings.dart';

class IntroPage extends StatefulWidget {
  static const String id = "intro_page";

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _pageController = PageController(initialPage: 0);

  int currentIndex = 0;
  bool isVisible = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              makePage(
                  image: "assets/images/image1.png",
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent),
              makePage(
                  image: "assets/images/image_2.png",
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent),
              makePage(
                  image: "assets/images/image_3.png",
                  title: Strings.stepThreeTitle,
                  content: Strings.stepThreeContent),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 60),
            child: _isVisible(currentIndex),
          )
        ],
      ),
    );
  }

  Widget _isVisible(int page) {
    if (page == 2) {
      isVisible = true;
    } else {
      isVisible = false;
    }

    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: isVisible,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, HomePage.id);
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: Text(
                  "Skip",
                  style: TextStyle(color: Colors.green, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ]);
  }

  Widget makePage({image, title, content}) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.green, fontSize: 25),
              ),
              const SizedBox(height: 30),
              Text(
                content,
                style: const TextStyle(color: Colors.grey, fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(5)),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
