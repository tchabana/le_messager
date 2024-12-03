import 'package:flutter/material.dart';
import 'package:le_messager/models/contact.model.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key, required this.contacts});
  final List<Contact> contacts;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/messages",
                  arguments: contacts[index]);
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: Image.network("${contacts[index].profile}"),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(contacts[index].name),
                  ],
                ),
                CircleAvatar(
                  child: Text("${contacts[index].score}"),
                )
              ],
            ),
          );
        });
  }
}
