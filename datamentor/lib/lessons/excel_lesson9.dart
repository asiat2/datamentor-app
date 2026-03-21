import 'package:flutter/material.dart';

class ExcelLesson9 extends StatelessWidget {
  const ExcelLesson9({super.key});

  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget exampleBox(String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 9 — Pivot Tables"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            sectionTitle("Definition"),

            const Text(
              "A Pivot Table is a powerful Excel tool used to summarize, "
              "analyze, and organize large amounts of data. It allows users "
              "to group information and calculate values such as sums, "
              "averages, or counts automatically.",
              style: TextStyle(fontSize: 16),
            ),

            sectionTitle("Pivot Table Example"),

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: InteractiveViewer(
                minScale: 1,
                maxScale: 4,
                child: Image.asset(
                  "assets/images/excel_pivot_table.png",
                ),
              ),
            ),

            sectionTitle("Understanding the Pivot Table"),

            const Text(
              "The Pivot Table shown summarizes Age values by Gender "
              "for each person. Excel organizes the data automatically "
              "based on the fields selected.",
              style: TextStyle(fontSize: 16),
            ),

            sectionTitle("Pivot Table Fields"),

            exampleBox(
              "Rows: First Name, Last Name\n"
              "Each row represents a person."
            ),

            exampleBox(
              "Columns: Gender\n"
              "This separates the data into Female and Male categories."
            ),

            exampleBox(
              "Values: Sum of Age\n"
              "Excel calculates the total age values for the selected fields."
            ),

            sectionTitle("Example Interpretation"),

            exampleBox(
              "Angel appears under Male with age 48."
            ),

            exampleBox(
              "Angelyn Vong appears under Female with age 58."
            ),

            exampleBox(
              "This allows analysts to quickly compare age distribution "
              "between genders."
            ),

            sectionTitle("Why Pivot Tables Are Important"),

            const Text(
              "Pivot Tables help analysts explore data quickly without "
              "writing formulas. They are widely used in business, "
              "finance, healthcare, and marketing to summarize data "
              "and discover insights.",
              style: TextStyle(fontSize: 16),
            ),

            sectionTitle("Real-Life Example"),

            exampleBox(
              "A company can use Pivot Tables to summarize employee ages "
              "by department."
            ),

            exampleBox(
              "A sales team can analyze revenue by region and product."
            ),

          ],
        ),
      ),
    );
  }
}