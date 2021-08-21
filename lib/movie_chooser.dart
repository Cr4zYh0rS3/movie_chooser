import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:http/http.dart' as http;

class MovieChooser extends StatefulWidget {
  const MovieChooser({Key? key}) : super(key: key);
  static const routename = '/movie-chooser';

  @override
  _MovieChooserState createState() => _MovieChooserState();
}

class _MovieChooserState extends State<MovieChooser> {
  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  var id = 0;
  var ischoosed = false;
  List movies = [];
  Future fetchProducts() async {
    final response = await http
        .get(Uri.parse('https://moviechooser.herokuapp.com/movie-api'));
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      print(movies);
      movies = decodedData;
    } else {
      //throw Exception('Unable to fetch products from the REST API');
      print('An Error occured');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
          child: Container(
        padding: EdgeInsets.fromLTRB(
            0,
            MediaQuery.of(context).size.height * (ischoosed ? 0.18 : 0.3),
            0,
            0),
        child: Column(
          children: [
            if (ischoosed) ...[
              Container(
                  width: 180,
                  child: Image.network(
                    movies[id]['movie_picture_url'],
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  movies[id]['movie_name'],
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            ],
            ischoosed
                ? Container()
                : Text(
                    'Pop The Corn',
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
            Container(
              width: ischoosed ? 150 : 250,
              height: ischoosed ? 150 : 250,
              child: FloatingActionButton(
                backgroundColor: Colors.grey[900],
                onPressed: () {
                  setState(() {
                    ischoosed = true;
                    fetchProducts();
                    id = Random().nextInt(movies.length);
                  });
                },
                child: Image.network(
                  'https://image.flaticon.com/icons/png/512/3753/3753932.png',
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
