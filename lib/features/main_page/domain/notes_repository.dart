import '../../../domain/entities/note.dart';

abstract class INotesRepository {
  Future<List<Note>> getNotes();
  Future<void> update(Note note);
  Future<void> delete(String id);
  Future<void> add(String title, String text);
}
