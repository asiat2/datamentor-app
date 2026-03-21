import 'package:flutter/material.dart';
import 'progress_service.dart';

// EXCEL
import 'lessons/excel_lesson1.dart';
import 'lessons/excel_lesson2.dart';
import 'lessons/excel_lesson3.dart';
import 'lessons/excel_lesson4.dart';
import 'lessons/excel_lesson5.dart';
import 'lessons/excel_lesson6.dart';
import 'lessons/excel_lesson7.dart';
import 'lessons/excel_lesson8.dart';
import 'lessons/excel_lesson9.dart';
import 'lessons/excel_lesson10.dart';
import 'lessons/excel_lesson11.dart';

// SQL
import 'lessons/sql_lesson1.dart';
import 'lessons/sql_lesson2.dart';
import 'lessons/sql_lesson3.dart';
import 'lessons/sql_lesson4.dart';
import 'lessons/sql_lesson5.dart';
import 'lessons/sql_lesson6.dart';
import 'lessons/sql_lesson7.dart';
import 'lessons/sql_lesson8.dart';
import 'lessons/sql_lesson9.dart';
import 'lessons/sql_lesson10.dart';
import 'lessons/sql_lesson11.dart';
import 'lessons/sql_lesson12.dart';
import 'lessons/sql_lesson13.dart';
import 'lessons/sql_lesson14.dart';
import 'lessons/sql_lesson15.dart';

// PYTHON
import 'lessons/python_lesson1.dart';
import 'lessons/python_lesson2.dart';
import 'lessons/python_lesson3.dart';
import 'lessons/python_lesson4.dart';
import 'lessons/python_lesson5.dart';
import 'lessons/python_lesson6.dart';
import 'lessons/python_lesson7.dart';
import 'lessons/python_lesson8.dart';
import 'lessons/python_lesson9.dart';
import 'lessons/python_lesson10.dart';
import 'lessons/python_lesson11.dart';
import 'lessons/python_lesson12.dart';

// POWER BI
import 'lessons/powerbi_lesson1.dart';
import 'lessons/powerbi_lesson2.dart';
import 'lessons/powerbi_lesson3.dart';
import 'lessons/powerbi_lesson4.dart';
import 'lessons/powerbi_lesson5.dart';
import 'lessons/powerbi_lesson6.dart';
import 'lessons/powerbi_lesson7.dart';
import 'lessons/powerbi_lesson8.dart';
import 'lessons/powerbi_lesson9.dart';
import 'lessons/powerbi_lesson10.dart';

// TABLEAU
import 'lessons/tableau_lesson1.dart';
import 'lessons/tableau_lesson2.dart';
import 'lessons/tableau_lesson3.dart';
import 'lessons/tableau_lesson4.dart';
import 'lessons/tableau_lesson5.dart';
import 'lessons/tableau_lesson6.dart';
import 'lessons/tableau_lesson7.dart';
import 'lessons/tableau_lesson8.dart';
import 'lessons/tableau_lesson9.dart';
import 'lessons/tableau_lesson10.dart';
import 'lessons/tableau_lesson11.dart';
import 'lessons/tableau_lesson12.dart';

void main() {
  runApp(const DataMentorApp());
}

////////////////////////////////////////////////////////////
/// MAIN APP
////////////////////////////////////////////////////////////
///
class DataMentorApp extends StatelessWidget {
  const DataMentorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DataMentor',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),

      home: const HomePage(),
    );
  }
}

////////////////////////////////////////////////////////////
/// HOME PAGE
////////////////////////////////////////////////////////////
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> courses = const [
    {"title": "Excel for Data Analysis", "icon": Icons.table_chart},
    {"title": "SQL for Data Analysts", "icon": Icons.storage},
    {"title": "Python for Data Analysis", "icon": Icons.code},
    {"title": "Power BI Dashboards", "icon": Icons.bar_chart},
    {"title": "Tableau Visualization", "icon": Icons.pie_chart},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      body: Column(
        children: [
          ////////////////////////////////////////////////////////////
          /// 🔵 HEADER (BLUE DESIGN)
          ////////////////////////////////////////////////////////////
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome to DataMentor👋",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Start learning Data Analytics & Business Intelligence today",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          ////////////////////////////////////////////////////////////
          /// 📚 COURSE LIST
          ////////////////////////////////////////////////////////////
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: courses.length,

              itemBuilder: (context, index) {
                final course = courses[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CoursePage(title: course["title"]),
                      ),
                    );
                  },

                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),

                    child: Row(
                      children: [
                        //////////////////////////////////////////////////////
                        /// ICON
                        //////////////////////////////////////////////////////
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(course["icon"], color: Colors.blue),
                        ),

                        const SizedBox(width: 16),

                        //////////////////////////////////////////////////////
                        /// TITLE
                        //////////////////////////////////////////////////////
                        Expanded(
                          child: Text(
                            course["title"],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        //////////////////////////////////////////////////////
                        /// ARROW
                        //////////////////////////////////////////////////////
                        const Icon(Icons.arrow_forward_ios, size: 16),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// COURSE PAGE (WITH PROGRESS TRACKING)
////////////////////////////////////////////////////////////
///
class CoursePage extends StatefulWidget {
  final String title;

  const CoursePage({super.key, required this.title});

  @override
  State<CoursePage> createState() => _CoursePageState();

  static const Map<String, List<String>> courseLessons = {
    "Excel for Data Analysis": [
      "Lesson 1 — What is Excel",
      "Lesson 2 — Excel Interface Overview",
      "Lesson 3 — Basic Excel Formulas",
      "Lesson 4 — SUM, AVERAGE, COUNT Functions",
      "Lesson 5 — IF Function",
      "Lesson 6 — VLOOKUP and XLOOKUP",
      "Lesson 7 — Data Cleaning in Excel",
      "Lesson 8 — Sorting and Filtering Data",
      "Lesson 9 — Pivot Tables",
      "Lesson 10 — Data Visualization in Excel",
      "Lesson 11 — Excel Dashboards",
    ],

    "SQL for Data Analysts": [
      "Lesson 1 — What is SQL",
      "Lesson 2 — SQL Query Execution Order",
      "Lesson 3 — SELECT Statement",
      "Lesson 4 — WHERE Clause",
      "Lesson 5 — GROUP BY",
      "Lesson 6 — HAVING Clause",
      "Lesson 7 — ORDER BY & LIMIT",
      "Lesson 8 — JOIN",
      "Lesson 9 — UNION vs UNION ALL",
      "Lesson 10 — Window Functions",
      "Lesson 11 — Views",
      "Lesson 12 — Stored Procedures",
      "Lesson 13 — SQL Table Operations",
      "Lesson 14 — SQL Constraints",
      "Lesson 15 — SQL Index",
    ],

    "Python for Data Analysis": [
      "Lesson 1 — Introduction to Python",
      "Lesson 2 — Python Variables & Data Types",
      "Lesson 3 — Lists, Tuples, Dictionaries",
      "Lesson 4 — Control Flow (if, loops)",
      "Lesson 5 — Python Functions",
      "Lesson 6 — Working with NumPy",
      "Lesson 7 — Introduction to Pandas",
      "Lesson 8 — Data Cleaning with Pandas",
      "Lesson 9 — Filtering & Aggregation",
      "Lesson 10 — Data Visualization",
      "Lesson 11 — Working with CSV,Excel & SQL Files",
      "Lesson 12 — Data Analysis Project",
    ],

    "Power BI Dashboards": [
      "Lesson 1 — Introduction to Power BI",
      "Lesson 2 — Power BI Interface",
      "Lesson 3 — Importing Data",
      "Lesson 4 — Data Cleaning in Power BI",
      "Lesson 5 — Creating Visualizations",
      "Lesson 6 — Building Dashboards",
      "Lesson 7 — Power BI Data Model",
      "Lesson 8 — Introduction to DAX",
      "Lesson 9 — Measures and Calculations",
      "Lesson 10 — Publishing Reports",
    ],

    "Tableau Visualization": [
      "Lesson 1 — Introduction to Tableau",
      "Lesson 2 — Connecting Data (Direct vs Extract)",
      "Lesson 3 — Tableau Interface",
      "Lesson 4 — Creating Charts",
      "Lesson 5 — Calculated Fields",
      "Lesson 6 — Filters and Granularity",
      "Lesson 7 — Groups and Bins",
      "Lesson 8 — Parameters",
      "Lesson 9 — Level of Detail (LOD Expressions)",
      "Lesson 10 — Tableau Dashboards",
      "Lesson 11 — Storytelling with Data",
      "Lesson 12 — Tableau Best Practices",
    ],
  };
  static final Map<String, Map<String, WidgetBuilder>> lessonRoutes = {
    "Excel for Data Analysis": {
      "Lesson 1 — What is Excel": (_) => const ExcelLesson1(),
      "Lesson 2 — Excel Interface Overview": (_) => const ExcelLesson2(),
      "Lesson 3 — Basic Excel Formulas": (_) => const ExcelLesson3(),
      "Lesson 4 — SUM, AVERAGE, COUNT Functions": (_) => const ExcelLesson4(),
      "Lesson 5 — IF Function": (_) => const ExcelLesson5(),
      "Lesson 6 — VLOOKUP and XLOOKUP": (_) => const ExcelLesson6(),
      "Lesson 7 — Data Cleaning in Excel": (_) => const ExcelLesson7(),
      "Lesson 8 — Sorting and Filtering Data": (_) => const ExcelLesson8(),
      "Lesson 9 — Pivot Tables": (_) => const ExcelLesson9(),
      "Lesson 10 — Data Visualization in Excel": (_) => const ExcelLesson10(),
      "Lesson 11 — Excel Dashboards": (_) => const ExcelLesson11(),
    },

    "SQL for Data Analysts": {
      "Lesson 1 — What is SQL": (_) => const SqlLesson1(),
      "Lesson 2 — SQL Query Execution Order": (_) => const SqlLesson2(),
      "Lesson 3 — SELECT Statement": (_) => const SqlLesson3(),
      "Lesson 4 — WHERE Clause": (_) => const SqlLesson4(),
      "Lesson 5 — GROUP BY": (_) => const SqlLesson5(),
      "Lesson 6 — HAVING Clause": (_) => const SqlLesson6(),
      "Lesson 7 — ORDER BY & LIMIT": (_) => const SqlLesson7(),
      "Lesson 8 — JOIN": (_) => const SqlLesson8(),
      "Lesson 9 — UNION vs UNION ALL": (_) => const SqlLesson9(),
      "Lesson 10 — Window Functions": (_) => const SqlLesson10(),
      "Lesson 11 — Views": (_) => const SqlLesson11(),
      "Lesson 12 — Stored Procedures": (_) => const SqlLesson12(),
      "Lesson 13 — SQL Table Operations": (_) => const SqlLesson13(),
      "Lesson 14 — SQL Constraints": (_) => const SqlLesson14(),
      "Lesson 15 — SQL Index": (_) => const SqlLesson15(),
    },

    "Python for Data Analysis": {
      "Lesson 1 — Introduction to Python": (_) => const PythonLesson1(),
      "Lesson 2 — Python Variables & Data Types": (_) => const PythonLesson2(),
      "Lesson 3 — Lists, Tuples, Dictionaries": (_) => const PythonLesson3(),
      "Lesson 4 — Control Flow (if, loops)": (_) => const PythonLesson4(),
      "Lesson 5 — Python Functions": (_) => const PythonLesson5(),
      "Lesson 6 — Working with NumPy": (_) => const PythonLesson6(),
      "Lesson 7 — Introduction to Pandas": (_) => const PythonLesson7(),
      "Lesson 8 — Data Cleaning with Pandas": (_) => const PythonLesson8(),
      "Lesson 9 — Filtering & Aggregation": (_) => const PythonLesson9(),
      "Lesson 10 — Data Visualization": (_) => const PythonLesson10(),
      "Lesson 11 — Working with CSV & Excel Files": (_) =>
          const PythonLesson11(),
      "Lesson 12 — Data Analysis Project": (_) => const PythonLesson12(),
    },

    "Power BI Dashboards": {
      "Lesson 1 — Introduction to Power BI": (_) => const PowerBILesson1(),
      "Lesson 2 — Power BI Interface": (_) => const PowerBILesson2(),
      "Lesson 3 — Importing Data": (_) => const PowerBILesson3(),
      "Lesson 4 — Data Cleaning in Power BI": (_) => const PowerBILesson4(),
      "Lesson 5 — Creating Visualizations": (_) => const PowerBILesson5(),
      "Lesson 6 — Building Dashboards": (_) => const PowerBILesson6(),
      "Lesson 7 — Power BI Data Model": (_) => const PowerBILesson7(),
      "Lesson 8 — Introduction to DAX": (_) => const PowerBILesson8(),
      "Lesson 9 — Measures and Calculations": (_) => const PowerBILesson9(),
      "Lesson 10 — Publishing Reports": (_) => const PowerBILesson10(),
    },

    "Tableau Visualization": {
      "Lesson 1 — Introduction to Tableau": (_) => const TableauLesson1(),
      "Lesson 2 — Connecting Data (Direct vs Extract)": (_) =>
          const TableauLesson2(),
      "Lesson 3 — Tableau Interface": (_) => const TableauLesson3(),
      "Lesson 4 — Creating Charts": (_) => const TableauLesson4(),
      "Lesson 5 — Calculated Fields": (_) => const TableauLesson5(),
      "Lesson 6 — Filters and Granularity": (_) => const TableauLesson6(),
      "Lesson 7 — Groups and Bins": (_) => const TableauLesson7(),
      "Lesson 8 — Parameters": (_) => const TableauLesson8(),
      "Lesson 9 — Level of Detail (LOD Expressions)": (_) =>
          const TableauLesson9(),
      "Lesson 10 — Tableau Dashboards": (_) => const TableauLesson10(),
      "Lesson 11 — Storytelling with Data": (_) => const TableauLesson11(),
      "Lesson 12 — Tableau Best Practices": (_) => const TableauLesson12(),
    },
  };
}

class _CoursePageState extends State<CoursePage> {
  Future<bool> isLessonUnlocked(int index, List<String> lessons) async {
    if (index == 0) return true;

    final prev = lessons[index - 1];

    return await ProgressService.isLessonComplete(widget.title, prev);
  }

  @override
  Widget build(BuildContext context) {
    final lessons = CoursePage.courseLessons[widget.title] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),

      body: ListView.builder(
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          final lesson = lessons[index];

          return FutureBuilder<bool>(
            future: isLessonUnlocked(index, lessons),
            builder: (context, snapshot) {
              final unlocked = snapshot.data ?? false;
              final lesson = lessons[index];

              return FutureBuilder<bool>(
                future: ProgressService.isLessonComplete(widget.title, lesson),
                builder: (context, snap) {
                  final completed = snap.data ?? false;

                  ////////////////////////////////////////////////////////////
                  /// 🎨 COLOR LOGIC
                  ////////////////////////////////////////////////////////////

                  Color bgColor;
                  IconData icon;
                  Color iconColor;

                  if (completed) {
                    bgColor = Colors.green.shade50;
                    icon = Icons.check_circle;
                    iconColor = Colors.green;
                  } else if (unlocked) {
                    bgColor = Colors.blue.shade50;
                    icon = Icons.play_circle_fill;
                    iconColor = Colors.blue;
                  } else {
                    bgColor = Colors.grey.shade200;
                    icon = Icons.lock;
                    iconColor = Colors.grey;
                  }

                  ////////////////////////////////////////////////////////////
                  /// 💎 BEAUTIFUL CARD UI
                  ////////////////////////////////////////////////////////////

                  return GestureDetector(
                    onTap: unlocked
                        ? () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: CoursePage
                                    .lessonRoutes[widget.title]![lesson]!,
                              ),
                            );

                            await ProgressService.markLessonComplete(
                              widget.title,
                              lesson,
                            );

                            setState(() {});
                          }
                        : () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Complete previous lesson first 🔒",
                                ),
                              ),
                            );
                          },

                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      padding: const EdgeInsets.all(16),

                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),

                      child: Row(
                        children: [
                          //////////////////////////////////////////////////////
                          /// ICON
                          //////////////////////////////////////////////////////
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(icon, color: iconColor),
                          ),

                          const SizedBox(width: 16),

                          //////////////////////////////////////////////////////
                          /// TEXT
                          //////////////////////////////////////////////////////
                          Expanded(
                            child: Text(
                              lesson,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          //////////////////////////////////////////////////////
                          /// ARROW
                          //////////////////////////////////////////////////////
                          if (unlocked)
                            const Icon(Icons.arrow_forward_ios, size: 16),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
