<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment - Tour Guide</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/cd12e36558.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100 text-gray-900">
     <%@ include file="head.jsp"%>
    <main class="container mx-auto mt-8 mb-8 p-6 bg-white shadow-md rounded-lg">
        <h2 class="text-2xl font-semibold mb-4"><i class="fas fa-credit-card"></i> Secure Payment</h2>
        <p class="mb-6 text-gray-700">Complete your booking by providing your payment details.</p>

        <!-- Payment Form -->
        <form class="space-y-4" action="${pageContext.request.contextPath}/book" method="post">
            <div>
                <label for="name" class="block font-medium">Full Name</label>
                <input type="text" name="fullname" id="name" value="${firstname} ${lastname}" class="w-full p-2 border border-gray-300 rounded" placeholder="Enter your full name">
            </div>

            <div>
                <label for="email" class="block font-medium">Email</label>
                <input type="text" name="email" id="email" value="${email}" class="w-full p-2 border border-gray-300 rounded bg-gray-200" placeholder="Enter your email" readonly>
            </div>
			<input type="text" name="title" id="title" value="${title}"  hidden>
			<input type="date" name="date" id="date" value="${date}"  hidden>
			<input type="text" name="activiNo" id="activiNo" value="${activiNo}"  hidden>
            <div>
                <label for="adults" class="block font-medium">Adults</label>
                <input type="number" name="adults" id="adults" class="w-full p-2 border border-gray-300 rounded bg-gray-200" placeholder="Enter the number of adults" value="${adults}" onchange="updateTotal()" readonly>
            </div>

            <div>
                <label for="card-number" class="block font-medium">Card Number</label>
                <input type="text" name="cardNumber" id="card-number" class="w-full p-2 border border-gray-300 rounded" placeholder="1234 5678 9012 3456">
            </div>

            <div class="flex space-x-4">
                <div class="w-1/2">
                    <label for="expiry" class="block font-medium">Expiry Date</label>
                    <input type="text" name="expiry" id="expiry" class="w-full p-2 border border-gray-300 rounded" placeholder="MM/YY">
                </div>

                <div class="w-1/2">
                    <label for="cvv" class="block font-medium">CVV</label>
                    <input type="text" name="cvv" id="cvv" class="w-full p-2 border border-gray-300 rounded" placeholder="123">
                </div>
            </div>

            <div>
                <label for="amount" class="block font-medium">Total Amount</label>
                <input type="text" name="totalAmount" id="amount" class="w-full p-2 border border-gray-300 rounded bg-gray-200" value="${total}" readonly>
            </div>

            <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 w-full">
                <i class="fas fa-lock"></i> Pay Now
            </button>
        </form>

        <!-- Payment Security Notice -->
        <div class="mt-6 p-4 bg-gray-100 border-l-4 border-gray-500 rounded">
            <h3 class="text-lg font-semibold text-gray-900"><i class="fas fa-shield-alt"></i> Secure Payment</h3>
            <p class="text-gray-700">We use encrypted transactions to protect your information.</p>
        </div>
    </main>
	<%@ include file="footer.jsp"%>
    <script>
        function updateTotal() {
            let pricePerAdult = ${price}; // Get the price from JSP
            let adults = document.getElementById("adults").value;
            let total = pricePerAdult * adults;
            document.getElementById("amount").value = total.toFixed(2); // Update the total amount
        }
    </script>

</body>
</html>
