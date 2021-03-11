import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Country extends StatelessWidget {
  final Map country;
  Country(this.country);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          country['name'],
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          children: [
            BackCountryCard('Capital', country['capital']),
            BackCountryCard('Region', country['region']),
            BackCountryCard('Subregion', country['subregion']),
            BackCountryCard('Population', country['population'].toString()),
            FlipCard(
              front: CountryCard('Flag'),
              back: Card(
                color: Colors.white,
                elevation: 10.0,
                child: SvgPicture.network(
                  country['flag'],
                  width: 200.0,
                ),
              ),
            ),
            BackCountryCard('Currency', country['currencies'][0]['name']),
            BackCountryCard('Languages', country['languages'][0]['name']),
            BackCountryCard('Border', country['borders'][0]),
          ],
        ),
      ),
    );
  }
}

class BackCountryCard extends StatelessWidget {
  final String title;
  final String backTitle;

  BackCountryCard(this.title, this.backTitle);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlipCard(
        front: CountryCard(title),
        back: Card(
          color: Colors.black,
          elevation: 10.0,
          child: Center(
            child: Text(
              backTitle,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final String title;

  CountryCard(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 10,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
