import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradproject/models/detailed_model.dart';
import 'package:gradproject/models/fav_model.dart';
import 'package:gradproject/models/rating_model.dart';

class FavProvider extends ChangeNotifier{
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  FavModel favModel = FavModel(userId: "", name: []);
 // Detailedmodel detailedmodel = Detailedmodel(id: 0, name: "", image: "", cooktime: "", calories: "", ingredients: "", instructions: "", keywords: "", quantities: "", servings: "");
  UserCredential ?user ;
  // saverating(
  //     List rate,
  //    // List recipe_id
  //     ) async {
  //   ratingModel ratingmodel = ratingModel(
  //       userId: auth.currentUser!.uid,
  //       recipe_id: [],
  //       rate: rate
  //       );
  //   await firestore
  //       .collection("ratings")
  //       .doc(auth.currentUser!.uid)
  //       .set(
  //       ratingmodel.toJson());
  // }
  //
  //
  Future savefavs(List<String> name ) async {
    final userId = auth.currentUser!.uid;
    final favDocRef = firestore.collection('favorites').doc(userId);
    final favsDoc = await favDocRef.get();
    if (!favsDoc.exists) {
      // If the document doesn't exist, create a new document with the current ratings
      final favs = FavModel(userId: userId, name: name);
      await favDocRef.set(favs.toJson());
    } else {
      // If the document already exists, add the current ratings to the existing ratings
      final existingfavs = List<String>.from(favsDoc.data()!['name'] ?? []);
      existingfavs.addAll(name);
      final newfavs = FavModel(userId: userId, name: existingfavs);
      await favDocRef.set(newfavs.toJson());
    }
  }

  // Future saveratingss(List rate, List recipe_id) async {
  //   final userId = auth.currentUser!.uid;
  //   final ratingsDocRef = firestore.collection('favorites').doc(userId);
  //   final ratingsDoc = await ratingsDocRef.get();
  //   if (!ratingsDoc.exists) {
  //     // If the document doesn't exist, create a new document with the current ratings and recipe IDs
  //     final rating = ratingModel(userId: userId, rate: rate, recipe_id: recipe_id);
  //     await ratingsDocRef.set(rating.toJson());
  //   } else {
  //     // If the document already exists, add the current ratings and recipe IDs to the existing ratings and recipe IDs
  //     final existingRatings = List.from(ratingsDoc.data()!['name'] ?? []);
  //     existingRatings.addAll(rate);
  //     final existingRecipeIds = List.from(ratingsDoc.data()!['recipe_id'] ?? []);
  //     existingRecipeIds.addAll(recipe_id);
  //     final newRatings = ratingModel(
  //       userId: userId,
  //       rate: existingRatings,
  //       recipe_id: existingRecipeIds,
  //     );
  //     await ratingsDocRef.set(newRatings.toJson());
  //   }
  // }

  getfavs() async {
    await firestore
        .collection('favorites')
        .doc(auth.currentUser!.uid)
        .get()
        .then((value) {
      favModel = FavModel.fromJson(value.data()!);
    });
    notifyListeners();
  }


  Future<void> getfavss() async {
    try {
      var document = firestore
          .collection('favorites')
          .doc(auth.currentUser!.uid);
      var data = await document.get();
      if (data.exists) {
        favModel = FavModel.fromJson(data.data()!);
        notifyListeners();
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error retrieving data: $e');
    }
  }
}

