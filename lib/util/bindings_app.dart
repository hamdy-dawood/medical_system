import 'package:get/get.dart';
import 'package:python_system/controllers/questions_controller.dart';

class BindingsApp implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuestionsController());
  }
}
