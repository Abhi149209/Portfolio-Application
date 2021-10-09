
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
class web extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Web Design projects"),
      ),
      body: Card(
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.arrow_drop_down_circle),
              title: const Text('Mern Stack',style: TextStyle(fontSize: 40),),

            ),

            Column(
              children: [
                SizedBox(height: 50.0),
                Container(
                  child: Image.asset('assets/images/mern2.jpg'),
                ),
                Container(
                  child: Column(
                    children: [
                      SizedBox(height: 75.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Center(child: Flexible(child: Text("Namastey!-an e-commerce website ",style: TextStyle(fontSize: 25,color: Colors.green),))),

                      ),
                      SizedBox(height: 35.0),

                      Container(
                          child:Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Center(
                                child: Flexible(child: Center(
                                  child: Text("A E-commerce Website (T-Shirt Store) ,with 2 payment Gateways Stripe and honeyTree(Paypal and Debit Card), with MongoDB as Database, express Server , Reactjs ,Nodejs",style: TextStyle(
                                    color: Colors.grey,
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
                            child: Text('https://github.com/Abhi149209/Namastey'),
                            onTap: () => launch('https://github.com/Abhi149209/Namastey')
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
