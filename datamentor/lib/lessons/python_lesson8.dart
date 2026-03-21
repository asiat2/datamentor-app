import 'package:flutter/material.dart';

class PythonLesson8 extends StatelessWidget {
  const PythonLesson8({super.key});

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget explanationText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
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
          Text(
            explanation,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget infoBox(String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 8 — Data Cleaning"),
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
              "Data cleaning is the process of fixing or removing incorrect, "
              "missing, or duplicate data to improve data quality.",
            ),

            // MISSING VALUES
            sectionTitle("Handling Missing Values"),
            infoBox("Missing data can affect analysis and predictions."),
            codeBox(
              "df.dropna()",
              "Removes all rows that contain missing values.",
            ),
            codeBox(
              "df.fillna(0)",
              "Replaces missing values with 0.",
            ),

            // DUPLICATES
            sectionTitle("Removing Duplicates"),
            infoBox("Duplicate data can lead to incorrect results."),
            codeBox(
              "df.drop_duplicates()",
              "Removes duplicate rows from the dataset.",
            ),

            // DATA TYPES
            sectionTitle("Fixing Data Types"),
            infoBox("Incorrect data types can cause errors."),
            codeBox(
              "df['Age'] = df['Age'].astype(int)",
              "Converts Age column to integer type.",
            ),

            // RENAMING COLUMNS
            sectionTitle("Renaming Columns"),
            infoBox("Clean column names improve readability."),
            codeBox(
              "df.rename(columns={'old_name':'new_name'}, inplace=True)",
              "Changes column names.",
            ),

            // REMOVING COLUMNS
            sectionTitle("Dropping Columns"),
            infoBox("Remove unnecessary data."),
            codeBox(
              "df.drop('column_name', axis=1, inplace=True)",
              "Deletes a column from the dataset.",
            ),

            // STRING CLEANING
            sectionTitle("Cleaning Text Data"),
            infoBox("Fix messy text values."),
            codeBox(
              "df['Name'] = df['Name'].str.strip()",
              "Removes extra spaces from text.",
            ),
            codeBox(
              "df['Name'] = df['Name'].str.lower()",
              "Converts text to lowercase.",
            ),

            // OUTLIERS
            sectionTitle("Handling Outliers"),
            infoBox("Outliers are extreme values that can affect analysis."),
            codeBox(
              "df = df[df['Age'] < 100]",
              "Removes unrealistic age values (e.g., above 100).",
            ),

            // SUMMARY
            sectionTitle("Summary"),
            infoBox(
              "Remove missing values → dropna() or fillna()\n"
              "Remove duplicates → drop_duplicates()\n"
              "Fix data types → astype()\n"
              "Clean text → strip(), lower()\n"
              "Remove outliers → filtering",
            ),

          ],
        ),
      ),
    );
  }
}