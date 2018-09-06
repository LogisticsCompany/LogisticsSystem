function $1(str) {
    return document.getElementById(str);
}

let addrShow = $1('show');
let btn = $1('btn');
let prov = $1('province');
let city = $1('city');
let country = $1('country');

let current = {
    province: '',
    city: '',
    country: ''
};

function showProv() {
    btn.disabled = true;
    let provinces = province;
    let len = provinces.length;
    for (let i = 0; i < len; i++) {
        let provOpt = document.createElement('option');
        provOpt.innerText = provinces[i].name;
        provOpt.value = i;
        prov.appendChild(provOpt);
    }
}

showProv();

function showCity(obj) {
    let val = obj.options[obj.selectedIndex].value;
    if (val != current.province) {
        current.province = val;
        addrShow.value = '';
        btn.disabled = true;
    }

    if (val != null) {
        city.length = 0;
        let cities = province[val]["city"];
        let cityLen = cities.length;
        for (let j = 0; j < cityLen; j++) {
            let cityOpt = document.createElement('option');
            cityOpt.innerText = cities[j].name;
            cityOpt.value = j;
            city.appendChild(cityOpt);
        }
        // 必须刷新！！！
        $('#city').selectpicker("refresh");
    }
}

function showCountry(obj) {
    let val = obj.options[obj.selectedIndex].value;
    current.city = val;
    if (val != null) {
        country.length = 0;
        let countries = province[current.province]["city"][val].districtAndCounty;
        let countryLen = countries.length;
        if (countryLen == 0) {
            addrShow.value = province[current.province].name + '-' + province[current.province]["city"][current.city].name;
            return;
        }
        for (let k = 0; k < countryLen; k++) {
            let countryOpt = document.createElement('option');
            countryOpt.innerText = countries[k];
            countryOpt.value = k;
            country.appendChild(countryOpt);
        }
        $('#country').selectpicker("refresh");
    }
}

function selectCountry(obj) {
    current.country = obj.options[obj.selectedIndex].value;
    if (current.city != null && current.country != null)
        btn.disabled = false;
}

function showAddr() {
    addrShow.value = province[current.province].name + '-' +
        province[current.province]["city"][current.city].name + '-' +
        province[current.province]["city"][current.city].districtAndCounty[current.country];
}