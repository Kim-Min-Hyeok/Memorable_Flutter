import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memorable/models/TestsheetModel.dart'; // 수정된 모델 경로

class TestsheetView extends StatelessWidget {
  const TestsheetView({super.key});

  @override
  Widget build(BuildContext context) {
    // Arguments를 가져옵니다.
    final TestsheetDetailModel testsheetDetail = Get.arguments;

    // 인자를 확인하는 로그 추가
    print('TestsheetDetail: $testsheetDetail');

    return Scaffold(
      appBar: AppBar(
        title: Text('나만의 시험지 - ${testsheetDetail.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${testsheetDetail.testsheetId}'),
            SizedBox(height: 16),
            Text('카테고리: ${testsheetDetail.category}'),
            // SizedBox(height: 16),
            // Text('내용: ${testsheetDetail.content}'),
          ],
        ),
      ),
    );
  }
}
