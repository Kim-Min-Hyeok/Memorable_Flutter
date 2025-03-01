import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memorable/utilities/color_style.dart';

class LearningButtonsComponent extends StatelessWidget {
  const LearningButtonsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildLearningButton(
            context: context,
            title: '빈칸학습지',
            description: 'AI가 자료에서 중요한 단어를 추출하여\n자동으로 빈칸을 생성해줘요📚',
            asset: 'assets/worksheetButton.png',
            onTap: () {
              // TODO: Implement worksheet button action
            },
          ),
          SizedBox(width: 20.w),
          _buildLearningButton(
            context: context,
            title: '나만의 시험지',
            description: '빈칸 학습지로 학습 후 맞춤형 시험지로\n시험을 칠 수 있어요📝',
            asset: 'assets/testsheetButton.png',
            onTap: () {
              // TODO: Implement testsheet button action
            },
          ),
          SizedBox(width: 20.w),
          _buildLearningButton(
            context: context,
            title: '오답노트',
            description: '오답노트로 틀린 문제만 모아서\n시험 직전에 볼 수 있어요🖍',
            asset: 'assets/problemsheetButton.png',
            onTap: () {
              // TODO: Implement wrongsheet button action
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLearningButton({
    required BuildContext context,
    required String title,
    required String description,
    required String asset,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 316.w,
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              asset,
              width: 60.w,
              height: 60.h,
            ),
            SizedBox(height: 63.h,),
            Flexible(
              child: Text(
                title,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            SizedBox(height: 4.h),
            Flexible(
              child: Text(
                description,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: gray1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}