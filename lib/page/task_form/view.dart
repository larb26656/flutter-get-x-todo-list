import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:todo_list/model/task_dto.dart';
import 'package:todo_list/page/profile/logic.dart';
import 'package:todo_list/service/task/task_service.dart';
import 'package:todo_list/style/color_palettes.dart';
import 'package:todo_list/style/dimensions.dart';
import 'package:todo_list/style/form_settings.dart';
import 'package:todo_list/style/text_size.dart';
import 'package:todo_list/widget/field_wrap.dart';

import 'logic.dart';

class TaskFormPage extends StatelessWidget {
  final logic = Get.find<TaskFormLogic>();

  Widget _topicField() {
    return FieldWrap(
      label: 'Topic',
      child: ReactiveTextField(
        formControlName: 'topic',
        showErrors: FormSettings.defaultShowErrors,
        validationMessages: (control) {
          return {
            'required': 'Please fill topic.',
          };
        },
      ),
    );
  }

  Widget _descriptionField() {
    return FieldWrap(
      label: 'Description',
      child: ReactiveTextField(
        formControlName: 'description',
        showErrors: FormSettings.defaultShowErrors,
        maxLines: 8,
      ),
    );
  }

  Widget _formDetail() {
    return Obx(() {
      if (logic.isLoading.value) {
        return const SpinKitSquareCircle(
          color: ColorPalettes.primary,
          size: 50.0,
        );
      } else {
        return SingleChildScrollView(
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
        );
      }
    });
  }

  submitButton() {
    return ReactiveFormConsumer(
        builder: (BuildContext context, FormGroup formGroup, Widget? child) {
      return TextButton(
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          backgroundColor: ColorPalettes.secondary,
          padding: const EdgeInsets.all(Dimensions.spacePadding3),
          primary: Colors.white,
          textStyle: const TextStyle(fontSize: TextSize.t5Size),
        ),
        onPressed: formGroup.valid
            ? () async {
                await logic.submit();
                Get.back(result: true);
              }
            : null,
        child: const Text('Submit'),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add task'),
        centerTitle: true,
      ),
      body: ReactiveForm(
        formGroup: logic.form,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(Dimensions.spacePadding3),
                child: _formDetail(),
              ),
            ),
            submitButton()
          ],
        ),
      ),
    );
  }
}
