class Address {

  String place;
  String district;
  String city;
  String postalCode;
  String federativeUnit;

  Address({
    this.place,
    this.district,
    this.city,
    this.postalCode,
    this.federativeUnit
  });

  @override
  String toString() {
    return '$place, $district, $city, $postalCode, $federativeUnit';
  }
}