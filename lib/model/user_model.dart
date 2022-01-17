class UserModel {
  late String uid;
  late String email;
  late String userName;
  late String profileImage;
  late String phoneNumber;
  late List wishList;
  late List cartItems;
  late List orders;

  UserModel(
      {required this.uid,
      required this.email,
      required this.userName,
      required this.profileImage,
      required this.phoneNumber,
      required this.wishList,
      required this.cartItems,
      required this.orders});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    userName = json['userName'];
    profileImage = json['profileImage'];
    phoneNumber = json['phoneNumber'];
    wishList = json['wishList'];
    cartItems = json['cartItems'];
    orders = json['orders'];
    email = json['email'];
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'userName': userName,
      'profileImage': profileImage,
      'phoneNumber': phoneNumber,
      'wishList': wishList,
      'cartItems': cartItems,
      'orders': orders,
      'email': email,
    };
  }
}
