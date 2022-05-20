import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/screens/home_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Food Delivery UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[50],
        primaryColor: Colors.deepOrangeAccent,
        appBarTheme: AppBarTheme(
          color: Colors.deepOrangeAccent,
          centerTitle: true,
        ),
      ),
      home: IntroScreen(),
    );
  }
}

class IntroScreen extends StatefulWidget {
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      showNextButton: false,
      showSkipButton: true,
      showDoneButton: true,
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: () {
        _onIntroEnd(context);
      },
      skip: const Text("Skip"),
      globalBackgroundColor: Colors.deepOrangeAccent,
      pages: [
        PageViewModel(
            title: "Welcome",
            decoration: PageDecoration(
              imageAlignment: Alignment.center,
              imagePadding: EdgeInsets.only(top: 50.0),
            ),
            image: Center(
              child: Image.asset(
                'assets/images/int1.png',
              ),
            ),
            body:
                "Here you can write the description of the page, to explain someting..."),
        PageViewModel(
            title: "Welcome",
            decoration: PageDecoration(
              imageAlignment: Alignment.center,
              imagePadding: EdgeInsets.only(top: 50.0),
            ),
            image: Center(child: Image.asset('assets/images/int2.png')),
            body:
                "Here you can write the description of the page, to explain someting..."),
      ],
    );
  }
}
