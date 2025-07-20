import 'package:flutter/material.dart';
import 'mho_pages.dart';       // contains BarangaySelectionPage()
import 'bns_home_page.dart';   // contains BnsHomePage
import 'bhw_home_page.dart';   // contains BhwHomePage

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _selectedUserType;

  /// Validate email format
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter email';
    }
    // Simple regex for email validation
    const pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    if (!RegExp(pattern).hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  /// Validate password
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  /// Submit form
  void _submitForm() {
    if (_formKey.currentState!.validate() && _selectedUserType != null) {
      Widget targetPage;

      switch (_selectedUserType) {
        case 'MHO':
          targetPage = BarangaySelectionPage();
          break;
        case 'BNS':
          targetPage = const BnsHomePage();
          break;
        case 'BHW':
          targetPage = const BhwHomePage();
          break;
        default:
          return;
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => targetPage),
      );
    } else {
      // Show snackbar if user type is not selected
      if (_selectedUserType == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select user type')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F4EA),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 60),
            ClipOval(
              child: Image.asset(
                'assets/image/logo.png',
                height: 100,
                width: 100,
              ),
            ),
            const SizedBox(height: 20),
            const Text("LOGIN", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction, // Real-time validation
              child: Column(
                children: [
                  /// Email Field
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: _validateEmail,
                  ),
                  const SizedBox(height: 16),

                  /// Password Field
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: _validatePassword,
                  ),
                  const SizedBox(height: 16),

                  /// User Type Dropdown
                  DropdownButtonFormField<String>(
                    value: _selectedUserType,
                    items: ['MHO', 'BNS', 'BHW'].map((role) {
                      return DropdownMenuItem(value: role, child: Text(role));
                    }).toList(),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      hintText: 'Select User Type',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => setState(() => _selectedUserType = value),
                    validator: (value) => value == null ? 'Select user type' : null,
                  ),
                  const SizedBox(height: 24),

                  /// Login Button
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF73B36B),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text("LOGIN", style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
