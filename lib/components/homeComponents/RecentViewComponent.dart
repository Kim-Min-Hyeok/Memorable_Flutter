import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memorable/utilities/color_style.dart';

class RecentViewComponent extends StatelessWidget {
  final String recentWorksheetName;
  const RecentViewComponent({super.key, required this.recentWorksheetName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 988.w,
      padding: EdgeInsets.fromLTRB(28.w, 12.h, 12.w, 12.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        borderRadius: BorderRadius.circular(60.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '가장 최근에 학습한\n',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: white),
                  ),
                  TextSpan(
                    text: recentWorksheetName,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: blue2),
                  ),
                  TextSpan(
                    text: ' 학습지로 바로 이동할까요?',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: white),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 220.w,
            height: 68.h,
            child: ElevatedButton(
              onPressed: () {
                // TODO: Implement recent button action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: blue2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(85.r),
                ),
                padding: EdgeInsets.zero,
              ),
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      '시작하기',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: white),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 53.w),
                      child: Icon(Icons.chevron_right, color: white, size: 24.w),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}