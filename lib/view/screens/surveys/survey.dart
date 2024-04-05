class Survey {
  int? id;
  String? title;
  String? description;
  List<QuestionModel>? questions;

  Survey(
      {this.id,
      this.title,

      this.description,
      this.questions});

  factory Survey.fromJson(Map<String, dynamic> json) {
    return Survey(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      questions: json.containsKey('questions')
          ? List<QuestionModel>.from(json['questions'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'questions': questions,
    };
  }
}

class QuestionModel {
  int id;
  String question;
  String questionType;
  String description;
  List<String> answers;

  QuestionModel({
    required this.id,
    required this.question,
    required this.questionType,
    required this.description,
    required this.answers,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      question: json['question'],
      questionType: json['questionType'],
      description: json['description'],
      answers: List<String>.from(json['answers']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'questionType': questionType,
      'description': description,
      'answers': answers,
    };
  }
}
