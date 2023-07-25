import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  final PageController pageController = PageController();
  var test = 0;

  void initState() {
    super.initState();
    Timer.periodic(
      Duration(seconds: 3),
      (timer) {
        int? nextPage = pageController.page?.toInt();
        if (nextPage == null) return;
        test = (nextPage == 0) ? 0 : 1;
        (test == 0) ? nextPage++ : nextPage--;
        pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
    );
  }

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
        body: PageView(
      controller: pageController,
      children: [1, 2, 3, 4, 5]
          .map((n) => Image.asset('asset/img/image_$n.jpeg', fit: BoxFit.cover))
          .toList(),
    ));
  }
}
