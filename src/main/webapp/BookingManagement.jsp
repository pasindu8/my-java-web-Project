<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Management</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/cd12e36558.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100 text-gray-900">

   <%@ include file="head.jsp"%>

   
    <main class="container mx-auto mt-8 mb-10 p-6 bg-white shadow-md rounded-lg">
        <h2 class="text-2xl font-semibold mb-4"><i class="fas fa-list"></i> Manage Bookings</h2>

        
        <table class="w-full border-collapse border border-gray-300">
            <thead>
                <tr class="bg-gray-200">
                    <th class="border border-gray-300 p-2">Tour Number</th>
                    <th class="border border-gray-300 p-2">Price</th>
                    <th class="border border-gray-300 p-2">Actions</th>
                </tr>
            </thead>
            <tbody id="booking-list">
            <c:forEach var="booking" items="${bookings}">
                <tr class="booking-item">
                    <td class="border border-gray-300 p-2">${booking.activiNo}</td>
                    <td class="border border-gray-300 p-2">$${booking.total}</td>
                    <td class="border border-gray-300 p-2 flex space-x-2">
                        <a href="${pageContext.request.contextPath}/BookingCancel?no=${booking.activiNo}&id=${booking.id}" class="text-red-500 hover:text-red-700">
                            <i class="fas fa-times-circle"></i> Cancel
                        </a>
                    </td>
                </tr>
             </c:forEach>
            </tbody>
        </table>
    </main>
<%@ include file="footer.jsp"%>
</body>
</html>
