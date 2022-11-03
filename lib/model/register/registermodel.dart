class ShopRegisterModel
{
   bool? status;
   String? msg;


//   ShopRegisterModel({
//     this.msg,
//     this.user,
//     this.status,
//     this.errNum
// });
  ShopRegisterModel.fromJson(Map<String,dynamic> json)
  {
    status=json['status'];
    msg=json['message'];
  }

}

