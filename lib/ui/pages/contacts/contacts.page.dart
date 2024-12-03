import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:le_messager/blocs/contact.bloc.dart';
import 'package:le_messager/blocs/contact.state.dart';
import 'package:le_messager/global.enum.dart';
import 'package:le_messager/ui/pages/shared/retry.error.dart';
import 'package:le_messager/ui/widgets/contact.bar.button.dart';
import 'package:le_messager/ui/widgets/contact.list.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Mes contacts"),
        ),
        body: Column(
          children: [
            const ContactBarButton(),
            BlocBuilder<ContactsBloc, ContactsState>(
              builder: (context, state) {
                if (state.requestState == RequestState.LOADING) {
                  return const CircularProgressIndicator();
                } else if (state.requestState == RequestState.ERROR) {
                  return RetryError(
                    curentEvent: state.curentEvent,
                    errorMessage: state.errorMessage,
                  );
                } else if (state.requestState == RequestState.LOADED) {
                  return Expanded(
                    child: ContactList(
                      contacts: state.contacts,
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: "btn1",
              onPressed: () {
                Navigator.pushNamed(context, "/addContact");
              },
              child: const Icon(Icons.add),
            ),
          ],
        ));
  }
}
