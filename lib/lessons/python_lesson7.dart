import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PythonLesson7 extends StatefulWidget {
  const PythonLesson7({super.key});

  @override
  State<PythonLesson7> createState() => _PythonLesson7State();
}

class _PythonLesson7State extends State<PythonLesson7> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  void loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted = prefs.getBool("Lesson 7 — Pandas") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 7 — Pandas", true);

    setState(() {
      isCompleted = true;
    });
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget explanationText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(text, style: const TextStyle(fontSize: 16)),
    );
  }

  Widget codeBox(String code, String explanation) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            code,
            style: const TextStyle(
              color: Colors.greenAccent,
              fontFamily: 'monospace',
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          Text(explanation, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget infoBox(String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text, style: const TextStyle(fontSize: 15)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lesson 7 — Pandas"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // INTRO
            sectionTitle("Definition"),
            explanationText(
              "Pandas is a powerful Python library used for data analysis. "
              "It introduces DataFrames, which are like Excel tables.",
            ),

            // CREATE DATAFRAME
            sectionTitle("Creating a DataFrame"),
            infoBox("A DataFrame is like a table with rows and columns."),
            codeBox(
              "import pandas as pd\n\n"
                  "data = {\n"
                  "  'Name': ['John', 'Mary'],\n"
                  "  'Age': [28, 34]\n"
                  "}\n"
                  "df = pd.DataFrame(data)\n"
                  "print(df)",
              "Creates a table with Name and Age columns.",
            ),

            // SELECT COLUMN
            sectionTitle("Selecting a Column"),
            infoBox("You can select a column using its name."),
            codeBox(
              "print(df['Name'])",
              "Returns the Name column (John, Mary).",
            ),

            // FILTERING DATA
            sectionTitle("Filtering Data"),
            infoBox("Filter rows based on a condition."),
            codeBox(
              "print(df[df['Age'] > 30])",
              "Returns rows where Age is greater than 30 (Mary).",
            ),

            // ADD COLUMN
            sectionTitle("Adding a New Column"),
            infoBox("You can create new columns easily."),
            codeBox(
              "df['Salary'] = [5000, 6000]\n"
                  "print(df)",
              "Adds a new column called Salary.",
            ),

            // BASIC STATS
            sectionTitle("Basic Statistics"),
            infoBox("Pandas can summarize data quickly."),
            codeBox(
              "print(df['Age'].mean())\n"
                  "print(df['Age'].max())",
              "mean() gives average age\n"
                  "max() gives highest age",
            ),

            // READING CSV
            sectionTitle("Reading a CSV File"),
            infoBox("Load real-world datasets from files."),
            codeBox(
              "df = pd.read_csv('data.csv')\n"
                  "print(df.head())",
              "Reads a CSV file and shows first 5 rows.",
            ),

            // SUMMARY
            sectionTitle("Summary"),
            infoBox(
              "DataFrame = table of data\n"
              "Select columns using df['column']\n"
              "Filter data using conditions\n"
              "Supports statistics and file reading",
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: isCompleted
                    ? null
                    : () async {
                        await markCompleted();
                        Navigator.pop(context);
                      },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Text(isCompleted ? "Completed ✅" : "Mark as Completed"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
