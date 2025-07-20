// ignore_for_file: use_key_in_widget_constructors, unnecessary_string_interpolations, unnecessary_to_list_in_spreads, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BnsHomePage(),
  ));
}

class BnsHomePage extends StatefulWidget {
  const BnsHomePage();

  @override
  State<BnsHomePage> createState() => _BnsHomePageState();
}

class _BnsHomePageState extends State<BnsHomePage> {
  String? selectedPurok;
  final List<String> purokList = ['Purok 1', 'Purok 2', 'Purok 3', 'Purok 4', 'Purok 5'];

  @override
  Widget build(BuildContext context) {
    return selectedPurok == null
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF4CAF50),
              title: const Text("Select Purok"),
            ),
            body: ListView(
              children: purokList.map((purok) {
                return ListTile(
                  title: Text(purok),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () => setState(() => selectedPurok = purok),
                );
              }).toList(),
            ),
          )
        : DashboardPage(
            selectedPurok: selectedPurok!,
            onChangePurok: () => setState(() => selectedPurok = null),
          );
  }
}

class DashboardPage extends StatefulWidget {
  final String selectedPurok;
  final VoidCallback onChangePurok;

  const DashboardPage({
    required this.selectedPurok,
    required this.onChangePurok,
  });

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      DashboardOverview(purok: widget.selectedPurok),
      const ChildrenRecordsPage(),
      ReportsPage(purok: widget.selectedPurok),
    ];
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4CAF50),
        title: Text('${widget.selectedPurok}'),
        actions: [
          IconButton(icon: const Icon(Icons.swap_horiz), onPressed: widget.onChangePurok, tooltip: 'Change Purok'),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF4CAF50)),
              accountName: Text('BNS', style: TextStyle(fontSize: 20)),
              accountEmail: SizedBox.shrink(),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40, color: Colors.teal),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.dashboard),
                    title: const Text('Dashboard'),
                    onTap: () => _onItemTap(0),
                  ),
                  ListTile(
                    leading: const Icon(Icons.child_care),
                    title: const Text('Children Records'),
                    onTap: () => _onItemTap(1),
                  ),
                  ListTile(
                    leading: const Icon(Icons.bar_chart),
                    title: const Text('Reports'),
                    onTap: () => _onItemTap(2),
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Logout'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const BnsHomePage()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}

class DashboardOverview extends StatelessWidget {
  final String purok;
  const DashboardOverview({required this.purok});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> summaryItems = [
      {'title': 'No. of Male', 'value': '30', 'color': Colors.blue, 'icon': Icons.male},
      {'title': 'No. of Female', 'value': '20', 'color': Colors.pink, 'icon': Icons.female},
      {'title': 'Total Children', 'value': '50', 'color': Colors.green, 'icon': Icons.child_care},
    ];

    final List<Map<String, dynamic>> vaccineInventory = [
      {'name': 'BCG', 'needed': 12, 'icon': Icons.vaccines},
      {'name': 'Hepatitis B', 'needed': 10, 'icon': Icons.health_and_safety},
      {'name': 'Pentavalent', 'needed': 15, 'icon': Icons.local_hospital},
      {'name': 'OPV', 'needed': 9, 'icon': Icons.healing},
      {'name': 'Measles', 'needed': 8, 'icon': Icons.medication},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFE9F4EA),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text("Dashboard Summary - $purok", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          // Stat Cards
          ...summaryItems.map((item) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: item['color'].withOpacity(0.2),
                  child: Icon(item['icon'], color: item['color']),
                ),
                title: Text(item['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
                trailing: Text(item['value'], style: TextStyle(fontSize: 20, color: item['color'], fontWeight: FontWeight.bold)),
              ),
            );
          }).toList(),

          const SizedBox(height: 16),
          const Text("Children Distribution Chart", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Container(
            height: 200,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [
              BoxShadow(color: Colors.grey.shade300, blurRadius: 6)
            ]),
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(value: 30, color: Colors.blue, title: 'Male'),
                  PieChartSectionData(value: 20, color: Colors.pink, title: 'Female'),
                ],
                centerSpaceRadius: 40,
              ),
            ),
          ),

          const SizedBox(height: 16),
          const Text("Vaccine Inventory Chart", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Container(
            height: 220,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [
              BoxShadow(color: Colors.grey.shade300, blurRadius: 6)
            ]),
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                barGroups: vaccineInventory.map((vaccine) {
                  return BarChartGroupData(
                    x: vaccineInventory.indexOf(vaccine),
                    barRods: [
                      BarChartRodData(toY: vaccine['needed'].toDouble(), color: Colors.teal, width: 16),
                    ],
                  );
                }).toList(),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, getTitlesWidget: (value, meta) {
                    final index = value.toInt();
                    return Text(vaccineInventory[index]['name'], style: const TextStyle(fontSize: 10));
                  })),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChildrenRecordsPage extends StatelessWidget {
  const ChildrenRecordsPage();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> records = [
      {'name': 'Liam Mateo', 'age': '3', 'vaccine': 'Pentavalent'},
      {'name': 'Isla Rae', 'age': '4', 'vaccine': 'BCG'},
      {'name': 'Noah Elijah', 'age': '2', 'vaccine': 'OPV'},
      {'name': 'Ava Skye', 'age': '5', 'vaccine': 'Measles'},
      {'name': 'Lucas Zion', 'age': '3', 'vaccine': 'Hepatitis B'},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4CAF50),
        title: const Text('Children Records'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: records.length,
        itemBuilder: (context, index) {
          final record = records[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.child_care, color: Colors.teal),
              title: Text(record['name']!),
              subtitle: Text('${record['age']} y/o\nVaccine: ${record['vaccine']}'),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}

class ReportsPage extends StatelessWidget {
  final String purok;
  const ReportsPage({required this.purok});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> vaccineInventory = [
      {'name': 'BCG', 'needed': 12},
      {'name': 'Hepatitis B', 'needed': 10},
      {'name': 'Pentavalent', 'needed': 15},
      {'name': 'OPV', 'needed': 9},
      {'name': 'Measles', 'needed': 8},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFE9F4EA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4CAF50),
        automaticallyImplyLeading: false,
        title: Text('Vaccine Report - $purok', style: const TextStyle(fontSize: 18)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: vaccineInventory.length,
              itemBuilder: (context, index) {
                final vaccine = vaccineInventory[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(vaccine['name'].toString(), style: const TextStyle(fontSize: 14)),
                    trailing: Text('Needed: ${vaccine['needed']}', style: const TextStyle(fontSize: 14)),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.print),
              label: const Text('Generate Report'),
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4CAF50)),
              onPressed: () async {
                final pdf = pw.Document();
                pdf.addPage(
                  pw.Page(
                    build: (pw.Context context) => pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('Vaccine Inventory Report - $purok',
                            style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                        pw.SizedBox(height: 20),
                        ...vaccineInventory.map(
                          (vaccine) => pw.Text('${vaccine['name']}: Needed - ${vaccine['needed']}'),
                        ),
                      ],
                    ),
                  ),
                );
                await Printing.layoutPdf(onLayout: (format) => pdf.save());
              },
            ),
          ),
        ],
      ),
    );
  }
}
