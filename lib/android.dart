
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class Android extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Android projects"),
      ),
      body: Card(
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.arrow_drop_down_circle),
              title: const Text('Google Flutter',style: TextStyle(fontSize: 40),),

            ),

            Column(
              children: [
                SizedBox(height: 50.0),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/flutter.jpg'),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      SizedBox(height: 45.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Flexible(child: Text("Student-Mitra Analyser ",style: TextStyle(fontSize: 25,color: Colors.orange),)),
                      ),
                      SizedBox(height: 15.0),
                      
                      Container(
                          child:Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Center(
                                child: Flexible(child: Center(
                                  child: Text("An Student Analyser Application for examination purpose using Google Flutter , Firebase, Rest APIs",style: TextStyle(

                                    fontSize: 20,

                                  ) ),
                                )),
                              ),
                            ),
                          )
                      ),
                      Container(
                          child:Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Center(
                                child: Flexible(child: Center(
                                  child: Text("GITHUB REPO",style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 20,

                                  ) ),
                                )),
                              ),
                            ),
                          )
                      ),
                      SizedBox(height: 10,),
                      Center(
                        child: InkWell(
                            child: Text('https://github.com/pktintali/students-mitra-flutter'),
                            onTap: () => launch('https://github.com/pktintali/students-mitra-flutter')
                        ),
                      ),
                    ],
                  ),
                ),//CirlceAvatar
              ],
            ),

          ],
        ),
      ),
    );
  }
}
