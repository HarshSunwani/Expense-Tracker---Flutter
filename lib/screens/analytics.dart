import 'package:expense_tracker/static_data.dart';
import 'package:expense_tracker/styles/global_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Analytics extends StatelessWidget {
  const Analytics({super.key});

  Map<String, double> _calculateTotalsByCategory() {
    final Map<String, double> data = {};
    for (var expense in StaticData.expenses) {
      final category = expense['category'];
      final amount = expense['amount'];
      data[category] = (data[category] ?? 0) + amount;
    }
    return data;
  }

  List<PieChartSectionData> _buildPieChartSections(Map<String, double> data) {
    final total = data.values.fold(0.0, (sum, val) => sum + val);
    final colors = [
      Colors.green,
      Colors.blue,
      Colors.orange,
      Colors.purple,
      Colors.red,
      Colors.cyan,
      Colors.brown,
    ];

    int colorIndex = 0;

    return data.entries.map((entry) {
      final percentage = (entry.value / total) * 100;
      final section = PieChartSectionData(
        color: colors[colorIndex % colors.length],
        value: entry.value,
        title: '${percentage.toStringAsFixed(1)}%',
        radius: 60,
        titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      );
      colorIndex++;
      return section;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final data = _calculateTotalsByCategory();
    final sections = _buildPieChartSections(data);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(GlobalStyles.spaceMd),
        child: data.isEmpty
            ? const Center(child: Text('No expense data to show.'))
            : Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Expense Breakdown by Category', style: GlobalStyles.heading2),
            const SizedBox(height: GlobalStyles.spaceLg),
            AspectRatio(
              aspectRatio: 1.2,
              child: PieChart(
                PieChartData(
                  sections: sections,
                  centerSpaceRadius: 40,
                  sectionsSpace: 4,
                ),
              ),
            ),
            const SizedBox(height: GlobalStyles.spaceMd),

            // Legend
            Wrap(
              spacing: 10,
              runSpacing: 6,
              children: data.keys.map((cat) {
                final index = data.keys.toList().indexOf(cat);
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: sections[index].color,
                      ),
                    ),
                    Text(cat),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
