import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memorable/components/homeComponents/RecentSheetViewComponent.dart';
import 'package:memorable/models/DocumentModel.dart';
import 'package:memorable/utilities/color_style.dart';
import 'package:memorable/utilities/text_style.dart';
import 'package:memorable/controllers/DocumentController.dart';

class BookmarkViewComponent extends StatelessWidget {
  final DocumentController documentController = Get.find<DocumentController>();
  final DateFormat dateFormat = DateFormat('yyyy.MM.dd');
  final RxInt bookmarkCount = 0.obs; // Declare bookmarkCount as RxInt
  final RxList<DocumentModel> bookmarkedDocuments = RxList<DocumentModel>();

  BookmarkViewComponent({super.key}) {
    // Initialize bookmarkCount and bookmarkedDocuments
    _updateBookmarkedDocuments();
  }

  @override
  Widget build(BuildContext context) {
    // Update bookmarkCount and bookmarkedDocuments whenever the currentDocuments list changes
    documentController.currentDocuments.listen((_) {
      _updateBookmarkedDocuments();
    });

    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 40.w, 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 90.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Obx(() => Text(
              '총 ${bookmarkCount.value}개의\n즐겨찾기 파일이 있어요',
              style: Theme.of(context).textTheme.displayLarge,
            )),
          ),
          SizedBox(height: 16.h),
          RecentSheetViewComponent(
            height: 580.h,
            currentDocuments: bookmarkedDocuments, // 필터링된 문서 리스트를 전달
            onBookmarkToggle: _updateBookmarkedDocuments, // Pass the callback function
          ),
        ],
      ),
    );
  }

  void _updateBookmarkedDocuments() {
    final docs = documentController.currentDocuments.where((doc) => doc.isBookmarked).toList();
    bookmarkedDocuments.assignAll(docs);
    bookmarkCount.value = docs.length;
  }
}
