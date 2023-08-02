import 'package:covid_tracker/services/countries_list.dart';
import 'package:covid_tracker/specific_country_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class CountryDataScreen extends StatefulWidget {
  const CountryDataScreen({super.key});

  @override
  State<CountryDataScreen> createState() => _CountryDataScreenState();
}

class _CountryDataScreenState extends State<CountryDataScreen> {
  CountryList countryList = CountryList();
  TextEditingController searchValue = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50,right: 15,left: 15,bottom: 20),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
              cursorColor: Colors.blue,
              controller: searchValue,
              onChanged: (value){
                setState(() {
                });
              },
              decoration: InputDecoration(
                hintText: 'Search with country name',
                hintStyle: const TextStyle(color: Colors.white),
                contentPadding: const EdgeInsets.all(22),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    )
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                    )
                ),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    )
                ),
              ),
            ),
            ),
            Expanded(
              child: FutureBuilder(
                future: countryList.fetchCountryList(),
                  builder: (context,AsyncSnapshot<List<dynamic>> snapshot){
                  if(snapshot.hasData){
                   return ListView.builder(
                       itemCount: snapshot.data!.length,
                       itemBuilder: (context,index){
                         String countryName = snapshot.data![index]['country'];
                         if(searchValue.text.isEmpty){
                           return Padding(
                             padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                             child: ListTile(
                               onTap: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (context) => SpecificCountryDataScreen(
                                     image: snapshot.data![index]['countryInfo']['flag'].toString(),
                                     name: snapshot.data![index]['country'].toString(),
                                     active: snapshot.data![index]['active'].toString(),
                                     critical: snapshot.data![index]['critical'].toString(),
                                     totalDeaths: snapshot.data![index]['todayDeaths'].toString(),
                                     totalRecovered: snapshot.data![index]['todayRecovered'].toString(),
                                     totalCases: snapshot.data![index]['cases'].toString(),
                                     tests: snapshot.data![index]['tests'].toString(),
                                     totalPopulation: snapshot.data![index]['population'].toString())
                                 ));
                               },
                               leading: Image(
                                 height: 50,
                                 width: 50,
                                 image: NetworkImage(snapshot.data![index]['countryInfo']['flag'].toString()),
                               ),
                               title: Text(snapshot.data![index]['country'].toString()),
                               titleTextStyle: const TextStyle(color: Colors.white,fontSize: 18),
                               subtitle: Text(snapshot.data![index]['cases'].toString(),style: TextStyle(color: Colors.white.withOpacity(.8)),),
                             ),
                           );
                         }
                         else if(countryName.toLowerCase().contains(searchValue.text.toLowerCase())){
                           return Padding(
                             padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                             child: ListTile(
                               onTap: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (context) => SpecificCountryDataScreen(
                                     image: snapshot.data![index]['countryInfo']['flag'].toString(),
                                     name: snapshot.data![index]['country'].toString(),
                                     active: snapshot.data![index]['active'].toString(),
                                     critical: snapshot.data![index]['critical'].toString(),
                                     totalDeaths: snapshot.data![index]['todayDeaths'].toString(),
                                     totalRecovered: snapshot.data![index]['todayRecovered'].toString(),
                                     totalCases: snapshot.data![index]['cases'].toString(),
                                     tests: snapshot.data![index]['tests'].toString(),
                                   totalPopulation: snapshot.data![index]['population'].toString(),
                                 )
                                 ));
                               },
                               leading: Image(
                                 height: 50,
                                 width: 50,
                                 image: NetworkImage(snapshot.data![index]['countryInfo']['flag'].toString()),
                               ),
                               title: Text(snapshot.data![index]['country'].toString()),
                               titleTextStyle: const TextStyle(color: Colors.white,fontSize: 18),
                               subtitle: Text(snapshot.data![index]['cases'].toString(),style: TextStyle(color: Colors.white.withOpacity(.8)),),
                             ),
                           );
                         }else {
                           return Container(

                           );
                         }
                       });
                  }
                  else
                    {
                      return ListView.builder(
                        itemCount: 6,
                          itemBuilder: (context,index){
                          return Shimmer.fromColors(
                              baseColor: Colors.grey.shade700,
                              highlightColor: Colors.grey.shade100,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Container(height: 50,width: 50,color: Colors.white,),
                                    title: Container(height: 10,width: 89,color: Colors.white,),
                                    subtitle: Container(height: 10,width: 89,color: Colors.white,),
                                  ),
                                ],
                              ),
                          );
                          }
                      );
                    }
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}