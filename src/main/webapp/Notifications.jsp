<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tour Guide - Notifications</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/cd12e36558.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100 text-gray-900">

	<%@ include file="head.jsp"%>
    <!-- Main Content -->
    <main class="container mx-auto mt-8 mb-10 p-6 bg-white shadow-md rounded-lg">
        <h2 class="text-2xl font-semibold mb-4"><i class="fas fa-bell"></i> Notifications</h2>

        <!-- Notification Cards -->
        <div class="space-y-4">
            <!-- Weather Notifications -->
            <c:forEach var="Weather" items="${Weather}">
                <div class="p-4 bg-yellow-100 border-l-4 border-yellow-500 rounded">
                    <h3 class="text-lg font-semibold text-yellow-900"><i class="fas fa-exclamation-triangle"></i> Weather Alert</h3>
                    <p class="text-gray-700">${Weather.description}</p>
                     <a href="${pageContext.request.contextPath}/NotificationDelete?no=${Weather.id}" class="text-red-500 hover:text-red-700">
                    <i class="fas fa-trash-alt text-xl"></i>
                </a>
                    <small class="text-gray-500">Posted on: ${Weather.date}</small>
                </div>
            </c:forEach>

            <!-- Discount Notifications -->
            <c:forEach var="Discount" items="${Discount}">
                <div class="p-4 bg-green-100 border-l-4 border-green-500 rounded">
                    <h3 class="text-lg font-semibold text-green-900"><i class="fas fa-tag"></i> Discount Offer!</h3>
                    <p class="text-gray-700">${Discount.description}</p>
                    <a href="${pageContext.request.contextPath}/NotificationDelete?no=${Discount.id}" class="text-red-500 hover:text-red-700">
                    <i class="fas fa-trash-alt text-xl"></i>
                </a>
                    <small class="text-gray-500">Posted on: ${Discount.date}</small>
                </div>
            </c:forEach>

            <!-- Rating Notifications -->
            <c:forEach var="Rating" items="${Rating}">
                <div class="p-4 bg-blue-100 border-l-4 border-blue-500 rounded">
                    <h3 class="text-lg font-semibold text-blue-900"><i class="fas fa-star"></i> Book Rating Alert</h3>
                    <p class="text-gray-700">${Rating.description}</p>
                    <a href="${pageContext.request.contextPath}/NotificationDelete?no=${Rating.id}" class="text-red-500 hover:text-red-700">
                    <i class="fas fa-trash-alt text-xl"></i>
                </a>
                    <small class="text-gray-500">Posted on: ${Rating.date}</small>
                </div>
            </c:forEach>
        </div>
    </main>
	<%@ include file="footer.jsp"%>
</body>
</html>
