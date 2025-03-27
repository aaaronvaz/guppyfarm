import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Fetch all fish documents
  Future<List<Map<String, dynamic>>> getFish() async {
    try {
      QuerySnapshot snapshot = await _db.collection('fishes').get();
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id; // Add document ID for future updates
        print('entires: ${data.length}');
        return data;
      }).toList();
    } catch (e) {
      print('Error fetching fish data: $e');
      return [];
    }
  }

  // Toggle favorite status
  Future<void> toggleFavorite(String fishId, bool currentFav) async {
    try {
      await _db.collection('fishes').doc(fishId).update({
        'fav': !currentFav, // Toggle the value
      });
    } catch (e) {
      print('Error updating favorite status: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getFavoriteFish() async {
    try {
      QuerySnapshot snapshot =
          await _db.collection('fishes').where('fav', isEqualTo: true).get();
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id; // Add document ID
        return data;
      }).toList();
    } catch (e) {
      print('Error fetching favorite fish: $e');
      return [];
    }
  }
}
