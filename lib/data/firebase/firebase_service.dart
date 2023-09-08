import 'dart:io';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseDataBase {
  static final CollectionReference garbageCollection =
      FirebaseFirestore.instance.collection('dechets');

  static Future<DocumentReference<Object?>> sendData({
    required String type,
    required String quantity,
    required String note,
    required double latitude,
    required double longitude,
  }) async {
    DocumentReference documentReference = await garbageCollection.add({
      'type': type,
      'quantity': quantity,
      'note': note,
      'localisation': GeoPoint(latitude, longitude),
      'metadata': FieldValue.serverTimestamp(),
    });
    return documentReference;
  }

  static Future<void> uploadImageToFirebase({
    required XFile imageFile,
    required String documentId,
  }) async {
    final Reference storageRef =
        FirebaseStorage.instance.ref().child('images/$documentId.jpg');
    final UploadTask uploadTask = storageRef.putFile(File(imageFile.path));
    final TaskSnapshot downloadUrl = (await uploadTask);
    final String url = await downloadUrl.ref.getDownloadURL();
    await garbageCollection.doc(documentId).update({'image_url': url});
  }
}
