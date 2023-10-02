import 'package:flutter/material.dart';
import 'dart:io';

class DisplayResult extends StatefulWidget {
  final String apiResponse;
  final File image;
  const DisplayResult(
      {super.key, required this.apiResponse, required this.image});
  @override
  State<DisplayResult> createState() => _DisplayResultState();
}

class _DisplayResultState extends State<DisplayResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: Text(
            'Diagnosis',
            style: TextStyle(
              letterSpacing: 2.0,
              fontSize: 25.0,
            ),
          ),
          centerTitle: false,
          backgroundColor: Color.fromARGB(255, 3, 125, 78),
        ),
        /* body: Container(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 50.0),
          /*child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      height: 300.0,
                      width: 300.0,
                      child: Image.file(
                        widget.image,
                      ))),
              SizedBox(
                height: 20.0,
              ),
              Divider(
                color: Color.fromARGB(255, 3, 125, 78),
                thickness: 2.0,
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                'Result : ',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 3, 125, 78),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Expanded(
                child: Text(
                  '\t\t${widget.apiResponse}',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                    'Caution: The PlantDoctor project relies on a model, and the diagnoses provided may not always be accurate or conclusive.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 225, 148, 5),
                      fontSize: 14.0,
                    )),
              )
            ],
          ),*/
        ),*/
        body: Container(
            padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 40.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Wrap(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10.0),
                        color: Colors.green[100],
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Image.file(widget.image),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Result :',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 23.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      widget.apiResponse,
                                      style: TextStyle(
                                        color: Colors.blue[900],
                                        fontSize: 18.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                        'Caution: The PlantDoctor project relies on a model, and the diagnoses provided may not always be accurate or conclusive.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 225, 148, 5),
                          fontSize: 14.0,
                        )))
              ],
            )),
      ),
    );
  }
}

/*Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Image.file(widget.image), 
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Result :',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 23.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Text(
                          widget.apiResponse,
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 18.0,
                          ),
                        )
                      ],
                    ),
                  ),
                )
            ],
          ),*/ 
