import 'package:flutter/material.dart';

class ExcelLesson5 extends StatelessWidget {
  const ExcelLesson5({super.key});

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
        title: const Text("Lesson 5 — IF Function"),
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
              "The IF function returns different values based on a condition.",
              style: TextStyle(fontSize:16),
            ),

            const SizedBox(height:20),

            const Text(
              "Formula",
              style: TextStyle(fontSize:22,fontWeight:FontWeight.bold),
            ),

            box('=IF(condition, value_if_true, value_if_false)'),

            const SizedBox(height:20),

            const Text(
              "Examples",
              style: TextStyle(fontSize:22,fontWeight:FontWeight.bold),
            ),

            example(
              '=IF(A1>50,"Pass","Fail")',
              "Student passes exam if score > 50."
            ),

            example(
              '=IF(B2>10000,"Bonus","No Bonus")',
              "Salesperson earns bonus if sales exceed 10,000."
            ),

            example(
              '=IF(A2="Present","OK","Absent")',
              "Checks employee attendance."
            ),

          ],
        ),
      ),
    );
  }
}