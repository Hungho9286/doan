import 'localdb.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class FireDB {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  createNewUser(String name, String avartar, String uid) async {
    final User? current_user = _auth.currentUser;
    if (await getUser()) {
      print("USER ALREADY EXISTS");
    } else {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(current_user!.uid)
          .set({
        "name": name,
        "phone": "",
        "avartar": avartar,
        "address" : "",
        "point": 0,
        "status" : true ,
      }).then((value) async {
        await LocalDB.saveChaoPoint("0");
        await LocalDB.savePhone("");
        await LocalDB.saveAddress("");
        await LocalDB.saveStatus(true);
        print("User Registered Successfully");
      });
    }
  }
  
  Future<bool> getUser() async {
    final User? current_user = _auth.currentUser;
    String user = "";

    await FirebaseFirestore.instance
        .collection("users")
        .doc(current_user!.uid)
        .get()
        .then((value) async {
      user = value.data().toString();
      print(user);
      await LocalDB.saveChaoPoint("999999");
      await LocalDB.savePhone("");
      await LocalDB.saveAddress("");
      await LocalDB.saveStatus(true);
    });
    if (user.toString() == "null") {
      return false;
    } else {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(current_user.uid)
          .get()
          .then((value) async {
        user = value.data().toString();
        print(user);
        await LocalDB.saveChaoPoint(value["money"].toString());
        await LocalDB.savePhone(value["phone"].toString());
        await LocalDB.saveAddress(value["address"].toString());
        await LocalDB.saveStatus(value["Status"]);
        
        
      });
      return true;
    }
  }
}
