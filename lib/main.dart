import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ai/ai_login.dart';
import 'ai/ai_mypage.dart';
import 'ai/ai_introduction.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI 자서전',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late bool isLogin = false;

  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final String apiUrl = 'http://127.0.0.1:3000/loginCheck';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      setState(() {
        isLogin = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildMain(),
          if(!isLogin) _buildLogin(),
        ],
      ),
    );
  }
  Widget _buildMain() {
    return Padding(
      padding: const EdgeInsets.only(top: 150,bottom: 100),
      child: Column(
        children: [
          Container(
            child: Text(
              "LIFE LEFACY",
              style: TextStyle(fontSize: 40),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text("AI와 음성인식 기술을 활용한\n맞춤형 자서전 제작 서비스"),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // 버튼 배경색 설정
                    foregroundColor: Colors.white,     // 글자 색
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),  // 모서리를 살짝 둥글게
                    ),
                  ),
                  child: Text(
                    '자서전 작성',
                    style: TextStyle(),
                  ),
                  onPressed: () {
                    // 실행될 코드 작성
                    if(!isLogin) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }else{
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IntroductionPage()),
                      );
                    }
                  }
                ),
              ),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                height: 40,
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),  // 모서리를 살짝 둥글게
                    ),
                  ),
                  child: Text('자서전 보기'),
                  onPressed: () {
                    if(!isLogin){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyPage()),
                      );
                    }
                  }
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
  Widget _buildLogin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 400,
          height: 40,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),  // 모서리를 살짝 둥글게
                ),
              ),
              child: Text(
                '로그인',
                style: TextStyle(),
              ),
              onPressed: () {
                // 실행될 코드 작성
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              }
          ),
        ),
      ],
    );
  }
}
