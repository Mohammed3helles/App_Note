import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_notes_app/ui/resources/color_manager.dart';
import 'package:my_notes_app/ui/resources/constants_manager.dart';

import '../../data/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color selectedColor = NoteColor.primary;
  List<Note>? noteAdded;

  addNote(Note note) async {
    try {
      emit(AddNoteLoading());
      note.color = selectedColor.value;
      Box<Note> noteBox = Hive.box<Note>(kBoxNote);
      await noteBox.add(note);
      noteAdded=noteBox.values.toList();
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
