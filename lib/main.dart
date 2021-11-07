import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator_app/theming/dart_theme_provider.dart';
import 'package:calculator_app/theming/style.dart';
import 'package:calculator_app/widgets/number_button_widget.dart';
import 'package:calculator_app/widgets/zero_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) {
      return themeChangeProvider;
    }, child: Consumer<DarkThemeProvider>(
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Styles.themeData(themeChangeProvider.darkTheme, context),
          home: const MainScreen(),
        );
      },
    ));
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
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Flexible(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: AutoSizeText(
                        _expression,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.w400, fontSize: 90),
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
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: const EdgeInsets.only(top: 16, left: 8),
              child: Row(
                children: [
                  Text(
                    'Dark Theme ',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Checkbox(
                    value: themeChange.darkTheme,
                    onChanged: (val) {
                      themeChange.darkTheme = val ?? false;
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
