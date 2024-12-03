import 'package:le_messager/blocs/contact.action.dart';
import 'package:le_messager/global.enum.dart';
import 'package:le_messager/models/contact.model.dart';

class ContactsState {
  List<Contact> contacts;
  RequestState requestState;
  String errorMessage;
  ContactEvent curentEvent;
  ContactsState({
    required this.contacts,
    required this.requestState,
    required this.errorMessage,
    required this.curentEvent,
  });
}
