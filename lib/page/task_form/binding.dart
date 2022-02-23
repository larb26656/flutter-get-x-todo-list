import 'package:get/get.dart';

import 'logic.dart';

class TaskFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskFormLogic());
  }
}
