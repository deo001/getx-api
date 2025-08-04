import 'package:get/get.dart';
import 'package:getx_api/services/remote_services.dart';
import '../models/product_model.dart';

class ProductController extends GetxController{
  var isLoading = true.obs;
  var productList = <Product>[].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    fetchProducts();
    super.onInit();

  }

  void fetchProducts() async{
    isLoading(true);
    try {
      var  products = await RemoteServices.fetchProducts();
      if(products != null){
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}