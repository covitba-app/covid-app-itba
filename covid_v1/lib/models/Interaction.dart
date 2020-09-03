import 'package:flutter/foundation.dart';

class Interaction {
  final String id;
  final String title;
  final double risk;
  final DateTime date;

  Interaction(
      {@required this.id,
      @required this.risk,
      @required this.title,
      @required this.date});
}
