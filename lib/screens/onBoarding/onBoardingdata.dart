// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class OnboardData {
  final String image, title, description;
  OnboardData({
    required this.description,
    required this.image,
    required this.title,
  });
}

final List<OnboardData> my_data = [
  OnboardData(
    description:
        'New skills are diversified your job options\nand help you to keep up with the fast-\nchanging world',
    image: 'lib/assets/onboarding-images/first.png',
    title: 'Explore your new skill today',
  ),
  OnboardData(
    description: 'Develop valueable skill\nanytime, anywhere',
    image: 'lib/assets/onboarding-images/second.png',
    title: 'Learn Everywhere',
  ),
  OnboardData(
      description: 'Payment, courses are insecure\nYour information is safe!',
      image: 'lib/assets/onboarding-images/third.png',
      title: 'Safe & Secure'),
];
