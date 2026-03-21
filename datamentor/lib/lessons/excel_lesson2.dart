import 'package:flutter/material.dart';

class ExcelLesson2 extends StatelessWidget {
  const ExcelLesson2({super.key});

  Widget section(String title, String description){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            title,
            style: const TextStyle(
                fontSize:18,
                fontWeight:FontWeight.bold
            ),
          ),

          Text(description),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 2 — Excel Interface"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Definition",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "The Excel interface contains the tools used to work with spreadsheets.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),
            const Text(
              "Excel Interface",
              style: TextStyle(fontSize:22,fontWeight:FontWeight.bold),
            ),

            const SizedBox(height:10),

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: InteractiveViewer(
                minScale:1,
                maxScale:4,
                child: Image.asset("assets/images/excel_interface.png"),
              ),
            ),

            const SizedBox(height:20),

            const Text(
              "Main Parts",
              style: TextStyle(fontSize:22,fontWeight:FontWeight.bold),
            ),

            section(
              "Ribbon",
              "Contains Excel tools such as charts, formulas, formatting and data analysis."
            ),

            section(
              "Formula Bar",
              "Displays the contents of the selected cell and allows you to edit formulas."
            ),

            section(
              "Worksheet Grid",
              "The main area where data is entered using rows and columns."
            ),

            section(
              "Sheet Tabs",
              "Allows switching between multiple worksheets in one Excel file."
            ),

          ],
        ),
      ),
    );
  }
}