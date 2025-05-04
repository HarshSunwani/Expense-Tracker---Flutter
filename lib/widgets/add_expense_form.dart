import 'package:flutter/material.dart';
import 'package:expense_tracker/styles/global_styles.dart';
import '../static_data.dart';

class AddExpenseForm extends StatefulWidget {
  final void Function(Map<String, dynamic>) onSubmit;

  const AddExpenseForm({super.key, required this.onSubmit});

  @override
  State<AddExpenseForm> createState() => _AddExpenseFormState();
}

class _AddExpenseFormState extends State<AddExpenseForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  String? _selectedCategory;
  DateTime? _selectedDate;

  final List<Map<String, dynamic>> _categories = StaticData.categories;

  void _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 5),
      lastDate: now,
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() &&
        _selectedCategory != null &&
        _selectedDate != null) {
      widget.onSubmit({
        'title': _titleController.text,
        'amount': double.parse(_amountController.text),
        'category': _selectedCategory!,
        'date':
            _selectedDate!.toIso8601String().split('T')[0], // e.g., 2025-05-05
      });
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: GlobalStyles.spaceMd,
        right: GlobalStyles.spaceMd,
        top: GlobalStyles.spaceLg,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Add Expense', style: GlobalStyles.heading2),
            const SizedBox(height: GlobalStyles.spaceMd),

            // Title
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              validator:
                  (value) =>
                      value == null || value.isEmpty ? 'Enter a title' : null,
            ),

            // Amount
            TextFormField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              validator: (value) {
                final parsed = double.tryParse(value ?? '');
                if (parsed == null || parsed <= 0) {
                  return 'Enter a valid amount';
                }
                return null;
              },
            ),

            // Category Dropdown
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Category'),
              value: _selectedCategory,
              items:
                  _categories.map((cat) {
                    return DropdownMenuItem<String>(
                      value: cat["name"],
                      child: Text(cat["name"]),
                    );
                  }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value!;
                });
              },
              validator: (value) => value == null ? 'Select a category' : null,
            ),

            // Date Picker
            GestureDetector(
              onTap: _pickDate,
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: 'Date'),
                  controller: TextEditingController(
                    text:
                        _selectedDate != null
                            ? '${_selectedDate!.year}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.day.toString().padLeft(2, '0')}'
                            : '',
                  ),
                  validator:
                      (_) => _selectedDate == null ? 'Select a date' : null,
                ),
              ),
            ),

            const SizedBox(height: GlobalStyles.spaceMd),

            // Submit Button
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: GlobalStyles.themeColor,
              ),
              child: Text(
                'Add Expense',
                style: GlobalStyles.body.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(height: GlobalStyles.spaceMd),
          ],
        ),
      ),
    );
  }
}
