import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/note.dart';
import '../../domain/notes_repository.dart';

part 'notes_bloc.freezed.dart';
part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc({required this.repository}) : super(const NotesState.initial()) {
    on<NotesEvent>((event, emit) async {
      await event.when(
        started: () async => await _started(emit),
        deleted: (String id) async => await _deleted(id, emit),
        added: (String title, String text) async => await _added(title, text, emit),
        updated: (Note note) async => await _updated(note, emit),
      );
    });
  }

  final INotesRepository repository;

  Future<void> _started(Emitter emit) async {
    emit(const NotesState.loading());
    try {
      final list = await repository.getNotes();
      emit(NotesState.loaded(list));
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(const NotesState.error());
    }
  }

  Future<void> _deleted(String id, Emitter emit) async {
    emit(const NotesState.loading());
    try {
      await repository.delete(id);
      add(const NotesEvent.started());
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(const NotesState.error());
    }
  }

  Future<void> _added(String title, String text, Emitter emit) async {
    emit(const NotesState.loading());
    try {
      await repository.add(title, text);
      add(const NotesEvent.started());
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(const NotesState.error());
    }
  }

  Future<void> _updated(Note note, Emitter emit) async {
    emit(const NotesState.loading());
    try {
      await repository.update(note);
      add(const NotesEvent.started());
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(const NotesState.error());
    }
  }
}
