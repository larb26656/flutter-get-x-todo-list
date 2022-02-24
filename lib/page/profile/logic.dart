import 'package:get/get.dart';
import 'package:todo_list/model/task_dto.dart';
import 'package:todo_list/service/task/task_service.dart';

class ProfileLogic extends GetxController {

  final taskService = Get.find<TaskService>();

  RxBool isLoading = false.obs;

  Rx<dynamic> error = Rx(null);

  RxList<TaskDto> taskList = RxList();

  searchTask() async {
    error.value = null;
    taskList.value = [];
    isLoading.value = true;
    try {
      taskList.value = await taskService.getList() ?? [];
    } catch (e, st) {
      error.value = e;
      print(st);
    }
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    searchTask();
  }

}
