import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PythonLesson12 extends StatefulWidget {
  const PythonLesson12({super.key});

  @override
  State<PythonLesson12> createState() => _PythonLesson12State();
}

class _PythonLesson12State extends State<PythonLesson12> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  void loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted = prefs.getBool("Lesson 12 — Data Analysis Project") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 12 — Data Analysis Project", true);

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
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text, style: const TextStyle(fontSize: 15)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 12 — Data Analysis Project"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // INTRO
            sectionTitle("Project Overview"),
            explanationText(
              "A data analysis project follows these steps:\n"
              "1. Load data\n"
              "2. Clean data\n"
              "3. Analyze data\n"
              "4. Visualize results\n"
              "5. Generate insights",
            ),

            // STEP 1: LOAD DATA
            sectionTitle("Step 1 — Load Data"),
            infoBox("Load dataset from a CSV file."),
            codeBox(
              "import pandas as pd\n"
                  "df = pd.read_csv('sales.csv')\n"
                  "print(df.head())",
              "Loads dataset and displays first rows.",
            ),

            // STEP 2: CLEAN DATA
            sectionTitle("Step 2 — Clean Data"),
            infoBox("Handle missing values and duplicates."),
            codeBox(
              "df = df.dropna()\n"
                  "df = df.drop_duplicates()",
              "Removes missing and duplicate data.",
            ),

            // STEP 3: ANALYZE DATA
            sectionTitle("Step 3 — Analyze Data"),
            infoBox("Calculate important metrics."),
            codeBox(
              "total_sales = df['Sales'].sum()\n"
                  "avg_sales = df['Sales'].mean()\n"
                  "print(total_sales, avg_sales)",
              "Calculates total and average sales.",
            ),

            // STEP 4: GROUP ANALYSIS
            sectionTitle("Step 4 — Group Analysis"),
            infoBox("Analyze data by category."),
            codeBox(
              "df.groupby('Region')['Sales'].sum()",
              "Shows total sales per region.",
            ),

            // STEP 5: VISUALIZATION
            sectionTitle("Step 5 — Visualization"),
            infoBox("Visualize results using charts."),
            codeBox(
              "import matplotlib.pyplot as plt\n"
                  "df.groupby('Region')['Sales'].sum().plot(kind='bar')\n"
                  "plt.show()",
              "Displays sales by region in a bar chart.",
            ),

            // REAL-LIFE HEALTHCARE EXAMPLE
            sectionTitle("Real-Life Example (Healthcare)"),
            infoBox("Analyze patient data."),
            codeBox(
              "df = pd.read_csv('patients.csv')\n"
                  "df = df[df['Age'] > 50]\n"
                  "df.groupby('Diagnosis')['Patients'].count()",
              "Finds number of patients by diagnosis for age > 50.",
            ),

            // INSIGHTS
            sectionTitle("Insights"),
            infoBox(
              "After analysis, you should answer questions like:\n"
              "- Which region has highest sales?\n"
              "- Which disease is most common?\n"
              "- What trends exist over time?",
            ),

            // SUMMARY
            sectionTitle("Summary"),
            infoBox(
              "Load → Clean → Analyze → Visualize → Insight\n"
              "This is the full data analysis workflow\n"
              "Used in real-world jobs",
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
