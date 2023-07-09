import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SubmissionScreen extends StatelessWidget {
  final List<HouseData> houseData = [
    HouseData('Red House', 1020, Colors.red),
    HouseData('Yellow House', 1094, Colors.yellow),
    HouseData('Blue House', 1093, Colors.blue),
    HouseData('Green House', 1000, Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Widget Clicked')),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Leaderboard',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  CircleAvatar(
                    radius: 24.0,
                    backgroundImage:
                        AssetImage('assets/images/testflutter.jpg'),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'This week:',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textColor,
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildRowText('01'),
                        buildRowText('02'),
                        buildRowText('03'),
                        buildRowText('04'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildRowText('Red House'),
                        buildRowText('Yellow House'),
                        buildRowText('Blue House'),
                        buildRowText('Green House'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildRowText('1050 pts'),
                        buildRowText('894 pts'),
                        buildRowText('950 pts'),
                        buildRowText('1000 pts'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Current Team Position:',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textColor,
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                height: 200.0, // Set a fixed height for the bar chart container
                child: charts.BarChart(
                  createBarChartData(),
                  animate: true,
                  domainAxis: charts.OrdinalAxisSpec(
                    renderSpec: charts.NoneRenderSpec(),
                  ),
                  primaryMeasureAxis: charts.NumericAxisSpec(
                    renderSpec: charts.NoneRenderSpec(),
                  ),
                  defaultRenderer: charts.BarRendererConfig(
                    strokeWidthPx: 0.0,
                  ),
                  layoutConfig: charts.LayoutConfig(
                    leftMarginSpec: charts.MarginSpec.fixedPixel(0),
                    topMarginSpec: charts.MarginSpec.fixedPixel(0),
                    rightMarginSpec: charts.MarginSpec.fixedPixel(0),
                    bottomMarginSpec: charts.MarginSpec.fixedPixel(0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildColumnText('Red'),
                  buildColumnText('Yellow'),
                  buildColumnText('Blue'),
                  buildColumnText('Green'),
                ],
              ),
              SizedBox(height: 8.0),
              Text(
                'Your Contribution to Green House:',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textColor,
                ),
              ),
              Text(
                '160 pts',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Keep it UP!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRowText(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: AppColors.textColor,
        ),
      ),
    );
  }

  Widget buildColumnText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: AppColors.textColor,
      ),
    );
  }

  List<charts.Series<HouseData, String>> createBarChartData() {
    return [
      charts.Series<HouseData, String>(
        id: 'House',
        colorFn: (HouseData data, _) =>
            charts.ColorUtil.fromDartColor(data.color),
        domainFn: (HouseData data, _) => data.house,
        measureFn: (HouseData data, _) => data.value,
        data: houseData,
      ),
    ];
  }
}

class HouseData {
  final String house;
  final int value;
  final Color color;

  HouseData(this.house, this.value, this.color);
}

class AppColors {
  static const Color background = Color.fromARGB(255, 9, 49, 47);
  static const Color textColor = Colors.white;
}
