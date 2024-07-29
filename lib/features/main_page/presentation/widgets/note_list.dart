import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notepad/features/main_page/presentation/widgets/note_card.dart';

import '../../../../domain/entities/note.dart';
import '../notes_bloc/notes_bloc.dart';

class NoteList extends StatelessWidget {
  const NoteList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NotesState>(builder: (context, state) {
      return state.when(
        initial: () => const Text('no data'),
        loading: () => const Center(child: CircularProgressIndicator()),
        loaded: (notes) => _buildNotesList(notes),
        updated: (notes) => _buildNotesList(notes),
        error: () => const Text('Something went wrong!'),
      );
    });
  }

  Widget _buildNotesList(List<Note> notes) {
    return ListView.builder(
      itemCount: notes.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => NoteCard(
        key: Key('NoteCard_$index'),
        note: notes[index],
      ),
    );
  }
}
