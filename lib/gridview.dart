import 'package:flutter/material.dart';
import 'package:fluttertask/custom_text.dart';

class HighlightGridScreen extends StatefulWidget {
  @override
  _HighlightGridScreenState createState() => _HighlightGridScreenState();
}

class _HighlightGridScreenState extends State<HighlightGridScreen> {
  String selectedRule = 'Odd Numbers'; 

  // Rules for different highlighting logic
  bool isOdd(int number) => number % 2 != 0;
  bool isEven(int number) => number % 2 == 0;
  bool isPrime(int number) {
    if (number < 2) return false;
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  bool isFibonacci(int number) {
    int a = 0, b = 1, temp;
    while (b < number) {
      temp = a + b;
      a = b;
      b = temp;
    }
    return b == number || number == 0;
  }

 
  bool highlightNumber(int number) {
    switch (selectedRule) {
      case 'Odd Numbers':
        return isOdd(number);
      case 'Even Numbers':
        return isEven(number);
      case 'Prime Numbers':
        return isPrime(number);
      case 'Fibonacci Numbers':
        return isFibonacci(number);
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple,
        centerTitle: true,
        title:const MyText(text:'Number Highlighter',textSize: 20,textColor: Colors.white,),
      ),
      body: Column(
        children: [
          // Dropdown for rule selection
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButton<String>(
              value: selectedRule,
              items: [
                'Odd Numbers',
                'Even Numbers',
                'Prime Numbers',
                'Fibonacci Numbers'
              ].map((rule) {
                return DropdownMenuItem(
                  value: rule,
                  child: MyText(text:rule,textSize: 15,),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedRule = newValue!;
                });
              },
            ),
          ),

          // Grid displaying numbers from 1 to 100
          Expanded(
            child: GridView.builder(
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 10, 
              ),
              itemCount: 100,
              itemBuilder: (context, index) {
                int number = index + 1; 
                return Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: highlightNumber(number)
                        ? Colors.purpleAccent 
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MyText(text:'$number',textColor: highlightNumber(number)
                              ? Colors.white
                              : Colors.black,textSize: 12,
                     ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
