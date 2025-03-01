import 'package:memorable/models/DocumentModel.dart';

class WorksheetModel implements DocumentModel {
  @override
  final int id;
  @override
  String name;
  @override
  final String category;
  @override
  bool isBookmarked;
  @override
  final DateTime createdDate;
  @override
  final String fileType = 'worksheet';

  WorksheetModel({
    required this.id,
    required this.name,
    required this.category,
    required this.isBookmarked,
    required this.createdDate,
  });

  factory WorksheetModel.fromJson(Map<String, dynamic> json) {
    return WorksheetModel(
      id: json['worksheetId'],
      name: json['name'] ?? '빈칸 학습지',
      category: json['category'],
      isBookmarked: json['worksheetBookmark'],
      createdDate: DateTime.parse(json['worksheetCreate_date']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'worksheetId': id,
      'name': name,
      'category': category,
      'worksheetBookmark': isBookmarked,
      'worksheetCreate_date': createdDate.toIso8601String(),
    };
  }
}

class WorksheetDetail {
  final int worksheetId;
  final String name;
  final String category;
  final bool isCompleteAllBlanks;
  final bool isAddWorksheet;
  final bool isMakeTestSheet;
  final List<String> answer1;
  final List<String> answer2;
  final String content;

  WorksheetDetail({
    required this.worksheetId,
    required this.name,
    required this.category,
    required this.isCompleteAllBlanks,
    required this.isAddWorksheet,
    required this.isMakeTestSheet,
    required this.answer1,
    required this.answer2,
    required this.content,
  });

  factory WorksheetDetail.fromJson(Map<String, dynamic> json) {
    return WorksheetDetail(
      worksheetId: json['worksheetId'],
      name: json['name'],
      category: json['category'],
      isCompleteAllBlanks: json['isCompleteAllBlanks'],
      isAddWorksheet: json['isAddWorksheet'],
      isMakeTestSheet: json['isMakeTestSheet'],
      answer1: List<String>.from(json['answer1']),
      answer2: List<String>.from(json['answer2']),
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'worksheetId': worksheetId,
      'name': name,
      'category': category,
      'isCompleteAllBlanks': isCompleteAllBlanks,
      'isAddWorksheet': isAddWorksheet,
      'isMakeTestSheet': isMakeTestSheet,
      'answer1': answer1,
      'answer2': answer2,
      'content': content,
    };
  }
}