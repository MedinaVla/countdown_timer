import 'package:flutter/material.dart';

import 'presentation/presentation.dart';

class CountDownTimer extends StatelessWidget {
  const CountDownTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Countdown',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(109, 234, 255, 1),
        colorScheme: const ColorScheme.light(
          secondary: Color.fromRGBO(72, 74, 126, 1),
        ),
      ),
      home: const CountdownPage(),
    );
  }
}
