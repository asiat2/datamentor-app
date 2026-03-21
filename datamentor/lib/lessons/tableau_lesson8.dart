import 'package:flutter/material.dart';

class TableauLesson8 extends StatelessWidget {
  const TableauLesson8({super.key});

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget explanation(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
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
      child: Text(text),
    );
  }

  Widget exampleBox(String title, String content) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(content),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 8 — Parameters"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // DEFINITION
            sectionTitle("Definition"),
            explanation(
              "Parameters are dynamic inputs that allow users to control values "
              "in calculations, filters, and visualizations.",
            ),

            infoBox(
              "Think of parameters as user-controlled settings that change how data is displayed.",
            ),

            // HOW IT WORKS
            sectionTitle("How Parameters Work"),
            explanation(
              "1. Create a parameter\n"
              "2. Define values (numbers, list, or range)\n"
              "3. Use it in a calculated field\n"
              "4. Let users interact with it",
            ),

            // EXAMPLES
            sectionTitle("Common Examples"),

            exampleBox(
              "Example 1 — Switch Measures",
              "User selects:\n"
              "- Sales\n"
              "- Profit\n"
              "- Quantity\n\n"
              "Chart updates based on selection.",
            ),

            exampleBox(
              "Example 2 — What-If Analysis",
              "User changes discount percentage (e.g., 10%, 20%)\n"
              "Dashboard recalculates revenue.",
            ),

            exampleBox(
              "Example 3 — Threshold Filter",
              "User selects minimum sales value\n"
              "Only data above that value is shown.",
            ),

            exampleBox(
              "Example 4 — Healthcare Use Case",
              "User selects age group (e.g., 20–40, 40–60)\n"
              "Dashboard updates patient analysis.",
            ),

            // CALCULATED FIELD
            sectionTitle("Using Parameter in Calculation"),

            infoBox(
              "Example Formula:\n\n"
              "IF [Parameter] = 'Sales' THEN SUM([Sales])\n"
              "ELSEIF [Parameter] = 'Profit' THEN SUM([Profit])\n"
              "END",
            ),

            // TYPES
            sectionTitle("Types of Parameters"),

            infoBox(
              "List → User selects from options\n"
              "Range → User selects a number range\n"
              "String → User inputs text\n"
              "Integer/Float → Numeric values",
            ),

            // WHY IMPORTANT
            sectionTitle("Why Parameters Are Important"),

            infoBox(
              "Make dashboards interactive\n"
              "Allow user control\n"
              "Enable scenario analysis\n"
              "Improve user experience",
            ),

            // SUMMARY
            sectionTitle("Summary"),

            infoBox(
              "Parameters = dynamic user input\n"
              "Used in calculations and filters\n"
              "Make dashboards interactive\n"
              "Very powerful for analysis",
            ),

          ],
        ),
      ),
    );
  }
}