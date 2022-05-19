class TrackBody {
  String? token;
  double ?longitude;
  double ?latitude;
  String? location;
  String? orderId;

  TrackBody(
      {required this.token, required this.longitude, required this.latitude, required this.location, required this.orderId});

  TrackBody.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    location = json['location'];
    orderId = json['order_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['location'] = this.location;
    data['order_id'] = this.orderId;
    return data;
  }
}
