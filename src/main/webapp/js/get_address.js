function get_address(provinceId, cityId, countryId) {
    let prov = province[provinceId];
    let city = prov['city'][cityId];
    let coun = city.districtAndCounty[countryId];
    return prov.name + city.name + coun;
}