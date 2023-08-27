import 'package:flutter/material.dart';

import '../model/questions.dart';

class quizapp extends StatefulWidget {
  const quizapp({super.key});

  @override
  State<quizapp> createState() => _quizappState();
}

class _quizappState extends State<quizapp> {
  var questions=[
    Question("The sun rises in the west?", true),
    Question("Water boils at 100 degrees Celsius?",true),
    Question("Abraham Lincoln was the first President of the United States?",false),
    Question("The Great Wall of China is visible from space?",true),
    Question("Penguins can fly?",true),
    Question("The Eiffel Tower is located in London?",false),
    Question("Diamonds are made from compressed coal?",true),
    Question("The capital of Japan is Tokyo?",false),
    Question("The primary colors in art are red, blue, and green?",true),
    Question("The human body has 206 bones?",false),
    Question("The Nile is the longest river in the world?",true),
    Question("Honey never spoils?",true),
    Question("Mount Everest is the highest peak on Earth?",false),
    Question("Mars is the hottest planet in our solar system?",true)];
  int _index=0;
  int _myscore=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(title:Text("True Citizen",style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold,
        )
        ),
          centerTitle: true,backgroundColor: Colors.blueGrey,),
        backgroundColor: Colors.blueGrey,
        body:Container(

          //margin:EdgeInsets.only(top:MediaQuery.of(context).size.height*0.1),
            alignment:Alignment.center,
            child:Column(
              //mainAxisAlignment:MainAxisAlignment.center,
              children:<Widget>[
                SizedBox(height:30),
                Container_getimage(),
                SizedBox(height:30),
                Container_showquestions(),
                SizedBox(height:30),
                Container_mybutton(),



              ],

            )
        )
    );

    return const Placeholder();
  }
  Container_getimage()
  {
    return Container(

      child:Image.asset("Images/flag.png",
        width:300,
        height:250,

      ),

    );
  }
  Container_showquestions()
  {
    return Container(
        width:400,
        height:120,
        decoration:BoxDecoration(
          color:Colors.transparent,
          border:Border.all(color:Colors.grey,width:0.5),
          borderRadius:BorderRadius.circular(12.0),
        ),
        child:Column(
            children:<Widget>[
              Padding(
                  padding:EdgeInsets.all(10.0),
                  child:Center(

                    child:Text("${questions[_index].questiontext}",style:TextStyle(color:Colors.white,fontSize:20)),
                  )
              ),
              SizedBox(height:10),

            ]

        )
    );



  }
  Container_mybutton()
  {
    return Container(
      child:Column(

        children:<Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget>[
                InkWell(
                    onTap:()
                    {

                      myquestionsprevious();
                    },
                    child:Container(
                        width:70,
                        height:50,
                        decoration:BoxDecoration(
                          color:Colors.blueGrey.shade900,
                        ),
                        child:Center(child:Text("PREVIOUS",style:TextStyle(color:Colors.white,fontSize:14)))
                    )
                ),


                Row(

                  children:<Widget>[
                    InkWell(
                        onTap:()
                        {
                          checkanswer(true);
                          myquestions();

                        },
                        child:Container(
                          width:70,
                          height:50,
                          decoration:BoxDecoration(
                            color:Colors.blueGrey.shade900,
                          ),
                          child:Center(child:Text("True",style:TextStyle(color:Colors.white,fontSize:14))),


                        )
                    ),

                  ],
                ),
                Row(
                    children:<Widget>[
                      InkWell(
                          onTap:()
                          {
                            checkanswer(false);
                            myquestions();
                          },
                          child:Container(
                              width:70,
                              height:50,
                              decoration:BoxDecoration(
                                color:Colors.blueGrey.shade900,
                              ),
                              child:Center(child:Text("FALSE",style:TextStyle(color:Colors.white,fontSize:14)))
                          )
                      )
                    ]
                ),
                Row(
                    children:<Widget>[
                      InkWell(
                          onTap:()
                          {
                            myquestions();
                          },
                          child:Container(
                              width:80,
                              height:50,
                              decoration:BoxDecoration(
                                color:Colors.blueGrey.shade900,
                              ),
                              child:Center(child:Text("NEXT",style:TextStyle(color:Colors.white,fontSize:14)))
                          )
                      )
                    ]
                )
              ]
          ),
          SizedBox(height:30),
          Row(

              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children:<Widget>[
                Text("YOUR SCORE",style:TextStyle(color:Colors.white,fontSize: 15,fontWeight:FontWeight.bold,)),
                Row(
                    children:<Widget>[
                      Container(
                          width:100,
                          height:50,
                          decoration:BoxDecoration(
                            color:Colors.blueGrey.shade900,
                            borderRadius:BorderRadius.circular(15.0),
                          ),
                          child:Center(child:Text("$_myscore",style:TextStyle(color:Colors.white,fontSize:15,fontWeight:FontWeight.bold)))
                      )
                    ]
                )
              ]

          )
        ],
      ),
    );
  }


  myquestions()//to move to next question
  {
    setState(() {
      _index=(_index+1)%questions.length;//to avoid error that will apear when all questions are finished in array and length is finished
    });
  }
  myquestionsprevious()
  {
    setState(() {
      if(_index>=1)
      {
        _index--;
      }
    });
  }

  calculatemyscore()
  {
    setState(() {
      _myscore++;
    });
  }

  calculatemyscorenegative()
  {
    setState(() {
      if(_myscore>=1) {
        _myscore--;
      }
    });
  }


  checkanswer(bool userchoice)
  {
    if(userchoice==questions[_index].iscorrect)
    {
      final snackbar=SnackBar(content:Text("CORRECT ANSWER!!"),backgroundColor:Colors.blue,duration:Duration(milliseconds:1000,)
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      calculatemyscore();
    }
    else
    {
      final snackbar=SnackBar(content:Text("INCORRECT ANSWER!!"),backgroundColor:Colors.red,
        duration:Duration(milliseconds:1000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      calculatemyscorenegative();
    }
  }



}