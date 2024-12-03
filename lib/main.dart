import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:le_messager/blocs/contact.action.dart';
import 'package:le_messager/blocs/contact.bloc.dart';
import 'package:le_messager/blocs/contact.state.dart';
import 'package:le_messager/global.enum.dart';
import 'package:le_messager/repositories/contact.repo.dart';
import 'package:le_messager/ui/pages/contacts/add.contact.page.dart';
import 'package:le_messager/ui/pages/contacts/contacts.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ContactsBloc(
                ContactsState(
                    contacts: [],
                    requestState: RequestState.NONE,
                    errorMessage: "",
                    curentEvent: LoadAllContactsEvent()),
                ContactRepository()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Le Messager',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
          useMaterial3: false,
        ),
        routes: {
          "/contacts": (context) => const ContactsPage(),
          "/addContact": (context) => const AddContactPage(),
        },
        initialRoute: "/contacts",
      ),
    );
  }
}
