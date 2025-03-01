import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memorable/models/WorksheetModel.dart'; // 수정된 모델 경로

class WorksheetView extends StatelessWidget {
  const WorksheetView({super.key});

  @override
  Widget build(BuildContext context) {
    // Arguments를 가져옵니다.
    final WorksheetDetail worksheetDetail = Get.arguments;

    // 인자를 확인하는 로그 추가
    print('WorksheetDetail: $worksheetDetail');

    return Scaffold(
      appBar: AppBar(
        title: Text('빈칸학습지 - ${worksheetDetail.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${worksheetDetail.worksheetId}'),
            SizedBox(height: 16),
            Text('카테고리: ${worksheetDetail.category}'),
            SizedBox(height: 16),
            Text('내용: ${worksheetDetail.content}'),
            SizedBox(height: 16),
            Text('빈칸 학습지 답안 1: ${worksheetDetail.answer1.join(', ')}'),
            SizedBox(height: 8),
            Text('빈칸 학습지 답안 2: ${worksheetDetail.answer2.join(', ')}'),
          ],
        ),
      ),
    );
  }
}
