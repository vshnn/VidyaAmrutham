import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vidyaamrutham/Teacher/pages/teacher_home.dart';

class RemoveStudent extends StatefulWidget {
  final String grade, section;

  RemoveStudent({Key? key, required this.grade, required this.section})
      : super(key: key);

  @override
  State<RemoveStudent> createState() => RemoveStudentState();
}

class RemoveStudentState extends State<RemoveStudent> {
  final Map<String, bool> _attendance = {};
  late Map<String, dynamic> data;

  Future<Map<String, dynamic>> getStudents() async {
    String? url = dotenv.env['SERVER'];
    var response = await http.get(Uri.parse(
        'https://$url/teacher/students/${widget.grade}/${widget.section}'));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Removal'),
      ),
      body: FutureBuilder(
        future: getStudents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              data = snapshot.data as Map<String, dynamic>;
              print(data);

              return Scrollable(viewportBuilder: (context, offset) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: data['result'].length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(data['result'][index]['name']),
                            subtitle: Text(
                                'Roll Number: ${data['result'][index]['roll_no']}'),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {},
                                ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              });
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  void submitAttendance() async {
    for (int i = 0; i < data['result'].length; i++) {
      if (_attendance[data['result'][i]['id'].toString()] == null) {
        _attendance[data['result'][i]['id'].toString()] = false;
      }
    }
    String? url = dotenv.env['SERVER'];
    var response = await http.post(
      Uri.parse('http://$url/teacher/attendance'),
      body: json.encode({
        'grade': widget.grade,
        'section': widget.section,
        'attendance': _attendance,
        'date': DateTime.now().toIso8601String(),
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    var result = json.decode(response.body);
    print(result);

    if (result['result'] == "Success") {
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Success'),
              content: const Text('Attendance Submitted'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Teacher1()),
                        (route) => false);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          });
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Failed'),
              content: const Text('Attendance Submission Failed'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Teacher1()),
                        (route) => false);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          });
    }
  }
}
