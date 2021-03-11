import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:screens/Country/country.dart';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  Future<List> countries;

  Future<List> getCountries() async {
    var response =
        await Dio().get('https://restcountries.eu/rest/v2/region/asia');
    return response.data;
  }

  @override
  void initState() {
    countries = getCountries();
    print(countries);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(countries);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Screen 2',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Nunito',
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: FutureBuilder<List>(
            future: countries,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  Country(snapshot.data[index + 1]),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 8.0,
                            ),
                            child: Text(
                              snapshot.data[index]['name'],
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              }
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.black,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
