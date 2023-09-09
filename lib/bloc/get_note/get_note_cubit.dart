import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_notes_app/data/models/note_model.dart';
import 'package:my_notes_app/ui/resources/constants_manager.dart';

part 'get_note_state.dart';

class GetNoteCubit extends Cubit<GetNoteState> {
  GetNoteCubit() : super(GetNoteInitial());

  List<Note>? notes;
  List<Note>? filterNotes;
  final controller=TextEditingController();
  bool search = false;

  fetchSearch() {
    if (search) {
      search = false;
    } else {
      search = true;
    }
    emit(GetNoteSuccess());
  }

  filterListNote(String text) {
    filterNotes = notes!
        .where((element) =>
            element.title.toLowerCase().startsWith(text.toLowerCase()))
        .toList();
     emit(GetNoteSuccess());
  }

  getNote() {
    notes = Hive.box<Note>(kBoxNote).values.toList();
    emit(GetNoteSuccess());
  }
}
