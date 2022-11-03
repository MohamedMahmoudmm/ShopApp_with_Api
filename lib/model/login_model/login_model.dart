class ShopLoginModel
{
   bool? status;
   String? msg;
   UserData? data;

//   ShopLoginModel({
//     this.msg,
//     this.user,
//     this.status,
//     this.errNum
// });
  ShopLoginModel.fromJson(Map<String,dynamic> json)
  {
    status=json['status'];
    msg=json['message'];
    data=json['data'] != null ? UserData.fromJson(json['data']):null;
  }

}

class UserData
{

   String? name;
   String? email;
   String? phone;
    String? image;
   String? token;
  UserData({
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.token
});
  UserData.fromJson(Map<String , dynamic> json)
  {
    phone=json['phone'];
    name=json['name'];
    image=json['image'];
    email=json['email'];
    token=json['token'];
  }
}