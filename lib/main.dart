import 'package:calculator_app/widgets/number_button_widget.dart';
import 'package:calculator_app/widgets/zero_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  child: Text(
                    '3,670',
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
                  () {},
                  titleColor: operatorColor2,
                ),
                NumberButtonWidget(
                  '+/-',
                  () {},
                  titleColor: operatorColor2,
                ),
                NumberButtonWidget(
                  '%',
                  () {},
                  titleColor: operatorColor2,
                ),
                NumberButtonWidget(
                  '/',
                  () {},
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
                  () {},
                ),
                NumberButtonWidget('8', () {}),
                NumberButtonWidget('9', () {}),
                NumberButtonWidget(
                  'x',
                  () {},
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
                  () {},
                ),
                NumberButtonWidget('5', () {}),
                NumberButtonWidget('6', () {}),
                NumberButtonWidget(
                  '-',
                  () {},
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
                  () {},
                ),
                NumberButtonWidget('2', () {}),
                NumberButtonWidget('3', () {}),
                NumberButtonWidget(
                  '+',
                  () {},
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
                const ZeroButtonWidget(),
                NumberButtonWidget('.', () {}),
                NumberButtonWidget(
                  '=',
                  () {},
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
