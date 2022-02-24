import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:todo_list/model/task_dto.dart';
import 'package:todo_list/model/user_dto.dart';
import 'package:todo_list/service/task/task_service.dart';

class TaskFormLogic extends GetxController {

  final taskService = Get.find<TaskService>();

  RxBool isLoading = false.obs;

  final FormGroup form = FormGroup({
    'topic': FormControl<String>(value: '', validators: [Validators.required]),
    'description': FormControl<String>(value: ''),
  });

  Future<void> submit() async {
    isLoading.value = true;

    UserDto user = UserDto.fromEmpty();
    user.id = 1;

    await taskService.add(
        TaskDto(
          null,
          form.control('topic').value,
          form.control('description').value,
          DateTime.now(),
          user
        )
    );
    isLoading.value = false;
  }

}
