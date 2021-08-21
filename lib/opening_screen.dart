import 'package:flutter/material.dart';

class OpeningScreen extends StatefulWidget {
  const OpeningScreen({Key? key}) : super(key: key);
  static const routename = '/';

  @override
  _OpeningScreenState createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          padding: EdgeInsets.fromLTRB(
              0, MediaQuery.of(context).size.height * 0.35, 0, 0),
          child: Column(
            children: <Widget>[
              Container(
                width: 120,
                height: 120,
                child: Image.network(
                    'https://ieeecs-media.computer.org/wp-media/2018/04/27230619/cropped-cs-favicon-512x512.png'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'IEEE YTU CS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontFamily: 'OpenSans-Bold',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 200,
                height: 1,
                color: Colors.white,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Movie Chooser',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'OpenSans-Bold',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.8,
                    MediaQuery.of(context).size.height * 0.18,
                    0,
                    0),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/movie-chooser');
                  },
                  backgroundColor: Colors.grey[900],
                  child: Image.network(
                    'https://image.flaticon.com/icons/png/512/777/777242.png',
                    width: 37,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
