// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}

/// ==============================
/// Mock Login Page
/// ==============================
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login'), backgroundColor: const Color(0xFF4CAF50)),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4CAF50)),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => BarangaySelectionPage()),
            );
          },
          child: const Text('Login to System'),
        ),
      ),
    );
  }
}

/// ==============================
/// Barangay Children Data (60 children)
/// ==============================
Map<String, List<Map<String, String>>> barangayChildrenData = {
  'Barangay 1': [
    {'name': 'Liam Santos', 'age': '2', 'vaccineAccepted': 'BCG', 'vaccineNeeded': 'OPV'},
    {'name': 'Olivia Reyes', 'age': '3', 'vaccineAccepted': 'OPV', 'vaccineNeeded': 'Measles'},
    {'name': 'Lucas Dela Cruz', 'age': '1', 'vaccineAccepted': 'BCG', 'vaccineNeeded': 'Pentavalent'},
    {'name': 'Emma Cruz', 'age': '4', 'vaccineAccepted': 'Measles', 'vaccineNeeded': 'OPV'},
    {'name': 'Noah Mendoza', 'age': '2', 'vaccineAccepted': 'Pentavalent', 'vaccineNeeded': 'BCG'},
    {'name': 'Sophia Ramos', 'age': '3', 'vaccineAccepted': 'OPV', 'vaccineNeeded': 'Measles'},
    {'name': 'James Torres', 'age': '1', 'vaccineAccepted': 'BCG', 'vaccineNeeded': 'Pentavalent'},
    {'name': 'Isabella Gutierrez', 'age': '5', 'vaccineAccepted': 'Measles', 'vaccineNeeded': 'OPV'},
    {'name': 'Benjamin Navarro', 'age': '2', 'vaccineAccepted': 'OPV', 'vaccineNeeded': 'BCG'},
    {'name': 'Mia Gonzales', 'age': '3', 'vaccineAccepted': 'Pentavalent', 'vaccineNeeded': 'Measles'},
  ],
  'Barangay 2': [
    {'name': 'Carlo Villanueva', 'age': '2', 'vaccineAccepted': 'OPV', 'vaccineNeeded': 'Measles'},
    {'name': 'Angela Soriano', 'age': '3', 'vaccineAccepted': 'Pentavalent', 'vaccineNeeded': 'OPV'},
    {'name': 'Daniel Perez', 'age': '4', 'vaccineAccepted': 'BCG', 'vaccineNeeded': 'Pentavalent'},
    {'name': 'Sofia Fernandez', 'age': '2', 'vaccineAccepted': 'Measles', 'vaccineNeeded': 'OPV'},
    {'name': 'Gabriel Bautista', 'age': '1', 'vaccineAccepted': 'OPV', 'vaccineNeeded': 'Measles'},
    {'name': 'Chloe Diaz', 'age': '3', 'vaccineAccepted': 'Pentavalent', 'vaccineNeeded': 'BCG'},
    {'name': 'Ethan Ramirez', 'age': '4', 'vaccineAccepted': 'OPV', 'vaccineNeeded': 'Measles'},
    {'name': 'Hannah Castillo', 'age': '2', 'vaccineAccepted': 'BCG', 'vaccineNeeded': 'OPV'},
    {'name': 'Matthew Lopez', 'age': '5', 'vaccineAccepted': 'Measles', 'vaccineNeeded': 'Pentavalent'},
    {'name': 'Aria Santos', 'age': '3', 'vaccineAccepted': 'Pentavalent', 'vaccineNeeded': 'OPV'},
  ],
  'Barangay 3': [
    {'name': 'Joshua Cruz', 'age': '1', 'vaccineAccepted': 'BCG', 'vaccineNeeded': 'OPV'},
    {'name': 'Victoria Reyes', 'age': '4', 'vaccineAccepted': 'OPV', 'vaccineNeeded': 'Measles'},
    {'name': 'Samuel Dela Cruz', 'age': '2', 'vaccineAccepted': 'Measles', 'vaccineNeeded': 'Pentavalent'},
    {'name': 'Lara Mendoza', 'age': '3', 'vaccineAccepted': 'Pentavalent', 'vaccineNeeded': 'OPV'},
    {'name': 'Nathan Ramos', 'age': '1', 'vaccineAccepted': 'BCG', 'vaccineNeeded': 'Measles'},
    {'name': 'Camille Torres', 'age': '5', 'vaccineAccepted': 'OPV', 'vaccineNeeded': 'Pentavalent'},
    {'name': 'Isaac Gutierrez', 'age': '2', 'vaccineAccepted': 'Measles', 'vaccineNeeded': 'BCG'},
    {'name': 'Jasmine Navarro', 'age': '3', 'vaccineAccepted': 'Pentavalent', 'vaccineNeeded': 'OPV'},
    {'name': 'Adrian Gonzales', 'age': '4', 'vaccineAccepted': 'BCG', 'vaccineNeeded': 'Measles'},
    {'name': 'Ella Cruz', 'age': '2', 'vaccineAccepted': 'OPV', 'vaccineNeeded': 'Pentavalent'},
  ],
  'Barangay 4': [
    {'name': 'Patrick Villanueva', 'age': '2', 'vaccineAccepted': 'Pentavalent', 'vaccineNeeded': 'BCG'},
    {'name': 'Alexa Soriano', 'age': '3', 'vaccineAccepted': 'BCG', 'vaccineNeeded': 'OPV'},
    {'name': 'Christian Perez', 'age': '4', 'vaccineAccepted': 'Measles', 'vaccineNeeded': 'OPV'},
    {'name': 'Julia Fernandez', 'age': '2', 'vaccineAccepted': 'OPV', 'vaccineNeeded': 'Measles'},
    {'name': 'Henry Bautista', 'age': '1', 'vaccineAccepted': 'Pentavalent', 'vaccineNeeded': 'BCG'},
    {'name': 'Samantha Diaz', 'age': '3', 'vaccineAccepted': 'Measles', 'vaccineNeeded': 'OPV'},
    {'name': 'Leo Ramirez', 'age': '4', 'vaccineAccepted': 'OPV', 'vaccineNeeded': 'Measles'},
    {'name': 'Faith Castillo', 'age': '2', 'vaccineAccepted': 'BCG', 'vaccineNeeded': 'Pentavalent'},
    {'name': 'Caleb Lopez', 'age': '5', 'vaccineAccepted': 'Pentavalent', 'vaccineNeeded': 'Measles'},
    {'name': 'Sienna Santos', 'age': '3', 'vaccineAccepted': 'OPV', 'vaccineNeeded': 'BCG'},
  ],
  'Barangay 5': [
    {'name': 'Victor Cruz', 'age': '1', 'vaccineAccepted': 'Measles', 'vaccineNeeded': 'OPV'},
    {'name': 'Hazel Reyes', 'age': '4', 'vaccineAccepted': 'Pentavalent', 'vaccineNeeded': 'BCG'},
    {'name': 'Owen Dela Cruz', 'age': '2', 'vaccineAccepted': 'OPV', 'vaccineNeeded': 'Measles'},
    {'name': 'Bianca Mendoza', 'age': '3', 'vaccineAccepted': 'BCG', 'vaccineNeeded': 'OPV'},
    {'name': 'Julian Ramos', 'age': '1', 'vaccineAccepted': 'Measles', 'vaccineNeeded': 'Pentavalent'},
    {'name': 'Trisha Torres', 'age': '5', 'vaccineAccepted': 'OPV', 'vaccineNeeded': 'Measles'},
    {'name': 'Xavier Gutierrez', 'age': '2', 'vaccineAccepted': 'Pentavalent', 'vaccineNeeded': 'BCG'},
    {'name': 'Paula Navarro', 'age': '3', 'vaccineAccepted': 'Measles', 'vaccineNeeded': 'OPV'},
    {'name': 'Andre Gonzales', 'age': '4', 'vaccineAccepted': 'OPV', 'vaccineNeeded': 'Measles'},
    {'name': 'Clara Cruz', 'age': '2', 'vaccineAccepted': 'BCG', 'vaccineNeeded': 'Pentavalent'},
  ],
};

/// ==============================
/// Vaccine Inventory Data
/// ==============================
Map<String, int> vaccineInventory = {
  'BCG': 20,
  'OPV': 15,
  'Pentavalent': 10,
  'Measles': 8,
};

/// ==============================
/// Barangay Selection Page
/// ==============================
class BarangaySelectionPage extends StatelessWidget {
  final List<String> barangays = [
    'Barangay 1', 'Barangay 2', 'Barangay 3', 'Barangay 4', 'Barangay 5'
  ];

  BarangaySelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFF4CAF50), title: const Text('Select Barangay')),
      body: ListView.builder(
        itemCount: barangays.length,
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            title: Text(barangays[index], style: const TextStyle(fontWeight: FontWeight.w500)),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardPage(barangayName: barangays[index])));
            },
          ),
        ),
      ),
    );
  }
}

/// ==============================
/// Dashboard Page
/// ==============================
class DashboardPage extends StatelessWidget {
  final String barangayName;
  const DashboardPage({super.key, required this.barangayName});

  @override
  Widget build(BuildContext context) {
    final children = barangayChildrenData[barangayName] ?? [];
    int maleCount = 0;
    int femaleCount = 0;
    for (var child in children) {
      if (children.indexOf(child) % 2 == 0) {
        maleCount++;
      } else {
        femaleCount++;
      }
    }

    return Scaffold(
      drawer: _buildDrawer(context),
      appBar: AppBar(backgroundColor: const Color(0xFF4CAF50), title: Text('Dashboard - $barangayName')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text("Dashboard Summary", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          _dashboardItem(Icons.male, 'No. of Male', '$maleCount', Colors.blue),
          _dashboardItem(Icons.female, 'No. of Female', '$femaleCount', Colors.pink),
          _dashboardItem(Icons.child_care, 'Total Children', '${children.length}', Colors.green),

          const SizedBox(height: 20),
          const Text("Vaccine Inventory Summary", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          _dashboardItem(Icons.vaccines, 'BCG', '${vaccineInventory['BCG']} doses', Colors.teal),
          _dashboardItem(Icons.vaccines, 'OPV', '${vaccineInventory['OPV']} doses', Colors.orange),
          _dashboardItem(Icons.vaccines, 'Pentavalent', '${vaccineInventory['Pentavalent']} doses', Colors.purple),
          _dashboardItem(Icons.vaccines, 'Measles', '${vaccineInventory['Measles']} doses', Colors.red),

          const SizedBox(height: 20),
          const Text("Children Summary", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 250,
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(color: Colors.blue, value: maleCount.toDouble(), title: '$maleCount\nMale'),
                  PieChartSectionData(color: Colors.pink, value: femaleCount.toDouble(), title: '$femaleCount\nFemale'),
                ],
                centerSpaceRadius: 40,
              ),
            ),
          ),

          const SizedBox(height: 20),
          const Text("Vaccine Inventory Chart", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 300,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: vaccineInventory.values.reduce((a, b) => a > b ? a : b).toDouble() + 5,
                barGroups: List.generate(vaccineInventory.length, (index) {
                  final key = vaccineInventory.keys.elementAt(index);
                  final value = vaccineInventory[key]!;
                  return BarChartGroupData(x: index, barRods: [
                    BarChartRodData(toY: value.toDouble(), color: Colors.teal, width: 18),
                  ]);
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dashboardItem(IconData icon, String title, String value, Color color) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: color.withOpacity(0.2), child: Icon(icon, color: color)),
        title: Text(title),
        trailing: Text(value, style: TextStyle(fontWeight: FontWeight.bold, color: color)),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF4CAF50)),
            accountName: Text('Municipal Health Office'),
            accountEmail: Text(barangayName),
          ),
          _drawerItem(context, Icons.child_care, 'Children Records', () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => ChildrenRecordsPage(barangayName: barangayName)));
          }),
          _drawerItem(context, Icons.assessment, 'Reports', () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => ReportsPage(barangayName: barangayName)));
          }),
          _drawerItem(context, Icons.inventory, 'Vaccine Inventory', () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const InventoryPage()));
          }),
        ],
      ),
    );
  }

  ListTile _drawerItem(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return ListTile(leading: Icon(icon), title: Text(title), onTap: onTap);
  }
}

/// ==============================
/// Children Records Page
/// ==============================
class ChildrenRecordsPage extends StatelessWidget {
  final String barangayName;
  const ChildrenRecordsPage({super.key, required this.barangayName});

  @override
  Widget build(BuildContext context) {
    final children = barangayChildrenData[barangayName] ?? [];

    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFF4CAF50), title: const Text('Children Records')),
      body: ListView.builder(
        itemCount: children.length,
        itemBuilder: (context, index) {
          final child = children[index];
          return Card(
            child: ListTile(
              title: Text(child['name']!),
              subtitle: Text('Age: ${child['age']} | Vaccine Accepted: ${child['vaccineAccepted']}'),
            ),
          );
        },
      ),
    );
  }
}

/// ==============================
/// Reports Page
/// ==============================
class ReportsPage extends StatelessWidget {
  final String barangayName;
  const ReportsPage({super.key, required this.barangayName});

  @override
  Widget build(BuildContext context) {
    final children = barangayChildrenData[barangayName] ?? [];
    final List<int> years = [2019, 2020, 2021, 2022, 2023, 2024];

    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFF4CAF50), title: const Text('Reports')),
      body: ListView.builder(
        itemCount: years.length,
        itemBuilder: (context, index) {
          final year = years[index];
          return Card(
            child: ListTile(
              title: Text('Records for $year'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => Scaffold(
                  appBar: AppBar(title: Text('$year Masterlist'), backgroundColor: const Color(0xFF4CAF50)),
                  body: ListView.builder(
                    itemCount: children.length,
                    itemBuilder: (context, i) {
                      final child = children[i];
                      return ListTile(
                        title: Text(child['name']!),
                        subtitle: Text('Age: ${child['age']} | Vaccine: ${child['vaccineAccepted']}'),
                      );
                    },
                  ),
                )));
              },
            ),
          );
        },
      ),
    );
  }
}

/// ==============================
/// Inventory Page
/// ==============================
class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFF4CAF50), title: const Text('Vaccine Inventory')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: vaccineInventory.entries.map((entry) {
            return Card(
              child: ListTile(
                leading: const Icon(Icons.vaccines, color: Colors.teal),
                title: Text(entry.key, style: const TextStyle(fontWeight: FontWeight.bold)),
                trailing: Text('${entry.value} doses', style: const TextStyle(fontSize: 16)),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
