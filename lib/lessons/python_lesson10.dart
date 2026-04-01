import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PythonLesson10 extends StatefulWidget {
  const PythonLesson10({super.key});

  @override
  State<PythonLesson10> createState() => _PythonLesson10State();
}

class _PythonLesson10State extends State<PythonLesson10> {
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  void loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isCompleted =
          prefs.getBool("Lesson 10 — Data Visualization") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 10 — Data Visualization", true);

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
        color: Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text, style: const TextStyle(fontSize: 15)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 10 — Data Visualization"),
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
              "Data visualization helps analysts understand patterns, trends, "
              "and insights using charts and graphs.",
            ),

            // LINE CHART
            sectionTitle("Line Chart"),
            infoBox("Used to show trends over time."),
            codeBox(
              "import matplotlib.pyplot as plt\n"
                  "plt.plot([1, 2, 3, 4])\n"
                  "plt.title('Trend Over Time')\n"
                  "plt.show()",
              "Displays a line chart showing values increasing over time.",
            ),

            // BAR CHART
            sectionTitle("Bar Chart"),
            infoBox("Used to compare categories."),
            codeBox(
              "plt.bar(['A','B','C'], [10, 20, 15])\n"
                  "plt.title('Category Comparison')\n"
                  "plt.show()",
              "Compares values for categories A, B, and C.",
            ),

            // HISTOGRAM
            sectionTitle("Histogram"),
            infoBox("Shows distribution of data."),
            codeBox(
              "plt.hist([1,2,2,3,3,3,4])\n"
                  "plt.title('Data Distribution')\n"
                  "plt.show()",
              "Shows how often values appear.",
            ),

            // PIE CHART
            sectionTitle("Pie Chart"),
            infoBox("Shows proportions of a whole."),
            codeBox(
              "plt.pie([30, 50, 20], labels=['A','B','C'])\n"
                  "plt.show()",
              "Displays percentage distribution.",
            ),

            // USING PANDAS
            sectionTitle("Visualization with Pandas"),
            infoBox("Pandas integrates with matplotlib easily."),
            codeBox(
              "df['Age'].plot(kind='hist')\n"
                  "plt.show()",
              "Creates histogram directly from DataFrame.",
            ),

            // REAL LIFE
            sectionTitle("Real-Life Example"),
            infoBox("Example from healthcare or business."),
            codeBox(
              "df.groupby('Department')['Patients'].sum().plot(kind='bar')\n"
                  "plt.show()",
              "Shows total patients per department.",
            ),

            // SUMMARY
            sectionTitle("Summary"),
            infoBox(
              "Line → Trends over time\n"
              "Bar → Compare categories\n"
              "Histogram → Distribution\n"
              "Pie → Proportions\n"
              "Used in dashboards and reporting",
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
