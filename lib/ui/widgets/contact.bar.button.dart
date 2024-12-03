import 'package:flutter/material.dart';
import 'package:le_messager/blocs/contact.action.dart';
import 'package:le_messager/ui/widgets/contact.bar.button.item.dart';

class ContactBarButton extends StatelessWidget {
  const ContactBarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ContactBarButtonItem(
            textButton: "All Contacts",
            contactEvent: LoadAllContactsEvent(),
          ),
          ContactBarButtonItem(
            textButton: "Student",
            contactEvent: LoadStudentsContactsEvent(),
          ),
          ContactBarButtonItem(
            textButton: "Develloper",
            contactEvent: LoadDeveloppersContactsEvent(),
          ),
        ],
      ),
    );
  }
}
