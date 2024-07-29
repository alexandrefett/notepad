import 'package:notepad/domain/entities/note.dart';

import '../../features/main_page/data/notes_datasource.dart';
import '../../features/main_page/domain/notes_repository.dart';

class NotesImplementation implements INotesRepository {
  NotesImplementation(this.remoteDataSource);

  final INotesDatasource remoteDataSource;

  @override
  Future<void> delete(String id) async {
    return await remoteDataSource.delete(id);
  }

  @override
  Future<List<Note>> getNotes() async {
    return await remoteDataSource.getNotes();
  }

  @override
  Future<void> update(Note note) async {
    return await remoteDataSource.update(note);
  }

  @override
  Future<void> add(String title, String text) async {
    await remoteDataSource.add(title, text);
  }
}
