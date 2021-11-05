import 'package:flutter/material.dart';

class NumberButtonWidget extends StatelessWidget {
  const NumberButtonWidget(this.title, this.onPressFun,
      {this.titleColor, Key? key})
      : super(key: key);
  final String title;
  final Function onPressFun;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    final double size = (MediaQuery.of(context).size.width - 80) / 4;
    return SizedBox(
      width: size,
      height: size,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(), primary: Colors.white),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: titleColor ?? Colors.black),
        ),
        onPressed: () {
          onPressFun(title);
        },
      ),
    );
  }
}
