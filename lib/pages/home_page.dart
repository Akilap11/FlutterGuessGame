import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_7_game/pages/game_over.dart';
import 'package:flutter_application_7_game/pages/right_page.dart';
import 'package:flutter_application_7_game/pages/wrong_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int myNumber = 0;
  int counter = 0;
  //random number should be generated first before the build
  //look bottom for the initstate code!

  //to get the value from the textbox
  final mycontroller = TextEditingController();
  //Clean up the controller when the widget is disposed.
  //after we go to another page, text field will be cleared
  @override
  void dispose() {
    mycontroller.dispose();
    super.dispose();
  }

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
            Image.asset(
              'assets/ss.jpg',
              height: 300,
              width: 200,
            ),
            const SizedBox(height: 10),
            const Text(
              "I have a secret number in my mind. ",
              style: TextStyle(fontSize: 20),
            ),
            const Text(
              "Can you guess it?(1-10)",
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: mycontroller,
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                counter++;
                if (counter > 3) {
                  //Reset the Counter
                  //go to game over screen(pushreplacement)
                  counter = 0;
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GameOver()));
                } else {
                  //get input from user and convert it to int
                  //if input is equal to myNumber, go to right page(pushreplacement)
                  //if input is not equal to myNumber, go to wrong page(push )

                  if (mycontroller.text.toString() == myNumber.toString()) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const right()));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                wrong(mycontroller: mycontroller)));
                  }
                }
              },
              child: const Text(
                "Guess",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }

//init State code should be here. init state runs when the application starts.
  @override
  void initState() {
    int randomNum = Random().nextInt(10) + 1;
    myNumber = randomNum;
    super.initState();
  }
}
