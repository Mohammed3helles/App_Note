import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes_app/bloc/add_note/add_note_cubit.dart';
import 'package:my_notes_app/bloc/get_note/get_note_cubit.dart';
import 'package:my_notes_app/ui/resources/strings_manager.dart';
import 'package:my_notes_app/ui/widgets/custom_appBar.dart';
import 'package:my_notes_app/ui/widgets/custom_list_view.dart';

import '../widgets/model_bottom_sheet.dart';

class HomeNote extends StatefulWidget {
  const HomeNote({Key? key}) : super(key: key);

  @override
  State<HomeNote> createState() => _HomeNoteState();
}

class _HomeNoteState extends State<HomeNote> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<GetNoteCubit>(context).getNote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          CustomAppBar(
            title: NoteStrings.titleApp,
            onTap: () {
              BlocProvider.of<GetNoteCubit>(context).fetchSearch();
            },
            onChanged: (value){
              BlocProvider.of<GetNoteCubit>(context).filterListNote(value);
            },
          ),
          const Expanded(child: CustomListView()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              builder: (_) => BlocProvider(
                  create: (_) => AddNoteCubit(),
                  child: const AddNoteFromModelBottomSheet()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
