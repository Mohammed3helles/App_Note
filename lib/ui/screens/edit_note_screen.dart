import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/bloc/add_note/add_note_cubit.dart';
import 'package:my_notes_app/bloc/get_note/get_note_cubit.dart';
import 'package:my_notes_app/ui/resources/strings_manager.dart';
import 'package:my_notes_app/ui/widgets/customListColor.dart';
import 'package:my_notes_app/ui/widgets/custom_TextField.dart';
import 'package:my_notes_app/ui/widgets/custom_appBar.dart';

import '../../data/models/note_model.dart';

class EditNote extends StatelessWidget {
  final Note note;

  const EditNote({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          CustomAppBar(
            title: NoteStrings.editNote,
            iconData: Icons.check,
            onTap: () {
              BlocProvider.of<GetNoteCubit>(context).getNote();
              Navigator.pop(context);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
            child: CustomTextField(
              hint: NoteStrings.hint,
              maxLines: 1,
              onChanged: (value) {
                note.title = value ?? note.title;
                note.save();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: CustomTextField(
              hint: NoteStrings.content,
              maxLines: 5,
              onChanged: (value) {
                note.description = value;
                note.save();
              },
            ),
          ),
          BlocProvider(create: (_)=>AddNoteCubit(),
          child:  CustomListColor(note: note,),
          ),
        ],
      ),
    );
  }
}
