import 'package:educat/elements/fonts/myText.dart';
import 'package:educat/screens/login-signup/elements/customButton.dart';
import 'package:educat/screens/login-signup/pages/welcomePage.dart';
import 'package:educat/screens/onBoarding/onBoardingContent.dart';
import 'package:educat/screens/onBoarding/onBoardingdata.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: currentPage);

    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: my_data.length,
              controller: _pageController,
              itemBuilder: ((context, index) => OnboardingContent(
                    image: my_data[index].image,
                    title: my_data[index].title,
                    description: my_data[index].description,
                  )),
            ),
          ),

          CustomButton(ontap: (){}, height: height, child: child)
        ],
      ),
    ));
  }
}
