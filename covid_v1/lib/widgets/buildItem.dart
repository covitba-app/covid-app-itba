import 'package:flutter/material.dart';

class BuildItem extends StatelessWidget {
  int i;
  int total;

  BuildItem(this.i, this.total);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Container(
          width: 80,
          padding: EdgeInsets.all(20),
          color: Theme.of(context).primaryColor.withAlpha(
              (255 / total).truncate().toInt() * (total - i % total)),
          child: Center(
            child: Text(
              i.toString(),
            ),
          ),
        ),
      ),
    );
  }
}
