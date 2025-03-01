import 'package:get/get.dart';
import 'package:memorable/models/DocumentModel.dart';
import 'package:memorable/models/MockData.dart';

class DocumentService extends GetxService {
  final RxList<DocumentModel> worksheets = <DocumentModel>[].obs;
  final RxList<DocumentModel> testsheets = <DocumentModel>[].obs;
  final RxList<DocumentModel> wrongsheets = <DocumentModel>[].obs;

  Future<DocumentService> init() async {
    await Future.delayed(Duration(seconds: 1)); // 네트워크 지연 시뮬레이션
    
    worksheets.addAll(MockData.worksheets);
    testsheets.addAll(MockData.testsheets);
    wrongsheets.addAll(MockData.wrongsheets);

    return this;
  }

  List<DocumentModel> getAllDocuments() {
    return [...worksheets, ...testsheets, ...wrongsheets];
  }

  List<DocumentModel> getBookmarkedDocuments() {
    return getAllDocuments().where((doc) => doc.isBookmarked).toList();
  }

  Future<void> toggleBookmark(DocumentModel document) async {
    document.isBookmarked = !document.isBookmarked;
    // 실제 서버에서는 여기서 API 호출을 수행할 것입니다.
    // 예: await _api.updateBookmark(document.id, document.isBookmarked);
  }

  Future<void> deleteDocument(DocumentModel document) async {
    switch (document.fileType) {
      case "worksheet":
        worksheets.remove(document);
        break;
      case "testsheet":
        testsheets.remove(document);
        break;
      case "wrongsheet":
        wrongsheets.remove(document);
        break;
    }
    // 실제 서버에서는 여기서 API 호출을 수행할 것입니다.
    // 예: await _api.deleteDocument(document.id, document.fileType);
  }

  Future<void> updateDocumentName(DocumentModel document, String newName) async {
    document.name = newName;
    // 실제 서버에서는 여기서 API 호출을 수행할 것입니다.
    // 예: await _api.updateDocumentName(document.id, document.fileType, newName);
  }
}