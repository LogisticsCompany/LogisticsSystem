<script>
    function $1(str) {
        return document.getElementById(str);
    }

    function getOption(value, text) {
        let opt = document.createElement('option');
        opt.innerText = text;
        opt.value = value;
        return opt;
    }

    function showProv(__province, ___province, province_id) {
        let len = province.length;
        for (let i = 0; i < len; i++)
            __province.appendChild(getOption(i, province[i].name));

        if (province_id != -1)
            ___province.selectpicker('val', province_id);
        ___province.selectpicker("refresh");
    }

    function init_address(_province, _city, _country,
                          province_id, city_id, country_id) {
        let __province = $1(_province);
        let __city = $1(_city);
        let __country = $1(_country);

        let ___province = $("#" + _province);
        let ___city = $("#" + _city);
        let ___country = $("#" + _country);

        __province.addEventListener("change", function () {
            let val = __province.options[__province.selectedIndex].value;
            if (val != province_id) {
                province_id = val;
                city_id = -1;
            }

            if (val != null) {
                __city.length = 0;
                let cities = province[val]["city"];
                let cityLen = cities.length;
                for (let j = 0; j < cityLen; j++)
                    __city.appendChild(getOption(j, cities[j].name));

                if (city_id != -1)
                    ___city.selectpicker('val', city_id);
                ___city.selectpicker("refresh");
            }
        });

        __city.addEventListener("change", function () {
            let val = __city.options[__city.selectedIndex].value;
            if (val != city_id) {
                city_id = val;
                country_id = -1;
            }

            if (val != null) {
                __country.length = 0;
                let countries = province[province_id]["city"][val].districtAndCounty;
                let countryLen = countries.length;
                for (let k = 0; k < countryLen; k++)
                    __country.appendChild(getOption(k, countries[k]));

                if (country_id != -1)
                    ___country.selectpicker('val', country_id);
                ___country.selectpicker("refresh");
            }
        });

        showProv(__province, ___province, province_id);
    }
</script>