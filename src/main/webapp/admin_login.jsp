<!DOCTYPE html>
<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">s
<html xmlns = "http://www.w3.org/1999/xhtml">
<head>
    <base href = "<%=basePath%>"/>
    <meta http-equiv = "Content-Type" content = "text/html; charset=utf-8"/>
    <meta charset = "utf-8">
    <title>物流信息管理系统</title>
    <meta name = "description" content = "">
    <meta name = "viewport" content = "width=device-width">
    <link rel = "stylesheet" href = "css/color.min.css">
    <link rel = "stylesheet" href = "css/style.min.css">
    <style type = "text/css" id = "font-override"></style>
    <style type = "text/css">#focuses {
        width: 100%;
        font-size: 187.5%;
        line-height: 150%
    }

    #focuses .prompt input {
        width: 13.8em;
        margin: 0 auto;
        padding-top: 15px;
        display: block;
        background: 0;
        border: 0;
        border-bottom: 2px solid #fff;
        color: #fff;
        font-weight: 500;
        outline: 0;
        text-align: center;
        transition: border-color .2s ease;
        background: transparent;
    }</style>

    <style>
        .login_button {
            width: 200px;
            height: 50px;
            background: transparent;
            color: #fff;
            padding: 0;
            margin: 0;
            font-size: 100%;
            border: 0;
        }
    </style>
</head>
<body class = "f--default Chrome">
<svg xmlns = "http://www.w3.org/2000/svg">
    <defs>
        <symbol id = "icon-folder" viewBox = "0 0 512 512">
            <path d = "M390.5 144h-167c-4.7 0-10.7-9.9-18.5-19-7.1-8.3-14.7-13-20.5-13h-60.3c-15.5 0-28.2 8.9-28.2 24.3v234.6c0 15.5 12.7 29.1 28.2 29.1h266.3c15.5 0 25.5-13.6 25.5-29.1V168.8c0-15.5-10-24.8-25.5-24.8zm-266.3-16H179.3c3.9 0 8.6 1.6 14.3 8.3 12.1 14.3 15.5 23.7 29.9 23.7h167c6.6 0 9.5 2.2 9.5 8.8V192H112v-55.7c0-9 10.3-8.3 12.2-8.3zm266.3 256H124.2c-6.5 0-12.2-6.2-12.2-13.1V208h288v162.9c0 6-2.6 13.1-9.5 13.1z"></path>
        </symbol>
    </defs>
</svg>


<div class = "bookmarks-bar bookmarks-placeholder"
     style = "display:none; position: fixed; top: 0; left: 0; right: 0; height: 31px; background-color: rgba(242,242,242,1); border-bottom: 0.5px solid rgba(182,180,182,0.4);"></div>
<div class = "overlay loading-overlay">
    <svg xmlns = "http://www.w3.org/2000/svg" width = "1000" height = "1000" viewBox = "0 0 1000 1000"
         class = "loading-logo" fill = "#ccc">
        <path d = "M500.024 1000.08C223.851 1000.08-.032 776.2-.032 500.024S223.851-.032 500.024-.032s500.056 223.883 500.056 500.056S776.2 1000.08 500.024 1000.08zm250.33-523.321a228.485 228.485 0 0 0-5.749-51.018 136.773 136.773 0 0 0-19.042-45.27 98.029 98.029 0 0 0-35.928-32.336Q667 335.925 633.946 335.92q-43.839 0-78.324 26.228t-48.863 75.09h-1.437a172.1 172.1 0 0 0-11.5-39.881 108.707 108.707 0 0 0-20.839-31.976 92.149 92.149 0 0 0-31.976-21.557q-19.048-7.9-44.911-7.9a120.578 120.578 0 0 0-74.372 25.509 147.849 147.849 0 0 0-29.1 30.539 141.892 141.892 0 0 0-20.12 40.959h-1.437q0-9.332-.359-21.2t-.718-24.431q-.37-12.562-.718-23.353-.371-10.779-1.078-17.964h-15.809q.708 7.191 1.438 17.964.707 10.779 1.077 22.635.354 11.856.719 23.353t.359 19.4v247.187h15.809V511.251q0-38.079 9.7-67.9 9.7-29.809 26.588-50.659A117.245 117.245 0 0 1 347.6 360.71a108.444 108.444 0 0 1 48.5-11.137q29.455 0 48.5 12.575a92.92 92.92 0 0 1 29.82 31.257 125.19 125.19 0 0 1 14.731 41.677 256.2 256.2 0 0 1 3.952 43.114v198.326h15.809V511.251q0-38.079 10.06-67.9 10.054-29.809 26.946-50.659a117.245 117.245 0 0 1 39.521-31.977 108.445 108.445 0 0 1 48.5-11.137q29.455 0 48.863 12.575a98.748 98.748 0 0 1 30.9 31.257 127.515 127.515 0 0 1 16.168 41.677 217.585 217.585 0 0 1 4.67 43.114v198.321h15.809V476.759z"></path>
    </svg>
</div>
<ul id = "background" class = "background">
    <li class = "fadein"
        style = "background-image: url(&quot;backgrounds/5740fe48-d74e-4d95-8ec7-8c1f738cabc0.jpg&quot;);"></li>
</ul>
<div class = "background-overlay show"></div>
<div class = "apps show-apps">
    <div class = "full"></div>
    <div class = "top-bar"></div>
    <div class = "top-row">
        <!--<input type = "text"></div>-->
    </div>
    <div class = "center">
        <div class = "app-container clock">
            <div class = "default-clock">
                <div class = "time">物流信息管理系统</div>
            </div>
        </div>
        <br><br><br><br><br><br><br>
        <form>
            <div id = "focuses" class = "focuses app-container">
                <div class = "prompt" style = "display: block;">
                    <div class = "app-container quote">
                        <p class = "quote-body">
                            <span class = "quote-body-text">账号</span>
                        <div class = "prompt" style = "display: block;">
                            <span class = "quote-source">
                                <input type = "text" name = "username">
                            </span>
                        </div>
                        </p>
                    </div>
                    <br>
                    <div class = "app-container quote">
                        <p class = "quote-body">
                            <span class = "quote-body-text">密码</span>
                        <div class = "prompt" style = "display: block;">
                                        <span class = "quote-source">
                                            <input type = "password" name = "password">
                                        </span>
                        </div>
                        </p>
                    </div>
                    <br>
                    <button class = "login_button">
                        <span class = "quote-body-text">登录</span>
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
<div class = "overlay drop-overlay">
    <p>Drop to upload backgrounds <span class = "badge plus-badge">PLUS</span></p>
</div>
<!--<script src = "js/lib.min.js"></script>-->
<!--<script src = "app/app.min.js"></script>-->
</body>
</html>