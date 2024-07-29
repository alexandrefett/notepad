import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.freezed.dart';
part 'note.g.dart';

@freezed
class Note with _$Note {
  factory Note({
    String? id,
    required String title,
    required String text,
  }) = _Note;

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
  factory Note.fromJsonId(Map<String, dynamic> json, String id) {
    json['id'] = id;
    return _$NoteFromJson(json);
  }
}
