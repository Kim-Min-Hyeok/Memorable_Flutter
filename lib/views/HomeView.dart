import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:memorable/components/HeaderComponent.dart';
import 'package:memorable/components/homeComponents/HomeViewComponent.dart';
import 'package:memorable/utilities/color_style.dart';
import 'package:memorable/components/TapBarComponent.dart';
import 'package:memorable/components/bookmarkComponents/BookmarkViewComponent.dart';
import 'package:memorable/components/mypageComponents/MyPageViewComponent.dart';
import 'package:memorable/controllers/DocumentController.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final DocumentController documentController = Get.put(DocumentController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('---------------home_view()');
      documentController.loadDocuments();
      print(
          'Worksheets loaded in HomeView: ${documentController.currentDocuments.length}');
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: gray5,
        appBar: const HeaderComponent(),
        body: Row(
          children: [
            SizedBox(width: 40.w),
            Column(
              children: [
                SizedBox(height: 109.h),
                TabBarComponent(controller: _tabController),
              ],
            ),
            SizedBox(width: 33.w),
            Expanded(
              child: RotatedBox(
                quarterTurns: 1,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    RotatedBox(
                      quarterTurns: 3,
                      child: HomeViewComponent(),
                    ),
                    RotatedBox(quarterTurns: 3, child: BookmarkViewComponent()), // Corrected here
                    RotatedBox(quarterTurns: 3, child: MyPageViewComponent()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}