import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unumbers/feature/stream/model/stream_data.dart';

final streamDataProvider = StreamProvider<StreamData>((ref) {
  final firebase =
      FirebaseFirestore.instance.collection('games').doc('game').snapshots();

  return firebase.map((snapshot) {
    final data = snapshot.data();
    if (data != null) {
      return StreamData.fromJson(data);
    } else {
      throw Exception('No data');
    }
  });
});
