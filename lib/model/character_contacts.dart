class CharacterContacts {
  int id;
  String name;
  String username;
  String email;
  Map address;
  String phone;
  String website;
  Map company;


  CharacterContacts.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        address = json['address'],
        phone = json['phone'],
        website = json['website'],
        company = json['company'],
        username = json['username'];

  Map toJson() {
    return {'id': id, 'name': name,email: 'email','address': address, 'phone': phone,website: 'website',
      company : 'company', username : "username"};
  }
}
// String street,
// String suite,
// String city,
// String zipcode,
// LatLng geo,
// double lat,
// double lng,