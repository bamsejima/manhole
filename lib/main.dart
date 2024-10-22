import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = const WindowOptions(
    center: true,
    fullScreen: false,
    size: Size(960, 800),
    minimumSize: Size(960, 800),
    titleBarStyle: TitleBarStyle.normal,
    windowButtonVisibility: true,
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  // debugPaintSizeEnabled = true;
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      title: 'ManHole Monitoring - 데이터 플로우 테스트',
      home: const Scaffold(
        body: HomeWidget(),
      ),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    const headerData1 = Row(
      children: [
        Text('고유코드'),
        SizedBox(height: 20, width: 10),
        SizedBox(
          height: 20,
          width: 160,
          child: TextField(),
        ),
      ],
    );

    const headerdata2 = Row(
      children: [
        Text('식별코드'),
        SizedBox(width: 10),
        SizedBox(
          height: 20,
          width: 160,
          child: TextField(),
        ),
      ],
    );

    const headerData3 = Row(
      children: [
        Text('단말번호'),
        SizedBox(width: 10),
        SizedBox(
          height: 20,
          width: 160,
          child: TextField(),
        ),
      ],
    );

    const headerData4 = Row(
      children: [
        Text('전송타입'),
        SizedBox(width: 10),
        SizedBox(
          height: 20,
          width: 160,
          child: TextField(),
        ),
      ],
    );

    const serverData = Row(
      children: [
        Text('서버       '),
        SizedBox(width: 10),
        SizedBox(
          height: 20,
          width: 160,
          child: TextField(),
        ),
        SizedBox(width: 20),
        Text(
          '퍼블릭키',
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(width: 10),
        SizedBox(
          height: 20,
          width: 160,
          child: TextField(
            style: TextStyle(color: Colors.grey),
            enabled: false,
          ),
        ),
      ],
    );

    const transPort = Row(
      children: [
        Text('전송포트'),
        SizedBox(width: 10),
        SizedBox(
          height: 20,
          width: 160,
          child: TextField(),
        ),
        SizedBox(width: 20),
        Text(
          '전송시간',
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(width: 10),
        SizedBox(
          height: 20,
          width: 160,
          child: TextField(
            enabled: false,
          ),
        ),
      ],
    );

    const recvPort = Row(
      children: [
        Text('수신포트'),
        SizedBox(width: 10),
        SizedBox(
          height: 20,
          width: 160,
          child: TextField(),
        ),
      ],
    );

    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
    );

    final commandButtons = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FilledButton(
          onPressed: () {
            debugPrint('서버접속');
          },
          style: style,
          child: const Text('서버접속'),
        ),
        const SizedBox(width: 10),
        FilledButton(
          onPressed: null,
          style: style,
          child: const Text('키값요청'),
        ),
        const SizedBox(width: 10),
        FilledButton(
          onPressed: null,
          style: style,
          child: const Text('키값삭제'),
        ),
        const SizedBox(width: 10),
        FilledButton(
          onPressed: null,
          style: style,
          child: const Text('데이타전송'),
        ),
      ],
    );

    const configTitle = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '헤더 및 기본정보 설정',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );

    const subTtile = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PAYLOAD',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );

    const sendDataTitle = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '전송데이터',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        SizedBox(
          height: 80,
          width: 900,
          child: TextField(
            keyboardType: TextInputType.text,
            minLines: 2,
            maxLines: 5,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
        ),
      ],
    );

    const recvDataTitle = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '수신데이터',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        SizedBox(
          height: 80,
          width: 900,
          child: TextField(
            keyboardType: TextInputType.text,
            minLines: 2,
            maxLines: 5,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
        ),
      ],
    );

    const payloadData1 = Row(
      children: [
        Text('맨홀열림'),
        SizedBox(width: 10),
        SizedBox(
          height: 20,
          width: 160,
          child: TextField(),
        ),
        SizedBox(width: 70),
        Text('산소       '),
        SizedBox(width: 24),
        SizedBox(
          width: 160,
          height: 20,
          child: TextField(),
        ),
        SizedBox(width: 34),
        Text('이산화질소'),
        SizedBox(width: 10),
        SizedBox(
          height: 20,
          width: 160,
          child: TextField(),
        ),
      ],
    );

    const payloadData2 = Row(
      children: [
        Text('수위체크'),
        SizedBox(width: 10),
        SizedBox(
          height: 20,
          width: 160,
          child: TextField(),
        ),
        SizedBox(width: 70),
        Text('황화수소'),
        SizedBox(width: 24),
        SizedBox(
          height: 20,
          width: 160,
          child: TextField(),
        ),
        SizedBox(width: 34),
        Text('습도'),
        SizedBox(width: 52),
        SizedBox(
          height: 20,
          width: 160,
          child: TextField(),
        ),
      ],
    );
    const payloadData3 = Row(
      children: [
        Text('밸브열림'),
        SizedBox(width: 10),
        SizedBox(
          height: 20,
          width: 160,
          child: TextField(),
        ),
        SizedBox(width: 70),
        Text('일산화탄소'),
        SizedBox(width: 10),
        SizedBox(
          height: 20,
          width: 160,
          child: TextField(),
        ),
        SizedBox(width: 34),
        Text('온도'),
        SizedBox(width: 52),
        SizedBox(
          height: 20,
          width: 160,
          child: TextField(),
        ),
      ],
    );

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 40,
            ),
            const SizedBox(
              width: 900,
              child: configTitle,
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 300,
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      headerData1,
                      headerdata2,
                      headerData3,
                      headerData4,
                    ],
                  ),
                ),
                SizedBox(
                  width: 600,
                  height: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      serverData,
                      transPort,
                      recvPort,
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
              width: 900,
              child: commandButtons,
            ),
            const SizedBox(
              height: 30,
              width: 700,
              child: Divider(),
            ),
            const SizedBox(
              width: 900,
              child: subTtile,
            ),
            const SizedBox(height: 20),
            const SizedBox(
              width: 900,
              child: payloadData1,
            ),
            const SizedBox(height: 10),
            const SizedBox(
              width: 900,
              child: payloadData2,
            ),
            const SizedBox(height: 10),
            const SizedBox(
              width: 900,
              child: payloadData3,
            ),
            const SizedBox(height: 30),
            const SizedBox(
              width: 900,
              child: sendDataTitle,
            ),
            const SizedBox(height: 30),
            const SizedBox(
              width: 900,
              child: recvDataTitle,
            ),
          ],
        ),
      ),
    );
  }
}
