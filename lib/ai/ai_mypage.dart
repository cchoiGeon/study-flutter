import 'package:flutter/material.dart';
import 'package:flutterstudy/ai/ai_introduction.dart';
import 'package:flutterstudy/main.dart';
import 'package:flutterstudy/ai/ai_list.dart';
import 'package:flutterstudy/ai/ai_write.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int _currentIndex = 2;
  late String userCase;
  List<Map<String, dynamic>>? items; // Nullable로 변경하여 로딩 상태를 체크

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final String apiUrl = 'http://127.0.0.1:3000/userCase';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      print("로그인 성공");

      // 예제에서 사용된 `response.body.data`는 실제 데이터에 맞게 수정이 필요합니다.
      final responseData = jsonDecode(response.body);
      userCase = responseData['data'];

      // userCase에 따라 items 설정
      setState(() {
        if (userCase == "case1") {
          items = case1;
        } else if (userCase == "case2") {
          items = case2;
        } else if (userCase == "case3") {
          items = case3;
        } else if (userCase == "case4") {
          items = case4;
        } else if (userCase == "case5") {
          items = case5;
        } else if (userCase == "case6") {
          items = case6;
        }
      });
    } else {
      print("실패");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: items == null
          ? Center(child: CircularProgressIndicator()) // 로딩 중일 때 인디케이터 표시
          : Column(
        children: [
          Expanded(child: _buildList()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (index == 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => WritePage()),
              );
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IntroductionPage()),
              );
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '자서전 작성',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '자기소개',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '내 자서전',
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Text(
        '나의 자서전',
        style: TextStyle(
          color: Colors.white
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: items!.length,
      itemBuilder: (context, index) {
        return ExpansionTile(
          title: Text(items![index]["title"]),
          children: (items![index]["questions"] as List<String>)
            .map((question) => InkWell(
              onTap: () {
                print('$question 눌림');
              },
              child: ListTile(
                title: Text(question),
              ),
            )
          ).toList(),
        );
      },
    );
  }
}
