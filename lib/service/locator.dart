import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../data/datasource/notes_datasource_implementation.dart';
import '../data/repository/notes_implementation.dart';
import '../features/main_page/presentation/notes_bloc/notes_bloc.dart';

final locator = GetIt.instance;

Future<void> setUp() async {
  locator.registerLazySingleton(() => NotesBloc(
        repository: NotesImplementation(
          NotesDatasourceImplementation(
            client: http.Client(),
          ),
        ),
      ));
}
