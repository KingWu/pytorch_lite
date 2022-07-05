import 'package:flutter/material.dart';
import 'package:pytorch_lite/pigeon.dart';

/// Individual bounding box
class BoxWidget extends StatelessWidget {
  ResultObjectDetection result;

  BoxWidget({Key? key,  required this.result}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Color for bounding box
    Color color = Colors.primaries[
        (result.classIndex) %
            Colors.primaries.length];

    return Positioned(
      left: result.rect.left,
      top: result.rect.top,
      width: result.rect.width,
      height: result.rect.height,
      child: Container(
        width: result.rect.width,
        height: result.rect.height,
        decoration: BoxDecoration(
            border: Border.all(color: color, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(2))),
        child: Align(
          alignment: Alignment.topLeft,
          child: FittedBox(
            child: Container(
              color: color,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(result.className ?? ''),
                  Text(" " + result.score.toStringAsFixed(2)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
