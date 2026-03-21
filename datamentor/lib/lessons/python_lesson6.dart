import 'package:flutter/material.dart';

class PythonLesson6 extends StatelessWidget {
  const PythonLesson6({super.key});

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget explanationText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
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
          Text(
            explanation,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget infoBox(String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.purple.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 6 — NumPy"),
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
              "NumPy is a powerful Python library used for numerical computing. "
              "It provides fast arrays and supports mathematical operations.",
            ),

            // ARRAY CREATION
            sectionTitle("Creating Arrays"),
            infoBox("NumPy arrays are faster and more powerful than Python lists."),
            codeBox(
              "import numpy as np\n"
              "arr = np.array([1, 2, 3])\n"
              "print(arr)",
              "Creates a NumPy array with values 1, 2, and 3.",
            ),

            // BASIC OPERATIONS
            sectionTitle("Array Operations"),
            infoBox("NumPy allows element-wise operations."),
            codeBox(
              "arr = np.array([1, 2, 3])\n"
              "print(arr + 2)",
              "Adds 2 to each element → [3, 4, 5].",
            ),

            // STATISTICS
            sectionTitle("Statistical Functions"),
            infoBox("NumPy provides built-in statistical calculations."),
            codeBox(
              "arr = np.array([1, 2, 3, 4])\n"
              "print(arr.mean())\n"
              "print(arr.sum())",
              "mean() gives average → 2.5\n"
              "sum() gives total → 10",
            ),

            // ARRAY SHAPE
            sectionTitle("Array Shape"),
            infoBox("Shape tells the structure (rows, columns)."),
            codeBox(
              "arr = np.array([[1,2,3],[4,5,6]])\n"
              "print(arr.shape)",
              "This is a 2D array with 2 rows and 3 columns → (2,3).",
            ),

            // INDEXING
            sectionTitle("Indexing & Access"),
            infoBox("You can access elements using indexes."),
            codeBox(
              "arr = np.array([10, 20, 30])\n"
              "print(arr[1])",
              "Returns the second element → 20.",
            ),

            // SLICING
            sectionTitle("Slicing"),
            infoBox("Slicing extracts part of the array."),
            codeBox(
              "arr = np.array([1,2,3,4,5])\n"
              "print(arr[1:4])",
              "Returns elements from index 1 to 3 → [2,3,4].",
            ),

            // SUMMARY
            sectionTitle("Summary"),
            infoBox(
              "NumPy arrays are faster than lists\n"
              "Supports math operations easily\n"
              "Provides statistical functions\n"
              "Used heavily in data analysis and AI",
            ),

          ],
        ),
      ),
    );
  }
}