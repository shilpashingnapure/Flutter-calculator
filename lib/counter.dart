import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyCalulator extends StatefulWidget {
  const MyCalulator({super.key});

  @override
  State<MyCalulator> createState() => _MyCalulatorState();
}

class _MyCalulatorState extends State<MyCalulator> {
  String userInput = '';
  void getUserNum(num) {
    print(num);
    switch (num) {
      case 'AC':
        setState(() {
          if (userInput != '') {
            userInput = userInput.substring(0, userInput.length - 1);
          }
          ;
        });
        break;
      case 'C':
        setState(() {
          userInput = '';
        });
        break;
      case '=':
        var exp = Parser().parse(userInput);
        var evalution = exp.evaluate(EvaluationType.REAL, ContextModel());
        var res = evalution.toString();
        if (res.endsWith('0')) {
          res = res.replaceAll('.0', '');
        }
        setState(() {
          userInput = res;
        });
        break;
      default:
        setState(() {
          userInput += num;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          alignment: Alignment.bottomRight,
          width: 400,
          height: 250,
          padding: EdgeInsets.all(20),
          child: Text(
            (userInput != '') ? userInput : '0',
            style: TextStyle(fontSize: 60, color: Colors.white),
          ),
        ),
        Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: () => getUserNum('AC'),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Container(
                            child: Center(
                                child: Text(
                              'AC',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            )),
                            padding: EdgeInsets.all(15),
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        )),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        button(label: 'C'),
                        button(label: '/', color: Colors.grey)
                      ],
                    ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    button(label: '7', color: Colors.grey.shade800),
                    button(label: '8', color: Colors.grey.shade800),
                    button(label: '9', color: Colors.grey.shade800),
                    button(label: '*', color: Colors.grey)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    button(label: '4', color: Colors.grey.shade800),
                    button(label: '5', color: Colors.grey.shade800),
                    button(label: '6', color: Colors.grey.shade800),
                    button(label: '-')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    button(label: '1', color: Colors.grey.shade800),
                    button(label: '2', color: Colors.grey.shade800),
                    button(label: '3', color: Colors.grey.shade800),
                    button(label: '+', color: Colors.grey)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    button(label: '00', color: Colors.grey.shade800),
                    button(label: '0', color: Colors.grey.shade800),
                    button(label: '.', color: Colors.grey.shade800),
                    button(label: '=', color: Colors.amber.shade800)
                  ],
                )
              ],
            ))
      ],
    )));
  }

  Widget button({label, color = Colors.grey}) {
    return ElevatedButton(
        onPressed: () => getUserNum(label),
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            padding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        child: Text(
          label,
          style: TextStyle(fontSize: 30),
        ));
  }
}

// class button extends StatelessWidget {
//   button(
//       {super.key,
//       required this.label,
//       this.color = Colors.grey,
//       this.size = 30});

//   final String label;
//   final Color color;
//   final double size;

//   void getValues(val) {
//     print(val);
//     switch (val) {
//       case "C":
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//         onPressed: () => getValues(label),
//         style: ElevatedButton.styleFrom(
//             backgroundColor: color,
//             foregroundColor: Colors.white,
//             padding: EdgeInsets.all(10),
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(50))),
//         child: Text(
//           label,
//           style: TextStyle(fontSize: 30),
//         ));

//     // return GestureDetector(
//     //   onTap: () => getValues(label),
//     //   child: Material(
//     //       elevation: 8,
//     //       borderRadius: BorderRadius.circular(50),
//     //       child: CircleAvatar(
//     //         radius: 40,
//     //         backgroundColor: color,
//     //         child: Text(
//     //           label,
//     //           style: TextStyle(fontSize: size),
//     //         ),
//     //       )),
//     // );
//   }
// }
