// import 'package:flutter/material.dart';

// class RegisterScreen extends StatefulWidget {
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   int _currentStep = 0;
//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _birthdayController = TextEditingController();
//   TextEditingController _educationController = TextEditingController();
//   String? _selectedGender;
//   List<String> _personalPreferences = [];

//   List<Step> _steps = [
//     Step(
//       title: Text('Connect with Google Account'),
//       content: Container(
//         child: Text('Connect with Google'),
//       ),
//       isActive: true,
//     ),
//     Step(
//       title: Text('Fill in User Information'),
//       content: Column(
//         children: [
//           TextFormField(
//             controller: _usernameController,
//             decoration: InputDecoration(
//               labelText: 'Username',
//             ),
//           ),
//           TextFormField(
//             controller: _birthdayController,
//             decoration: InputDecoration(
//               labelText: 'Birthday',
//             ),
//           ),
//           TextFormField(
//             controller: _educationController,
//             decoration: InputDecoration(
//               labelText: 'Education',
//             ),
//           ),
//         ],
//       ),
//       isActive: false,
//     ),
//     Step(
//       title: Text('Select Gender'),
//       content: Column(
//         children: [
//           RadioListTile(
//             title: Text('Male'),
//             value: 'male',
//             groupValue: _selectedGender,
//             onChanged: (value) {
//               setState(() {
//                 _selectedGender = value;
//               });
//             },
//           ),
//           RadioListTile(
//             title: Text('Female'),
//             value: 'female',
//             groupValue: _selectedGender,
//             onChanged: (value) {
//               setState(() {
//                 _selectedGender = value;
//               });
//             },
//           ),
//         ],
//       ),
//       isActive: false,
//     ),
//     Step(
//       title: Text('Choose Personal Preferences'),
//       content: Column(
//         children: [
//           CheckboxListTile(
//             title: Text('Option 1'),
//             value: _personalPreferences.contains('Option 1'),
//             onChanged: (value) {
//               setState(() {
//                 if (value) {
//                   _personalPreferences.add('Option 1');
//                 } else {
//                   _personalPreferences.remove('Option 1');
//                 }
//               });
//             },
//           ),
//           CheckboxListTile(
//             title: Text('Option 2'),
//             value: _personalPreferences.contains('Option 2'),
//             onChanged: (value) {
//               setState(() {
//                 if (value) {
//                   _personalPreferences.add('Option 2');
//                 } else {
//                   _personalPreferences.remove('Option 2');
//                 }
//               });
//             },
//           ),
//         ],
//       ),
//       isActive: false,
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Register'),
//       ),
//       body: Stepper(
//         steps: _steps,
//         currentStep: _currentStep,
//         onStepContinue: () {
//           setState(() {
//             if (_currentStep < _steps.length - 1) {
//               _currentStep++;
//             } else {
//               // Submit form
//             }
//           });
//         },
//         onStepCancel: () {
//           setState(() {
//             if (_currentStep > 0) {
//               _currentStep--;
//             } else {
//               _currentStep = 0;
//             }
//           });
//         },
//         controlsBuilder: (BuildContext context,
//             {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
//           return Row(
//             children: [
//               FlatButton(
//                 onPressed: onStepCancel,
//                 child: Text('Back'),
//               ),
//               FlatButton(
//                 onPressed: onStepContinue,
//                 child:
//                     Text(_currentStep == _steps.length - 1 ? 'Submit' : 'Next'),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
