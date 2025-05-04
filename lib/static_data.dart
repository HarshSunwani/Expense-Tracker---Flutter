// TODO: Use Hive
class StaticData {
  static final List<Map<String, dynamic>> expenses = [
    {
      'title': 'Grocery Shopping',
      'amount': 45.99,
      'date': 'May 5, 2025',
      'category': 'Food',
    },
    {
      'title': 'Uber Ride',
      'amount': 12.50,
      'date': 'May 4, 2025',
      'category': 'Transport',
    },
    {
      'title': 'Netflix Subscription',
      'amount': 15.99,
      'date': 'May 1, 2025',
      'category': 'Entertainment',
    },
  ];

  static final List<Map<String, dynamic>> categories = [
    {'name': 'Food', 'description': 'Meals, groceries, snacks'},
    {'name': 'Transport', 'description': 'Fuel, public transit, taxi'},
    {'name': 'Entertainment', 'description': 'Movies, games, events'},
    {'name': 'Health', 'description': 'Medicines, doctor visits, gym'},
    {'name': 'Shopping', 'description': 'Clothes, gadgets, accessories'},
    {'name': 'Bills', 'description': 'Utilities, subscriptions, rent'},
    {'name': 'Other', 'description': 'Miscellaneous expenses'},
  ];
}
