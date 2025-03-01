import 'package:memorable/models/WorksheetModel.dart';
import 'package:memorable/models/TestsheetModel.dart';
import 'package:memorable/models/WrongsheetModel.dart';
import 'package:memorable/models/QuestionModel.dart';

class MockData {
  static List<WorksheetModel> worksheets = [
    WorksheetModel(
      id: 1,
      name: "사회학개론 정리",
      category: "사회",
      isBookmarked: true,
      createdDate: DateTime.parse("2024-07-04T16:56:03.217683"),
    ),
    WorksheetModel(
      id: 2,
      name: "사회학개론 정리",
      category: "사회",
      isBookmarked: false,
      createdDate: DateTime.parse("2024-07-04T17:07:41.837927"),
    ),
    WorksheetModel(
      id: 3,
      name: "사회학개론 정리",
      category: "사회",
      isBookmarked: false,
      createdDate: DateTime.parse("2024-07-04T17:08:02.294939"),
    ),
  ];

  static List<TestsheetModel> testsheets = [
    TestsheetModel(
      id: 1,
      name: "사회학 시험",
      category: "사회",
      isBookmarked: false,
      createdDate: DateTime.now(),
    ),
  ];

  static List<WrongsheetModel> wrongsheets = [
    WrongsheetModel(
      id: 1,
      name: "사회학 오답노트",
      category: "사회",
      isBookmarked: false,
      createdDate: DateTime.now(),
    ),
  ];

  static List<WorksheetDetail> worksheetDetails = [
    WorksheetDetail(
      worksheetId: 1,
      name: "사회학개론 정리",
      category: "사회",
      isCompleteAllBlanks: false,
      isAddWorksheet: true,
      isMakeTestSheet: false,
      answer1: ["Answer 1", "Answer 2"],
      answer2: ["Answer 3", "Answer 4"],
      content: "이것은 예시 텍스트입니다. A4 용지 한 장 분량의 텍스트로 채워집니다.\n"
               "사회학은 사회 현상과 인간 행동을 과학적으로 연구하는 학문입니다.\n"
               "사회 구조, 문화, 사회 변동, 사회적 관계 등을 분석합니다.\n"
               "이 과정에서 다양한 이론과 방법론을 사용하여 사회 현상을 이해하고 설명합니다.\n"
               "또한, 사회 문제를 해결하고 더 나은 사회를 만들기 위한 방안을 제시합니다.\n"
               "사회학은 미시적 관점과 거시적 관점에서 접근하며, 인간의 일상생활부터 사회 전체까지\n"
               "다양한 주제를 다룹니다.\n",
    ),
    WorksheetDetail(
      worksheetId: 2,
      name: "사회학개론 정리",
      category: "사회",
      isCompleteAllBlanks: false,
      isAddWorksheet: true,
      isMakeTestSheet: false,
      answer1: ["Answer 1", "Answer 2"],
      answer2: ["Answer 3", "Answer 4"],
      content: "이것은 예시 텍스트입니다. A4 용지 한 장 분량의 텍스트로 채워집니다.\n"
               "사회학은 사회 현상과 인간 행동을 과학적으로 연구하는 학문입니다.\n"
               "사회 구조, 문화, 사회 변동, 사회적 관계 등을 분석합니다.\n"
               "이 과정에서 다양한 이론과 방법론을 사용하여 사회 현상을 이해하고 설명합니다.\n"
               "또한, 사회 문제를 해결하고 더 나은 사회를 만들기 위한 방안을 제시합니다.\n"
               "사회학은 미시적 관점과 거시적 관점에서 접근하며, 인간의 일상생활부터 사회 전체까지\n"
               "다양한 주제를 다룹니다.\n",
    ),
    WorksheetDetail(
      worksheetId: 3,
      name: "사회학개론 정리",
      category: "사회",
      isCompleteAllBlanks: false,
      isAddWorksheet: true,
      isMakeTestSheet: false,
      answer1: ["Answer 1", "Answer 2"],
      answer2: ["Answer 3", "Answer 4"],
      content: "이것은 예시 텍스트입니다. A4 용지 한 장 분량의 텍스트로 채워집니다.\n"
               "사회학은 사회 현상과 인간 행동을 과학적으로 연구하는 학문입니다.\n"
               "사회 구조, 문화, 사회 변동, 사회적 관계 등을 분석합니다.\n"
               "이 과정에서 다양한 이론과 방법론을 사용하여 사회 현상을 이해하고 설명합니다.\n"
               "또한, 사회 문제를 해결하고 더 나은 사회를 만들기 위한 방안을 제시합니다.\n"
               "사회학은 미시적 관점과 거시적 관점에서 접근하며, 인간의 일상생활부터 사회 전체까지\n"
               "다양한 주제를 다룹니다.\n",
    ),
  ];

  static List<TestsheetDetailModel> testsheetDetails = [
    TestsheetDetailModel(
      testsheetId: 1,
      name: "사회학 시험",
      category: "사회",
      reExtracted: false,
      isCompleteAllBlanks: List<bool>.filled(20, false),
      questions1: List<QuestionModel>.generate(10, (index) => QuestionModel(
        questionId: index,
        question: "Question ${index + 1}",
        answer: "Answer ${index + 1}",
      )),
      questions2: List<QuestionModel>.generate(10, (index) => QuestionModel(
        questionId: index + 10,
        question: "Question ${index + 11}",
        answer: "Answer ${index + 11}",
      )),
      score: List<int>.filled(20, 0),
      isCorrect: List<bool>.filled(20, false),
    ),
  ];

  static List<WrongsheetDetail> wrongsheetDetails = [
    WrongsheetDetail(
      wrongsheetId: 1,
      name: "사회학 오답노트",
      category: "사회",
      questions: List<QuestionModel>.generate(5, (index) => QuestionModel(
        questionId: index,
        question: "Wrong Question ${index + 1}",
        answer: "Correct Answer ${index + 1}",
      )),
    ),
  ];
}
