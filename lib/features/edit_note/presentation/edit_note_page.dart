import 'package:flutter/material.dart';

import '../../../domain/entities/note.dart';
import '../../../service/locator.dart';
import '../../main_page/presentation/notes_bloc/notes_bloc.dart';

class EditNotePage extends StatefulWidget {
  EditNotePage({super.key, required this.note});

  Note note;
  @override
  EditNotePageState createState() {
    return EditNotePageState();
  }
}

class EditNotePageState extends State<EditNotePage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = widget.note.title;
    textController.text = widget.note.text;
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
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                maxLines: 1,
              ),
              TextFormField(
                controller: textController,
                decoration: const InputDecoration(
                  labelText: 'Text',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final updatedNote = Note(
                        id: widget.note.id,
                        text: textController.text,
                        title: titleController.text,
                      );
                      locator<NotesBloc>().add(NotesEvent.updated(note: updatedNote));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Updating note...')),
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
