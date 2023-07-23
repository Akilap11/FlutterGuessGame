import 'package:flutter/material.dart';
import 'package:flutter_application_7_game/pages/home_page.dart';

class right extends StatelessWidget {
  const right({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guess Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Congratulations! ",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 10),
            const Text(
              "You guessed it right!",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  //push replacement
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: const Text(
                  "Start Again",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
