import 'package:flutter/material.dart';

class MyPageViewComponent extends StatelessWidget {
  const MyPageViewComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('최근 생성된 파일', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.file_copy),
              title: Text('파일이름'),
              subtitle: Text('2024.10.10'),
              trailing: Icon(Icons.bookmark),
            );
          },
        ),
      ],
    );
  }
}