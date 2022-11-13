import 'package:flutter/material.dart';

void main()=> runApp(MyApp());
var imagelist=[
  'assets/001.PNG','assets/002.PNG',
  'assets/003.PNG','assets/003mega.PNG',];
var titleText=['001 妙蛙種子','002 妙蛙草','003 妙蛙花','003 超級妙蛙花'];
var contextlist=[
  '身高:0.7m\n分類:種子寶可夢\n體重:6.9kg\n特性:茂盛\n\n簡介:\n經常可見牠在太陽下睡午覺的樣子。在沐浴了充足的陽光之後，牠背上的種子就會成長茁壯。',
  '身高:1.0m\n分類:種子寶可夢\n體重:13.0kg\n特性:茂盛\n\n簡介:\n下盤為了支撐背上的花苞而變得強韌。當待在太陽底下一動也不動的時間變長，就表示大朵的花即將盛開。',
  '身高:2.0m\n分類:種子寶可夢\n體重:100.0kg\n特性:茂盛\n\n簡介:\n據說充足的營養和陽光會讓花朵的顏色變得更加鮮豔。花朵散發的香氣能夠療癒人心。',
  '身高:2.4m\n分類:種子寶可夢\n體重:155.5kg\n特性:厚脂肪\n\n簡介:\n據說充足的營養和陽光會讓花朵的顏色變得更加鮮豔。花朵散發的香氣能夠療癒人心。',
];
var index=0;
var titlecounter=0;
var contextcounter=0;
var Buttoncounter1=0;
bool isvalued=false;


final _messangerKey = GlobalKey<ScaffoldMessengerState>();
class _MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
          scaffoldMessengerKey: _messangerKey,
          home: Scaffold(
            appBar: AppBar(title: Text('寶可夢圖鑑',style: TextStyle(color: isvalued? Colors.brown[100]:Colors.white),),
              actions: [Switch(
                activeColor: Colors.brown[100],
                  value: isvalued,
                  onChanged:(value){
                  setState(() {
                    isvalued=!isvalued;});})],
              backgroundColor:isvalued? Colors.brown[900]:Colors.red[800]),
            body:Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      color:isvalued? Colors.brown[100]:Colors.white,
                      height: 100,width: 380,
                      alignment: Alignment.center,
                      child:titlecounter==Buttoncounter1?
                      Text(titleText[Buttoncounter1],style: TextStyle(fontSize: 40),):
                      Text(titleText[Buttoncounter1],style: TextStyle(fontSize: 40),)
                  ),
                    ElevatedButton(
                      style:ButtonStyle(
                        backgroundColor:isvalued? MaterialStateProperty.all(Colors.brown[100]):MaterialStateProperty.all(Colors.white),
                        elevation: MaterialStateProperty.all(0),
                      ),
                      child:Ink.image(
                        height: 400,
                        width: 400,
                      fit: BoxFit.fill,
                        image: AssetImage(imagelist[index]),),
                    onPressed: () {
                      setState(() {
                        titlecounter==Buttoncounter1;
                        contextcounter=Buttoncounter1;
                      });
                      _messangerKey.currentState?.showSnackBar(SnackBar(
                        content:Text(contextlist[contextcounter]),
                        action: SnackBarAction(
                          label: 'Close',
                          onPressed: () {},),));

                      }),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:<Widget>[
                      IconButton(
                        iconSize: 60,
                        icon:const Icon(Icons.arrow_circle_left_rounded),
                        onPressed:(){
                          setState(() {
                            if(Buttoncounter1!=0){
                            Buttoncounter1=Buttoncounter1-1;
                            }
                            if(index>0){
                              index=index-1;}
                            titlecounter==Buttoncounter1;
                          });
                        },),
                      IconButton(
                        iconSize: 60,
                        icon:const Icon(Icons.arrow_circle_right_rounded),
                        onPressed:(){
                          setState(() {
                            if(Buttoncounter1!=3){
                            Buttoncounter1=Buttoncounter1+1;
                            }
                            if(index<3){
                              index=index+1;}
                            titlecounter==Buttoncounter1;
                          });
                        },),
                    ],

                  ),
                  const SizedBox(height: 50,),
                ],),),

            backgroundColor:isvalued? Colors.brown[100]:Colors.white
          )
      );

  }
}
class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _MyAppState();
  }
}
final ButtonStyle myButtonStyle = ElevatedButton.styleFrom(
  primary: Colors.black,
  onPrimary: Colors.black,
  backgroundColor:Colors.brown[100],
  minimumSize: Size(88, 36),
  elevation: 10,
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);
final ButtonStyle myButtonStyle2 = ElevatedButton.styleFrom(
  primary: Colors.black,
  onPrimary: Colors.black,
  backgroundColor:Colors.white,
  minimumSize: Size(88, 36),
  elevation: 10,
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);