import 'package:get/get.dart';

class DashboardController extends GetxController {
  final _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;

  void changeTabIndex(int index) {
    _selectedIndex.value = index;
  }
}
