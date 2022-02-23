import 'package:get/get.dart';
import 'package:todo_list/model/task_dto.dart';
import 'package:todo_list/service/task/task_service.dart';

class ProfileLogic extends GetxController {

  final taskService = Get.find<TaskService>();

  RxBool isLoading = false.obs;

  RxList<TaskDto> taskList = RxList();

  searchTask() async {
    taskList.value = [];
    isLoading.value = true;
    taskList.value = await taskService.getList();
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    searchTask();
  }

}
