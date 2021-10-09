import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'android.dart';

import 'package:url_launcher/url_launcher.dart';
import 'web.dart';


import 'header.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Portfolio",style: TextStyle(color: Colors.white),),
      ),
      body: ListView(
        children: [
          Container(
            child: Image.asset(
              "assets/images/me.jpg",
              height: 400,
              width: double.infinity,
              fit: BoxFit.cover,

            ),
          ),
          SizedBox(height: 50),
          Center(child: Text("About Me",style: TextStyle(fontSize: 40,color: Colors.orange),)),
          SizedBox(height: 50),

          Card(
            color: const Color(0xFFe0e0e0),
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle),
                    title: const Text('Abhinav Sahai',style: TextStyle(fontSize: 40),),
                    subtitle: Text(
                      'Application Development Head @Google DSC glbitm',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),

                  ),

                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text("Website development/ Designing , Application Development(FLUTTER), Data Structures and algorithms",style: TextStyle(fontSize: 20),),
                    ),
                  ),

                  SizedBox(height: 10),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text("Languages worked on - c/c++,python , DART, javascript",style: TextStyle(fontSize: 20))

                    )),
                    SizedBox(height: 10,),
                   Container(
                       child: Padding(
                         padding: const EdgeInsets.all(20),
                         child: Text("Tech Stacks- MERN (mongoDB,Expressjs,Reactjs,Nodejs) , Flutter(Google Frameworks), Flask(python)",style: TextStyle(fontSize: 20)),
                       ),
                      ),


                ],
              ),
            ),
          ),
          SizedBox(height: 50),
          Center(child: Text("Projects Section",style: TextStyle(fontSize: 40,color: Colors.red),)),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              clipBehavior: Clip.antiAlias,

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.arrow_drop_down_circle),
                      title: const Text('Android ',style: TextStyle(fontSize: 40),),
                      subtitle: Text(
                        'Android Development',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),

                    ),

                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [

                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("assets/images/Google-Android-256.png",height: 300,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Flexible(child: Text("Student-Mitra Analyser",style: TextStyle(color: Colors.grey,fontSize: 35),)),
                            )
                          ],
                        ),
                        Center(
                          child: FlatButton(
                            color: Colors.blue,
                            child: Text("Navigate"),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Android()),
                              );
                            },
                          ),
                        )

                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 50),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              clipBehavior: Clip.antiAlias,

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.arrow_drop_down_circle),
                      title: const Text('Web Development ',style: TextStyle(fontSize: 40),),
                      subtitle: Text(
                        'Website Development/Design',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),

                    ),

                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [

                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("assets/images/mern.jpg",height: 300,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Flexible(child: Text("Namastey!-A E-commerce Website",style: TextStyle(color: Colors.grey,fontSize: 35),)),
                            )
                          ],
                        ),
                        Center(
                          child: FlatButton(
                            color: Colors.blue,
                            child: Text("Navigate"),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>web()),
                              );
                            },
                          ),
                        )

                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          Center(child: Text("Contact Me",style: TextStyle(fontSize: 40,color: Colors.green),)),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle),
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),

                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '9am - 8pm',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.email,
                            ),
                            SizedBox(width: 35,),
                            Center(
                              child: InkWell(
                                child: Text("sahai.abhinav99@gmail.com",style: TextStyle(fontSize: 15,color: Colors.grey),),

                                  onTap: () => launch('sahai.abhinav99@gmail.com')
                              ),
                            ),


                          ],
                        ),
                        SizedBox(height: 35,),
                        Row(
                          children: [

                            Center(
                              child: InkWell(
                                  child: Text("Linked in",style: TextStyle(fontSize: 20 , color: Colors.grey),),
                                  onTap: () => launch('https://www.linkedin.com/in/abhinav-sahai-b836b81b5/')
                              ),
                            ),
                            SizedBox(width: 105,),
                            Center(
                              child: InkWell(
                                  child:  Text("twitter ",style: TextStyle(fontSize: 20 , color: Colors.grey),),
                                  onTap: () => launch('https://twitter.com/AbhinavSahai2')
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [

                            Center(
                              child: InkWell(
                                  child: Text("Instagram",style: TextStyle(fontSize: 20 , color: Colors.grey),),
                                  onTap: () => launch('https://www.instagram.com/abhi_149209/')
                              ),
                            ),
                            SizedBox(width: 105,),
                            Center(
                              child: InkWell(
                                  child: Text("Facebook",style: TextStyle(fontSize: 20 , color: Colors.grey),),
                                  onTap: () => launch('https://www.facebook.com/abhinav.sahai.161/')
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),



                ],
              ),
            ),
          ),




        ],
      ),
    );
  }
}