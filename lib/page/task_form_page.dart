import 'package:flutter/material.dart';
import 'package:todo_list/model/task_dto.dart';
import 'package:todo_list/style/color_palettes.dart';
import 'package:todo_list/style/dimensions.dart';
import 'package:todo_list/style/text_size.dart';
import 'package:todo_list/widget/field_wrap.dart';

class TaskFormPage extends StatefulWidget {
  const TaskFormPage({Key? key}) : super(key: key);

  @override
  _TaskFormPageState createState() => _TaskFormPageState();
}

class _TaskFormPageState extends State<TaskFormPage> {

  final _topicController = TextEditingController();
  final _descriptionController = TextEditingController();

  bool isFormValid = false;

  Widget _topicField() {
    return FieldWrap(
      label: 'Topic',
      child: TextField(
        controller: _topicController,

        onChanged: (value) {
          _validateForm();
        },
      ),
    );
  }

  Widget _descriptionField() {
    return FieldWrap(
      label: 'Description',
      child: TextField(
        maxLines: 8,
        controller: _descriptionController,
        decoration: const InputDecoration(
        ),
        onChanged: (value) {
          _validateForm();
        },
      ),
    );
  }

  void _validateForm() {
    bool isValid = true;

    isValid = _topicController.text.isNotEmpty;

    setState(() {
      isFormValid = isValid;
    });
  }

  submitButton() {
    return TextButton(
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero
        ),
        backgroundColor: ColorPalettes.secondary,
        padding: const EdgeInsets.all(Dimensions.spacePadding3),
        primary: Colors.white,
        textStyle: const TextStyle(fontSize: TextSize.t5Size),
      ),
      onPressed: isFormValid ? () {
        Navigator.pop(
          context,
          TaskDto(
            _topicController.text,
            _descriptionController.text,
            DateTime.now()
          )
        );
    } : null,
      child: const Text('Submit'),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add task'
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(Dimensions.spacePadding3),
              child: Column(
                children: [
                  _topicField(),
                  const SizedBox(
                    height: Dimensions.spacePadding3,
                  ),
                  _descriptionField(),

                ],
              ),
            ),
          ),
          submitButton()
        ],

      ),
    );
  }
}
