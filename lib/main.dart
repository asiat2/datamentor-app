import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:datamentor/widgets/lesson_template.dart';

// import 'progress_service.dart';

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

// Widget getLessonPage(String course, String lesson) {
//   return LessonPage(course: course, lesson: lesson);
// }

Widget getLessonPage(String course, String lesson) {
  /// =========================
  /// 📊 EXCEL
  /// =========================
  if (course == "Excel for Data Analysis") {
    switch (lesson) {
      case "Lesson 1 — What is Excel":
        return ExcelLesson1();
      case "Lesson 2 — Excel Interface":
        return ExcelLesson2();

      case "Lesson 3 — Basic Excel Formulas":
        return ExcelLesson3();
      case "Lesson 4 — SUM, AVERAGE, COUNT":
        return ExcelLesson4();
      case "Lesson 5 — IF Function":
        return ExcelLesson5();
      case "Lesson 6 — VLOOKUP & XLOOKUP":
        return ExcelLesson6();
      case "Lesson 7 — Data Cleaning":
        return ExcelLesson7();
      case "Lesson 8 — Sorting & Filtering":
        return ExcelLesson8();
      case "Lesson 9 — Pivot Tables":
        return ExcelLesson9();
      case "Lesson 10 — Excel Charts":
        return ExcelLesson10();
      case "Lesson 11 — Excel Dashboards":
        return ExcelLesson11();
    }
  }

  /// =========================
  /// 🗄️ SQL
  /// =========================
  if (course == "SQL for Data Analysts") {
    switch (lesson) {
      case "Lesson 1 — What is SQL":
        return SqlLesson1();
      case "Lesson 2 — SQL Query Execution Order":
        return SqlLesson2();
      case "Lesson 3 — SELECT Statement":
        return SqlLesson3();
      case "Lesson 4 — WHERE Clause":
        return SqlLesson4();
      case "Lesson 5 — GROUP BY":
        return SqlLesson5();
      case "Lesson 6 — HAVING Clause":
        return SqlLesson6();
      case "Lesson 7 — ORDER BY":
        return SqlLesson7();
      case "Lesson 8 — SQL JOIN Types":
        return SqlLesson8();
      case "Lesson 9 — UNION vs UNION ALL":
        return SqlLesson9();
      case "Lesson 10 — Window Functions":
        return SqlLesson10();
      case "Lesson 11 — SQL Views":
        return SqlLesson11();
      case "Lesson 12 — Stored Procedures":
        return SqlLesson12();
      case "Lesson 13 — SQL Table Operations":
        return SqlLesson13();
      case "Lesson 14 — SQL Constraints":
        return SqlLesson14();
      case "Lesson 15 — SQL Index":
        return SqlLesson15();
    }
  }

  /// =========================
  /// 🐍 PYTHON
  /// =========================
  if (course == "Python for Data Analysis") {
    switch (lesson) {
      case "Lesson 1 — Introduction to Python":
        return PythonLesson1();
      case "Lesson 2 — Variables & Data Types":
        return PythonLesson2();
      case "Lesson 3 — Lists, Tuples, Dictionaries":
        return PythonLesson3();
      case "Lesson 4 — Control Flow":
        return PythonLesson4();
      case "Lesson 5 — Functions":
        return PythonLesson5();
      case "Lesson 6 — NumPy":
        return PythonLesson6();
      case "Lesson 7 — Pandas":
        return PythonLesson7();
      case "Lesson 8 — Data Cleaning":
        return PythonLesson8();
      case "Lesson 9 — Filtering & Aggregation":
        return PythonLesson9();
      case "Lesson 10 — Data Visualization":
        return PythonLesson10();
      case "Lesson 11 — CSV, Excel & SQL":
        return PythonLesson11();
      case "Lesson 12 — Data Analysis Project":
        return PythonLesson12();
    }
  }

  /// =========================
  /// 📊 POWER BI
  /// =========================
  if (course == "Power BI for Data Analysis") {
    switch (lesson) {
      case "Lesson 1 — Introduction to Power BI":
        return PowerBILesson1();
      case "Lesson 2 — Power BI Interface":
        return PowerBILesson2();
      case "Lesson 3 — Importing Data":
        return PowerBILesson3();
      case "Lesson 4 — Data Cleaning":
        return PowerBILesson4();
      case "Lesson 5 — Creating Visualizations":
        return PowerBILesson5();
      case "Lesson 6 — Building Dashboards":
        return PowerBILesson6();
      case "Lesson 7 — Data Modeling":
        return PowerBILesson7();
      case "Lesson 8 — DAX (Formulas)":
        return PowerBILesson8();
      case "Lesson 9 — Measures and Calculations":
        return PowerBILesson9();
      case "Lesson 10 — Publishing Reports":
        return PowerBILesson10();
    }
  }

  /// =========================
  /// 📈 TABLEAU
  /// =========================
  if (course == "Tableau for Data Visualization") {
    switch (lesson) {
      case "Lesson 1 — Introduction to Tableau":
        return TableauLesson1();
      case "Lesson 2 — Connecting Data":
        return TableauLesson2();
      case "Lesson 3 — Tableau Interface":
        return TableauLesson3();
      case "Lesson 4 — Creating Charts":
        return TableauLesson4();
      case "Lesson 5 — Calculated Fields":
        return TableauLesson5();
      case "Lesson 6 — Filters and Granularity":
        return TableauLesson6();
      case "Lesson 7 — Groups and Bins":
        return TableauLesson7();
      case "Lesson 8 — Parameters":
        return TableauLesson8();
      case "Lesson 9 — Level of Detail (LOD)":
        return TableauLesson9();
      case "Lesson 10 — Dashboards":
        return TableauLesson10();
      case "Lesson 11 — Storytelling with Data":
        return TableauLesson11();
      case "Lesson 12 — Best Practices":
        return TableauLesson12();
    }
  }

  /// =========================
  /// ✅ FALLBACK (TEXT LESSONS)
  /// =========================
  return LessonPage(course: course, lesson: lesson);
}

////////////////////////////////////////////////////////////
/// MAIN APP
Future<void> saveCompletedLesson(String lesson) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(lesson, true);
}

////////////////////////////////////////////////////////////
// ✅ MOVE lessonContent HERE
final Map<String, Map<String, Map<String, String>>> lessonContent = {
  /////////////////////////////////////////////////////////
  /// 📊 EXCEL
  /////////////////////////////////////////////////////////
  "Excel for Data Analysis": {
    "Lesson 1 — What is Excel": {
      "content":
          "Microsoft Excel is a spreadsheet tool used to store, organize, and analyze data using rows and columns.",
    },
    "Lesson 2 — Excel Interface": {
      "content":
          "The Excel interface includes ribbons, worksheets, rows, columns, and cells used to manage data.",
    },

    "Lesson 3 — Basic Excel Formulas": {
      "content":
          "Excel formulas perform calculations using numbers, cell references, and operators such as +, -, *, /.",
    },

    "Lesson 4 — SUM, AVERAGE, COUNT": {
      "content":
          "Excel includes built-in functions like SUM, AVERAGE, and COUNT to summarize data efficiently.",
    },

    "Lesson 5 — IF Function": {
      "content":
          "The IF function returns different values based on a condition.",
    },

    "Lesson 6 — VLOOKUP & XLOOKUP": {
      "content": "Lookup functions search for information in tables.",
    },

    "Lesson 7 — Data Cleaning": {
      "content":
          "Data cleaning removes duplicates, fixes formatting, and handles missing values.",
    },

    "Lesson 8 — Sorting & Filtering": {
      "content":
          "Sorting organizes data while filtering shows only relevant rows.",
      "image": "assets/images/excel_sort_filter.png",
    },

    "Lesson 9 — Pivot Tables": {
      "content": "Pivot tables summarize and analyze large datasets quickly.",
      "image": "assets/images/excel_pivot_table.png",
    },

    "Lesson 10 — Excel Charts": {
      "content": "Charts visualize data to identify trends and patterns.",
      "image": "assets/images/excel_chart.png",
    },

    "Lesson 11 — Excel Dashboards": {
      "content": "Dashboards display key metrics and insights in one place.",
      "image": "assets/images/excel_dashboard.png",
    },
  },

  /////////////////////////////////////////////////////////
  /// 🗄️ SQL
  /////////////////////////////////////////////////////////
  "SQL for Data Analysts": {
    "Lesson 1 — What is SQL": {
      "content":
          "SQL is used to communicate with databases and manage data such as retrieving, updating, and deleting records.",
    },

    "Lesson 2 — SQL Query Execution Order": {
      "content":
          "SQL executes in order: FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT.",
    },

    "Lesson 3 — SELECT Statement": {
      "content":
          "SELECT retrieves data from a database and allows filtering and column selection.",
    },

    "Lesson 4 — WHERE Clause": {
      "content": "WHERE filters rows in SQL queries based on conditions.",
    },

    "Lesson 5 — GROUP BY": {
      "content":
          "GROUP BY groups rows into summary results using aggregate functions like COUNT and SUM.",
    },

    "Lesson 6 — HAVING Clause": {
      "content": "HAVING filters grouped results after aggregation.",
    },

    "Lesson 7 — ORDER BY": {
      "content": "ORDER BY sorts results in ascending or descending order.",
    },

    "Lesson 8 — SQL JOIN Types": {
      "content":
          "JOIN combines data from multiple tables such as INNER JOIN, LEFT JOIN, RIGHT JOIN.",
    },

    "Lesson 9 — UNION vs UNION ALL": {
      "content": "UNION removes duplicates while UNION ALL keeps all rows.",
    },

    "Lesson 10 — Window Functions": {
      "content":
          "Window functions like ROW_NUMBER and RANK perform calculations across rows without grouping them.",
    },

    "Lesson 11 — SQL Views": {
      "content": "Views are virtual tables created from SQL queries.",
    },

    "Lesson 12 — Stored Procedures": {
      "content":
          "Stored procedures are reusable SQL programs that simplify complex operations.",
    },

    "Lesson 13 — SQL Table Operations": {
      "content":
          "Commands like CREATE, ALTER, DELETE, and TRUNCATE manage tables and records.",
    },

    "Lesson 14 — SQL Constraints": {
      "content":
          "Constraints ensure data accuracy such as PRIMARY KEY and FOREIGN KEY.",
    },

    "Lesson 15 — SQL Index": {
      "content":
          "Indexes improve database performance by speeding up data retrieval.",
    },
  },
  /////////////////////////////////////////////////////////
  /// 🐍 PYTHON
  /////////////////////////////////////////////////////////
  "Python for Data Analysis": {
    "Lesson 1 — Introduction to Python": {
      "content":
          "Python is a high-level programming language used for data analysis, machine learning, and automation.",
    },

    "Lesson 2 — Variables & Data Types": {
      "content":
          "Variables store values. Python supports int, float, string, and boolean data types.",
    },

    "Lesson 3 — Lists, Tuples, Dictionaries": {
      "content":
          "Python data structures include lists (changeable), tuples (fixed), and dictionaries (key-value pairs).",
    },

    "Lesson 4 — Control Flow": {
      "content":
          "Control flow includes IF statements, FOR loops, and WHILE loops to control program execution.",
    },

    "Lesson 5 — Functions": {
      "content":
          "Functions are reusable blocks of code that take inputs and return outputs.",
    },

    "Lesson 6 — NumPy": {
      "content":
          "NumPy provides fast arrays and supports mathematical and statistical operations.",
    },

    "Lesson 7 — Pandas": {
      "content":
          "Pandas allows working with DataFrames for data analysis and manipulation.",
    },

    "Lesson 8 — Data Cleaning": {
      "content":
          "Data cleaning involves handling missing values, duplicates, and formatting issues.",
    },

    "Lesson 9 — Filtering & Aggregation": {
      "content":
          "Filtering selects data while aggregation calculates summaries like mean and sum.",
    },

    "Lesson 10 — Data Visualization": {
      "content":
          "Visualization uses charts like line, bar, and histogram to understand data.",
    },

    "Lesson 11 — CSV, Excel & SQL": {
      "content":
          "Python connects with CSV files, Excel files, and SQL databases for analysis.",
    },

    "Lesson 12 — Data Analysis Project": {
      "content":
          "A full workflow: Load → Clean → Analyze → Visualize → Generate insights.",
    },
  },

  /////////////////////////////////////////////////////////
  /// 📊 POWER BI
  /////////////////////////////////////////////////////////
  "Power BI for Data Analysis": {
    "Lesson 1 — Introduction to Power BI": {
      "content":
          "Power BI is a business intelligence tool used to connect, analyze, and visualize data through interactive dashboards.",
    },

    "Lesson 2 — Power BI Interface": {
      "content":
          "The interface includes Ribbon, Canvas, Fields, Visualizations, and Filters panes used to build reports.",
    },

    "Lesson 3 — Importing Data": {
      "content":
          "Power BI connects to Excel, CSV, SQL, and cloud sources to load data for analysis.",
    },

    "Lesson 4 — Data Cleaning": {
      "content":
          "Power Query is used to clean, transform, and prepare data before building reports.",
    },

    "Lesson 5 — Creating Visualizations": {
      "content":
          "Charts like bar, line, pie, and tables are used to present data insights visually.",
    },

    "Lesson 6 — Building Dashboards": {
      "content":
          "Dashboards combine KPIs, charts, and filters to provide a summary of key insights.",
    },

    "Lesson 7 — Data Modeling": {
      "content":
          "Data models define relationships between tables for accurate analysis.",
    },

    "Lesson 8 — DAX (Formulas)": {
      "content":
          "DAX is used to create calculations such as SUM, AVERAGE, and conditional logic.",
    },

    "Lesson 9 — Measures and Calculations": {
      "content":
          "Measures are dynamic calculations that update based on filters and visuals.",
    },

    "Lesson 10 — Publishing Reports": {
      "content":
          "Reports are published to Power BI Service and shared with teams for collaboration.",
    },
  },

  /////////////////////////////////////////////////////////
  /// 📈 TABLEAU
  /////////////////////////////////////////////////////////
  "Tableau for Data Visualization": {
    "Lesson 1 — Introduction to Tableau": {
      "content":
          "Tableau is a data visualization tool used to analyze data and create interactive dashboards.",
    },

    "Lesson 2 — Connecting Data": {
      "content":
          "Tableau connects to data sources such as Excel, CSV, SQL, and cloud platforms using live or extract connections.",
    },

    "Lesson 3 — Tableau Interface": {
      "content":
          "The interface includes Data Pane, Rows, Columns, Marks Card, Filters, and Canvas for building charts.",
    },

    "Lesson 4 — Creating Charts": {
      "content":
          "Charts such as bar, line, pie, map, and scatter are created by dragging fields into rows and columns.",
    },

    "Lesson 5 — Calculated Fields": {
      "content":
          "Calculated fields allow creation of new metrics using formulas like SUM, AVG, and IF conditions.",
    },

    "Lesson 6 — Filters and Granularity": {
      "content":
          "Filters control what data is shown, while granularity defines the level of detail in analysis.",
    },

    "Lesson 7 — Groups and Bins": {
      "content":
          "Groups combine categories, while bins divide numeric data into ranges for analysis.",
    },

    "Lesson 8 — Parameters": {
      "content":
          "Parameters allow users to interact with dashboards by changing values dynamically.",
    },

    "Lesson 9 — Level of Detail (LOD)": {
      "content":
          "LOD expressions control how calculations are performed regardless of the visualization level.",
    },

    "Lesson 10 — Dashboards": {
      "content":
          "Dashboards combine multiple charts into a single interactive view for decision-making.",
    },

    "Lesson 11 — Storytelling with Data": {
      "content":
          "Storytelling uses data, visuals, and explanations to communicate insights and guide decisions.",
    },

    "Lesson 12 — Best Practices": {
      "content":
          "Best practices ensure dashboards are simple, clear, consistent, and focused on insights.",
    },
  },
};

void main() {
  runApp(const DataMentorApp());
}

class DataMentorApp extends StatelessWidget {
  const DataMentorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DataMentor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      // home: HomePage(),
      home: HomePage(),
    );
  }
}

///HOMEPAGE/////
class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map<String, dynamic>> courses = [
    {"title": "Excel for Data Analysis", "icon": Icons.table_chart},
    {"title": "SQL for Data Analysts", "icon": Icons.storage},
    {"title": "Python for Data Analysis", "icon": Icons.code},
    {"title": "Power BI for Data Analysis", "icon": Icons.bar_chart},
    {"title": "Tableau for Data Visualization", "icon": Icons.pie_chart},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      body: Column(
        children: [
          ////////////////////////////////////////////////////////////
          /// 🔵 HEADER WITH LOGO
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/datamentor_logo.png',
                      height: 40,
                      width: 40,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.school,
                          color: Colors.white,
                          size: 40,
                        );
                      },
                    ),
                    // Image.asset(
                    //   'assets/images/datamentor_logo.png',
                    //   height: 40,
                    //   width: 40,
                    //   fit: BoxFit.contain,
                    // ),
                    // Icon(Icons.school, color: Colors.white, size: 40),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        "DataMentor",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  "Start your Data Analytics & BI journey today",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600, // 👈 makes it bold but clean
                  ),
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
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (_) => CoursePage(title: course["title"]),
                  //     ),
                  //   );
                  // },
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
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(course["icon"], color: Colors.blue),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            course["title"],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
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
}

class _CoursePageState extends State<CoursePage> {
  SharedPreferences? prefs;
  @override
  void initState() {
    super.initState();
    loadPrefs();
  }

  void loadPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {});
  }

  Future<int> getCompletedCount(List<String> lessons) async {
    final prefs = await SharedPreferences.getInstance();

    int count = 0;
    for (var lesson in lessons) {
      if (prefs.getBool(lesson) ?? false) {
        count++;
      }
    }
    return count;
  }

  // ✅ MOVE IT HERE
  List<String> get lessons {
    final list = lessonContent[widget.title]!.keys.toList();

    list.sort((a, b) {
      final aNum = int.parse(a.split(" ")[1]);
      final bNum = int.parse(b.split(" ")[1]);
      return aNum.compareTo(bNum);
    });

    return list;
  }
  //   List<String> get lessons {
  //   return lessonContent[widget.title]!.keys.toList();
  // }
  // final Map<String, List<String>> courseLessons = {
  //   "Excel for Data Analysis": [
  //     "Lesson 1 — What is Excel",
  //     "Lesson 2 — Excel Interface",
  //     "Lesson 3 — Basic Formulas",
  //   ],
  //   "SQL for Data Analysts": [
  //     "Lesson 1 — What is SQL",
  //     "Lesson 2 — SELECT Statement",
  //     "Lesson 3 — WHERE Clause",
  //   ],
  //   "Python for Data Analysis": [
  //     "Lesson 1 — Introduction to Python",
  //     "Lesson 2 — Variables & Data Types",
  //     "Lesson 3 — Lists & Dictionaries",
  //   ],
  //   "Power BI Dashboards": [
  //     "Lesson 1 — What is Power BI",
  //     "Lesson 2 — Power BI Interface",
  //     "Lesson 3 — Creating Visuals",
  //   ],
  //   "Tableau Visualization": [
  //     "Lesson 1 — What is Tableau",
  //     "Lesson 2 — Tableau Interface",
  //     "Lesson 3 — Building Dashboards",
  //   ],
  // };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),

      body: Column(
        children: [
          // 🔥 PROGRESS BAR
          FutureBuilder(
            future: getCompletedCount(
              lessonContent[widget.title]!.keys.toList(),
            ),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return SizedBox();

              int completed = snapshot.data!;
              int total = lessonContent[widget.title]!.length;

              double progress = completed / total;

              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$completed / $total lessons completed",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    LinearProgressIndicator(value: progress),
                  ],
                ),
              );
            },
          ),
          // ✅ 2. LESSON LIST (THIS IS MISSING/BROKEN)
          Expanded(
            child: ListView.builder(
              itemCount: lessons.length,
              itemBuilder: (context, index) {
                final lesson = lessons[index];
                if (prefs == null) {
                  return Center(child: CircularProgressIndicator());
                }

                final prefsData = prefs!;

                bool isUnlocked = true;
                bool isCompleted = prefsData.getBool(lesson) ?? false;

                if (index == 0) {
                  isUnlocked = true;
                } else {
                  final prevLesson = lessons[index - 1];
                  isUnlocked = prefsData.getBool(prevLesson) ?? false;
                }
                // return FutureBuilder(
                //   future: SharedPreferences.getInstance(),
                //   builder: (context, snapshot) {
                //     if (!snapshot.hasData) return SizedBox();

                //  final prefs = snapshot.data!;
                // bool isUnlocked = true;
                // bool isCompleted = prefs.getBool(lesson) ?? false;

                // if (index > 0) {
                //   final prevLesson =
                //       courseLessons[widget.title]![index - 1];
                //   isUnlocked = prefs.getBool(prevLesson) ?? false;
                // }

                return GestureDetector(
                  onTap: isUnlocked
                      ? () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  getLessonPage(widget.title, lesson),
                            ),
                          );

                          setState(() {});
                        }
                      : null,

                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
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
                        Icon(
                          isUnlocked ? Icons.lock_open : Icons.lock,
                          color: isUnlocked ? Colors.green : Colors.red,
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            lesson,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        // ✅ CHECK ICON
                        Row(
                          children: [
                            if (isCompleted)
                              Icon(Icons.check_circle, color: Colors.green),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward_ios, size: 16),
                          ],
                        ),
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

class LessonPage extends StatefulWidget {
  final String course;
  final String lesson;

  const LessonPage({super.key, required this.course, required this.lesson});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    loadProgress();
  }

  void loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted = prefs.getBool(widget.lesson) ?? false;
    });
  }

  void markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(widget.lesson, true);

    setState(() {
      isCompleted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final lessonData = lessonContent[widget.course]?[widget.lesson];

    final content = lessonData != null && lessonData["content"] != null
        ? lessonData["content"]
        : "Content coming soon...";
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.lesson.split("—")[0], // 👈 ONLY "Lesson 1"
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: LessonTemplate(
              title: widget.lesson,
              content: content ?? "Content coming soon...",
              image: lessonData?["image"],
            ),
          ),

          // ✅ COMPLETE BUTTON
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: isCompleted
                  ? null
                  : () async {
                      markCompleted();

                      // go back after marking complete
                      Navigator.pop(context);
                    },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(isCompleted ? "Completed ✅" : "Mark as Completed"),
            ),
          ),
        ],
      ),
    );
  }
}
