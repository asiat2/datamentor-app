import 'package:flutter/material.dart';
// import 'progress_service.dart';

// // EXCEL
// import 'lessons/excel_lesson1.dart';
// import 'lessons/excel_lesson2.dart';
// import 'lessons/excel_lesson3.dart';
// import 'lessons/excel_lesson4.dart';
// import 'lessons/excel_lesson5.dart';
// import 'lessons/excel_lesson6.dart';
// import 'lessons/excel_lesson7.dart';
// import 'lessons/excel_lesson8.dart';
// import 'lessons/excel_lesson9.dart';
// import 'lessons/excel_lesson10.dart';
// import 'lessons/excel_lesson11.dart';

// // SQL
// import 'lessons/sql_lesson1.dart';
// import 'lessons/sql_lesson2.dart';
// import 'lessons/sql_lesson3.dart';
// import 'lessons/sql_lesson4.dart';
// import 'lessons/sql_lesson5.dart';
// import 'lessons/sql_lesson6.dart';
// import 'lessons/sql_lesson7.dart';
// import 'lessons/sql_lesson8.dart';
// import 'lessons/sql_lesson9.dart';
// import 'lessons/sql_lesson10.dart';
// import 'lessons/sql_lesson11.dart';
// import 'lessons/sql_lesson12.dart';
// import 'lessons/sql_lesson13.dart';
// import 'lessons/sql_lesson14.dart';
// import 'lessons/sql_lesson15.dart';

// // PYTHON
// import 'lessons/python_lesson1.dart';
// import 'lessons/python_lesson2.dart';
// import 'lessons/python_lesson3.dart';
// import 'lessons/python_lesson4.dart';
// import 'lessons/python_lesson5.dart';
// import 'lessons/python_lesson6.dart';
// import 'lessons/python_lesson7.dart';
// import 'lessons/python_lesson8.dart';
// import 'lessons/python_lesson9.dart';
// import 'lessons/python_lesson10.dart';
// import 'lessons/python_lesson11.dart';
// import 'lessons/python_lesson12.dart';

// // POWER BI
// import 'lessons/powerbi_lesson1.dart';
// import 'lessons/powerbi_lesson2.dart';
// import 'lessons/powerbi_lesson3.dart';
// import 'lessons/powerbi_lesson4.dart';
// import 'lessons/powerbi_lesson5.dart';
// import 'lessons/powerbi_lesson6.dart';
// import 'lessons/powerbi_lesson7.dart';
// import 'lessons/powerbi_lesson8.dart';
// import 'lessons/powerbi_lesson9.dart';
// import 'lessons/powerbi_lesson10.dart';

// // TABLEAU
// import 'lessons/tableau_lesson1.dart';
// import 'lessons/tableau_lesson2.dart';
// import 'lessons/tableau_lesson3.dart';
// import 'lessons/tableau_lesson4.dart';
// import 'lessons/tableau_lesson5.dart';
// import 'lessons/tableau_lesson6.dart';
// import 'lessons/tableau_lesson7.dart';
// import 'lessons/tableau_lesson8.dart';
// import 'lessons/tableau_lesson9.dart';
// import 'lessons/tableau_lesson10.dart';
// import 'lessons/tableau_lesson11.dart';
// import 'lessons/tableau_lesson12.dart';

////////////////////////////////////////////////////////////
/// MAIN APP
////////////////////////////////////////////////////////////

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
                        builder: (_) => Scaffold(
                          appBar: AppBar(title: Text("Test Page")),
                          body: Center(child: Text("It works")),
                        ),
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
class CoursePage extends StatelessWidget {
  final String title;

  const CoursePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text("Welcome to $title", style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}
