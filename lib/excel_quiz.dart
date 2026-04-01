import 'quiz_questions.dart';

class ExcelQuiz {

  static List<QuizQuestion> lesson1 = [

    QuizQuestion(
      question: "What is Excel mainly used for?",
      options: ["Gaming", "Data analysis", "Video editing", "Emailing"],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: "Excel organizes data using?",
      options: ["Slides", "Tables only", "Rows and columns", "Images"],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: "What is a cell?",
      options: [
        "A file",
        "A row",
        "A column",
        "Intersection of row and column"
      ],
      correctIndex: 3,
    ),

    QuizQuestion(
      question: "Which is a valid Excel cell reference?",
      options: ["1A", "A1", "AA", "11"],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: "What does =10+5 return?",
      options: ["10", "5", "15", "Error"],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: "What does SUM function do?",
      options: [
        "Subtracts values",
        "Adds values",
        "Counts values",
        "Deletes values"
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: "Which formula adds values in a range?",
      options: [
        "=ADD(A1:A5)",
        "=SUM(A1:A5)",
        "=TOTAL(A1:A5)",
        "=PLUS(A1:A5)"
      ],
      correctIndex: 1,
    ),

    QuizQuestion(
      question: "What does AVERAGE do?",
      options: [
        "Adds values",
        "Counts values",
        "Finds mean value",
        "Sorts values"
      ],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: "Which symbol starts a formula?",
      options: ["#", "@", "=", "\$"],
      correctIndex: 2,
    ),

    QuizQuestion(
      question: "Excel is part of which company?",
      options: ["Google", "Apple", "Microsoft", "Amazon"],
      correctIndex: 2,
    ),
  ];
}