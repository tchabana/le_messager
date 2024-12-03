import 'dart:math';
import 'package:le_messager/models/contact.model.dart';

class ContactRepository {
  List<String> types = ["Student", "Developper"];
  Map<int, Contact> contacts = {};

  ContactRepository() {
    _generateFakeContacts();
  }

  Future<List<Contact>> allContacts() async {
    int alea = Random().nextInt(10);
    await Future.delayed(Duration(seconds: 1));
    if (alea > 1) {
      return contacts.values.toList();
    } else {
      throw new Exception("Internet Error");
    }
  }

  Future<List<Contact>> addContact(Contact contact) async {
    try {
      // Générer une clé unique (par exemple, l'identifiant du Contact ou un index incrémental)
      int newKey = contacts.isNotEmpty ? contacts.keys.last + 1 : 0;
      // Ajouter le nouveau contact au Map
      contacts[newKey] = contact;
      // Retourner la liste des contacts
      return contacts.values.toList();
    } catch (e) {
      throw Exception("Internet Error: $e");
    }
  }

  Future<List<Contact>> contactByType(String type) async {
    int alea = Random().nextInt(10);
    await Future.delayed(Duration(seconds: 1));
    if (alea > 1) {
      return contacts.values.where((element) => element.type == type).toList();
    } else {
      throw new Exception("Internet Error");
    }
  }

  void _generateFakeContacts() {
    final random = Random();
    final names = [
      "Alice",
      "Bob",
      "Charlie",
      "Diana",
      "Ethan",
      "Fiona",
      "George",
      "Hannah",
      "Ian",
      "Julia"
    ];

    for (int i = 0; i < 10; i++) {
      int randomIndex = random.nextInt(types.length);
      contacts[i] = Contact(
        id: i,
        name: names[i],
        profile: "https://randomuser.me/api/portraits/lego/${i}.jpg",
        type: types[randomIndex],
        score: random.nextInt(100), // Génère un score entre 0 et 99
      );
    }
  }
}
