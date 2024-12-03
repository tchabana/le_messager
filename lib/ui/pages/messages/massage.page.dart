import 'package:flutter/material.dart';
import 'package:le_messager/models/contact.model.dart';

class MessagePage extends StatelessWidget {
  MessagePage({Key? key}) : super(key: key); // Correction du constructeur.

  final TextEditingController _messageContent = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Vérification de la présence de l'argument et de son type.
    final contact = ModalRoute.of(context)?.settings.arguments;
    if (contact == null || contact is! Contact) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Erreur"),
        ),
        body: const Center(
          child: Text("Aucun contact trouvé."),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Messages avec ${contact.name}"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(contact.profile),
                  onBackgroundImageError: (_, __) => const Icon(
                      Icons.error), // Gestion des erreurs de chargement.
                ),
                const SizedBox(width: 16),
                Text(
                  contact.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView(
              children: const [
                // Exemple de message affiché dans la liste.
                ListTile(
                  title: Text("Message exemple"),
                  subtitle: Text("12:00 PM"),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: const Border(top: BorderSide(color: Colors.grey)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    maxLines: null,
                    controller: _messageContent,
                    decoration: const InputDecoration(
                      hintText: "Tapez votre message...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: () {
                    if (_messageContent.text.trim().isNotEmpty) {
                      // Envoyer le message.
                      print("Message envoyé: ${_messageContent.text}");
                      _messageContent
                          .clear(); // Réinitialiser le champ après l'envoi.
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Veuillez entrer un message.")),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
