import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(Home());
}
class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:appBar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              title(),
              categoryList(),
              orderAgainText(),
              cardList(),
              pageList(),
              rButton(),

            ],
          ),
        ),

      ),
    );
  }
  Widget pageList(){
    return Container(
      width: double.infinity,
      height: 250,
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          container("images/a.jpg"),
          container("images/b.jpg"),
          container("images/c.jpg"),
          container("images/d.jpg"),
        ],
      ),
    );
  }
  Widget container(String image){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          child: Image.asset(image,fit:BoxFit.cover),
        ),
      ),
    );
  }
  Widget cardList(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(

        children: [
          CardList("KONAFA", "3 pieces", 7.5,"images/aaa.png"),
          CardList("CHEESE CAKE", "7 pieces", 2.5,"images/jjj.png"),
          CardList("PAVARIA", "1 pieces", 8.0,"images/ppp.png"),
          CardList("BLACK FOREST", "4 pieces", 9.5,"images/ooo.png"),
        ],
      ),
    );
  }
  Widget rButton(){
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      child: FlatButton(
        onPressed: (){},
        color: Colors.orange,
        child: Text("VIEW ALL FOOD",style: TextStyle(color: Colors.white,fontSize: 20),),

      ),
    );
  }
  Widget orderAgainText(){
    return  Container(
      margin: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Order again",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          Icon(Icons.arrow_forward,size: 20,),
        ],
      ),
    );
  }
  Widget categoryList(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Category("Meat", "images/aa.png", Colors.deepOrange),
          Category("Burger", "images/bb.png",Colors.green),
          Category("Falafel", "images/falafel_PNG32.png", Colors.blue),
          Category("Salad", "images/dd.png", Colors.yellow),
        ],
      ),
    );
  }

  Widget title(){
    return Container(
        margin: EdgeInsets.all(10),
        child: Text("What would you like to order?",
          textAlign: TextAlign.center,
          style:TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        )
    );
  }

 AppBar appBar(){
    return  AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: FlatButton(child: Icon(Icons.menu,color: Colors.black,) ,),

      actions: [
        SizedBox(width: 10,),
        Icon(Icons.search,color: Colors.black,),
      ],

      title: Center(
        child: Column(
          children: [
            Text("Delivering To",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300),),
            Text("البيت",style: TextStyle(color: Colors.orange,fontSize: 20,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
 }
}

class Category extends StatelessWidget{
  String text;
  String image;
  Color color;
  Category(this.text, this.image, this.color);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 200,
            height: 200,
            color: color,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                    margin:EdgeInsets.only(left: 10,bottom: 10),
                    child: Text(text,style: TextStyle(color: Colors.white,fontSize: 20),)
                ),
                Container(alignment:Alignment.center,child: Image.asset(image)),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
class CardList extends StatelessWidget{
  String name;
  String order;
  double price;
  String image;
  CardList(this.name, this.order, this.price,this.image);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 250,
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey,width:5.0 ),
        borderRadius: BorderRadius.circular(5),

      ),
      child: Stack(
        children: [
          Container(alignment:Alignment.center,child: Image.asset(image)),
          Column(
            children: [
              Text(name,style: TextStyle(fontWeight: FontWeight.bold,),),
              Text(order),
            ],
          ),
          Positioned(
            right: 0,
            child: Text("$price \$"),
          ),
          Positioned(
            bottom: 0,
            child: Row(
              children: [
                FlatButton(
                  onPressed: (){},
                  child: Row(
                    children: [
                      Icon(Icons.refresh,color: Colors.orange,),
                      Text("Re-Order",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange)),
                    ],
                  ),
                ),
                SizedBox(width: 5,),
                FlatButton(
                  onPressed: (){},
                  child: Row(
                    children: [
                      Icon(Icons.tag_faces,color: Colors.orange,),
                      Text("Rate",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange)),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }


}