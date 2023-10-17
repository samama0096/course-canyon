import 'package:elearn/data/models/section_model.dart.dart';
import 'package:elearn/data/services/section_service.dart';
import 'package:elearn/utils/custom_widgets/getx_custom_widgets.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SectionController extends GetxController {
  Rx<bool> loading = Rx(false);
  Rx<bool> loaded = Rx(false);
  List<Section> sections = [];
  final String id;

  final SectionService _sectionService = SectionService();

  SectionController({required this.id});
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getSections();
  }

  Future getSections() async {
    loading.value = true;
    var res = await _sectionService.getCourseSection(id: id);

    if (res == null) {
      showError('Check your internet connection');
      return;
    }
    if (res.isNotEmpty) {
      sections = res;

      loading.value = false;
      loaded.value = true;
    }
  }
}
