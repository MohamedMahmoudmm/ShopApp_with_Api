class HomeModel
{
   bool? status;
   HomeDataModel? data;


  HomeModel.fromJson(Map<String,dynamic> json)
  {
    status=json['status'];
    data= HomeDataModel.fromJson(json['data']);
  }

}

class HomeDataModel
{

   List<BannersModel> banners=[] ;
   List<ProductsModel> product=[];


  HomeDataModel.fromJson(Map<String , dynamic> json)
  {
    json['banners'].forEach((element)
    {
      banners.add(BannersModel.fromJson(element) );
    });
    json['products'].forEach((element)
    {
      product.add(ProductsModel.fromJson(element));
    });

  }

}
class BannersModel
{
  int? id;
  String? image;
  BannersModel.fromJson(Map<String, dynamic> json)
  {
    id=json['id'];
    image=json['image'];
  }

}
class ProductsModel
{

  int? id;
  String? image;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? name;
  bool? in_favorites;
  bool? in_cart;


  ProductsModel.fromJson(Map<String,dynamic> json)
  {
    id=json['id'];
    image=json['image'];
    price=json['price'];
    oldPrice=json['oldPrice'];
    discount=json['discount'];
    name=json['name'];
    in_favorites=json['in_favorites'];
    in_cart=json['in_cart'];

  }

}