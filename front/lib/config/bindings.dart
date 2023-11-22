import 'package:front/controllers/event_contorller.dart';
import 'package:front/controllers/products_controller.dart';
import 'package:front/controllers/profile_controller.dart';
import 'package:get/get.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ProfileColntroller>(ProfileColntroller());
    Get.put<ProductsController>(ProductsController());
    Get.put<EventController>(EventController());
  }
}
