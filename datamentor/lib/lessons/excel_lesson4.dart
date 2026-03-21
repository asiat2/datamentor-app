import 'package:flutter/material.dart';

class ExcelLesson4 extends StatelessWidget {
  const ExcelLesson4({super.key});

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

  Widget example(String formula,String explanation){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        box(formula),
        Text(explanation),
        const SizedBox(height:10),
      ],
    );
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 4 — SUM, AVERAGE, COUNT"),
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
              "Excel includes built-in functions to summarize data.",
              style: TextStyle(fontSize:16),
            ),

            const SizedBox(height:20),

            const Text(
              "Formula",
              style: TextStyle(fontSize:22,fontWeight:FontWeight.bold),
            ),

            box("=SUM(A1:A10)"),
            box("=AVERAGE(A1:A10)"),
            box("=COUNT(A1:A10)"),

            const SizedBox(height:20),

            const Text(
              "Examples",
              style: TextStyle(fontSize:22,fontWeight:FontWeight.bold),
            ),

            example(
              "=SUM(B2:B7)",
              "Adds weekly sales for a store."
            ),

            example(
              "=AVERAGE(C2:C10)",
              "Calculates average exam score."
            ),

            example(
              "=COUNT(A1:A30)",
              "Counts number of employees in a list."
            ),

          ],
        ),
      ),
    );
  }
}