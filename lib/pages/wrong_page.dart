import 'package:flutter/material.dart';
import 'package:flutter_application_7_game/pages/home_page.dart';

class wrong extends StatelessWidget {
  const wrong({super.key});

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
              "Sorry! Wrong guess! Try again!",
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  //go back to home page
                  //find the code to go back
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: const Text(
                  "Guess Again",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
