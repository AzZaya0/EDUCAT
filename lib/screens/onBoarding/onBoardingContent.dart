import 'package:flutter/material.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, Constraints) {
        return Container(
          margin: EdgeInsets.only(),
          child: Column(children: [],),
        );
      }),
    );
  }
}
