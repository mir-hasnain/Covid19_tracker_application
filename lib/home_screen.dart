import 'package:covid_tracker/country_list_screen.dart';
import 'package:covid_tracker/models/WorldStatesModel.dart';
import 'package:covid_tracker/services/world_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  final List<Color> colorList = [Colors.red, Colors.blue, Colors.green];
  WorldStates worldStates = WorldStates();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh:()async{
            worldStates.fetchDataWorldStates();
          },
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 1,
                width: MediaQuery.of(context).size.width * 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FutureBuilder(
                        future: worldStates.fetchDataWorldStates(),
                        builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                          if (!snapshot.hasData) {
                            return Expanded(
                              flex: 1,
                              child: SpinKitFadingCircle(
                                color: Colors.white,
                                controller: controller,
                              ),
                            );
                          } else {
                            return Column(
                              children: [
                                PieChart(
                                  dataMap: {
                                    'Deaths': double.parse(
                                        snapshot.data!.deaths.toString()),
                                    'Total Cases':
                                    double.parse(snapshot.data!.cases.toString()),
                                    'Recovered': double.parse(
                                        snapshot.data!.recovered.toString()),
                                  },
                                  chartValuesOptions: const ChartValuesOptions(
                                    chartValueStyle: TextStyle(color: Colors.white),
                                    showChartValuesInPercentage: true,
                                    showChartValues: true,
                                    showChartValueBackground: false,
                                  ),
                                  chartLegendSpacing:
                                  MediaQuery.of(context).size.width * .15,
                                  // TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                                  chartType: ChartType.ring,
                                  chartRadius:
                                  MediaQuery.of(context).size.width * .35,
                                  animationDuration:
                                  const Duration(milliseconds: 1500),
                                  legendOptions: const LegendOptions(
                                      legendTextStyle: TextStyle(color: Colors.white),
                                      legendPosition: LegendPosition.left),
                                  colorList: colorList,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 35,horizontal: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(.1),
                                      //backgroundBlendMode: BlendMode.dstATop,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          MyRow(
                                            title: 'Total Cases',
                                            value: snapshot.data!.cases.toString(),
                                          ),
                                          MyRow(
                                            title: 'Deaths',
                                            value: snapshot.data!.deaths.toString(),
                                          ),
                                          MyRow(
                                            title: 'Recovered',
                                            value: snapshot.data!.recovered.toString(),
                                          ),
                                          MyRow(
                                            title: 'Active',
                                            value: snapshot.data!.active.toString(),
                                          ),
                                          MyRow(
                                            title: 'Critical',
                                            value: snapshot.data!.critical.toString(),
                                          ),
                                          MyRow(
                                            title: 'Today cases',
                                            value: snapshot.data!.todayCases.toString(),
                                          ),
                                          MyRow(
                                            title: 'Today Deaths',
                                            value: snapshot.data!.todayDeaths.toString(),
                                          ),
                                          MyRow(
                                            title: 'Today Recovered',
                                            value:
                                            snapshot.data!.todayRecovered.toString(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CountryDataScreen()));
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * .9,
                                    height: MediaQuery.of(context).size.height * .065,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff1aa260),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Center(
                                        child: Text(
                                          'Track Countries',
                                          style:
                                          TextStyle(fontSize: 18, color: Colors.white),
                                        )),
                                  ),
                                ),
                              ],
                            );
                          }
                        })
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}

class MyRow extends StatelessWidget {
  final String title, value;
  const MyRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,style: const TextStyle(color: Colors.white,fontSize: 15),),
              Text(value,style: const TextStyle(color: Colors.white,fontSize: 15),),
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}
