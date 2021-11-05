import 'package:flutter/material.dart';

class ZeroButtonWidget extends StatelessWidget {
  const ZeroButtonWidget(this.onPressFun, {Key? key}) : super(key: key);
  final Function onPressFun;

  @override
  Widget build(BuildContext context) {
    final double size = (MediaQuery.of(context).size.width - 80) / 4;
    return SizedBox(
      width: (size * 2) + 16,
      height: size,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(45.0),
            ),
            primary: Colors.white),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            ' 0',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        onPressed: () {
          onPressFun('0');
        },
      ),
    );
  }
}
