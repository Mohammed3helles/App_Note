import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/ui/resources/strings_manager.dart';

import '../../bloc/get_note/get_note_cubit.dart';
import '../../data/models/note_model.dart';
import 'note_item.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({Key? key}) : super(key: key);

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNoteCubit, GetNoteState>(builder: (context, state) {
      GetNoteCubit data = BlocProvider.of<GetNoteCubit>(context);
      List<Note> notes = data.controller.text.isNotEmpty
          ? data.filterNotes ?? []
          : data.notes ?? [];

      if (notes.isNotEmpty) {
        return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return NoteItem(note: notes[index]);
            });
      } else {
        return Center(
          child: Text(
            NoteStrings.notAnyScreen,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        );
      }
    });
  }
}
