import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator_app/widgets/number_button_widget.dart';
import 'package:calculator_app/widgets/zero_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        textTheme: TextTheme(
          headline4: GoogleFonts.montserrat(
            fontWeight: FontWeight.w200,
            fontStyle: FontStyle.normal,
            color: Colors.black,
          ),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Color numberColor = Colors.black;
  final Color operatorColor = Colors.orange;
  final Color operatorColor2 = Colors.grey;
  String _expression = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void allClear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void removeLastChar(String text) {
    if (_expression.isNotEmpty) {
      setState(() {
        _expression = _expression.substring(0, _expression.length - 1);
        ;
      });
    }
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AutoSizeText(
                    _expression,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 90,
                        color: Colors.black),
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NumberButtonWidget(
                  'AC',
                  allClear,
                  titleColor: operatorColor2,
                ),
                NumberButtonWidget(
                  'C',
                  removeLastChar,
                  titleColor: operatorColor2,
                ),
                NumberButtonWidget(
                  '%',
                  numClick,
                  titleColor: operatorColor2,
                ),
                NumberButtonWidget(
                  '/',
                  numClick,
                  titleColor: operatorColor,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NumberButtonWidget(
                  '7',
                  numClick,
                ),
                NumberButtonWidget('8', numClick),
                NumberButtonWidget('9', numClick),
                NumberButtonWidget(
                  '*',
                  numClick,
                  titleColor: operatorColor,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NumberButtonWidget(
                  '4',
                  numClick,
                ),
                NumberButtonWidget('5', numClick),
                NumberButtonWidget('6', numClick),
                NumberButtonWidget(
                  '-',
                  numClick,
                  titleColor: operatorColor,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NumberButtonWidget(
                  '1',
                  numClick,
                ),
                NumberButtonWidget('2', numClick),
                NumberButtonWidget('3', numClick),
                NumberButtonWidget(
                  '+',
                  numClick,
                  titleColor: operatorColor,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ZeroButtonWidget(numClick),
                NumberButtonWidget('.', numClick),
                NumberButtonWidget(
                  '=',
                  evaluate,
                  titleColor: operatorColor,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
