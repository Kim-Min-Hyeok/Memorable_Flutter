class QuestionModel {
  final int questionId;
  final String question;
  final String answer;
  String userAnswer;

  QuestionModel({
    required this.questionId,
    required this.question,
    required this.answer,
    this.userAnswer = '',
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      questionId: json['questionId'],
      question: json['question'],
      answer: json['answer'],
      userAnswer: json['userAnswer'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'questionId': questionId,
      'question': question,
      'answer': answer,
      'userAnswer': userAnswer,
    };
  }
}