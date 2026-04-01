import 'package:flutter/material.dart';

class LessonTemplate extends StatelessWidget {
  final String title;
  final String content;
  final String? image;

  const LessonTemplate({
    super.key,
    required this.title,
    required this.content,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ////////////////////////////////////////////////////
          /// TITLE
          ////////////////////////////////////////////////////
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          ////////////////////////////////////////////////////
          /// IMAGE
          ////////////////////////////////////////////////////
          if (image != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                image!,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

          const SizedBox(height: 20),

          ////////////////////////////////////////////////////
          /// CONTENT
          ////////////////////////////////////////////////////
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(content, style: TextStyle(fontSize: 16, height: 1.5)),
          ),
        ],
      ),
    );
  }
}
