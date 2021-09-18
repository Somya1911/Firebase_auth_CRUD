import 'package:auth_firebase/Authenticate/Methods.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class HomeScreen extends StatelessWidget {
  final DBRef = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
 return MaterialApp(
   title: 'Cloud Computing DA',
     theme: ThemeData(
       // Define the default brightness and colors.
       brightness: Brightness.dark,
       primaryColor: Colors.lightBlue[800],

       // Define the default font family.
       fontFamily: 'Georgia',),
   home: Scaffold(
     //appBar: AppBar(title: Text("CRUD Operations"),),
     body: Center(
    child: Column(
       children: <Widget>[
         SizedBox(
           height: size.height / 20,
         ),
         Container(
           width: size.width / 1.1,
           child: Text(
             "Hey!! \n",

             style: TextStyle(
               fontSize: 30,
               fontWeight: FontWeight.bold,
             ),
           ),
         ),
         SizedBox(
           height: size.height / 20,
         ),
         Container(
           width: size.width / 1.1,
           child: Text(
             "This is an application to show the realtime database operation in Firebase \n",

             style: TextStyle(
               fontSize: 22,
               fontWeight: FontWeight.bold,
             ),
           ),
         ),

         RaisedButton(
           child: Text("Write Data"),
           onPressed: (){
             writeData();
    },

    ),
         RaisedButton(
           child: Text("Read Data"),
           onPressed: (){
             readData();
           },

         ),
         RaisedButton(
           child: Text("Update Data"),
           onPressed: (){
             updateData();
           },

         ),
     RaisedButton(
     child: Text("Delete Data"),
    onPressed: (){
    deleteData();
    },
     ),

         SizedBox(
           height: size.height / 20,
         ),
         Container(
           width: size.width / 1.1,
           child: Text(
             "Somya Khatri 19BIT0365 \n",

             style: TextStyle(
               fontSize: 22,
               fontWeight: FontWeight.bold,
             ),
           ),
         ),
         RaisedButton(
           child: Text("Log out"),
           onPressed: (){
             logOut(context);
           },
         ),

       ],
     )
   )

 ));


}
void writeData()
{
  DBRef.child("1").set({
    'id': 'ID1',
    'data': 'This is a sample Data'
  });

}
  void readData()
  {
    DBRef.once().then((DataSnapshot dataSnapShot){
      print(dataSnapShot.value );
    });

  }


  void updateData()
  {

    DBRef.child("1").update({
      'data' : 'This is an updated value'

    });
  }

  void deleteData() {
    DBRef.child("1").remove();

  }//     Scaffold(
//       appBar: AppBar(
//         title: Text("Home Screen"),
//
//       ),
//       body: Center(
//         child: TextButton(
//           onPressed: () => logOut(context),
//           child: Text("LogOut"),
//         ),
//       ),
//     );
//   }
// }
}
