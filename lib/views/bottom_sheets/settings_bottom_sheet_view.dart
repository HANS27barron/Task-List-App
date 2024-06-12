import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_first_app/view_models/app_view_model.dart';
import 'package:provider/provider.dart';

import '../../models/task_model.dart';

class SettingsBottomSheetView extends StatelessWidget {
  const SettingsBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController entryController = TextEditingController();

    return Consumer<AppViewModel>(builder:(context, viewModel, child){
      return Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(height: 80, child: Center(
          child: SizedBox(
            height: 40,
            width: 250,
            child: TextField(
              onSubmitted: (value){
                if(entryController.text.isNotEmpty){
                  viewModel.updateUsername(entryController.text);
                }
                Navigator.of(context).pop();
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom:5), 
                filled:true, 
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20), 
                  borderSide: const BorderSide(
                    width: 0, style: BorderStyle.none))),
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
              cursorColor: Colors.grey.shade900,
              autofocus: true,
              autocorrect: false,
              controller: entryController,
              style: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.w500)
            ),
          ),
        )),
      );
    });
  }
}