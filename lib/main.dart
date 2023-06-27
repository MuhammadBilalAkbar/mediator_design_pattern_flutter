abstract interface class Stateful {
  late String state;
}

class Mediator {
  final List<Stateful> parties;

  Mediator(this.parties);

  void update(String state) {
    for (final party in parties) {
      party.state = state;
    }
  }
}

class Attendee extends Stateful {
  String name;

  Attendee(this.name);
}

void main() {
  final curly = Attendee("Curly");
  final larry = Attendee("Larry");
  final moe = Attendee("I prefer not to disclose my name");
  final mixer = List<Attendee>.from([curly, larry, moe]);
  final publicAnnouncementSystem = Mediator(mixer);

  publicAnnouncementSystem.update("Do NOT eat the shrip tacos!");

  for (final person in mixer) {
    print("${person.name} heard \"${person.state}\".");
  }

  /*
    Curly heard "Do NOT eat the shrip tacos!".
    Larry heard "Do NOT eat the shrip tacos!".
    I prefer not to disclose my name heard "Do NOT eat the shrip tacos!".
  */
}
