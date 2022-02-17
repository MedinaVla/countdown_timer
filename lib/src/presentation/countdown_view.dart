import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class CountdownView extends StatelessWidget {
  const CountdownView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Countdown'),
      ),
      body: Stack(
        children: [
          const BackgroundColor(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100.0),
                child: Center(
                  child: CountdownText(),
                ),
              ),
              ActionsButtons(),
            ],
          )
        ],
      ),
    );
  }
}
