import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class ResultForm extends StatelessWidget {
  ResultForm(this.fileSizeMap, this.colors);

  Map<String, double> fileSizeMap;
  List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("~ Folder analyzer ~"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Analyze result:',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Center(
                child: PieChart(
              dataMap: fileSizeMap,
              colorList: colors,
              chartRadius: MediaQuery.of(context).size.width / 3.0,
              legendOptions: LegendOptions(
                  showLegends: true,
                  legendPosition: LegendPosition.bottom,
                  showLegendsInRow: true),
            ))
          ],
        ),
      ),
    );
  }
}
