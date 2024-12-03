import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:le_messager/blocs/contact.action.dart';
import 'package:le_messager/blocs/contact.bloc.dart';

class RetryError extends StatelessWidget {
  const RetryError(
      {super.key, required this.curentEvent, required this.errorMessage});
  final String errorMessage;
  final ContactEvent curentEvent;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(errorMessage),
        ElevatedButton(
            onPressed: () {
              context.read<ContactsBloc>().add(curentEvent);
            },
            child: const Text("Retry"))
      ],
    );
  }
}
