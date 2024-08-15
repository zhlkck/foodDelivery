import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserDetail(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userInfoMap);
  }

  UpdateUserwallet(String id, String amount) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .update({"wallet": amount});
  }

  Future addFoodItem(Map<String, dynamic> userInfoMap, String name) async {
    return await FirebaseFirestore.instance.collection('name').add(userInfoMap);

    // ignore: dead_code
    Future<Stream<QuerySnapshot>> getFoodItem(String nama) async {
      return await FirebaseFirestore.instance.collection(name).snapshots();
    }
  }

  getFoodItem(String s) {}

  getFoodCart(String s) {}
}
