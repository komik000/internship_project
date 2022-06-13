class CharacterContacts_address{
  String street;
  String suite;
  String city;
  String zipcode;
  String geo;

  CharacterContacts_address.fromJson(Map json)
      : street = json['street'],
        suite = json['suite'],
        city = json['city'],
        zipcode = json['zipcode'],
        geo = json['geo'];

  Map toJson() {
    return {'street': street, 'suite': suite,city: 'city','zipcode': zipcode, 'geo': geo};
  }
}