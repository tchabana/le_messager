import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:le_messager/blocs/contact.action.dart';
import 'package:le_messager/blocs/contact.bloc.dart';
import 'package:le_messager/blocs/contact.state.dart';

class ContactBarButtonItem extends StatelessWidget {
  const ContactBarButtonItem({
    super.key,
    required this.contactEvent,
    required this.textButton,
  });

  final String textButton;
  final ContactEvent contactEvent;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsBloc, ContactsState>(
      builder: (context, state) {
        return ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
              (states) {
                // Vérifie si l'événement courant correspond à `contactEvent`
                if (state.curentEvent.runtimeType == contactEvent.runtimeType) {
                  return Colors
                      .green.shade900; // Couleur si la condition est vraie
                }
                return Colors.grey; // Couleur par défaut
              },
            ),
          ),
          onPressed: () {
            // Envoie l'événement à ContactsBloc
            context.read<ContactsBloc>().add(contactEvent);
          },
          child: Text(textButton),
        );
      },
    );
  }
}
