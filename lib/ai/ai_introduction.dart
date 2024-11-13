import 'package:flutter/material.dart';
import 'package:flutterstudy/ai/ai_write.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final TextEditingController _textController = TextEditingController();
  final List<Map<String, String>> _messages = [];
  bool redirectNextPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildScrollableContent(), // ListView로 스크롤 기능 제공
      bottomNavigationBar: _buildBottomChattingBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Text(
        '자기 소개',
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _buildScrollableContent() {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: [
        _buildDefaultMessage(), // 기본 메시지
        _buildMessageList(), // 메시지 리스트
        if(redirectNextPage) _buildNextPage(), // 다음 페이지 텍스트
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
            child: Text(
              '안녕하세요 AI 작가, 새싹입니다! 이름, 나이, 성별,\n직업, 결혼유무, 자녀유무등을 포함한 간단한 자기\n소개를 부탁드려요.',
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '예시:\n안녕 나는 서울에 살고있는 홍길동이라고해.\n나는 남자고 55살이야. 나는 00고등학교를 졸업했고, 00일을 하고 있어.\n결혼한 지 23년차야. 나는 5살 아들과 3살 딸이 있어',
            ),
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
              child: Text(message['message'] ?? ''),
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

  Widget _buildNextPage() {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WritePage()),
        );
      },
      child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text('다음 페이지로 넘어가려면 이 글을 클릭하세요 !'),
            ),
          ),
        ),
    );
  }

  Future<void> _sendMessage() async {
    final message = _textController.text;
    if (message.isEmpty) return;

    setState(() {
      _messages.add({
        'sender' : 'User',
        'message' : message,
      });
    });

    _textController.clear();

    final response = await http.post(
      Uri.parse('http://127.0.0.1:5001/life-legacy-dev/asia-northeast3/api/chatGpt/makeCase'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'data': message}),
    );

    if (response.statusCode == 200) {
      final responseUserCase = jsonDecode(response.body)['result']['data'];
      final response2 = await http.get(Uri.parse('http://127.0.0.1:5001/life-legacy-dev/asia-northeast3/api/profile/me/main-question/$responseUserCase'));
      final responseUserMainQuestionList = jsonDecode(response2.body)['result']['data'];
      String userQuestionList = responseUserMainQuestionList.entries.map((entry) {
        return '${entry.key}. ${entry.value}';
      }).join('\n');

      setState(() {
        _messages.add({
          'sender': 'AI',
          'message': userQuestionList,
        });
        redirectNextPage = true;
      });
    } else {
      print('err');
    }
  }
}
