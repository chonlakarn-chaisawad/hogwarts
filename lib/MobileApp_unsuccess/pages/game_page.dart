import 'package:flutter/material.dart';


import 'functions.dart';

class GamePage extends StatefulWidget {
  final int number;
  const GamePage({super.key, required this.number});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var name = TextEditingController();
    Functions function = Functions(number: widget.number);
    function.divideTheNumberOfStudents();
    // var gryffindorNumber = _function.getGryffindorNumber();
    // var hufflepuffNumber = _function.getHufflepuffNumber();
    // var ravenclawNumber = _function.getRavenclawNumber();
    // var slytherinNumber = _function.getSlytherinNumber();
    var gryffindorMember = function.getGryffindorMember();
    var hufflepuffMember = function.getHufflepuffMember();
    var ravenclawMember = function.getRavenclawMember();
    var slytherinMember = function.getSlytherinMember();
    var _house = '';
    //var number = HomePage.number;

    return Scaffold(
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 246, 182, 77)),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 100, right: 100, bottom: 10),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: name,
                    decoration: InputDecoration(
                      hintText: 'Enter student’s name ',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                    ),
                    validator: (name) {
                      if (name == null || name.isEmpty) {
                        return 'You forgot to enter the student’s name, Please try again';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  //todo:
                  if (_formKey.currentState!.validate()) {
                    var house = function.inputStudentsNameAndRandomHouse(name);

                    if (house == House.gryffindor) {
                      _house = 'Gryffindor';
                    } else if (house == House.hufflepuff) {
                      _house = 'Hufflepuff';
                    } else if (house == House.ravenclaw) {
                      _house = 'Ravenclaw';
                    } else if (house == House.slytherin) {
                      _house = 'Slytherin';
                    } else if (house == House.full) {
                      _house = 'Received full of student';
                      print(
                          'GryffindorNumber : ${gryffindorMember.length} students');
                      for (int i = 0; i < gryffindorMember.length; i++) {
                        print(gryffindorMember[i]);
                      }
                      print(
                          'HufflepuffNumber : ${hufflepuffMember.length} students');
                      for (int i = 0; i < hufflepuffMember.length; i++) {
                        print(hufflepuffMember[i]);
                      }
                      print(
                          'RavenclawNumber : ${ravenclawMember.length} students');
                      for (int i = 0; i < ravenclawMember.length; i++) {
                        print(ravenclawMember[i]);
                      }
                      print(
                          'SlytherinNumber : ${slytherinMember.length} students');
                      for (int i = 0; i < slytherinMember.length; i++) {
                        print(slytherinMember[i]);
                      }
                    }
                    print(_house);
                  }
                },
                child: const Text(
                  'submit',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                child: Text(
                  _house,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
