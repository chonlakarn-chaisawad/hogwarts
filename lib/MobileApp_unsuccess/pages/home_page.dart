import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'game_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var imageSortingHat = 'assets/images/sortingHat01.png';
    var _controller = TextEditingController();
    var number;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hogwarts Sorting'),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 246, 182, 77)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Hogwarts',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Image.asset(
                imageSortingHat,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              Text(
                'Hmm... Let’s start sorting....',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(top: 35),
              //   child: Text(
              //     'Enter your number of students',
              //     style: TextStyle(
              //         fontSize: 15,
              //         color: Colors.black,
              //         fontWeight: FontWeight.bold),
              //   ),
              // ),
              Padding(
                padding:
                    EdgeInsets.only(top: 10, left: 100, right: 100, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter The number of students ',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                    ),
                    validator: (num) {
                      var input = _controller.text;
                      int? num = int.tryParse(input);
                      if (num == null) {
                        return 'Enter numbers only,Please try again';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  //todo:
                  var input = _controller.text;
                  var num = int.tryParse(input);
                  setState(() {
                    number = num;
                  });
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GamePage(number: number,)));
                  }
                },
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
