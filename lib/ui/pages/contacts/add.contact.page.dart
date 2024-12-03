import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:le_messager/blocs/contact.action.dart';
import 'package:le_messager/blocs/contact.bloc.dart';
import 'package:le_messager/blocs/contact.state.dart';
import 'package:le_messager/models/contact.model.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for form fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _profileController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _scoreController = TextEditingController();
// Dropdown types
  final List<String> types = ["Student", "Developper"];
  String? _selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Contact"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _profileController,
                decoration: const InputDecoration(
                  labelText: "Profile",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a profile";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _selectedType,
                decoration: const InputDecoration(
                  labelText: "Type",
                  border: OutlineInputBorder(),
                ),
                items: types
                    .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedType = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please select a type";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _scoreController,
                decoration: const InputDecoration(
                  labelText: "Score",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a score";
                  }
                  if (int.tryParse(value) == null) {
                    return "Score must be a number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              BlocBuilder<ContactsBloc, ContactsState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Generate a random ID for the contact
                        int newId = DateTime.now().millisecondsSinceEpoch;

                        // Create the contact
                        Contact newContact = Contact(
                          id: newId,
                          name: _nameController.text,
                          profile:
                              "https://randomuser.me/api/portraits/lego/1.jpg",
                          type: _selectedType!,
                          score: int.parse(_scoreController.text),
                        );

                        // Pass the contact back to the parent
                        context
                            .read<ContactsBloc>()
                            .add(AddContact(contact: newContact));
                        // Close the page
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Add Contact"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _profileController.dispose();
    _typeController.dispose();
    _scoreController.dispose();
    super.dispose();
  }
}
