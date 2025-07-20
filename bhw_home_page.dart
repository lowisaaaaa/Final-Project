import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart';

/// ==============================
/// Sitio Selection After Login
/// ==============================
final List<String> sitioList = [
  'Sitio Uno',
  'Sitio Dos',
  'Sitio Tres',
  'Sitio Cuatro',
  'Sitio Cinco',
];
String selectedSitio = '';

class SitioSelectionPage extends StatelessWidget {
  const SitioSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    
      appBar: AppBar(
        title: const Text('Select Sitio'),
        centerTitle: true,
        backgroundColor: const Color(0xFF4CAF50),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: sitioList.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              color: Colors.green[50],
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  selectedSitio = sitioList[index];
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const BhwHomePage()),
                  );
                },
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.location_on, color: Colors.green[700], size: 40),
                      const SizedBox(height: 8),
                      Text(
                        sitioList[index],
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// ==============================
/// Dummy BHW Profile Data
/// ==============================
final Map<String, String> bhwProfile = {
  'name': 'BHW Juanita',
  'position': 'Barangay Health Worker',
  'sitio': selectedSitio,
  'contact': '09123456789'
};

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SitioSelectionPage(),
  ));
}

class BhwHomePage extends StatelessWidget {
  const BhwHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BHWSystemApp();
  }
}

class BHWSystemApp extends StatelessWidget {
  const BHWSystemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BHW System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF7F9F8),
        fontFamily: 'Arial',
        primaryColor: const Color(0xFF4CAF50),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF4CAF50),
          foregroundColor: Colors.white,
        ),
      ),
      home: const MainNavigation(),
    );
  }
}

/// ==============================
/// Global Data
/// ==============================
final List<Map<String, dynamic>> childrenMasterlist = [
  {
    'name': 'Juan Dela Cruz',
    'age': 3,
    'gender': 'Male',
    'birthday': 'Jan 10, 2022',
    'schedule': null
  },
  {
    'name': 'Maria Clara',
    'age': 4,
    'gender': 'Female',
    'birthday': 'Feb 5, 2021',
    'schedule': null
  },
  {
    'name': 'Jose Rizal',
    'age': 2,
    'gender': 'Male',
    'birthday': 'Mar 15, 2023',
    'schedule': null
  },
  {
    'name': 'Ana Santos',
    'age': 2,
    'gender': 'Female',
    'birthday': 'Apr 20, 2022',
    'schedule': null
  },
  {
    'name': 'Pedro Pascual',
    'age': 4,
    'gender': 'Male',
    'birthday': 'May 8, 2021',
    'schedule': null
  },
  {
    'name': 'Liza Soberano',
    'age': 1,
    'gender': 'Female',
    'birthday': 'Jun 12, 2024',
    'schedule': null
  },
];

final List<String> vaccineList = [
  'BCG',
  'OPV',
  'Pentavalent',
  'Measles',
  'Hepatitis B',
  'Rotavirus',
  'PCV'
];

final Map<String, Map<String, bool>> vaccineStatus = {
  'Juan Dela Cruz': {
    'BCG': true,
    'OPV': true,
    'Pentavalent': false,
    'Measles': false,
    'Hepatitis B': false,
    'Rotavirus': false,
    'PCV': false
  },
  'Maria Clara': {
    'BCG': true,
    'OPV': true,
    'Pentavalent': true,
    'Measles': true,
    'Hepatitis B': true,
    'Rotavirus': false,
    'PCV': true
  },
  'Jose Rizal': {
    'BCG': false,
    'OPV': false,
    'Pentavalent': false,
    'Measles': false,
    'Hepatitis B': false,
    'Rotavirus': false,
    'PCV': false
  },
  'Ana Santos': {
    'BCG': false,
    'OPV': false,
    'Pentavalent': false,
    'Measles': false,
    'Hepatitis B': false,
    'Rotavirus': false,
    'PCV': false
  },
  'Pedro Pascual': {
    'BCG': false,
    'OPV': false,
    'Pentavalent': false,
    'Measles': false,
    'Hepatitis B': false,
    'Rotavirus': false,
    'PCV': false
  },
  'Liza Soberano': {
    'BCG': false,
    'OPV': false,
    'Pentavalent': false,
    'Measles': false,
    'Hepatitis B': false,
    'Rotavirus': false,
    'PCV': false
  },
};

final Map<String, Map<String, String>> vaccineLogs = {};

/// ==============================
/// Main Navigation
/// ==============================
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const DashboardPage(),
    const ChildrenInfoPage(),
    const VaccineStatusPage(),
    const ReportsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: const Color(0xFF4CAF50),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Masterlist'),
          BottomNavigationBarItem(icon: Icon(Icons.vaccines), label: 'Vaccine Status'),
          BottomNavigationBarItem(icon: Icon(Icons.picture_as_pdf), label: 'Reports'),
        ],
      ),
    );
  }
}

/// ==============================
/// Dashboard Page (Statistics)
/// ==============================
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    int complete = childrenMasterlist.where((c) => vaccineStatus[c['name']]?.values.every((v) => v) ?? false).length;
    int incomplete = childrenMasterlist.length - complete;
    int scheduledToday = childrenMasterlist.where((child) {
      final s = child['schedule'];
      if (s == null) return false;
      final today = DateTime.now();
      return s.day == today.day && s.month == today.month && s.year == today.year;
    }).length;

    int maleCount = childrenMasterlist.where((c) => c['gender'] == 'Male').length;
    int femaleCount = childrenMasterlist.where((c) => c['gender'] == 'Female').length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, size: 32),
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => Dialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.green[200],
                          child: const Icon(Icons.person, size: 40, color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          bhwProfile['name'] ?? '',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          bhwProfile['position'] ?? '',
                          style: const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const Divider(height: 32),
                        Row(
                          children: [
                            const Icon(Icons.location_on, color: Colors.green),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Sitio: ${selectedSitio.isEmpty ? 'Nothing has been selected' : selectedSitio}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.phone, color: Colors.green),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Contact: ${bhwProfile['contact']}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.pop(ctx),
                              child: const Text('Close'),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (_) => const SitioSelectionPage()),
                                  (route) => false,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 177, 244, 54),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                              icon: const Icon(Icons.logout),
                              label: const Text('Logout'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.male, color: Colors.blue),
                title: Text('Male Children: $maleCount'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.female, color: Colors.pink),
                title: Text('Female Children: $femaleCount'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.check_circle, color: Colors.green),
                title: Text('Complete Vaccinations: $complete'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.error, color: Colors.red),
                title: Text('Incomplete Vaccinations: $incomplete'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.notifications, color: Colors.orange),
                title: Text('Scheduled Today: $scheduledToday'),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Vaccines Given (Pie Chart)', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              height: 200,
              child: Center(
                child: Text(
                  'Pie chart placeholder\n(Use charts_flutter or fl_chart for real chart)',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ==============================
/// Children Info Page (Masterlist)
/// ==============================
class ChildrenInfoPage extends StatefulWidget {
  const ChildrenInfoPage({super.key});

  @override
  State<ChildrenInfoPage> createState() => _ChildrenInfoPageState();
}

class _ChildrenInfoPageState extends State<ChildrenInfoPage> {
  int todayCount = 0;
  String search = '';
  String filterAge = 'All';
  String filterGender = 'All';

  @override
  void initState() {
    super.initState();
    _updateTodayCount();
  }

  void _updateTodayCount() {
    final today = DateTime.now();
    setState(() {
      todayCount = childrenMasterlist
          .where((child) =>
              child['schedule'] != null &&
              child['schedule'].day == today.day &&
              child['schedule'].month == today.month &&
              child['schedule'].year == today.year)
          .length;
    });
  }

  void _showNotificationDialog() {
    final today = DateTime.now();
    final todaySchedules = childrenMasterlist
        .where((child) =>
            child['schedule'] != null &&
            child['schedule'].day == today.day &&
            child['schedule'].month == today.month &&
            child['schedule'].year == today.year)
        .toList();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Today\'s Schedule'),
        content: todaySchedules.isEmpty
            ? const Text('No children scheduled for today.')
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: todaySchedules
                    .map((child) => ListTile(
                          leading: const Icon(Icons.child_care),
                          title: Text(child['name']),
                          subtitle: const Text('Scheduled for vaccination today'),
                        ))
                    .toList(),
              ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Close')),
        ],
      ),
    );
  }

  void _setSchedule(int index) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        childrenMasterlist[index]['schedule'] = picked;
        _updateTodayCount();
      });
    }
  }

  bool _isComplete(String name) {
    final status = vaccineStatus[name]!;
    return status.values.every((v) => v == true);
  }

  void _showAddChildDialog() {
    final nameController = TextEditingController();
    final ageController = TextEditingController();
    String genderValue = 'Male';
    final birthdayController = TextEditingController();
    DateTime? pickedBirthday;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Add New Child'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Name')),
              TextField(controller: ageController, decoration: const InputDecoration(labelText: 'Age'), keyboardType: TextInputType.number),
              DropdownButtonFormField<String>(
                value: genderValue,
                items: ['Male', 'Female'].map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
                onChanged: (val) => genderValue = val ?? 'Male',
                decoration: const InputDecoration(labelText: 'Gender'),
              ),
              TextField(
                controller: birthdayController,
                decoration: const InputDecoration(labelText: 'Birthday'),
                readOnly: true,
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2010),
                    lastDate: DateTime(2030),
                  );
                  if (picked != null) {
                    pickedBirthday = picked;
                    birthdayController.text = "${picked.month}/${picked.day}/${picked.year}";
                  }
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty && ageController.text.isNotEmpty) {
                setState(() {
                  childrenMasterlist.add({
                    'name': nameController.text,
                    'age': int.tryParse(ageController.text) ?? 0,
                    'gender': genderValue,
                    'birthday': birthdayController.text,
                    'schedule': null
                  });

                  vaccineStatus[nameController.text] = {
                    for (var v in vaccineList) v: false
                  };
                  vaccineLogs[nameController.text] = {};
                });
                Navigator.pop(ctx);
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4CAF50)),
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _showEditChildDialog(int index) {
    final child = childrenMasterlist[index];
    final nameController = TextEditingController(text: child['name']);
    final ageController = TextEditingController(text: child['age'].toString());
    String genderValue = child['gender'];
    final birthdayController = TextEditingController(text: child['birthday']);
    DateTime? pickedBirthday;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Edit Child'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Name')),
              TextField(controller: ageController, decoration: const InputDecoration(labelText: 'Age'), keyboardType: TextInputType.number),
              DropdownButtonFormField<String>(
                value: genderValue,
                items: ['Male', 'Female'].map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
                onChanged: (val) => genderValue = val ?? 'Male',
                decoration: const InputDecoration(labelText: 'Gender'),
              ),
              TextField(
                controller: birthdayController,
                decoration: const InputDecoration(labelText: 'Birthday'),
                readOnly: true,
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2010),
                    lastDate: DateTime(2030),
                  );
                  if (picked != null) {
                    pickedBirthday = picked;
                    birthdayController.text = "${picked.month}/${picked.day}/${picked.year}";
                  }
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              setState(() {
                childrenMasterlist[index] = {
                  'name': nameController.text,
                  'age': int.tryParse(ageController.text) ?? 0,
                  'gender': genderValue,
                  'birthday': birthdayController.text,
                  'schedule': child['schedule']
                };
              });
              Navigator.pop(ctx);
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4CAF50)),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _deleteChild(int index) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Child'),
        content: const Text('Are you sure you want to delete this child?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              setState(() {
                vaccineStatus.remove(childrenMasterlist[index]['name']);
                vaccineLogs.remove(childrenMasterlist[index]['name']);
                childrenMasterlist.removeAt(index);
              });
              Navigator.pop(ctx);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> get filteredChildren {
    return childrenMasterlist.where((child) {
      final matchesSearch = search.isEmpty || child['name'].toLowerCase().contains(search.toLowerCase());
      final matchesAge = filterAge == 'All' || child['age'].toString() == filterAge;
      final matchesGender = filterGender == 'All' || child['gender'] == filterGender;
      return matchesSearch && matchesAge && matchesGender;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // Ensure vaccineStatus is initialized for all children
    for (var child in childrenMasterlist) {
      vaccineStatus[child['name']] ??= {for (var v in vaccineList) v: false};
      vaccineLogs[child['name']] ??= {};
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Children Masterlist'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: _showNotificationDialog,
              ),
              if (todayCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                    child: Text(
                      todayCount.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
        Row(
          children: [
       Expanded(
      child: TextField(
        decoration: const InputDecoration(labelText: 'Search by name'),
        onChanged: (val) => setState(() => search = val),
      ),
    ),
    const SizedBox(width: 8),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Age', style: TextStyle(fontWeight: FontWeight.bold)),
        DropdownButton<String>(
          value: filterAge,
          items: [
            'All',
            ...childrenMasterlist.map((c) => c['age'].toString()).toSet().toList()
          ].map((age) => DropdownMenuItem(value: age, child: Text(age))).toList(),
          onChanged: (val) => setState(() => filterAge = val ?? 'All'),
        ),
      ],
    ),
    const SizedBox(width: 8),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Gender', style: TextStyle(fontWeight: FontWeight.bold)),
        DropdownButton<String>(
          value: filterGender,
          items: ['All', 'Male', 'Female'].map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
          onChanged: (val) => setState(() => filterGender = val ?? 'All'),
        ),
      ],
    ),
  ],
   ),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingRowColor: MaterialStateProperty.all(const Color(0xFF4CAF50).withOpacity(0.2)),
                    columns: const [
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Age')),
                      DataColumn(label: Text('Gender')),
                      DataColumn(label: Text('Birthday')),
                      DataColumn(label: Text('Schedule')),
                      DataColumn(label: Text('Status')),
                      DataColumn(label: Text('Action')),
                    ],
                    rows: filteredChildren.asMap().entries.map((entry) {
                      final index = entry.key;
                      final child = entry.value;
                      final masterIndex = childrenMasterlist.indexOf(child);
                      return DataRow(cells: [
                        DataCell(Text(child['name'])),
                        DataCell(Text(child['age'].toString())),
                        DataCell(Text(child['gender'])),
                        DataCell(Text(child['birthday'])),
                        DataCell(Text(child['schedule'] == null
                            ? 'Not set'
                            : "${child['schedule'].month}/${child['schedule'].day}/${child['schedule'].year}")),
                        DataCell(Text(_isComplete(child['name']) ? 'Complete' : 'Incomplete',
                            style: TextStyle(color: _isComplete(child['name']) ? Colors.green : Colors.red))),
                        DataCell(Row(
                          children: [
                            ElevatedButton(
                              onPressed: () => _setSchedule(masterIndex),
                              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4CAF50)),
                              child: const Text('Set'),
                            ),
                            const SizedBox(width: 4),
                            ElevatedButton(
                              onPressed: () => _showEditChildDialog(masterIndex),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                              child: const Text('Edit'),
                            ),
                            const SizedBox(width: 4),
                            ElevatedButton(
                              onPressed: () => _deleteChild(masterIndex),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                              child: const Text('Delete'),
                            ),
                          ],
                        )),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddChildDialog,
        backgroundColor: const Color(0xFF4CAF50),
        child: const Icon(Icons.add),
      ),
    );
  }
}

/// ==============================
/// Vaccine Status Page
/// ==============================
class VaccineStatusPage extends StatefulWidget {
  const VaccineStatusPage({super.key});

  @override
  State<VaccineStatusPage> createState() => _VaccineStatusPageState();
}

class _VaccineStatusPageState extends State<VaccineStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vaccine Status')),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(16),
        child: DataTable(
          headingRowColor: MaterialStateProperty.all(const Color(0xFF4CAF50).withOpacity(0.2)),
          columns: [
            const DataColumn(label: Text('Name')),
            ...vaccineList.map((v) => DataColumn(label: Text(v))),
            const DataColumn(label: Text('Logs')),
          ],
          rows: childrenMasterlist.map((child) {
            final name = child['name'];
            vaccineStatus[name] ??= {for (var v in vaccineList) v: false};
            vaccineLogs[name] ??= {};
            return DataRow(
              cells: [
                DataCell(Text(name)),
                ...vaccineList.map((v) {
                  return DataCell(Checkbox(
                    value: vaccineStatus[name]![v],
                    onChanged: (val) {
                      setState(() {
                        vaccineStatus[name]![v] = val!;
                        if (val) {
                          vaccineLogs[name]![v] = DateTime.now().toIso8601String().substring(0, 10);
                        } else {
                          vaccineLogs[name]!.remove(v);
                        }
                      });
                    },
                  ));
                }),
                DataCell(
                  IconButton(
                    icon: const Icon(Icons.history),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text('Vaccine Logs for $name'),
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: vaccineList.map((v) {
                                final log = vaccineLogs[name]![v];
                                return ListTile(
                                  title: Text(v),
                                  subtitle: Text(log != null ? 'Given on $log' : 'Not given'),
                                );
                              }).toList(),
                            ),
                          ),
                          actions: [
                            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Close')),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

/// ==============================
/// Reports Page (Export to PDF/CSV)
/// ==============================
class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  Future<void> _generatePDF(BuildContext context) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Children Masterlist Report', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Table.fromTextArray(
                headers: ['Name', 'Age', 'Gender', 'Birthday', 'Status'],
                data: childrenMasterlist.map((child) => [
                  child['name'],
                  child['age'].toString(),
                  child['gender'],
                  child['birthday'],
                  vaccineStatus[child['name']]!.values.every((v) => v) ? 'Complete' : 'Incomplete',
                ]).toList(),
              ),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(onLayout: (format) async => pdf.save());
  }

  void _exportCSV(BuildContext context) {
    List<List<dynamic>> rows = [
      ['Name', 'Age', 'Gender', 'Birthday', 'Status']
    ];
    for (var child in childrenMasterlist) {
      rows.add([
        child['name'],
        child['age'].toString(),
        child['gender'],
        child['birthday'],
        vaccineStatus[child['name']]!.values.every((v) => v) ? 'Complete' : 'Incomplete',
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reports')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () => _generatePDF(context),
              icon: const Icon(Icons.picture_as_pdf),
              label: const Text('Generate PDF Report'),
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4CAF50)),
            ),
          ],
        ),
      ),
    );
  }
}
