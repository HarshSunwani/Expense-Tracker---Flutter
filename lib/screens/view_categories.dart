import 'package:flutter/material.dart';
import 'package:expense_tracker/styles/global_styles.dart';
import 'package:expense_tracker/static_data.dart';

class ViewCategories extends StatefulWidget {
  const ViewCategories({super.key});

  @override
  State<ViewCategories> createState() => _ViewCategoriesState();
}

class _ViewCategoriesState extends State<ViewCategories> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();

  List<Map<String, dynamic>> _categories = [];

  @override
  void initState() {
    super.initState();
    _categories = List.from(StaticData.categories);
  }

  void _addCategory() {
    final name = _nameController.text.trim();
    final desc = _descController.text.trim();

    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Category name is required')),
      );
      return;
    }

    final newCategory = {'name': name, 'description': desc};

    setState(() {
      _categories.add(newCategory);
      StaticData.categories.add(newCategory);
    });

    _nameController.clear();
    _descController.clear();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(GlobalStyles.spaceMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add New Category', style: GlobalStyles.heading2),
            const SizedBox(height: GlobalStyles.spaceSm),

            // Category Name Field
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Category Name *',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: GlobalStyles.spaceSm),

            // Description Field (Optional)
            TextField(
              controller: _descController,
              decoration: const InputDecoration(
                labelText: 'Description (optional)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: GlobalStyles.spaceSm),

            // Add Button
            ElevatedButton(
              onPressed: _addCategory,
              style: ElevatedButton.styleFrom(
                backgroundColor: GlobalStyles.themeColor,
              ),
              child: Text('Add Category', style: GlobalStyles.body.copyWith(color: Colors.white)),
            ),

            const SizedBox(height: GlobalStyles.spaceLg),
            const Divider(),

            // Category List Header
            Text('Your Categories', style: GlobalStyles.heading2),
            const SizedBox(height: GlobalStyles.spaceSm),

            // Category List
            Expanded(
              child:
                  _categories.isEmpty
                      ? const Center(child: Text('No categories added yet.'))
                      : ListView.builder(
                        itemCount: _categories.length,
                        itemBuilder: (context, index) {
                          final cat = _categories[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            elevation: 2,
                            child: ListTile(
                              title: Text(
                                cat['name'],
                                style: GlobalStyles.body.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle:
                                  (cat['description'] != null &&
                                          cat['description']
                                              .toString()
                                              .trim()
                                              .isNotEmpty)
                                      ? Text(cat['description'])
                                      : null,
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
