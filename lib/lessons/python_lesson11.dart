import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PythonLesson11 extends StatefulWidget {
  const PythonLesson11({super.key});

  @override
  State<PythonLesson11> createState() => _PythonLesson11State();
}

class _PythonLesson11State extends State<PythonLesson11> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  void loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted = prefs.getBool("Lesson 11 — CSV, Excel & SQL") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 11 — CSV, Excel & SQL", true);

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
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text, style: const TextStyle(fontSize: 15)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 11 — CSV, Excel & SQL"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // INTRO
            sectionTitle("Definition"),
            explanationText(
              "Data analysts work with files (CSV, Excel) and databases (SQL) "
              "to load, store, and analyze data.",
            ),

            // CSV
            sectionTitle("CSV Files"),
            infoBox("CSV = Comma-Separated Values (simple text file)."),
            codeBox(
              "import pandas as pd\n"
                  "df = pd.read_csv('data.csv')\n"
                  "print(df.head())",
              "Loads a CSV file and shows first 5 rows.",
            ),
            codeBox(
              "df.to_csv('output.csv', index=False)",
              "Saves cleaned data to a new CSV file.",
            ),

            // EXCEL
            sectionTitle("Excel Files"),
            infoBox("Excel files (.xlsx) are widely used in business."),
            codeBox(
              "df = pd.read_excel('data.xlsx')\n"
                  "print(df.head())",
              "Loads Excel data into a DataFrame.",
            ),
            codeBox(
              "df.to_excel('output.xlsx', index=False)",
              "Saves DataFrame to Excel file.",
            ),

            // MULTIPLE SHEETS
            sectionTitle("Excel Sheets"),
            infoBox("Excel files can have multiple sheets."),
            codeBox(
              "df = pd.read_excel('data.xlsx', sheet_name='Sheet1')",
              "Loads a specific sheet from Excel.",
            ),

            // SQL INTRO
            sectionTitle("SQL (Databases)"),
            infoBox("SQL is used to store and query large datasets."),
            codeBox(
              "import sqlite3\n"
                  "conn = sqlite3.connect('data.db')\n"
                  "df = pd.read_sql('SELECT * FROM patients', conn)",
              "Loads data from a database table into Pandas.",
            ),

            // SQL QUERY
            sectionTitle("SQL Query Example"),
            infoBox("Filter and analyze data using SQL."),
            codeBox(
              "query = 'SELECT * FROM patients WHERE age > 50'\n"
                  "df = pd.read_sql(query, conn)",
              "Returns patients older than 50.",
            ),

            // WRITE TO SQL
            sectionTitle("Saving to Database"),
            infoBox("Store processed data into SQL database."),
            codeBox(
              "df.to_sql('patients_cleaned', conn, if_exists='replace', index=False)",
              "Saves DataFrame into SQL table.",
            ),

            // SUMMARY
            sectionTitle("Summary"),
            infoBox(
              "CSV → Simple file format\n"
              "Excel → Business-friendly format\n"
              "SQL → Database storage & queries\n"
              "All used in real-world data analysis",
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
