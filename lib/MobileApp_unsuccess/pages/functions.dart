import 'dart:math';

enum House { gryffindor, hufflepuff, ravenclaw, slytherin, full }

class Functions {
  late final int number;
  var gryffindorNumber = 0;
  var hufflepuffNumber = 0;
  var ravenclawNumber = 0;
  var slytherinNumber = 0;
  var remainderlist = <int?>[0, 0, 0, 0];
  var gryffindorMember = <String>[];
  var hufflepuffMember = <String>[];
  var ravenclawMember = <String>[];
  var slytherinMember = <String>[];

  Functions({
    required this.number,
  });

  void divideTheNumberOfStudents() {
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
      gryffindorNumber = (number ~/ 4) + remainderlist[0]!;
      hufflepuffNumber = (number ~/ 4) + remainderlist[1]!;
      ravenclawNumber = (number ~/ 4) + remainderlist[2]!;
      slytherinNumber = (number ~/ 4) + remainderlist[3]!;
    }
  }

  int getGryffindorNumber() {
    return gryffindorNumber;
  }

  int getHufflepuffNumber() {
    return hufflepuffNumber;
  }

  int getRavenclawNumber() {
    return ravenclawNumber;
  }

  int getSlytherinNumber() {
    return slytherinNumber;
  }

  House inputStudentsNameAndRandomHouse(name) {
    if (gryffindorNumber != 0 ||
        hufflepuffNumber != 0 ||
        ravenclawNumber != 0 ||
        slytherinNumber != 0) {
      while (true) {
        var randomHouse = Random().nextInt(4);
        if (randomHouse == 0 && gryffindorNumber != 0) {
          gryffindorMember.add('$name');
          gryffindorNumber--;
          return House.gryffindor;
        } else if (randomHouse == 1 && hufflepuffNumber != 0) {
          hufflepuffMember.add('$name');
          hufflepuffNumber--;
          return House.hufflepuff;
        } else if (randomHouse == 2 && ravenclawNumber != 0) {
          ravenclawMember.add('$name');
          ravenclawNumber--;
          return House.ravenclaw;
        } else if (randomHouse == 3 && slytherinNumber != 0) {
          slytherinMember.add('$name');
          slytherinNumber--;
          return House.slytherin;
        }
      }
    } else {
      return House.full;
    }
  }

  List<String> getGryffindorMember() {
    return gryffindorMember;
  }

  List<String> getHufflepuffMember() {
    return hufflepuffMember;
  }

  List<String> getRavenclawMember() {
    return ravenclawMember;
  }

  List<String> getSlytherinMember() {
    return slytherinMember;
  }

}
