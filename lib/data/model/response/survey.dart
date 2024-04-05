class SurveyModel {
  int? id;
  String? title;
  String? description;
  List<Question>? questions;

   SurveyModel(
      {this.id,
      this.title,

      this.description,
      this.questions});

  factory SurveyModel.fromJson(Map<String, dynamic> json) {
    return SurveyModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      questions: json.containsKey('questions')
          ? List<Question>.from(json['questions'])
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

class Question {
  int id;
  String question;
  String questionType;
  String description;
  List<String> answers;

  Question({
    required this.id,
    required this.question,
    required this.questionType,
    required this.description,
    required this.answers,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
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
