import 'package:flutter/material.dart';
import 'item_model.dart'; //Item Class
import 'package:charts_flutter/flutter.dart' as charts;
//import 'package:syncfusion_flutter_charts/charts.dart';
//import 'package:intl/intl.dart';
import 'package:flutter/painting.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GraphScreenState();
  }
}

class GraphScreenState extends State<GraphScreen> {
  //Create example data
  static List<Item> dataItem = [
    Item('Income', 'Salary', 100, DateTime(2022, 3, 14), 'Sal1'),
    Item('Income', 'Salary', 200, DateTime(2022, 3, 14), 'Sal2'),
    Item('Income', 'Salary', 300, DateTime(2022, 3, 11), 'Sal3'),
    Item('Income', 'Business', 400, DateTime(2022, 3, 9), 'Bus1'),
    Item('Income', 'Business', 500, DateTime(2022, 3, 10), 'Bus2'),
    Item('Income', 'Investments', 600, DateTime(2022, 3, 11), 'Inv1'),
    Item('Income', 'Savings', 700, DateTime(2022, 3, 12), 'Sav1'),
    Item('Income', 'Savings', 800, DateTime(2022, 3, 13), 'Sav2'),
    Item('Income', 'Gifts', 900, DateTime(2022, 3, 14), 'Gift1'),
    Item('Income', 'Other', 1000, DateTime(2022, 3, 15), 'Oth1'),
    Item('Income', 'Other', 1100, DateTime(2022, 2, 16), 'Oth2'),
    Item('Income', 'Gifts', 1200, DateTime(2022, 1, 17), 'Gift2'),
    Item('Income', 'Business', 1300, DateTime(2022, 2, 18), 'Bus3'),
    Item('Income', 'Salary', 1400, DateTime(2022, 1, 19), 'Sal4'),
    Item('Income', 'Salary', 1500, DateTime(2022, 2, 20), 'Sal5'),
    Item('Income', 'Deposits', 1500, DateTime(2022, 1, 20), 'Dep1'),
    Item('Income', 'Deposits', 1500, DateTime(2022, 2, 20), 'Dep2'),
    Item('Income', 'Deposits', 1500, DateTime(2022, 1, 20), 'Dep3'),
    Item('Income', 'Deposits', 1500, DateTime(2022, 2, 20), 'Dep4'),
    Item('Income', 'Deposits', 1500, DateTime(2022, 1, 20), 'Dep5'),
    Item('Income', 'Deposits', 1500, DateTime(2022, 1, 20), 'Dep6'),
    Item('Income', 'Deposits', 1500, DateTime(2022, 2, 20), 'Dep7'),
    Item('Expense', 'Bills', 10, DateTime(2022, 1, 21), 'Bil1'),
    Item('Expense', 'Bills', 20, DateTime(2022, 2, 22), 'Bil2'),
    Item('Expense', 'Bills', 30, DateTime(2022, 1, 23), 'Bil3'),
    Item('Expense', 'Bills', 40, DateTime(2022, 2, 24), 'Bil4'),
    Item('Expense', 'Bills', 50, DateTime(2022, 2, 28), 'Bil5'),
    Item('Expense', 'Bills', 60, DateTime(2022, 1, 25), 'Bil6'),
    Item('Expense', 'Bills', 70, DateTime(2022, 3, 9), 'Bil7'),
    Item('Expense', 'Bills', 80, DateTime(2022, 3, 10), 'Bil8'),
    Item('Expense', 'Clothes', 90, DateTime(2022, 3, 13), 'Clo1'),
    Item('Expense', 'Travel', 100, DateTime(2022, 3, 12), 'Tra1'),
    Item('Expense', 'Food', 110, DateTime(2022, 3, 6), 'Fud1'),
    Item('Expense', 'Entertainment', 120, DateTime(2022, 3, 7), 'Ent1'),
    Item('Expense', 'Health', 130, DateTime(2022, 1, 18), 'Hel1'),
    Item('Expense', 'Other(E)', 140, DateTime(2022, 2, 19), 'Oth3'),
    Item('Expense', 'Clothes', 150, DateTime(2022, 3, 2), 'Clo2'),
    Item('Expense', 'Clothes', 500, DateTime(2022, 3, 12), 'Clo3'),
    Item('Expense', 'Travel', 500, DateTime(2022, 1, 22), 'Tra2'),
    Item('Expense', 'Travel', 500, DateTime(2022, 2, 25), 'Tra3'),
    Item('Expense', 'Travel', 500, DateTime(2022, 1, 12), 'Tra4'),
    Item('Expense', 'Health', 500, DateTime(2022, 2, 9), 'Hel2'),
    Item('Expense', 'Entertainment', 100, DateTime(2022, 1, 7), 'Ent2'),
    Item('Expense', 'Bills', 1500, DateTime(2022, 2, 29), 'Bil9'),
  ];

  //Function - Create list depending on Date
  List<Item> createListDay(List<Item> original, String historyType) {
    List<Item> newlist = [];
    late DateTime targetdate;
    final currDate = DateTime.now();
    if (historyType == 'Daily') {
      targetdate = currDate.subtract(const Duration(days: 7));
      for (var i = 0; i < original.length; i++) {
        DateTime indexDate = original[i].date;
        if (indexDate.isAfter(targetdate)) {
          newlist.add(original[i]);
        }
      }
    }

    return newlist;
  }

  //Function - Create list depending on Type
  List<Item> createListType(List<Item> original, String type_) {
    return original
        .where((element) => (element.type == type_))
        .toList(growable: false);
  }

  //Function - Create list depending on Category
  List<Item> createListCat(List<Item> original, String cat_) {
    return original
        .where((element) => (element.category == cat_))
        .toList(growable: false);
  }

  //Function - Calculate total costs
  double _calcTotal(List<Item> calcData) {
    double total = 0.0;
    for (var i = 0; i < calcData.length; i++) {
      total = total + calcData[i].price;
    }
    return total;
  }

  //Function - Calculate total costs per category
  double _calcTotalCat(List<Item> calcData, String cat) {
    double total = 0.0;
    for (var i = 0; i < calcData.length; i++) {
      if (calcData[i].category == cat) {
        total = total + calcData[i].price;
      }
    }
    return total;
  }

  //Function to return a series list of Object 'Item'
  charts.Series<Item, String> _createSeries(
    List<Item> list,
    String id,
    String barType,
  ) {
    if (barType == 'Daily') {
      return charts.Series(
        id: id,
        data: list,
        domainFn: (Item item, _) => item.dateString, //Horizontal
        measureFn: (Item item, _) => item.price, //Vertical
        colorFn: (Item item, _) => item.barcolor,
      );
      //fillPatternFn: (Item item, _) => charts.FillPatternType.forwardHatch);
    } else if (barType == 'Monthly') {
      return charts.Series(
        id: id,
        data: list,
        domainFn: (Item item, _) => item.monthString, //Horizontal
        measureFn: (Item item, _) => item.price, //Vertical
        colorFn: (Item item, _) => item.barcolor,
      );
      //fillPatternFn: (Item item, _) => charts.FillPatternType.forwardHatch);
    } else if (barType == 'Yearly') {
      return charts.Series(
        id: id,
        data: list,
        domainFn: (Item item, _) => item.yearString, //Horizontal
        measureFn: (Item item, _) => item.price, //Vertical
        colorFn: (Item item, _) => item.barcolor,
      );
      //fillPatternFn: (Item item, _) => charts.FillPatternType.forwardHatch);
    } else {
      return charts.Series(
          id: id,
          data: list,
          domainFn: (Item item, _) => item.category, //Horizontal
          measureFn: (Item item, _) => item.price, //Vertical
          colorFn: (Item item, _) => item.barcolor);
    }
  }

  List<charts.Series<Item, String>> _createChartSeriesList(
      List<Item> incomeData, List<Item> expenseData, String barType) {
    return [
      _createSeries(createListCat(incomeData, 'Salary'), 'Salary', barType),
      _createSeries(createListCat(incomeData, 'Business'), 'Business', barType),
      _createSeries(
          createListCat(incomeData, 'Investments'), 'Investments', barType),
      _createSeries(createListCat(incomeData, 'Deposits'), 'Deposits', barType),
      _createSeries(createListCat(incomeData, 'Savings'), 'Savings', barType),
      _createSeries(createListCat(incomeData, 'Gifts'), 'Gifts', barType),
      _createSeries(createListCat(incomeData, 'Other'), 'Other(Inc)', barType),
      _createSeries(createListCat(expenseData, 'Bills'), 'Bills', barType),
      _createSeries(createListCat(expenseData, 'Clothes'), 'Clothes', barType),
      _createSeries(createListCat(expenseData, 'Travel'), 'Travel', barType),
      _createSeries(createListCat(expenseData, 'Food'), 'Food', barType),
      _createSeries(createListCat(expenseData, 'Entertainment'),
          'Entertainment', barType),
      _createSeries(createListCat(expenseData, 'Health'), 'Health', barType),
      _createSeries(
          createListCat(expenseData, 'Other(E)'), 'Other(Exp)', barType),
    ];
  }

  //Function to Return a Bar Chart
  barChart(List<charts.Series<Item, String>> data, String overall) {
    if (overall == 'true') {
      return charts.BarChart(
        data,
        animate: true,
        vertical: false,
        barGroupingType: charts.BarGroupingType.grouped,
        behaviors: [
          charts.SeriesLegend(
            position: charts.BehaviorPosition.end,
            desiredMaxRows: 7,
            showMeasures: true,
            entryTextStyle: const charts.TextStyleSpec(fontSize: 10),
          )
        ],
      );
    } else {
      return charts.BarChart(
        data,
        animate: true,
        vertical: true,
        barGroupingType: charts.BarGroupingType.stacked,
        behaviors: [
          charts.SeriesLegend(
            position: charts.BehaviorPosition.end,
            desiredMaxRows: 7,
            showMeasures: true,
            entryTextStyle: const charts.TextStyleSpec(fontSize: 10),
          )
        ],
      );
    }
  }

  pieChartExp(List<charts.Series<CatExpense, String>> data) {
    return charts.PieChart<Object>(data,
        animate: true,
        defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: 50,
            arcRendererDecorators: [
              new charts.ArcLabelDecorator(
                  labelPosition: charts.ArcLabelPosition.outside)
            ]),
        behaviors: [
          // new charts.DatumLegend(
          //     position: charts.BehaviorPosition.end,
          //     desiredMaxRows: 4,
          //     showMeasures: false,
          //     legendDefaultMeasure: charts.LegendDefaultMeasure.sum,
          //     entryTextStyle:
          //         const charts.TextStyleSpec(fontSize: 5))
        ]);
  }

  pieChartInc(List<charts.Series<CatIncome, String>> data) {
    return charts.PieChart<Object>(data,
        animate: true,
        defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: 50,
            arcRendererDecorators: [
              new charts.ArcLabelDecorator(
                  labelPosition: charts.ArcLabelPosition.outside)
            ]),
        behaviors: [
          // new charts.DatumLegend(
          //     position: charts.BehaviorPosition.end,
          //     desiredMaxRows: 4,
          //     showMeasures: false,
          //     legendDefaultMeasure: charts.LegendDefaultMeasure.sum,
          //     entryTextStyle:
          //         const charts.TextStyleSpec(fontSize: 5))
        ]);
  }

  @override
  Widget build(BuildContext context) {
    //Sort dataItem list
    dataItem.sort((a, b) => a.date.compareTo(b.date));

    //Income List
    List<Item> incomeItems = createListType(dataItem, 'Income');
    //Expense List
    List<Item> expenseItems = createListType(dataItem, 'Expense');

    //Chart Series for Bar Graph
    List<charts.Series<Item, String>> overallData = [
      _createSeries(incomeItems, "Income", 'false'),
      _createSeries(expenseItems, 'Expense', 'false'),
    ];

    //Last 7 Days Data (Calculates based on current day)
    List<Item> dailyInc = createListDay(incomeItems, 'Daily');
    List<Item> dailyExp = createListDay(expenseItems, 'Daily');

    //Daily Bar Chart
    List<charts.Series<Item, String>> dailyBarGraphData =
        _createChartSeriesList(dailyInc, dailyExp, 'Daily');
    List<charts.Series<Item, String>> monthlyBarGraphData =
        _createChartSeriesList(incomeItems, expenseItems, 'Monthly');
    List<charts.Series<Item, String>> yearlyBarGraphData =
        _createChartSeriesList(incomeItems, expenseItems, 'Yearly');

    //Calculate total Per Type
    var totalIncome = _calcTotal(incomeItems);
    var totalExpense = _calcTotal(expenseItems);

    //List for Income Pie Graph
    List<CatIncome> pieIncome = [
      CatIncome('Salary', _calcTotalCat(incomeItems, 'Salary')),
      CatIncome('Business', _calcTotalCat(incomeItems, 'Business')),
      CatIncome('Investments', _calcTotalCat(incomeItems, 'Investments')),
      CatIncome('Deposits', _calcTotalCat(incomeItems, 'Deposits')),
      CatIncome('Savings', _calcTotalCat(incomeItems, 'Savings')),
      CatIncome('Gifts', _calcTotalCat(incomeItems, 'Gifts')),
      CatIncome('Other', _calcTotalCat(incomeItems, 'Other')),
    ];
    List<charts.Series<CatIncome, String>> incomePieChart = [
      charts.Series(
        id: "Income",
        data: pieIncome,
        domainFn: (CatIncome item, _) => item.categoryName, //Horizontal
        measureFn: (CatIncome item, _) => item.total, //Vertical
        colorFn: (CatIncome item, _) => item.barcolor,
        labelAccessorFn: (CatIncome row, _) => '${row.total}',
      ),
    ];

    //List for Expense PieGraph
    List<CatExpense> pieExpense = [
      CatExpense('Bills', _calcTotalCat(expenseItems, 'Bills')),
      CatExpense('Clothes', _calcTotalCat(expenseItems, 'Clothes')),
      CatExpense('Travel', _calcTotalCat(expenseItems, 'Travel')),
      CatExpense('Food', _calcTotalCat(expenseItems, 'Food')),
      CatExpense('Entertainment', _calcTotalCat(expenseItems, 'Entertainment')),
      CatExpense('Health', _calcTotalCat(expenseItems, 'Health')),
      CatExpense('Other(E)', _calcTotalCat(expenseItems, 'Other(E)')),
    ];
    List<charts.Series<CatExpense, String>> expensePieChart = [
      charts.Series(
        id: "Expense",
        data: pieExpense,
        domainFn: (CatExpense item, _) => item.categoryName, //Horizontal
        measureFn: (CatExpense item, _) => item.total, //Vertical
        colorFn: (CatExpense item, _) => item.barcolor,
        labelAccessorFn: (CatExpense row, _) => '${row.total}',
      ),
    ];

    //Get screen size
    var screenWidth = MediaQuery.of(context).size.width;

    return (screenWidth > 650)
        ?
        //IF SCREEN SIZE BIG
        Column(children: <Widget>[
            //BAR GRAPH
            Expanded(
                flex: 2,
                child: DefaultTabController(
                    initialIndex: 1,
                    length: 4,
                    child: Scaffold(
                        appBar: PreferredSize(
                            preferredSize: Size.fromHeight(80.0),
                            child: AppBar(
                                backgroundColor:
                                    const Color.fromARGB(255, 202, 149, 211),
                                title: const Text("Budget History"),
                                bottom: const TabBar(
                                  tabs: <Widget>[
                                    Tab(text: "Overview"),
                                    Tab(text: "Daily"),
                                    Tab(text: "Monthly"),
                                    Tab(text: "Yearly"),
                                  ],
                                ))),
                        body: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TabBarView(
                            children: <Widget>[
                              Center(
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Expanded(
                                          child:
                                              barChart(overallData, 'true')))),
                              Center(
                                child: Expanded(
                                    child:
                                        barChart(dailyBarGraphData, 'false')),
                              ),
                              Center(
                                child: Expanded(
                                    child:
                                        barChart(monthlyBarGraphData, 'false')),
                              ),
                              Center(
                                child: Expanded(
                                    child:
                                        barChart(yearlyBarGraphData, 'false')),
                              ),
                            ],
                          ),
                        )))),
            //PIE GRAPHS
            Expanded(
                //If screen size is small
                child: Row(
              children: <Widget>[
                Expanded(
                    child: Column(
                        //PIE GRAPH INCOME
                        children: <Widget>[
                      Text("Income",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      Expanded(
                          //height: 200,
                          //width: 400,
                          child: pieChartInc(incomePieChart)),
                      Text(
                        "Total: " "$totalIncome",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                    ])),
                Expanded(
                    child: Column(
                        //PIE GRAPH INCOME
                        children: <Widget>[
                      Text(
                        "Expense",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                          //height: 200,
                          //width: 400,
                          child: pieChartExp(expensePieChart)),
                      Text("Total: " "$totalExpense",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 5)
                    ]))
              ],
            )),
          ] //Children of Column
            )
        :

        //IF SCREEN SIZE SMALL
        Column(children: <Widget>[
            //BAR GRAPH
            Expanded(
                flex: 2,
                child: DefaultTabController(
                    initialIndex: 1,
                    length: 4,
                    child: Scaffold(
                        appBar: PreferredSize(
                            preferredSize: Size.fromHeight(80.0),
                            child: AppBar(
                                backgroundColor:
                                    const Color.fromARGB(255, 202, 149, 211),
                                title: const Text("Budget History"),
                                bottom: const TabBar(
                                  tabs: <Widget>[
                                    Tab(text: "Overview"),
                                    Tab(text: "Daily"),
                                    Tab(text: "Monthly"),
                                    Tab(text: "Yearly"),
                                  ],
                                ))),
                        body: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TabBarView(
                            children: <Widget>[
                              Center(
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Expanded(
                                          child:
                                              barChart(overallData, 'true')))),
                              Center(
                                child: Expanded(
                                    child:
                                        barChart(dailyBarGraphData, 'false')),
                              ),
                              Center(
                                child: Expanded(
                                    child:
                                        barChart(monthlyBarGraphData, 'false')),
                              ),
                              Center(
                                child: Expanded(
                                    child:
                                        barChart(yearlyBarGraphData, 'false')),
                              ),
                            ],
                          ),
                        )))),
            //PIE GRAPHS
            // PIE GRAPH INCOME
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(children: <Widget>[
                Text(
                  "Income",
                  style: const TextStyle(
                      fontWeight: FontWeight
                          .bold), //Theme.of(context).textTheme.bodyText2,
                ),
                Expanded(
                    //height: 155, width: 400,
                    child: pieChartInc(incomePieChart)),
                Text("Total: " "$totalIncome",
                    style: const TextStyle(
                        fontWeight: FontWeight
                            .bold)), //Theme.of(context).textTheme.bodyText2,
              ]),
            )),
            //PIE GRAPH EXPENSE
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(children: <Widget>[
                Text(
                  "Expense",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(
                    //height: 155, width: 400,
                    child: pieChartExp(expensePieChart)),
                Text(
                  "Total: " "$totalExpense",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
            )),
          ] //Children of Column
            );
  }
}
