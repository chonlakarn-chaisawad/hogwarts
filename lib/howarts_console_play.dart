import 'dart:io';
import 'dart:math';

void main() {
  var number;
  var gryffindorNumber;
  var hufflepuffNumber;
  var ravenclawNumber;
  var slytherinNumber;
  var remainderlist = <int?>[0, 0, 0, 0];
  var gryffindorMember = <String>[];
  var hufflepuffMember = <String>[];
  var ravenclawMember = <String>[];
  var slytherinMember = <String>[];
  var ans;

  print('╔═════════════════════════════════════════════════════════════');
  print('║  (ﾉ´ ･ᴗ･`)ﾉ*:･ﾟ✧ Welcome to Hogwarts ✧ﾟ･:*ヽ(´･ᴗ･ `ヽ)  ');
  print('╟─────────────────────────────────────────────────────────────');
  print('║              Hmm... Let’s start sorting....                 ');
  //start input N
  do {
    stdout.write('║ Enter your number of students : ');
    var input = stdin.readLineSync();
    if (input == null) {
      return;
    }

    number = int.tryParse(input);

    if (number == null) {
      print('║     ⇾ Enter numbers only,Please try again ⇽    ');
      continue;
    }
  } while (number == null);
  //end input N

  //start divide the number of students
  if ((number % 4) == 0) {
    gryffindorNumber = number ~/ 4;
    hufflepuffNumber = number ~/ 4;
    ravenclawNumber = number ~/ 4;
    slytherinNumber = number ~/ 4;
  } else {
    var remainder = number % 4;
    do {
      var random = Random().nextInt(4);

      if (remainderlist[random] == 0) {
        remainderlist[random] = 1;
        remainder--;
      }
    } while (remainder != 0);
    gryffindorNumber = (number ~/ 4) + remainderlist[0];
    hufflepuffNumber = (number ~/ 4) + remainderlist[1];
    ravenclawNumber = (number ~/ 4) + remainderlist[2];
    slytherinNumber = (number ~/ 4) + remainderlist[3];
  }
  //end divide the number of students
  //start input student's name and random house
  while (true) {
    print('╟─────────────────────────────────────────────────────────────');
    stdout.write('║ Enter your name : ');
    var name = stdin.readLineSync();

    if(name == null || name.isEmpty){
      continue;
    }

    if (number == 0) {
      print('║ Received full of student');
      print('╟─────────────────────────────────────────────────────────────');
      print(
          '║ GryffindorNumber : ${gryffindorMember.length} students ${gryffindorMember}');
      print(
          '║ HufflepuffNumber : ${hufflepuffMember.length} students ${hufflepuffMember}');
      print(
          '║ RavenclawNumber : ${ravenclawMember.length} students ${ravenclawMember}');
      print(
          '║ SlytherinNumber : ${slytherinMember.length} students ${slytherinMember}');
      print('╟─────────────────────────────────────────────────────────────');
      do {
        stdout.write('║ Do you want to reset (Y/N) : ');
        ans = stdin.readLineSync();
        if (ans == "Y" || ans == "y") {
          print(
              '╚═════════════════════════════════════════════════════════════');
          main();
          break;
        } else if (ans == "N" || ans == "n") {
          print(
              '╟─────────────────────────────────────────────────────────────');
          print('║     (*^◇^)/ﾟ・:* [[ GOOD BYE ]] *:・ﾟ＼(^◇^*)    ');
          print(
              '╚═════════════════════════════════════════════════════════════');
          break;
        }
      } while (ans != null);

      break;
    } else {
      while (true) {
        var randomHouse = Random().nextInt(4);
        if (randomHouse == 0 && gryffindorNumber != 0) {
          print('║ GRYFFINDOR!!!');
          gryffindorMember.add('$name');
          gryffindorNumber--;
          break;
        } else if (randomHouse == 1 && hufflepuffNumber != 0) {
          print('║ HUFFLEPUFF!!!');
          hufflepuffMember.add('$name');
          hufflepuffNumber--;
          break;
        } else if (randomHouse == 2 && ravenclawNumber != 0) {
          print('║ RAVENCLAW!!!');
          ravenclawMember.add('$name');
          ravenclawNumber--;
          break;
        } else if (randomHouse == 3 && slytherinNumber != 0) {
          print('║ SLYTHERIN!!!');
          slytherinMember.add('$name');
          slytherinNumber--;
          break;
        }
      }
    }
    number--;
  }
  //end input student's name and random house
}
