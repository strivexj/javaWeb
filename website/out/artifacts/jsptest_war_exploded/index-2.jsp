<%--
  Created by IntelliJ IDEA.
  User: pangd
  Date: 2018/6/23
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title></title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/grid.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/jquery-ui-1.8.5.custom.css" type="text/css" media="all">
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.cycle.all.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.8.5.custom.min.js"></script>
    <script type="text/javascript" src="js/html5.js"></script>


</head>

<body>
<%
    //加载驱动程序
    String driverName = "com.mysql.jdbc.Driver";
//数据库信息
    String userName = "JavaWeb";
//密码
    String userPasswd = "cdut6a502";
//数据库名
    String dbName = "JavaWeb";
//表名
    String tableName1 = "Index2intor";
    String tableName2 = "Index2news";
%>
<%
    String[] hrefs = new String[15];
    String[] titles = new String[15];
    for(int i=0;i<15;i++){
        hrefs[i]="";
        titles[i]="";
    }
%>
<%
    String url1 = "jdbc:mysql://39.108.183.209/" + dbName + "?user=" + userName + "&password=" + userPasswd;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection(url1);
    Statement stmt = conn.createStatement();
    String sql = "SELECT * FROM " + tableName2;
    ResultSet rs = stmt.executeQuery(sql);
    int i = 0;
    while (rs.next()) {
        if (i > 14)
            break;
        titles[i] = rs.getString(2);
        hrefs[i] = rs.getString(3);
        i += 1;
    }
    rs.close();
    stmt.close();
    conn.close();
%>
<%
    String readmore = "";
    String imageUrl1 = "";
    String imageUrl2 = "";
    String body1 = "";
    String body2 = "";
    String importnew = "";
%>
<%
    String url2 = "jdbc:mysql://39.108.183.209/" + dbName + "?user=" + userName + "&password=" + userPasswd;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection(url2);
    stmt = conn.createStatement();
    sql = "SELECT * FROM " + tableName1;
    rs = stmt.executeQuery(sql);
    i = 0;
    while (rs.next()) {
        if (i > 0)
            break;
        readmore = rs.getString(2);
        imageUrl1 = rs.getString(3);
        imageUrl2 = rs.getString(4);
        body1 = rs.getString(5);
        body2 = rs.getString(6);
        i += 1;
    }
    rs.close();
    stmt.close();
    conn.close();
%>
<header>
    <nav>
        <div class="container">
            <div class="wrapper">
                <h1><a href="index.jsp"><strong>志愿者</strong>服务</a></h1>
                <ul>
                    <li><a href="index.jsp">文明你我</a></li>
                    <li><a href="index-1.html">志愿者APP</a></li>
                    <li><a href="index-2.jsp" class="current">志愿者网</a></li>
                    <li><a href="index-3.html">雷锋热线</a></li>
                    <li><a href="index-3.html">公益活动</a></li>
                    <li><a href="index-3.html">公益广告</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <section class="adv-content">
        <div class="container">
            <ul class="breadcrumbs">
                <li>咨询</li>
            </ul>
            <form action="" id="search-form">
                <fieldset>

                    <input type="text" value=""><input type="submit" value="">
                </fieldset>
            </form>
        </div>
    </section>
</header>
<section id="content">
    <div class="top">
        <div class="container">
            <div class="clearfix">
                <div class="grid9">
                    <h2>项目介绍</h2>
                    <div class="img-box">
                        <figure><img src="<%=imageUrl1%>" alt="" width="250" height="150"></figure>
                        <p style="word-wrap: break-word; font-size: large; line-height: 30px"><%=body1%></p>
                    </div>
                    <div class="img-box">
                        <figure><img src="<%=imageUrl2%>" alt="" width="250" height="150"></figure>
                        <p style="word-wrap: break-word; font-size: large; line-height: 30px"><%=body2%></p>
                    </div>
                    <a href="<%=readmore%>>" class="more">了解更多</a>
                </div>
            </div>
        </div>
    </div>
    <div class="middle">
        <div class="container">
            <div class="clearfix">
                <div class="grid3 first">
                    <h2>新闻专栏</h2>
                    <div class="img-wrap">
                        <figure><img src="images/2page-img3.jpg" alt=""></figure>
                    </div>
                    <p style="word-wrap: break-word">欢迎来到志愿者网的新闻专栏，我们讲会
                    第一时间为你们送上全球各地的新闻。</p>
                </div>
                <div class="grid9">
                    <h2>热点新闻</h2>
                    <p style="word-wrap: break-word"><%=importnew%></p>
                    <div class="clearfix">
                        <div class="grid3 first">
                            <ul class="list3">
                                <li><a href="<%=hrefs[0]%>"><%=titles[0]%></a></li>
                                <li><a href="<%=hrefs[1]%>"><%=titles[1]%></a></li>
                                <li><a href="<%=hrefs[2]%>"><%=titles[2]%></a></li>
                                <li><a href="<%=hrefs[3]%>"><%=titles[3]%></a></li>
                                <li><a href="<%=hrefs[4]%>"><%=titles[4]%></a></li>
                            </ul>
                        </div>
                        <div class="grid3">
                            <ul class="list3">
                                <li><a href="<%=hrefs[5]%>"><%=titles[5]%></a></li>
                                <li><a href="<%=hrefs[6]%>"><%=titles[6]%></a></li>
                                <li><a href="<%=hrefs[7]%>"><%=titles[7]%></a></li>
                                <li><a href="<%=hrefs[8]%>"><%=titles[8]%></a></li>
                                <li><a href="<%=hrefs[9]%>"><%=titles[9]%></a></li>
                            </ul>
                        </div>
                        <div class="grid3">
                            <ul class="list3">
                                <li><a href="<%=hrefs[10]%>"><%=titles[10]%></a></li>
                                <li><a href="<%=hrefs[11]%>"><%=titles[11]%></a></li>
                                <li><a href="<%=hrefs[12]%>"><%=titles[12]%></a></li>
                                <li><a href="<%=hrefs[13]%>"><%=titles[13]%></a></li>
                                <li><a href="<%=hrefs[14]%>"><%=titles[14]%></a></li>
                            </ul>
                        </div>
                    </div>
                    <a href="http://zqb.cyol.com/html/2017-08/11/nbs.D110000zgqnb_01.htm" class="more">了解更多</a>
                </div>
            </div>
        </div>
    </div>
    <div class="bottom">
        <div class="container">
            <div class="wrapper">
                <div class="grid3 first">
                    <h3>相关信息</h3>
                    <ul class="list1">
                        <li><a href="#">Real Application Clusters</a></li>
                        <li><a href="#">Database Security</a></li>
                        <li><a href="#">Secure Enterprise Search</a></li>
                    </ul>
                </div>
                <div class="grid3">
                    <h3>Quick Links</h3>
                    <ul class="list2">
                        <li><a href="#">Certification</a></li>
                        <li><a href="#">Education</a></li>
                        <li><a href="#">Careers</a></li>
                        <li><a href="#">For Midsize Companies</a></li>
                        <li><a href="#">Investors</a></li>
                        <li><a href="#">Technology Network</a></li>
                        <li><a href="#">FAQs</a></li>
                    </ul>
                </div>
                <div class="grid3">
                    <h3>Top Downloads</h3>
                    <ul class="list2">
                        <li><a href="#">Enterprise Architecture</a></li>
                        <li><a href="#">Enterprise 2.0</a></li>
                        <li><a href="#">Grid</a></li>
                        <li><a href="#">Service-Oriented Architecture</a></li>
                        <li><a href="#">Virtualization</a></li>
                        <li><a href="#">Database XE</a></li>
                        <li><a href="#">Enterprise Management</a></li>
                    </ul>
                </div>
                <!--日历-->
                <div class="grid3">
                    <div id="datepicker"></div>
                </div>
            </div>
        </div>
    </div>
</section>
<footer>
    <div class="container">
        <div class="wrapper">
            <div class="copy">Industrial Services (c) 2018 | <a href="index-4.html">Privacy
                policy</a></div>
            <address class="phone">
                如果想要质询更多.请拨打我们的电话 <strong>0-123-456-789</strong>
            </address>
        </div>
    </div>
</footer>
</body>

</html>