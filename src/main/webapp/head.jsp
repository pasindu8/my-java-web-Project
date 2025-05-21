<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        #myMenu {
            position: absolute;
            background-color: white;
            border: 1px solid #ccc;
            border-radius: 0.5rem;
            margin-top: 0.25rem;
            width: 250px;
            z-index: 50;
            display: none;
        }
        #myMenu li a {
            display: block;
            padding: 10px;
            text-decoration: none;
            color: #333;
        }
        #myMenu li a:hover {
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>
<nav class="bg-gradient-to-r from-blue-400 to-indigo-500 shadow-xl p-4">
    <div class="container mx-auto flex justify-between items-center">
        <a href="#" class="text-white text-2xl font-bold hover:text-indigo-300 transition duration-300">GET YOUR GUIDE</a>

        <div class="relative flex items-center bg-white rounded-full shadow-md overflow-hidden">
            <i class="fas fa-search text-gray-500 px-3"></i>
            <input type="text" id="mySearch" onkeyup="myFunction()" name="destination" placeholder="Sri Lanka" class="px-2 py-2 outline-none">

            <ul id="myMenu">
                <li><a href="${pageContext.request.contextPath}/addActivities.jsp">Add Activity</a></li>
                <li><a href="${pageContext.request.contextPath}/ActivitieManage">Manage Activity</a></li>
                <li><a href="${pageContext.request.contextPath}/dashboard">Profile</a></li>
                <li><a href="${pageContext.request.contextPath}/notification">Notifications</a></li>
                <li><a href="${pageContext.request.contextPath}/NotificationSend">Notification Send</a></li>
                <li><a href="${pageContext.request.contextPath}/BookingManagement">Booking Management</a></li>
                <li><a href="${pageContext.request.contextPath}/contact.jsp">Contact Us</a></li>
                <li><a href="${pageContext.request.contextPath}/RatingManagement">Rating Management</a></li>
                <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
            </ul>

            <div class="border-l px-3 flex items-center"></div>
            <button class="bg-purple-500 text-white px-5 py-2 rounded-full ml-2 hover:bg-purple-600 transition duration-300">Search</button>
        </div>

        <div class="flex space-x-6 text-white">
            <a href="#" class="hover:bg-indigo-400 rounded-md px-3 py-2 transition duration-300 flex items-center"><i class="far fa-heart mr-1"></i> Wishlist</a>
            <a href="#" class="hover:bg-indigo-400 rounded-md px-3 py-2 transition duration-300 flex items-center"><i class="fas fa-shopping-cart mr-1"></i> Cart</a>
            <button onmouseover="profiles()" class="hover:bg-indigo-400 rounded-md px-3 py-2 transition duration-300 flex items-center"><i class="fas fa-user mr-1"></i> Profile</button>
        </div>
    </div>
</nav>

<%
    String username = (String) session.getAttribute("username");
    String Error = (String) request.getAttribute("Error");
    String Success = (String) request.getAttribute("Success");
%>

<c:if test="${not empty Error}">
    <script>alert("<%= Error %>");</script>
</c:if>
<c:if test="${not empty Success}">
    <script>alert("<%= Success %>");</script>
</c:if>

<div id="profile" onmouseover="profiles()" onmouseout="profileh()" class="fixed right-3 top-20 bg-white shadow-lg rounded-r-lg p-6 w-64 h-auto overflow-y-auto border-r border-gray-200">
    <center><br><br>
        <c:choose>
            <c:when test="${username == null}">
                <a href="${pageContext.request.contextPath}/login" class="bg-blue-500 text-white px-4 py-2 rounded-md text-sm block mb-2 hover:bg-blue-600 transition duration-200">Login</a>
                <a href="${pageContext.request.contextPath}/singup" class="bg-green-500 text-white px-4 py-2 rounded-md text-sm block hover:bg-green-600 transition duration-200">Sign Up</a>
            </c:when>
            <c:when test="${username != null}">
                <div class="mb-4">
                    <i class="fas fa-user-circle text-gray-500 text-4xl"></i>
                    <p class="text-gray-700 mt-2 font-semibold"><%= username %></p>
                </div>
                <a href="${pageContext.request.contextPath}/dashboard" class="hover:bg-gray-100 text-gray-800 rounded-md px-4 py-2 block transition duration-200">Dashboard</a>
                <a href="${pageContext.request.contextPath}/home" class="hover:bg-gray-100 text-gray-800 rounded-md px-4 py-2 block transition duration-200">Home</a>
                <a href="${pageContext.request.contextPath}/notification" class="hover:bg-gray-100 text-gray-800 rounded-md px-4 py-2 block transition duration-200">Notifications</a>
                <a href="${pageContext.request.contextPath}/logout" class="bg-red-500 text-white rounded-md px-4 py-2 block transition duration-200 text-center hover:bg-red-600">Logout</a>
            </c:when>
        </c:choose>
    </center>
</div>

<script type="text/javascript">
    var profshow = document.getElementById("profile");
    profshow.style.display = "none";

    function profiles() {
        profshow.style.display = "block";
    }

    function profileh() {
        profshow.style.display = "none";
    }

    function myFunction() {
        var input = document.getElementById("mySearch");
        var filter = input.value.toUpperCase();
        var ul = document.getElementById("myMenu");
        var li = ul.getElementsByTagName("li");

        if (filter === "") {
            ul.style.display = "none";
            return;
        } else {
            ul.style.display = "block";
        }

        for (var i = 0; i < li.length; i++) {
            var a = li[i].getElementsByTagName("a")[0];
            if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
                li[i].style.display = "block";
            } else {
                li[i].style.display = "none";
            }
        }
    }
</script>
</body>
</html>
