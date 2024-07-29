import 'package:flutter/material.dart';

import '../../../../domain/entities/note.dart';
import '../../../../service/locator.dart';
import '../../../view_note/presentation/view_note_page.dart';
import '../notes_bloc/notes_bloc.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.note,
  });

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ViewNotePage(note: note),
          ),
        ),
        title: Text(note.title),
        subtitle: Text(
          note.text,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            locator<NotesBloc>().add(NotesEvent.deleted(id: note.id!));
          },
        ),
      ),
    );
  }
}
