<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/cd12e36558.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100 text-gray-900">
<%@ include file="head.jsp"%>
    <main class="container mx-auto mt-20 mb-10 p-6 bg-white shadow-md rounded-lg text-center">
        <h2 class="text-3xl font-semibold text-green-600"><i class="fas fa-check-circle"></i> Thank You!</h2>
        <p class="text-gray-700 mt-4">We appreciate your feedback and hope to see you again soon!</p>

        <!-- Back to Home Button -->
        <a href="${pageContext.request.contextPath}/home" class="mt-6 inline-block bg-blue-500 text-white px-6 py-2 rounded hover:bg-blue-600">
            <i class="fas fa-home"></i> Go to Home
        </a>
        <br><br>
    </main>
<%@ include file="footer.jsp"%>
</body>
</html>