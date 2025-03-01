import 'package:get/get.dart';
import 'package:memorable/models/DocumentModel.dart';
import 'package:memorable/services/documentService.dart';

class DocumentController extends GetxController {
  final DocumentService _service = Get.find<DocumentService>();
  final RxList<DocumentModel> currentDocuments = <DocumentModel>[].obs;
  final RxString recentWorksheetName = ''.obs;
  final RxInt selectedTabIndex = 0.obs; // Add selectedTabIndex

  @override
  void onInit() {
    super.onInit();
    print('DocumentController onInit called');
    loadInitialData();
  }

  void loadInitialData() {
    ever(_service.worksheets, (_) {
      loadDocuments();
      updateRecentWorksheetName();
      print('Worksheets loaded: ${currentDocuments.length}');
    });

    // 초기 데이터 로드
    loadDocuments();
    updateRecentWorksheetName();
  }

  void loadDocuments() {
    switch (selectedTabIndex.value) {
      case 1:
        currentDocuments.assignAll(_service.worksheets);
        break;
      case 2:
        currentDocuments.assignAll(_service.testsheets);
        break;
      case 3:
        currentDocuments.assignAll(_service.wrongsheets);
        break;
      default:
        currentDocuments.assignAll(_service.getAllDocuments());
    }
    print('Documents assigned: ${currentDocuments.length}');
  }

  void updateRecentWorksheetName() {
    recentWorksheetName.value = _service.worksheets.isNotEmpty
        ? _service.worksheets.first.name
        : "최근 워크시트 없음";
    print('Recent worksheet name updated: ${recentWorksheetName.value}');
  }

  void onTabChanged(int index) {
    selectedTabIndex.value = index;
    loadDocuments();
  }

  // ... 나머지 메서드들 ...
}
