import 'package:flutter/material.dart';
import 'package:flutter_application_7_game/pages/home_page.dart';

class Right extends StatelessWidget {
  final int myNumber;
  const Right({Key? key, required this.myNumber}) : super(key: key);

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
              "Yes! You guessed it right! ",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 10),
            const Text(
              "My secret number is: ",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 10),
            Text(
              "$myNumber",
              style: const TextStyle(fontSize: 30),
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
                  "Start the Game Again",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
