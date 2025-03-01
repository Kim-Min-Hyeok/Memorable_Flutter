import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memorable/utilities/color_style.dart';

class HeaderComponent extends StatelessWidget implements PreferredSizeWidget {
  const HeaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(76.h),
      child: AppBar(
        backgroundColor: gray5,
        elevation: 0,
        title: Row(
          children: [
            SizedBox(width: 20.w),
            Image.asset(
              'assets/appLogo.png',
              height: 15.07.h,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black, size: 24.sp),
            onPressed: () {
              // 검색 기능 구현
            },
          ),
          IconButton(
            icon: Icon(Icons.add, color: Colors.black, size: 24.sp),
            onPressed: () {
              // 추가 기능 구현
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(76.h);
}