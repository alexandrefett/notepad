import 'package:flutter/material.dart';

import '../../../service/locator.dart';
import '../../main_page/presentation/notes_bloc/notes_bloc.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  AddNotePageState createState() {
    return AddNotePageState();
  }
}

class AddNotePageState extends State<AddNotePage> {
  final _formKey = GlobalKey<FormState>();

  String? title;
  String? text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Add Note'),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                maxLines: 1,
                validator: (value) {
                  title = value;
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Text',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  text = value;
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      title ??= DateTime.now().toIso8601String();
                      locator<NotesBloc>().add(NotesEvent.added(title: title!, text: text!));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Adding note...')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
