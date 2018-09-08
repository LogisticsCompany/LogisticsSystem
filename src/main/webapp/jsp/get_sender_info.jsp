<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>
<%@ page import = "com.example.logistics_system.bean.User" %>
<%@include file = "init_address.jsp" %>
<%
    User user = (User) request.getSession().getAttribute("user");
    String address = "", sender = "", phoneNumber = "";
    int prov = -1, city = -1, country = -1;
    if (user != null)
    {
        prov = user.getProvince();
        city = user.getCity();
        country = user.getCountry();
        address = user.getAddress();
        sender = user.getName();
        phoneNumber = user.getPhoneNumber();
    }
%>

<script>
    let province_id = <%=prov%>;
    let city_id = <%=city%>;
    let country_id = <%=country%>;

    function get_sender_address_id() {
        let province_name = '<%=prov%>';
        let city_name = '<%=city%>';
        let country_name = '<%=country%>';

        if (province_name != null) {
            let provinces = province;
            let province_length = provinces.length;
            for (province_id = 0; province_id < province_length; province_id++)
                if (provinces[province_id].name == province_name)
                    break;


            if (city_name != null) {
                let cities = provinces[province_id]["city"];
                let city_length = cities.length;
                for (city_id = 0; city_id < city_length; city_id++)
                    if (cities[city_id].name == city_name)
                        break;

                if (country_name != null) {
                    let countries = cities[city_id].districtAndCounty;
                    let country_length = countries.length;
                    for (country_id = 0; country_id < country_length; country_id++)
                        if (countries[country_id] == country_name)
                            break;
                }
            }
        }
    }

    // get_sender_address_id();

    init_address('senderProvince', 'senderCity', 'senderCountry', province_id, city_id, country_id);
    init_address('receiverProvince', 'receiverCity', 'receiverCountry', -1, -1, -1);

    function set_sender_info() {
        let address = '<%=address%>';
        let sender = '<%=sender%>';
        let phone_number = '<%=phoneNumber%>';


        $1('senderAddress').value = address;
        $1('sender').value = sender;
        $1('senderPhoneNumber').value = phone_number;
    }

    set_sender_info();
</script>