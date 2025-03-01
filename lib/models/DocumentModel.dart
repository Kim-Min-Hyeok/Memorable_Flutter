import 'package:intl/intl.dart';

class DocumentModel {
  final int id;
  String name;
  final String category;
  bool isBookmarked;
  final DateTime createdDate;
  final String fileType;

  DocumentModel({
    required this.id,
    required this.name,
    required this.category,
    required this.isBookmarked,
    required this.createdDate,
    required this.fileType,
  });

  factory DocumentModel.fromJson(Map<String, dynamic> json) {
    return DocumentModel(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      isBookmarked: json['isBookmarked'],
      createdDate: DateTime.parse(json['createdDate']),
      fileType: json['fileType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'isBookmarked': isBookmarked,
      'createdDate': createdDate.toIso8601String(),
      'fileType': fileType,
    };
  }
}