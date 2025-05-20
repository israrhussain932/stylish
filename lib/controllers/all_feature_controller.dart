import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../data_models/model_category.dart';
class AllFeatureController extends GetxController {
  final FirebaseFirestore _firestore;
  AllFeatureController(this._firestore);
  RxList<AllFeatureModel> allFeatures = <AllFeatureModel>[].obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    fetchAllFeatures();
    super.onInit();
  }
  void fetchAllFeatures() async {
    try {
      isLoading.value = true;
      final snapshot = await _firestore.collection('all_feature').get();

      allFeatures.value = snapshot.docs
          .map((doc) => AllFeatureModel.fromMap(doc.data(), doc.id))
          .toList();
    } catch (e) {
      print("Error fetching features: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
