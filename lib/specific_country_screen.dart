import 'package:covid_tracker/home_screen.dart';
import 'package:flutter/material.dart';

class SpecificCountryDataScreen extends StatefulWidget {
  final String image,
      name,
      active,
      critical,
      totalDeaths,
      totalRecovered,
      totalCases,
      tests,
      totalPopulation;
  const SpecificCountryDataScreen(
      {super.key,
      required this.image,
      required this.name,
      required this.active,
      required this.critical,
      required this.totalDeaths,
      required this.totalRecovered,
      required this.totalCases,
      required this.tests, required this.totalPopulation});

  @override
  State<SpecificCountryDataScreen> createState() =>
      _SpecificCountryDataScreenState();
}

class _SpecificCountryDataScreenState extends State<SpecificCountryDataScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(.7),
        centerTitle: true,
        title: Text(widget.name.toString()),
      ),
          body: Container(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            color: Colors.black87,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .095),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black.withOpacity(.1),
                      ),
                      child: Column(
                        children: [
                          MyRow(
                            title: 'Total Population',
                            value: widget.totalPopulation.toString(),
                          ),
                          MyRow(
                            title: 'Total cases',
                            value: widget.totalCases.toString(),
                          ),
                          MyRow(
                            title: 'Recovered',
                            value: widget.totalRecovered.toString(),
                          ),
                          MyRow(
                            title: 'Today Deaths',
                            value: widget.totalDeaths.toString(),
                          ),
                          MyRow(
                            title: 'Active',
                            value: widget.active.toString(),
                          ),
                          MyRow(
                            title: 'Critical',
                            value: widget.critical.toString(),
                          ),
                          MyRow(
                            title: 'Tests',
                            value: widget.tests.toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.image.toString()),
                    radius: 50,
                  ),
                ],
              ),
            ]
            ),
          ),
    ));
  }
}
