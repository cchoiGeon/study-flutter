import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../main.dart'; // HomePage가 정의된 파일을 import합니다.

class LoginPage extends StatelessWidget {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login(BuildContext context) async {
    final String apiUrl = 'http://127.0.0.1:3000/login';
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'id': _idController.text,
        'password': _passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      print("로그인 성공");

      // 로그인 성공 시 HomePage로 이동
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    } else {
      print("로그인 실패");
      // 실패 시 에러 메시지를 보여줄 수도 있습니다.
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("로그인 실패"),
          content: Text("아이디 또는 비밀번호가 잘못되었습니다."),
          actions: [
            TextButton(
              child: Text("확인"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 200, bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _loginText(),
            _loginLogic(context), // context를 전달합니다.
          ],
        ),
      ),
    );
  }

  Widget _loginText() {
    return Container(
      child: Text(
        "로그인",
        style: TextStyle(fontSize: 40),
      ),
    );
  }

  Widget _loginLogic(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '아이디',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _idController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "아이디를 입력하세요",
            ),
          ),
          SizedBox(height: 10),
          Text(
            '비밀번호',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "비밀번호를 입력하세요",
            ),
          ),
          SizedBox(height: 40),
          Column(
            children: [
              SizedBox(
                height: 40,
                width: 500,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text('로그인'),
                  onPressed: () => _login(context), // context를 전달합니다.
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
