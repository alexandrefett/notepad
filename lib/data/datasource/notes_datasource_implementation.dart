import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:notepad/domain/entities/note.dart';

import '../../features/main_page/data/notes_datasource.dart';
import '../constants.dart';

class NotesDatasourceImplementation implements INotesDatasource {
  NotesDatasourceImplementation({required this.client});

  http.Client client;
  @override
  Future<void> delete(String id) async {
    await client.delete(Uri.parse('${Cocus.enpoint}/$id'), headers: {'x-apikey': Cocus.apikey});
  }

  @override
  Future<List<Note>> getNotes() async {
    final result = await client.get(Uri.parse(Cocus.enpoint), headers: {'x-apikey': Cocus.apikey});
    final notes = List<Note>.from(json.decode(result.body).map((value) => Note.fromJsonId(value, value['_id'])));
    return notes;
  }

  @override
  Future<void> update(Note note) async {
    await client.put(Uri.parse('${Cocus.enpoint}/${note.id}'),
        headers: {'x-apikey': Cocus.apikey}, body: {'title': note.title, 'text': note.text});
  }

  @override
  Future<void> add(String title, String text) async {
    await client
        .post(Uri.parse(Cocus.enpoint), headers: {'x-apikey': Cocus.apikey}, body: {'title': title, 'text': text});
  }
}
