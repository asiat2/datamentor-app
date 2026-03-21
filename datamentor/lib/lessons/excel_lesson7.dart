import 'package:flutter/material.dart';

class ExcelLesson7 extends StatelessWidget {
  const ExcelLesson7({super.key});

  Widget box(String text){
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical:6),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text,style: const TextStyle(fontSize:18)),
    );
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 7 — Data Cleaning"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Definition",
              style: TextStyle(fontSize:22,fontWeight:FontWeight.bold),
            ),

            const Text(
              "Data cleaning prepares messy data for analysis by removing duplicates, fixing formatting and handling missing values.",
              style: TextStyle(fontSize:16),
            ),

            const SizedBox(height:20),

            const Text(
              "Common Tools",
              style: TextStyle(fontSize:22,fontWeight:FontWeight.bold),
            ),

            box("Remove Duplicates"),
            box("TRIM()"),
            box("PROPER()"),

            const SizedBox(height:20),

            const Text(
              "Examples",
              style: TextStyle(fontSize:22,fontWeight:FontWeight.bold),
            ),

            box("=TRIM(A1)"),
            const Text("Removes extra spaces from text."),

            box("=PROPER(A1)"),
            const Text("Capitalizes each word in a name."),

          ],
        ),
      ),
    );
  }
}