part of 'notes_bloc.dart';

@freezed
class NotesEvent with _$NotesEvent {
  const factory NotesEvent.started() = _Started;
  const factory NotesEvent.deleted({required String id}) = _DeletePressed;
  const factory NotesEvent.updated({required Note note}) = _UpdatedPressed;
  const factory NotesEvent.added({
    required String title,
    required String text,
  }) = _AddPressed;
}
