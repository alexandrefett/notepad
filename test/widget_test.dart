import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:notepad/domain/entities/note.dart';
import 'package:notepad/features/add_note/presentation/add_note_page.dart';
import 'package:notepad/features/main_page/domain/notes_repository.dart';
import 'package:notepad/features/main_page/presentation/main_page.dart';
import 'package:notepad/features/main_page/presentation/notes_bloc/notes_bloc.dart';
import 'package:notepad/main.dart';

class MockNotesRepository extends Mock implements INotesRepository {}

class MockNotesBloc extends MockBloc<NotesEvent, NotesState> implements NotesBloc {}

void main() {
  final List<Note> noteList = [Note(text: '1', title: '1', id: '1'), Note(text: '2', title: '2', id: '2')];
  late NotesBloc notesBloc;
  late MockNotesRepository mockRepository;

  setUp(() {
    mockRepository = MockNotesRepository();
    notesBloc = NotesBloc(repository: mockRepository);
  });

  test('initial state should be NotesState.initial()', () {
    expect(notesBloc.state, equals(const NotesState.initial()));
  });

  testWidgets('MainPage initializes NotesBloc', (WidgetTester tester) async {
    // Build MainPage widget within MaterialApp
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<NotesBloc>(
          create: (context) => MockNotesBloc()..add(const NotesEvent.started()),
          child: const MainPage(key: Key('MainPage')),
        ),
      ),
    );

    // Verify NotesBloc is initialized
    expect(find.byKey(const Key('MainPage')), findsOneWidget);
  });

  testWidgets('Note Card test title and text', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.byKey(const Key('MainPage')), findsOne);
    expect(find.byKey(const Key('NoteList')), findsOne);
  });

  testWidgets('AddNotePage test', (WidgetTester tester) async {
    await tester.pumpWidget(const AddNotePage());
    expect(find.text('Submit'), findsOne);
  });

  tearDown(() {
    notesBloc.close();
  });
}
