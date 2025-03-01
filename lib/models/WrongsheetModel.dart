import 'package:memorable/models/DocumentModel.dart';
import 'package:memorable/models/QuestionModel.dart';

class WrongsheetModel implements DocumentModel {
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
  final String fileType = 'wrongsheet';

  WrongsheetModel({
    required this.id,
    required this.name,
    required this.category,
    required this.isBookmarked,
    required this.createdDate,
  });

  factory WrongsheetModel.fromJson(Map<String, dynamic> json) {
    return WrongsheetModel(
      id: json['wrongsheetId'],
      name: json['name'],
      category: json['category'],
      isBookmarked: json['wrongsheetBookmark'],
      createdDate: DateTime.parse(json['wrongsheetCreateDate']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'wrongsheetId': id,
      'name': name,
      'category': category,
      'wrongsheetBookmark': isBookmarked,
      'wrongsheetCreateDate': createdDate.toIso8601String(),
    };
  }
}

class WrongsheetDetail {
  final int wrongsheetId;
  final String name;
  final String category;
  final List<QuestionModel> questions;

  WrongsheetDetail({
    required this.wrongsheetId,
    required this.name,
    required this.category,
    required this.questions,
  });

  factory WrongsheetDetail.fromJson(Map<String, dynamic> json) {
    return WrongsheetDetail(
      wrongsheetId: json['wrongsheetId'],
      name: json['name'],
      category: json['category'],
      questions: (json['questions'] as List).map((q) => QuestionModel.fromJson(q)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'wrongsheetId': wrongsheetId,
      'name': name,
      'category': category,
      'questions': questions.map((q) => q.toJson()).toList(),
    };
  }
}