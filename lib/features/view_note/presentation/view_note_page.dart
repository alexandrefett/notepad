import 'package:flutter/material.dart';

import '../../../domain/entities/note.dart';
import '../../edit_note/presentation/edit_note_page.dart';

class ViewNotePage extends StatelessWidget {
  const ViewNotePage({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('View Note'),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditNotePage(key: const Key('EditNotePage'), note: note),
                    ),
                  ),
              child: const Text(
                'Edit',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              note.text,
            ),
          ],
        ),
      ),
    );
  }
}
