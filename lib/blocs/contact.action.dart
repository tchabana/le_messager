import 'package:le_messager/models/contact.model.dart';

abstract class ContactEvent {}

class LoadAllContactsEvent extends ContactEvent {}

class LoadStudentsContactsEvent extends ContactEvent {}

class LoadDeveloppersContactsEvent extends ContactEvent {}

class AddContact extends ContactEvent {
  AddContact({
    required this.contact,
  });

  Contact contact;
}
