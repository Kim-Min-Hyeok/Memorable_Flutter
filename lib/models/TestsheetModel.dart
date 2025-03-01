import 'package:memorable/models/DocumentModel.dart';
import 'package:memorable/models/QuestionModel.dart';

class TestsheetModel implements DocumentModel {
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
  final String fileType = 'testsheet';

  TestsheetModel({
    required this.id,
    required this.name,
    required this.category,
    required this.isBookmarked,
    required this.createdDate,
  });

  factory TestsheetModel.fromJson(Map<String, dynamic> json) {
    return TestsheetModel(
      id: json['testsheetId'],
      name: json['name'] ?? '나만의 시험지',
      category: json['category'],
      isBookmarked: json['testsheetBookmark'],
      createdDate: DateTime.parse(json['testsheetCreateDate']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'testsheetId': id,
      'name': name,
      'category': category,
      'testsheetBookmark': isBookmarked,
      'testsheetCreateDate': createdDate.toIso8601String(),
    };
  }
}

class TestsheetDetailModel {
  final int testsheetId;
  final String name;
  final String category;
  final bool reExtracted;
  final List<bool> isCompleteAllBlanks;
  final List<QuestionModel> questions1;
  final List<QuestionModel> questions2;
  final List<int>? score;
  final List<bool>? isCorrect;

  TestsheetDetailModel({
    required this.testsheetId,
    required this.name,
    required this.category,
    required this.reExtracted,
    required this.isCompleteAllBlanks,
    required this.questions1,
    required this.questions2,
    this.score,
    this.isCorrect,
  });

  factory TestsheetDetailModel.fromJson(Map<String, dynamic> json) {
    return TestsheetDetailModel(
      testsheetId: json['testsheetId'],
      name: json['name'],
      category: json['category'],
      reExtracted: json['reExtracted'],
      isCompleteAllBlanks: List<bool>.from(json['isCompleteAllBlanks']),
      questions1: (json['questions1'] as List).map((q) => QuestionModel.fromJson(q)).toList(),
      questions2: (json['questions2'] as List).map((q) => QuestionModel.fromJson(q)).toList(),
      score: json['score'] != null ? List<int>.from(json['score']) : null,
      isCorrect: json['isCorrect'] != null ? List<bool>.from(json['isCorrect']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'testsheetId': testsheetId,
      'name': name,
      'category': category,
      'reExtracted': reExtracted,
      'isCompleteAllBlanks': isCompleteAllBlanks,
      'questions1': questions1.map((q) => q.toJson()).toList(),
      'questions2': questions2.map((q) => q.toJson()).toList(),
      'score': score,
      'isCorrect': isCorrect,
    };
  }
}

class TestsheetGradeModel {
  final List<int>? score;
  final List<bool>? isCorrect;

  TestsheetGradeModel({this.score, this.isCorrect});

  factory TestsheetGradeModel.fromJson(Map<String, dynamic> json) {
    return TestsheetGradeModel(
      score: json['score'] != null ? List<int>.from(json['score']) : null,
      isCorrect: json['isCorrect'] != null ? List<bool>.from(json['isCorrect']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'score': score,
      'isCorrect': isCorrect,
    };
  }
}