<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Successful</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/cd12e36558.js" crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="head.jsp"%>
	<div class="bg-gray-100 flex items-center justify-center min-h-screen">
    <div class="bg-white p-8 rounded-lg shadow-lg max-w-lg text-center">
        <i class="fas fa-check-circle text-green-500 text-6xl mb-4"></i>
        <h1 class="text-2xl font-bold text-gray-800 mb-2">Booking Confirmed!</h1>
        <p class="text-gray-600">Thank you for booking with us. Your tour is successfully confirmed.</p>

        <div class="bg-gray-200 p-4 rounded-lg mt-4 text-left">
            <h2 class="text-lg font-semibold">Tour Details:</h2>
            <p><strong>Tour:</strong> ${titel}</p>
            <p><strong>Date:</strong> ${date}</p>
            <p><strong>Time:</strong> 3:00 AM</p>
            <p><strong>Participants:</strong> ${adults} Adults</p>
            <p><strong>Total Price:</strong> ${totalAmount}</p>
        </div>
        
        <p class="text-gray-500 text-sm mt-4">A confirmation email has been sent to your inbox.</p>
    </div>
    </div>>
<%@ include file="footer.jsp"%>
	
</body>
</html>
