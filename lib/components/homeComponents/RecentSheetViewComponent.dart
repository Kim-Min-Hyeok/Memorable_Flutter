import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:memorable/models/DocumentModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memorable/utilities/color_style.dart';
import 'package:memorable/utilities/text_style.dart';

class RecentSheetViewComponent extends StatelessWidget {
  final RxList<DocumentModel> currentDocuments;
  final RxInt selectedTabIndex = 0.obs;
  final DateFormat dateFormat = DateFormat('yyyy.MM.dd');
  final VoidCallback onBookmarkToggle; // Callback to update bookmark count
  final double height;

  RecentSheetViewComponent({
    super.key,
    required this.height,
    required this.currentDocuments,
    required this.onBookmarkToggle,
  });

  Map<String, dynamic> _getFileTypeInfo(String fileType) {
    switch (fileType) {
      case 'worksheet':
        return {
          'iconPath': 'assets/worksheetIcon-white.png',
          'iconText': '학습',
          'iconColor': blue2,
        };
      case 'testsheet':
        return {
          'iconPath': 'assets/testsheetIcon-white.png',
          'iconText': '시험',
          'iconColor': yellow1,
        };
      case 'wrongsheet':
        return {
          'iconPath': 'assets/worngsheetIcon-white.png',
          'iconText': '오답',
          'iconColor': gray1,
        };
      default:
        return {
          'iconPath': 'assets/worksheetIcon-white.png',
          'iconText': '학습',
          'iconColor': blue2,
        };
    }
  }

  List<DocumentModel> _filterDocuments() {
    switch (selectedTabIndex.value) {
      case 1:
        return currentDocuments.where((doc) => doc.fileType == 'worksheet').toList();
      case 2:
        return currentDocuments.where((doc) => doc.fileType == 'testsheet').toList();
      case 3:
        return currentDocuments.where((doc) => doc.fileType == 'wrongsheet').toList();
      default:
        return currentDocuments;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.fromLTRB(0.w, 24.h, 0, 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 상단 탭 바
          Row(
            children: [
              SizedBox(width: 28.w),
              Container(
                width: 382.w,
                height: 30.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTabItem('전체보기', 64.w, 0),
                    SizedBox(width: 8.w),
                    _buildTabItem('빈칸 학습지', 99.w, 1, iconPath: 'assets/worksheetIcon.png'),
                    SizedBox(width: 8.w),
                    _buildTabItem('나만의 시험지', 111.w, 2, iconPath: 'assets/testsheetIcon.png'),
                    SizedBox(width: 8.w),
                    _buildTabItem('오답노트', 84.w, 3, iconPath: 'assets/problemsheetIcon.png'),
                  ],
                ),
              ),
            ],
          ),
          // 문서 리스트
          Expanded(
            child: Obx(() {
              final filteredDocuments = _filterDocuments();
              return ListView.builder(
                shrinkWrap: true,
                itemCount: filteredDocuments.length,
                itemBuilder: (context, index) {
                  final doc = filteredDocuments[index];
                  final fileTypeInfo = _getFileTypeInfo(doc.fileType);
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 0.w),
                    decoration: BoxDecoration(
                      color: white,
                    ),
                    child: ListTile(
                      leading: _getLeadingIcon(doc.fileType),
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 85.w,
                            height: 28.h,
                            decoration: BoxDecoration(
                              border: Border.all(color: blue2, width: 1.r),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Text(
                              doc.category,
                              style: bodyCaption.copyWith(color: blue2),
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          SizedBox(
                            width: 150.w,
                            child: Text(doc.name, style: body1.copyWith(color: black)),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Text(
                            dateFormat.format(doc.createdDate),
                            style: bodyCaption.copyWith(color: gray1),
                          ),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(
                              doc.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                              color: doc.isBookmarked ? fileTypeInfo['iconColor'] : gray1,
                            ),
                            onPressed: () {
                              doc.isBookmarked = !doc.isBookmarked;
                              currentDocuments.refresh();
                              onBookmarkToggle(); // Call the callback function
                            },
                          ),
                        ],
                      ),
                      onTap: () {
                        switch (doc.fileType) {
                          case 'worksheet':
                            Get.toNamed('/worksheet', arguments: doc);
                            break;
                          case 'testsheet':
                            Get.toNamed('/testsheet', arguments: doc);
                            break;
                          case 'wrongsheet':
                            Get.toNamed('/wrongsheet', arguments: doc);
                            break;
                        }
                      },
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(String label, double width, int index, {String? iconPath}) {
    return Obx(() => GestureDetector(
          onTap: () => selectedTabIndex.value = index,
          child: Container(
            width: width,
            height: 30.h,
            decoration: BoxDecoration(
              color: selectedTabIndex.value == index ? black : gray5,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (iconPath != null) ...[
                  Image.asset(iconPath, width: 16.w, height: 16.h),
                  SizedBox(width: 3.w),
                ],
                Text(
                  label,
                  style: TextStyle(
                    color: selectedTabIndex.value == index ? white : gray1,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _getLeadingIcon(String fileType) {
    final info = _getFileTypeInfo(fileType);
    return Container(
      width: 60.w,
      height: 28.h,
      decoration: BoxDecoration(
        color: info['iconColor'],
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(info['iconPath'], width: 16.w, height: 16.h),
          SizedBox(width: 2.w),
          Text(
            info['iconText'],
            style: bodyCaption.copyWith(color: white),
          ),
        ],
      ),
    );
  }
}
