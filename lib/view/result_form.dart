import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class ResultForm extends StatelessWidget {
  ResultForm(this.fileSizeMap);

  Map<String, double> fileSizeMap;

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
                //TODO: change maximum size for pie chart
                  dataMap: fileSizeMap,)
            )
          ],
        ),
      ),
    );
  }
}
