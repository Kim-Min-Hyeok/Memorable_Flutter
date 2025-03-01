import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memorable/models/WrongsheetModel.dart'; // 수정된 모델 경로

class WrongsheetView extends StatelessWidget {
  const WrongsheetView({super.key});

  @override
  Widget build(BuildContext context) {
    // Arguments를 가져옵니다.
    final WrongsheetDetail wrongsheetDetail = Get.arguments;

    // 인자를 확인하는 로그 추가
    print('WrongsheetDetail: $wrongsheetDetail');

    return Scaffold(
      appBar: AppBar(
        title: Text('오답노트 - ${wrongsheetDetail.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${wrongsheetDetail.wrongsheetId}'),
            SizedBox(height: 16),
            Text('카테고리: ${wrongsheetDetail.category}'),
            // SizedBox(height: 16),
            // Text('내용: ${wrongsheetDetail.content}'),
          ],
        ),
      ),
    );
  }
}
