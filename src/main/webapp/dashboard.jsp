<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/cd12e36558.js" crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="head.jsp"%>
 
<div class="grid grid-cols-2 grid-rows-1 gap-1 p-10 h-[900px]">
            <div class="grid grid-rows-5 w-[400px] h-[600px]">
            <center>
                <img src="https://avatar.iran.liara.run/username?username=${firstname}+${lastname}" class="rounded-full w-[150px] h-[150px]"><br>
                <h1 class="font-mono text-2xl font-bold">Hi ${firstname} ${lastname}</h1><br>
                <c:choose>
                	<c:when test="${action == 'Admin'}">
                	 	<div class="mt-5 p-3 w-[200px] h-[50px] bg-blue-500 shadow-lg shadow-blue-500/50 text-white">
			                    <a href="${pageContext.request.contextPath}/addActivities.jsp">Add Activitie</a>
			            </div>
			            <div class="mt-5 p-3 w-[200px] h-[50px] bg-blue-500 shadow-lg shadow-blue-500/50 text-white">
			                    <a href="${pageContext.request.contextPath}/ActivitieManage">Manage Activitie</a>
			            </div>
			            <div class="mt-5 p-3 w-[200px] h-[50px] bg-blue-500 shadow-lg shadow-blue-500/50 text-white">
		                    <a href="${pageContext.request.contextPath}/dashboard">Profile</a>
		                </div>
		                <div class="mt-5 p-3 w-[200px] h-[50px] bg-blue-500 shadow-lg shadow-blue-500/50 text-white">
		                    <a href="${pageContext.request.contextPath}/notification">Notifications</a>
		                </div>
		                <div class="mt-5 p-3 w-[200px] h-[50px] bg-blue-500 shadow-lg shadow-blue-500/50 text-white">
		                    <a href="${pageContext.request.contextPath}/NotificationSend">Notifications Send</a>
		                </div>
		                <div class="mt-5 p-3 w-[200px] h-[50px] bg-blue-500 shadow-lg shadow-blue-500/50 text-white">
		                    <a href="${pageContext.request.contextPath}/BookingManagement">Booking Management</a>
		                </div>
		                <div class="mt-5 p-3 w-[200px] h-[50px] bg-blue-500 shadow-lg shadow-blue-500/50 text-white">
		                    <a href="${pageContext.request.contextPath}/contact.jsp">Contact Us</a>
		                </div>
		                <div class="mt-5 p-3 w-[200px] h-[50px] bg-blue-500 shadow-lg shadow-blue-500/50 text-white">
		                    <a href="${pageContext.request.contextPath}/RatingManagement">Rating Management</a>
		                </div>
		                <div class="mt-5 p-3 w-[200px] h-[50px] bg-blue-500 shadow-lg shadow-blue-500/50 text-white">
		                    <a href="${pageContext.request.contextPath}/logout">Logout</a>
		                </div>
			                
			          
	                </c:when>
	                <c:when test="${action == 'user'}">
	                	<div class="mt-5 p-3 w-[200px] h-[50px] bg-blue-500 shadow-lg shadow-blue-500/50 text-white">
		                    <a href="${pageContext.request.contextPath}/dashboard">Profile</a>
		                </div>
		                <div class="mt-5 p-3 w-[200px] h-[50px] bg-blue-500 shadow-lg shadow-blue-500/50 text-white">
		                    <a href="${pageContext.request.contextPath}/notification">Notifications</a>
		                </div>
		                <div class="mt-5 p-3 w-[200px] h-[50px] bg-blue-500 shadow-lg shadow-blue-500/50 text-white">
		                    <a href="${pageContext.request.contextPath}/BookingManagement">Booking Management</a>
		                </div>
		                <div class="mt-5 p-3 w-[200px] h-[50px] bg-blue-500 shadow-lg shadow-blue-500/50 text-white">
		                    <a href="${pageContext.request.contextPath}/contact.jsp">Contact Us</a>
		                </div>
		                <div class="mt-5 p-3 w-[200px] h-[50px] bg-blue-500 shadow-lg shadow-blue-500/50 text-white">
		                    <a href="${pageContext.request.contextPath}/RatingManagement">Rating Management</a>
		                </div>
		                <div class="mt-5 p-3 w-[200px] h-[50px] bg-blue-500 shadow-lg shadow-blue-500/50 text-white">
		                    <a href="${pageContext.request.contextPath}/logout">Logout</a>
		                </div>
	                </c:when>
	                <c:when test="${action == 'guide'}">
	                <div class="mt-5 p-3 w-[200px] h-[50px] bg-blue-500 shadow-lg shadow-blue-500/50 text-white">
		                    <a href="${pageContext.request.contextPath}/dashboard">Profile</a>
		                </div>
		                <div class="mt-5 p-3 w-[200px] h-[50px] bg-blue-500 shadow-lg shadow-blue-500/50 text-white">
		                    <a href="${pageContext.request.contextPath}/notification">Notifications</a>
		                </div>
		                <div class="mt-5 p-3 w-[200px] h-[50px] bg-blue-500 shadow-lg shadow-blue-500/50 text-white">
		                    <a href="${pageContext.request.contextPath}/contact.jsp">Contact Us</a>
		                </div>
		                <div class="mt-5 p-3 w-[200px] h-[50px] bg-blue-500 shadow-lg shadow-blue-500/50 text-white">
		                    <a href="${pageContext.request.contextPath}/SavedCards">About Us</a>
		                </div>
		                <div class="mt-5 p-3 w-[200px] h-[50px] bg-blue-500 shadow-lg shadow-blue-500/50 text-white">
		                    <a href="${pageContext.request.contextPath}/logout">Logout</a>
		                </div>
	                </c:when>
					<c:otherwise>
					<p class="text-red-500">Invalid Role</p>
					</c:otherwise>
              	</c:choose>
            </center>
            </div>
            <div class="grid grid-rows-5 gap-1">
                <div class="grid grid-rows-3">
                    <h1 class="font-mono text-2xl font-bold">Profile Details</h1>
                    <div class="grid grid-cols-2">
                    <form action="${pageContext.request.contextPath}/EditProfile" method="post">
                    <div class="grid grid-rows-2 gap-1 pl-3 pb-3 border-2 border-solid border-[#243c5a] rounded-lg w-[230px] h-[54px]">
                        <p>First Name</p>
                        <input type="text" name="fName" value="${firstname}" class="pl-2 w-[200px] h-[20px] text-[#243c5a] bg-[#ffffff]">
                    </div>
                    <div class="grid grid-rows-2 gap-1 pl-3 pb-3 border-2 border-solid border-[#243c5a] rounded-lg w-[230px] h-[54px]">
                        <p>Last Name</p>
                        <input type="text" name="lName" value="${lastname}" class="pl-2 w-[200px] h-[20px] text-[#243c5a] bg-[#ffffff]">
                    </div>
                    </div>
                </div>
                <div class="grid grid-rows-2 gap-1">
                    <h1 class="font-mono text-2xl font-bold">Contact Details</h1>
                    <div class="grid grid-rows-2 gap-1 pl-3 pb-3 border-2 border-solid border-[#243c5a] rounded-lg w-[270px] h-[54px]">
                        <p>Email</p>
                        <input type="text" name="email" value="${email}" class="pl-2 w-[250px] h-[20px] text-[#243c5a] bg-[#ffffff]">
                    </div><br>
                    <div class="grid grid-rows-2 gap-1 pl-3 pb-3 border-2 border-solid border-[#243c5a] rounded-lg w-[270px] h-[54px]">
                        <p>Mobile phone</p>
                        <input type="text" name="phone" value="${phone}" class="pl-2 w-[250px] h-[20px] text-[#243c5a] bg-[#ffffff]">
                    </div>
                </div>
                <div class="grid grid-rows-2 gap-1 h-[120px] mt-[50px]">
                    <h1 class="font-mono text-2xl font-bold">Date of birth</h1>
                    <input type="date" id="party" value="${birthDate}" name="birth" min="1945-01-01" max="2010-12-31" class="pl-3 pb-3 border-2 border-solid border-[#243c5a] rounded-lg w-[230px] h-[54px] text-[#243c5a] bg-[#ffffff]">
                </div>
                    <button type="submit" class="mt-10 w-[200px] h-[40px] bg-cyan-500 shadow-lg shadow-cyan-500/50 text-white">Save</button>
                    <a href="${pageContext.request.contextPath}/delete" class="mt-2 font-mono text-base font-bold text-[#E4080A]">Delete Account</a>
            </div>
        </div>
<%@ include file="footer.jsp"%>
</body>
</html>
