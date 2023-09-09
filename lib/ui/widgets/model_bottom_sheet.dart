import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_notes_app/bloc/add_note/add_note_cubit.dart';
import 'package:my_notes_app/bloc/get_note/get_note_cubit.dart';
import 'package:my_notes_app/data/models/note_model.dart';
import 'package:my_notes_app/ui/resources/color_manager.dart';
import 'package:my_notes_app/ui/resources/constants_manager.dart';
import 'package:my_notes_app/ui/resources/strings_manager.dart';
import 'package:my_notes_app/ui/widgets/customListColor.dart';

import 'custom_TextField.dart';

class AddNoteFromModelBottomSheet extends StatefulWidget {
  const AddNoteFromModelBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddNoteFromModelBottomSheet> createState() =>
      _AddNoteFromModelBottomSheetState();
}

class _AddNoteFromModelBottomSheetState
    extends State<AddNoteFromModelBottomSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String title = '', description = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteFailure) {
          debugPrint('this error because => ${state.errorMessage}');
        }
        if (state is AddNoteSuccess) {
          BlocProvider.of<GetNoteCubit>(context).getNote();
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                    child: CustomTextField(
                      hint: NoteStrings.hint,
                      maxLines: 1,
                      onSaved: (value) {
                        title = value!;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: CustomTextField(
                      hint: NoteStrings.content,
                      maxLines: 5,
                      onSaved: (value) {
                        description = value!;
                      },
                    ),
                  ),
                  const CustomListColor(),
                  buttonAddNote(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Container buttonAddNote(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            String time = DateFormat.yMd().format(DateTime.now());
            Note note = Note(title, description, time, NoteColor.primary.value);
            BlocProvider.of<AddNoteCubit>(context).addNote(note);
          } else {
            autoValidateMode = AutovalidateMode.always;
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: NoteColor.primary,
        ),
        child: Text(
          'Add',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
