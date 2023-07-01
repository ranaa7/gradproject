import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradproject/models/detailed_model.dart';
import 'package:gradproject/models/rating_model.dart';
import 'package:gradproject/models/recipe_model.dart';
import 'package:gradproject/models/user_model.dart';

class RatingProvider extends ChangeNotifier{
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

 ratingModel ratingmodel= ratingModel(userId: "", recipe_id: [], rate: []);
 //Detailedmodel detailedmodel = Detailedmodel(id: 0, name: "", image: "", cooktime: "", calories: "", ingredients: "", instructions: "", keywords: "", quantities: "", servings: "");
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
  // Future saveratings(List rate , List recipe_id) async {
  //   final userId = auth.currentUser!.uid;
  //   final ratingsDocRef = firestore.collection('ratings').doc(userId);
  //   final ratingsDoc = await ratingsDocRef.get();
  //   if (!ratingsDoc.exists) {
  //     // If the document doesn't exist, create a new document with the current ratings
  //     final rating = ratingModel(userId: userId, rate: rate, recipe_id: recipe_id);
  //     await ratingsDocRef.set(rating.toJson());
  //   } else {
  //     // If the document already exists, add the current ratings to the existing ratings
  //     final existingRatings = List.from(ratingsDoc.data()!['rate'] ?? []);
  //     existingRatings.addAll(rate);
  //     final newRatings = ratingModel(userId: userId, rate: existingRatings, recipe_id: []);
  //     await ratingsDocRef.set(newRatings.toJson());
  //   }
  // }

  Future saveratingss(List rate, List recipe_id) async {
    final userId = auth.currentUser!.uid;
    final ratingsDocRef = firestore.collection('ratings').doc(userId);
    final ratingsDoc = await ratingsDocRef.get();
    if (!ratingsDoc.exists) {
      // If the document doesn't exist, create a new document with the current ratings and recipe IDs
      final rating = ratingModel(userId: userId, rate: rate, recipe_id: recipe_id);
      await ratingsDocRef.set(rating.toJson());
    } else {
      // If the document already exists, add the current ratings and recipe IDs to the existing ratings and recipe IDs
      final existingRatings = List.from(ratingsDoc.data()!['rate'] ?? []);
      existingRatings.addAll(rate);
      final existingRecipeIds = List.from(ratingsDoc.data()!['recipe_id'] ?? []);
      existingRecipeIds.addAll(recipe_id);
      final newRatings = ratingModel(
        userId: userId,
        rate: existingRatings,
        recipe_id: existingRecipeIds,
      );
      await ratingsDocRef.set(newRatings.toJson());
    }
  }
  getrate() async {
    await firestore
        .collection("ratings")
        .doc(auth.currentUser!.uid)
        .get()
        .then((value) {
      ratingmodel = ratingModel.fromJson(value.data()!);
    });
    notifyListeners();
  }
}

