import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class TableauLesson6 extends StatefulWidget {
  const TableauLesson6({super.key});

  @override
  State<TableauLesson6> createState() => _TableauLesson6State();
}

class _TableauLesson6State extends State<TableauLesson6> {
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
          prefs.getBool("Lesson 6 — Filters and Granularity") ?? false;
    });
  }

  Future<void> markCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Lesson 6 — Filters and Granularity", true);

    setState(() {
      isCompleted = true;
    });
  }

  Widget section(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 4),

          Text(description, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lesson 6 — Filters and Granularity")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// FILTERS
            const Text(
              "Filters",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "Filters allow analysts to display only a subset of data "
              "based on specific conditions. Filters help focus analysis "
              "on relevant information.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            const Text(
              "Types of Filters in Tableau",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            section(
              "Dimension Filter",
              "Filters categorical fields such as region, category, "
                  "or product name.",
            ),

            section(
              "Measure Filter",
              "Filters numerical values such as sales, profit, or quantity.",
            ),

            section(
              "Date Filter",
              "Filters data based on specific dates, months, or years.",
            ),

            section(
              "Context Filter",
              "Creates a primary filter that other filters depend on.",
            ),

            const SizedBox(height: 20),

            const Text(
              "Example",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const Text(
              "An analyst may filter a dataset to show only "
              "sales from the year 2024 or only customers "
              "from a specific region.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 30),

            /// GRANULARITY
            const Text(
              "Granularity",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "Granularity refers to the level of detail in the dataset. "
              "High granularity means very detailed data, while low "
              "granularity means summarized data.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            const Text(
              "Examples of Granularity",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const Text(
              "High Granularity:\n"
              "Sales per transaction\n\n"
              "Medium Granularity:\n"
              "Sales per store\n\n"
              "Low Granularity:\n"
              "Total sales per region",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            const Text(
              "Relationship Between Filters and Granularity",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const Text(
              "Filters change the data that appears in a visualization, "
              "which can also affect the granularity of the analysis. "
              "For example, filtering data to a single region "
              "reduces the amount of detail displayed in the chart.",
              style: TextStyle(fontSize: 16),
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
