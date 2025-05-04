import 'package:expense_tracker/static_data.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/styles/global_styles.dart';
import 'package:expense_tracker/widgets/add_expense_form.dart';

class ViewExpenses extends StatefulWidget {
  const ViewExpenses({super.key});

  @override
  State<ViewExpenses> createState() => _ViewExpensesState();
}

class _ViewExpensesState extends State<ViewExpenses> {
  final List<Map<String, dynamic>> expenses = StaticData.expenses;

  void _openAddExpenseSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return AddExpenseForm(
          onSubmit: (expense) {
            setState(() {
              expenses.add(expense);
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(GlobalStyles.spaceMd),
        child: expenses.isEmpty
            ? Center(
          child: Text(
            'No expenses yet.',
            style: GlobalStyles.subtitle,
          ),
        )
            : ListView.builder(
          itemCount: expenses.length,
          itemBuilder: (context, index) {
            final expense = expenses[index];
            return Card(
              margin: const EdgeInsets.only(bottom: GlobalStyles.spaceMd),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(GlobalStyles.spaceSm),
              ),
              child: Padding(
                padding: const EdgeInsets.all(GlobalStyles.spaceMd),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(expense['title'], style: GlobalStyles.heading2),
                    const SizedBox(height: GlobalStyles.spaceSm),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${expense['amount'].toStringAsFixed(2)}',
                          style: GlobalStyles.body.copyWith(
                            fontWeight: FontWeight.bold,
                            color: GlobalStyles.themeColor,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(expense['category'],
                                style: GlobalStyles.caption),
                            Text(expense['date'],
                                style: GlobalStyles.caption),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddExpenseSheet(context),
        backgroundColor: GlobalStyles.themeColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
