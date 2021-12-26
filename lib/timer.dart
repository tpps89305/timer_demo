import 'dart:async';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int timer01 = 60;
  int timer02 = 60;

  var period = const Duration(seconds: 1);
  Timer? _timer1;
  Timer? _timer2;

  void handleTimer1() {
    if (_timer1 == null) {
      // 如果沒有在計時，就建立新的物件。
      _timer1 = Timer.periodic(period, (timer) {
        if (timer01 < 1) {
          // Timer 呼叫 cancel() 方法後就無法再啟動。
          // 如果要重新計時，就將原本的物件清除，再初始化新的。
          setState(() {
            timer.cancel();
            _timer1 = null;
          });
        } else {
          setState(() {
            timer01--;
          });
        }
      });
    } else {
      // 如果有 Timer 運作中，就停止它。
      if (_timer1!.isActive) {
        setState(() {
          _timer1!.cancel();
          _timer1 = null;
        });
      }
    }
  }

  void handleTimer2() {
    if (_timer2 == null) {
      // 如果沒有在計時，就建立新的物件。
      _timer2 = Timer.periodic(period, (timer) {
        if (timer02 < 1) {
          // Timer 呼叫 cancel() 方法後就無法再啟動。
          // 如果要重新計時，就將原本的物件清除，再初始化新的。
          setState(() {
            timer.cancel();
            _timer2 = null;
          });
        } else {
          setState(() {
            timer02--;
          });
        }
      });
    } else {
      // 如果有 Timer 運作中，就停止它。
      if (_timer2!.isActive) {
        setState(() {
          _timer2!.cancel();
          _timer2 = null;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var isTimer1Running = false;
    var isTimer2Running = false;

    if (_timer1 == null) {
      isTimer1Running = false;
    } else {
      isTimer1Running = _timer1!.isActive;
    }

    if (_timer2 == null) {
      isTimer2Running = false;
    } else {
      isTimer2Running = _timer2!.isActive;
    }

    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(timer01.toString()),
                ElevatedButton(
                    onPressed: () {
                      handleTimer1();
                    },
                    child: Text(isTimer1Running ? "PAUSE" : "START"))
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(timer02.toString()),
                ElevatedButton(
                    onPressed: () {
                      handleTimer2();
                    },
                    child: Text(isTimer2Running ? "PAUSE" : "START"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
