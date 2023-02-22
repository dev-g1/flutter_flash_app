import 'package:cloud_firestore/cloud_firestore.dart';
class Messages {

  final String? email;
  final String? text;


   toJson(){
    return {
      'email': email,
      'message': text
    };
}

  Messages({this.email, this.text});
//   factory Messages.fromFirestore(
//     DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options,
//   ){
//     final data = snapshot.data();
//     return Messages(
//       email: data?['Sender'],
//       text: data?['Text']
//       );
//   }
//   Map<String, dynamic> toFirestore(){
//     return {
//       if(email != null) 'Sender' : email,
//       if(text != null) 'Text' : text
//     };
// }




factory Messages.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
  final data = document.data()!;
  return Messages(
    // id: document.id,
    email: data["Sender"],
    text: data['Text'],
  );
}


}

