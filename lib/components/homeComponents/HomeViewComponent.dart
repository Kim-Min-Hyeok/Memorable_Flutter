import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memorable/components/homeComponents/LearningButtonsComponent.dart';
import 'package:memorable/components/homeComponents/RecentViewComponent.dart';
import 'package:memorable/components/homeComponents/RecentSheetViewComponent.dart';
import 'package:memorable/controllers/DocumentController.dart';

class HomeViewComponent extends StatelessWidget {
  final DocumentController documentController = Get.find<DocumentController>();
  final RxInt bookmarkCount = 0.obs; // Declare bookmarkCount as RxInt

  HomeViewComponent({super.key}) {
    // Initialize bookmarkCount
    bookmarkCount.value = documentController.currentDocuments.where((doc) => doc.isBookmarked).length;
  }

  @override
  Widget build(BuildContext context) {
    // Update bookmarkCount whenever the currentDocuments list changes
    documentController.currentDocuments.listen((_) {
      bookmarkCount.value = documentController.currentDocuments.where((doc) => doc.isBookmarked).length;
    });

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 3.h, 40.w, 63.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 90.h,
              child: Text(
                '사용자님,\n오늘도 함께 학습해볼까요?',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            SizedBox(height: 16.h),
            Obx(() {
              return RecentViewComponent(
                recentWorksheetName: documentController.recentWorksheetName.value,
              );
            }),
            SizedBox(height: 44.h),
            Text(
              '학습 라이브러리',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: 16.h),
            const LearningButtonsComponent(),
            SizedBox(height: 44.h),
            Text(
              '최근 생성된 파일',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: 16.h),
            RecentSheetViewComponent(
              height: 456.h,
              currentDocuments: documentController.currentDocuments,
              onBookmarkToggle: _updateBookmarkCount, // Pass the callback function
            ),
          ],
        ),
      ),
    );
  }

  void _updateBookmarkCount() {
    bookmarkCount.value = documentController.currentDocuments.where((doc) => doc.isBookmarked).length;
  }
}
