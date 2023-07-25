import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  //to get the value from the textbox
  final mycontroller = TextEditingController();

  //random number should be generated first before the build
  //init state runs when the application starts.
  @override
  void initState() {
    int randomNum = Random().nextInt(10) + 1;
    myNumber = randomNum;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guess Game'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/guess.png',
                  height: 300,
                  width: 250,
                ),
                const Text(
                  "I have a secret number in my mind (1-10) \nYou have 3 chances to guess it. \n  Can you guess it?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 30),
                Text(
                  "$counter of 3 chances are taken",
                  style: const TextStyle(fontSize: 20),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                  ],
                  controller: mycontroller,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    counter++;
                    if (counter == 3) {
                      //Reset the Counter
                      //go to game over screen(pushreplacement)
                      counter = 0;
                      if (mycontroller.text.toString() == myNumber.toString()) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Right(myNumber: myNumber)));
                      } else {
                        mycontroller.clear();
                        setState(() {});
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    GameOver(myNumber: myNumber)));
                      }
                    } else {
                      //get input from user and convert it to int
                      //if input is equal to myNumber, go to right page(pushreplacement)
                      //if input is not equal to myNumber, go to wrong page(push )

                      if (mycontroller.text.toString() == myNumber.toString()) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Right(myNumber: myNumber)));
                      } else {
                        mycontroller.clear();
                        setState(() {});
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Wrong()));
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
        ),
      ),
    );
  }
}
