import 'package:flutter/material.dart';

class ExcelLesson10 extends StatelessWidget {
  const ExcelLesson10({super.key});

  Widget section(String title, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            title,
            style: const TextStyle(
              fontSize:20,
              fontWeight:FontWeight.bold,
            ),
          ),

          const SizedBox(height:6),

          Text(text),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 10 — Excel Charts"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            section(
              "Definition",
              "Charts visually represent data to help identify trends, comparisons, and patterns."
            ),

            const SizedBox(height:20),

            const Text(
              "Example Chart",
              style: TextStyle(
                fontSize:22,
                fontWeight:FontWeight.bold
              ),
            ),

            const SizedBox(height:10),

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: InteractiveViewer(
                minScale:1,
                maxScale:4,
                child: Image.asset(
                  "assets/images/excel_chart.png",
                ),
              ),
            ),

            const SizedBox(height:20),

            section(
              "Dataset",
              "The pivot table summarizes values by Country and Gender."
            ),

            section(
              "Chart Type",
              "This is a clustered column chart used to compare values across categories."
            ),

            section(
              "Insight",
              "The United States shows the highest values and female counts are higher than male counts."
            ),

          ],
        ),
      ),
    );
  }
}