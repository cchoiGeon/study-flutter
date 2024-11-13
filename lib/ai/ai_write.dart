import 'package:flutter/material.dart';
import 'ai_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WritePage extends StatefulWidget {
  const WritePage({super.key});

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  final TextEditingController _textController = TextEditingController();
  final List<Map<String, String>> _messages = [];

  int mainIndex = 0;
  int subIndex = 0;
  bool isSecond = false;

  List<Map<String, dynamic>>? items; // 초기화 시 null로 설정
  Map<String, dynamic>? item; // 초기화 시 null로 설정
  String userCase = ""; // 기본값 설정

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final String apiUrl = 'http://127.0.0.1:3000/userCase';
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {

        // 서버 응답에서 `responseData['data']`를 확인하고 userCase 설정
        final responseData = jsonDecode(response.body);
        setState(() {
          userCase = responseData['data'] ?? ""; // 기본값 추가

          // userCase에 따라 items 설정
          switch (userCase) {
            case "case1":
              items = case1;
              item = items![0];
              break;
            case "case2":
              items = case2;
              item = items![0];
              break;
            case "case3":
              items = case3;
              item = items![0];
              break;
            case "case4":
              items = case4;
              item = items![0];
              break;
            case "case5":
              items = case5;
              item = items![0];
              break;
            case "case6":
              items = case6;
              item = items![0];
              break;
            default:
              items = []; // 예외적으로 빈 리스트 설정
              item = items![0];
            }
        });
      } else {
        print("로그인 실패");
      }
    } catch (e) {
      print("네트워크 오류: $e");
      setState(() {
        items = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: item == null || item!.isEmpty
          ? Center(child: CircularProgressIndicator())
          : _buildScrollableContent(),
      bottomNavigationBar: _buildBottomChattingBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Text(
        item != null && item!.isNotEmpty ? item!['title'] : "로딩 중",
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _buildScrollableContent() {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: [
        _buildDefaultMessage(),
        _buildMessageList(),
      ],
    );
  }

  Widget _buildDefaultMessage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(item != null && item!.isNotEmpty ? item!['questions'][0] : "로딩 중",),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    return Column(
      children: _messages.map((message) {
        bool isUser = message['sender'] == "User";
        return Align(
          alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isUser ? Colors.blue.shade200 : Colors.grey.shade200,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(message['message'] ?? '메시지가 없습니다.'),
            ),
          ),
        );
      }).toList(),
    );
  }


  Widget _buildBottomChattingBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            ),
            Expanded(
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "답변을 입력하세요",
                ),
              ),
            ),
            IconButton(
              onPressed: _sendMessage,
              icon: Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _sendMessage() async {
    final message = _textController.text;
    if (message.isEmpty) return;

    setState(() {
      _messages.add({
        'sender': 'User',
        'message': message,
      });
    });

    _textController.clear();
    if (!isSecond) {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:3000/write/create'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'message': message}),
      );
      if (response.statusCode == 200) {
        final responseMessage = jsonDecode(response.body)['response'];
        setState(() {
          _messages.add({
            'sender': 'AI',
            'message': responseMessage,
          });
          isSecond = true;
        });
      } else {
        print('첫 번째 API 호출 오류');
      }
    } else {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:3000/write/save'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'message': message}),
      );

      if (response.statusCode == 200) {
        final responseMessage = jsonDecode(response.body)['response'];
        setState(() {
          _messages.add({
            'sender': 'AI',
            'message': "이렇게 저장했어요 !",
          });
          _messages.add({
            'sender': 'AI',
            'message': responseMessage,
          });
          isSecond = false;
          subIndex++;
          if(subIndex == 5) {
            if(mainIndex != 8 ){
              mainIndex++; // 여기 수정해야됨
              subIndex = 0;
              _messages.clear();
              item = items![mainIndex];
            }else{
              // 해당 페이지 빠져 나오기
            }

          }else{
            _messages.add({
              'sender' : 'AI',
              'message' : items![mainIndex]['questions'][subIndex],
            });
          }
        });
      } else {
        print('두 번째 API 호출 오류');
      }
    }
  }
}
