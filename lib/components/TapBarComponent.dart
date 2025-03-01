import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memorable/utilities/color_style.dart';
import 'package:memorable/utilities/text_style.dart';

class TabBarComponent extends StatelessWidget {
  final TabController controller;
  const TabBarComponent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 93.w,
      height: 410.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(80.r),
      ),
      child: RotatedBox(
        quarterTurns: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 36.h),
            _buildTab(context, 0, '홈', 'assets/homeSelected.png', 'assets/homeUnselected.png'),
            SizedBox(height: 57.5.h),
            _buildTab(context, 1, '즐겨찾기', 'assets/bookmarkSelected.png', 'assets/bookmarkUnselected.png'),
            SizedBox(height: 57.5.h),
            _buildTab(context, 2, '마이페이지', 'assets/mypageSelected.png', 'assets/mypageUnselected.png'),
            SizedBox(height: 36.h),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(BuildContext context, int index, String label, String selectedAsset, String unselectedAsset) {
    return GestureDetector(
      onTap: () => controller.animateTo(index),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          final isSelected = controller.index == index;
          return RotatedBox(
            quarterTurns: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  isSelected ? selectedAsset : unselectedAsset,
                  width: 49.5.w,
                  height: 49.5.h,
                ),
                SizedBox(height: 4.h),
                Text(
                  label,
                  style: bodyCaption.copyWith(color: gray1)
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}