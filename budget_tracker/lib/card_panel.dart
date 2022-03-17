// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CardObj extends StatelessWidget {
  String? type, category1, category2, amount, date, name;
  CardObj(
      {Key? key,
      this.type,
      this.category1,
      this.category2,
      this.amount,
      this.date,
      this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Center(
                child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Type: $type'),
        Text('Category1: $category1'),
        Text('Category2: $category2'),
        Text('Amount: $amount'),
        Text('Date: $date'),
        Text('Name: $name'),
      ],
    ))));
  }
}
