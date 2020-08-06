// import'dart:async';

// var count = 0;
// const TIMEOUT = const Duration(seconds: 5);
// const MS = const Duration(milliseconds: 1);

// void main() {
//   // 1. Running a function repeatedly:
//   const PERIOD = const Duration(seconds:2);
//   newTimer.periodic(PERIOD, repeatMe);
//   // 3. Running a function once after some time:
//   const AFTER70MS = const Duration(milliseconds:70);
//   new Timer(AFTER70MS, () => print('this was quick!'));
//   // 4. Running a function asap:
//   Timer.run(() => print('I ran asap!'));
//   // 5. Calculating a period and provoking a timeout:
//   startTimeout(500);
// }

// repeatMe(Timer t) {
//   print("I have a repetetive job, and I'm active is ${t.isActive}!");
//   count++;
//   // 2. Stop the repetition:
//   if (count==4 &&t.isActive) {
//   t.cancel();
//  ...
