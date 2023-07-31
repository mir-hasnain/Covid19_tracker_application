import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Color> colorList = [Colors.red,Colors.blue,Colors.green];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black87,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PieChart(
                dataMap: const {
                'Death' : 22,
                'Total' : 200,
                'Alive' : 178,
              },
                chartValuesOptions: const ChartValuesOptions(
                  chartValueStyle: TextStyle(color: Colors.white),
                  showChartValues: true,
                  showChartValuesOutside: false,
                  showChartValueBackground: false,
                ),
                chartLegendSpacing: MediaQuery.of(context).size.width * .15,
                // TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                chartType: ChartType.ring,
                chartRadius: MediaQuery.of(context).size.width * .35,
                animationDuration: const Duration(milliseconds: 1500),
                legendOptions: const LegendOptions(
                  legendTextStyle: TextStyle(color: Colors.white),
                  legendPosition: LegendPosition.left

                ),
                colorList: colorList,
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Card(
                  child: Column(
                    children: [
                      MyRow(
                        title: 'hello',
                        value: '6080',
                      ),
                      MyRow(
                        title: 'hello',
                        value: '6080',
                      ),
                      MyRow(
                        title: 'hello',
                        value: '6080',
                      ),
                      MyRow(
                        title: 'hello',
                        value: '6080',
                      ),
                      MyRow(
                        title: 'hello',
                        value: '6080',
                      ),
                      MyRow(
                        title: 'hello',
                        value: '6080',
                      ),
                    ],
                  )
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .9,
                height: MediaQuery.of(context).size.height * .065,
                decoration: BoxDecoration(
                  color: const Color(0xff1aa260),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(child: Text('Track Countries',style: TextStyle(fontSize: 15),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class MyRow extends StatelessWidget {
  final String title,value;
  const MyRow({super.key,required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}
