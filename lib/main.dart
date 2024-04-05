import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(const App());

//   const String userdetails = '''
//    {
//      "name": "Kebedech Zeleke",
//      "department": "Software Engineering",
//      "id": "1311576",
//      "email": "kebedech@gmail.com",
//      "university": "Bahir Dar",
//      "propic": "asset/e.webp",
//      "logo": "asset/bduLogo.jpg"
//    }
// ''';

  // runApp(const StudentPage(student_details: userdetails));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Login(),
    );
  }
}
