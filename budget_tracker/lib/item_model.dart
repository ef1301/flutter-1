import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';

class Item {
  final String type; //Income or Expense
  final String category;
  final double price;
  final DateTime date;
  final String name;

  late charts.Color barcolor;
  late String dateString;
  late int month;
  late String monthString;
  late int year;
  late String yearString;

  Item(this.type, this.category, this.price, this.date, this.name) {
    switch (category) {
      case ('Salary'): //Income
        {
          barcolor = charts.ColorUtil.fromDartColor(Colors.green.shade200);
        }
        break;
      case 'Bills': //Expense
        {
          barcolor =
              charts.ColorUtil.fromDartColor(Color.fromARGB(255, 58, 95, 60));
        }
        break;
      case 'Business': //Income
        {
          barcolor = charts.ColorUtil.fromDartColor(Colors.red.shade200);
        }
        break;
      case 'Clothes': //Expense
        {
          barcolor =
              charts.ColorUtil.fromDartColor(Color.fromARGB(255, 177, 61, 61));
        }
        break;
      case 'Investments': //Income
        {
          barcolor = charts.ColorUtil.fromDartColor(Colors.blue.shade200);
        }
        break;
      case 'Travel': //Expense
        {
          barcolor =
              charts.ColorUtil.fromDartColor(Color.fromARGB(255, 75, 106, 151));
        }
        break;
      case 'Deposits': //Income
        {
          barcolor = charts.ColorUtil.fromDartColor(Colors.yellow.shade200);
        }
        break;
      case 'Food': //Expense
        {
          barcolor =
              charts.ColorUtil.fromDartColor(Color.fromARGB(255, 184, 160, 55));
        }
        break;
      case 'Savings': //Income
        {
          barcolor = charts.ColorUtil.fromDartColor(Colors.purple.shade200);
        }
        break;
      case 'Entertainment': //Expense
        {
          barcolor =
              charts.ColorUtil.fromDartColor(Color.fromARGB(255, 100, 38, 175));
        }
        break;
      case 'Gifts': //Income
        {
          barcolor = charts.ColorUtil.fromDartColor(Colors.orange.shade200);
        }
        break;
      case 'Health': //Expense
        {
          barcolor =
              charts.ColorUtil.fromDartColor(Color.fromARGB(255, 204, 108, 56));
        }
        break;
      case 'Other': //Income
        {
          barcolor = charts.ColorUtil.fromDartColor(Colors.pink.shade200);
        }
        break;
      case 'Other(E)': //Income
        {
          barcolor =
              charts.ColorUtil.fromDartColor(Color.fromARGB(255, 179, 57, 122));
        }
        break;
    }

    dateString = DateFormat('EEE, \nM/d').format(date);
    month = date.month;
    year = date.year;
    switch (month) {
      case 1:
        monthString = "January";
        break;
      case 2:
        monthString = "February";
        break;
      case 3:
        monthString = "March";
        break;
      case 4:
        monthString = "April";
        break;
      case 5:
        monthString = "May";
        break;
      case 6:
        monthString = "June";
        break;
      case 7:
        monthString = "July";
        break;
      case 8:
        monthString = "August";
        break;
      case 9:
        monthString = "September";
        break;
      case 10:
        monthString = "October";
        break;
      case 11:
        monthString = "November";
        break;
      case 12:
        monthString = "December";
        break;
    }
    yearString = year.toString();
  } //Constructor

  // set setColor(charts.Color newColor) {
  //   barcolor = newColor;
  // } //Setter function for colors

  // @override
  // DateTime compareTo(other) {
  //   if (this.date == null || other == null) {
  //     return null;
  //   }
  //   if (this.date < other.date) {
  //     return 1;
  //   }
  //   if (this.date > other.date) {
  //     return -1;
  //   }
  //   if (this.date == other.date) {
  //     return 0;
  //   }
  //   return null;
  // }
}

class CatIncome {
  final String categoryName;
  final double total;
  late charts.Color barcolor;

  //Constructor
  CatIncome(this.categoryName, this.total) {
    switch (categoryName) {
      case ('Salary'):
        {
          barcolor = charts.ColorUtil.fromDartColor(Colors.green.shade200);
        }
        break;
      case ('Business'):
        {
          barcolor = charts.ColorUtil.fromDartColor(Colors.red.shade200);
        }
        break;
      case ('Investments'):
        {
          barcolor = charts.ColorUtil.fromDartColor(Colors.blue.shade200);
        }
        break;
      case ('Deposits'):
        {
          barcolor = charts.ColorUtil.fromDartColor(Colors.yellow.shade200);
        }
        break;
      case ('Savings'):
        {
          barcolor = charts.ColorUtil.fromDartColor(Colors.purple.shade200);
        }
        break;
      case ('Gifts'):
        {
          barcolor = charts.ColorUtil.fromDartColor(Colors.orange.shade200);
        }
        break;
      case ('Other'):
        {
          barcolor = charts.ColorUtil.fromDartColor(Colors.pink.shade200);
        }
        break;
      default:
        barcolor = charts.ColorUtil.fromDartColor(Colors.grey.shade700);
    }
  }
}

class CatExpense {
  final String categoryName;
  final double total;
  late charts.Color barcolor;

  //Constructor
  CatExpense(this.categoryName, this.total) {
    switch (categoryName) {
      case ('Bills'):
        {
          barcolor =
              charts.ColorUtil.fromDartColor(Color.fromARGB(255, 58, 95, 60));
        }
        break;
      case ('Clothes'):
        {
          barcolor =
              charts.ColorUtil.fromDartColor(Color.fromARGB(255, 177, 61, 61));
        }
        break;
      case ('Travel'):
        {
          barcolor =
              charts.ColorUtil.fromDartColor(Color.fromARGB(255, 75, 106, 151));
        }
        break;
      case ('Food'):
        {
          barcolor =
              charts.ColorUtil.fromDartColor(Color.fromARGB(255, 184, 160, 55));
        }
        break;
      case ('Entertainment'):
        {
          barcolor =
              charts.ColorUtil.fromDartColor(Color.fromARGB(255, 100, 38, 175));
        }
        break;
      case ('Health'):
        {
          barcolor =
              charts.ColorUtil.fromDartColor(Color.fromARGB(255, 204, 108, 56));
        }
        break;
      case ('Other(E)'):
        {
          barcolor =
              charts.ColorUtil.fromDartColor(Color.fromARGB(255, 179, 57, 122));
        }
        break;
      default:
        barcolor = charts.ColorUtil.fromDartColor(Colors.grey.shade700);
    }
  }
}
