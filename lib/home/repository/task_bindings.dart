import 'package:get/get.dart';
import 'package:lista_tarefas/home/repository/controllers/comp_controler.dart';
import 'package:lista_tarefas/home/repository/controllers/task_controller.dart';
import 'package:lista_tarefas/home/repository/task_repository.dart';
import 'package:lista_tarefas/repository/i_repository.dart';

import 'controllers/edit_page_controller.dart';
import 'controllers/incomp_controller.dart';

class TaskBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<ITaskRepository>(TaskHttpRepository());
    Get.put(TaskController(Get.find()));
    Get.put(ImcompController(Get.find()));
    Get.put(CompController(Get.find()));
    //Get.put(EditPageFormController(Get.find()));
  }
}
