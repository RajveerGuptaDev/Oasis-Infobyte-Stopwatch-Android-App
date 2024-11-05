import 'dart:async';
import 'dart:core';


import 'package:flutter/material.dart';
import 'package:watchapp/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'Stop Watch',
      theme: ThemeData(
        brightness: Brightness.dark,
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String hoursString = "00" , minutesString = "00" ,  secondsString = "00" ;
  int hours = 00 , minutes = 00 , seconds = 00;
bool isTimerRunning = false;
   late Timer _timer;

  @override

  void startTimer(){
    setState(() {
      isTimerRunning = true;
    });
   _timer = Timer.periodic(const Duration(seconds: 1),(timer){
         _startSecond();
    });
  }
  void pauseTimer(){
    _timer.cancel();
    setState(() {
      isTimerRunning = false;
    });
  }

  void _startSecond (){
    setState(() {
      if(seconds < 59 ){
        seconds++;
        secondsString = seconds.toString();
        if( secondsString.length == 1) {
          secondsString = "0$secondsString";
        }

      }else {
        _startMinute();
      }
    });
  }
  void _startMinute() {
   setState(() {
    if (minutes < 59){
      seconds = 00;
      secondsString = "00";
      minutes++;
      minutesString = minutes.toString();
      if (minutesString.length == 1) {
        minutesString = "0" + minutesString;
      }
    }else {
      _startHours();
    }
   });
  }

   void _startHours(){
    setState(() {
      seconds = 00;
      secondsString= "00";
      minutes=00;
      minutesString="00";
      hours++;
      hoursString = hours.toString();
      if(hoursString.length ==1 ){
        hoursString = "0" + hoursString;
      }
    });
   }

   void resetTimer(){
    _timer.cancel();
    setState(() {
      seconds=00;
      minutes=00;
      hours=00;
      secondsString= "00";
      minutesString= "00";
      hoursString= "00";
    });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:const  Text('STOPWATCH',style: TextStyle(
          color: Colors.yellow,
          backgroundColor: Colors.black
        ),),

      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                  Text(" $hoursString:$minutesString:$secondsString ",style: const TextStyle(
                    color: Colors.yellow,
                    backgroundColor: Colors.black87,
                    fontSize: 50,
                    fontWeight: FontWeight.bold
                  ),),
            SizedBox(
              width: 20,
              height: 20,
            ),
            ElevatedButton(onPressed: (){
              if (isTimerRunning ){
                pauseTimer();
              }else {
                startTimer();
              }
            },
                child: Text( isTimerRunning ? "Hold" : "Start",style: const TextStyle(
                  color: Colors.yellow,
                  fontSize: 30,
                ),),





            ),
            SizedBox(
              width: 20,
              height: 20,
            ),
            ElevatedButton(onPressed: (){
              resetTimer();
            },
                child: const Text("Reset", style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 30,

                ),))
          ],
        ),
      ),
    );
  }
}
