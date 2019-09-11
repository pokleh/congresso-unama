import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:congresso_unama/models/congress.dart';
import 'package:congresso_unama/models/speaker.dart';

class SpeakerRepository {
  final Firestore _db = Firestore.instance;

  Stream<List<Speaker>> getCongressSpeakers(Congress congress) {
    return _db
        .collection('2019_palestras')
        .where("congress", isEqualTo: congress.id)
        .where("speaker", isGreaterThan: "")
        .orderBy("speaker")
        .snapshots()
        .map((list) =>
            list.documents.map((doc) => Speaker.fromFirestore(doc)).toList());
  }
}
