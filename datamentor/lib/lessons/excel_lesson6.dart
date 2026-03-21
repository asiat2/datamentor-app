import 'package:flutter/material.dart';

class ExcelLesson6 extends StatelessWidget {
  const ExcelLesson6({super.key});

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
        title: const Text("Lesson 6 — VLOOKUP & XLOOKUP"),
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
              "Lookup functions search for information in tables.",
              style: TextStyle(fontSize:16),
            ),

            const SizedBox(height:20),

            const Text(
              "Formula",
              style: TextStyle(fontSize:22,fontWeight:FontWeight.bold),
            ),

            box("=VLOOKUP(lookup_value, table_array, column_index, FALSE)"),
            box("=XLOOKUP(lookup_value, lookup_array, return_array)"),

            const SizedBox(height:20),

            const Text(
              "Examples",
              style: TextStyle(fontSize:22,fontWeight:FontWeight.bold),
            ),

            example(
              "=VLOOKUP(A2,A1:C10,2,FALSE)",
              "Finds employee salary based on employee ID."
            ),

            example(
              "=XLOOKUP(A2,A1:A10,B1:B10)",
              "Finds product price based on product name."
            ),

            example(
              "=VLOOKUP(A2,A1:D20,4,FALSE)",
              "Finds student grade from a grade table."
            ),

          ],
        ),
      ),
    );
  }
}