import 'package:flutter/material.dart';

class PowerBILesson10 extends StatelessWidget {
  const PowerBILesson10({super.key});

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
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text),
    );
  }

  Widget step(String title, String desc) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(desc),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson 10 — Publishing Reports"),
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
              "Publishing reports allows you to upload your Power BI dashboards "
              "to the Power BI Service (cloud) so others can view and interact with them.",
            ),

            infoBox(
              "Think of publishing like uploading your report online so your team can access it anywhere.",
            ),

            // STEPS
            sectionTitle("Steps to Publish"),

            step(
              "Step 1: Click Publish",
              "In Power BI Desktop, click the 'Publish' button on the Home ribbon.",
            ),

            step(
              "Step 2: Sign In",
              "Log into your Power BI account (Microsoft account).",
            ),

            step(
              "Step 3: Choose Workspace",
              "Select where to save your report (My Workspace or Team Workspace).",
            ),

            step(
              "Step 4: Upload Report",
              "Your report is uploaded to Power BI Service.",
            ),

            step(
              "Step 5: Share",
              "Share the report with your team or organization.",
            ),

            // WORKSPACES
            sectionTitle("Workspaces"),

            explanation(
              "Workspaces are places where reports and dashboards are stored.",
            ),

            infoBox(
              "My Workspace → Personal use\n"
              "Team Workspace → Shared with colleagues\n"
              "Used for collaboration and teamwork",
            ),

            // SHARING
            sectionTitle("Sharing Reports"),

            step(
              "Share Link",
              "Send a link so others can view your report.",
            ),

            step(
              "Permissions",
              "Control who can view or edit the report.",
            ),

            step(
              "Apps",
              "Publish dashboards as apps for wider distribution.",
            ),

            // REAL EXAMPLES
            sectionTitle("Real-Life Examples"),

            explanation(
              "Business Example:",
            ),

            infoBox(
              "A company publishes a sales dashboard so managers can track revenue daily.",
            ),

            explanation(
              "Healthcare Example:",
            ),

            infoBox(
              "A hospital publishes a patient dashboard to monitor admissions, "
              "disease trends, and department performance.",
            ),

            // BENEFITS
            sectionTitle("Benefits of Publishing"),

            infoBox(
              "Access reports anywhere\n"
              "Share insights with teams\n"
              "Enable real-time decision making\n"
              "Improve collaboration",
            ),

            // SUMMARY
            sectionTitle("Summary"),

            infoBox(
              "Publish → Upload report to Power BI Service\n"
              "Workspaces → Store reports\n"
              "Share → Give access to others\n"
              "Final step in Power BI workflow",
            ),

          ],
        ),
      ),
    );
  }
}