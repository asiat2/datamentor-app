import 'package:flutter/material.dart';
import 'quiz_questions.dart';
import 'progress_service.dart'; // ✅ ADD THIS
import '../excel_quiz.dart';

class QuizPage extends StatefulWidget {
  final List<QuizQuestion> questions;
  final String lessonTitle;
  final String courseTitle;

  const QuizPage({
    super.key,
    required this.questions,
    required this.lessonTitle,
    required this.courseTitle,
  });
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  int currentIndex = 0;
  int score = 0;

  void answerQuestion(int selectedIndex) {
    final question = widget.questions[currentIndex];

    if (selectedIndex == question.correctIndex) {
      score++;
    }

    if (currentIndex < widget.questions.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      showResult();
    }
  }

void showResult() {
  final total = widget.questions.length;
  final percent = (score / total) * 100;
  final passed = percent >= 70;

 showDialog(
  context: context,
  builder: (dialogContext) => AlertDialog(
    title: Text(passed ? "🎉 Passed!" : "❌ Failed"),
    content: Text("Score: $score / ${widget.questions.length}"),
    actions: [

      if (passed)
        TextButton(
          onPressed: () async {
  await ProgressService.markLessonComplete(
    widget.courseTitle,
    widget.lessonTitle,
  );

  Navigator.of(context).pop(); // closes dialog
  Navigator.of(context).pop(); // returns to lessons
},
          child: const Text("Continue"),
        ),

      if (!passed)
        TextButton(
          onPressed: () {
            Navigator.pop(dialogContext);
            setState(() {
              currentIndex = 0;
              score = 0;
            });
          },
          child: const Text("Retry"),
        ),
    ],
  ),
);
  @override
  Widget build(BuildContext context) {

    final question = widget.questions[currentIndex];

    return Scaffold(
      appBar: AppBar(title: const Text("Quiz")),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Question ${currentIndex + 1}",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            Text(
              question.question,
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            ...List.generate(question.options.length, (index) {

              return Container(
                margin: const EdgeInsets.only(bottom: 10),

                child: ElevatedButton.icon(
  icon: const Icon(Icons.quiz),
  label: const Text("Take Quiz"),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QuizPage(
          questions: ExcelQuiz.lesson1,
          lessonTitle: "Lesson 1 — What is Excel",
          courseTitle: "Excel for Data Analysis",
        ),
      ),
    );
  },
),
        );
            },
        ),
          ],
    ),
    ),
    );
  }
}
}