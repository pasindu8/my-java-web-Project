<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Tour Guide</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/cd12e36558.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100 text-gray-900">
<%@ include file="head.jsp"%>
    <!-- Main Content -->
    <main class="container mx-auto mt-8 p-6 bg-white shadow-md rounded-lg">
        <h2 class="text-2xl font-semibold mb-4"><i class="fas fa-envelope"></i> Contact Us</h2>
        <p class="mb-6 text-gray-700">Have any questions? Feel free to reach out to us.</p>

        <!-- Contact Form -->
        <form class="space-y-4" action="${pageContext.request.contextPath}/contact" method="post">
            
                <label for="name" class="block font-medium">Name</label>
                <input type="text" id="name" name="name" class="w-full p-2 border border-gray-300 rounded" placeholder="Enter your name">
            </div>

            <div>
                <label for="email" class="block font-medium">Email</label>
                <input type="email" id="email" name="email" class="w-full p-2 border border-gray-300 rounded" placeholder="Enter your email">
            </div>

            <div>
                <label for="message" class="block font-medium">Message</label>
                <textarea id="message" rows="4" name="massage" class="w-full p-2 border border-gray-300 rounded" placeholder="Your message here..."></textarea>
            </div>

            <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">
                <i class="fas fa-paper-plane"></i> Send Message
            </button>
        </form>

        <!-- Contact Details -->
        <div class="mt-8">
            <h3 class="text-xl font-semibold mb-2"><i class="fas fa-phone"></i> Get in Touch</h3>
            <p><i class="fas fa-map-marker-alt"></i> 123 Tour Guide Street, Travel City</p>
            <p><i class="fas fa-envelope"></i> contact@tourguide.com</p>
            <p><i class="fas fa-phone"></i> +1 234 567 890</p>
        </div>
    </main><br><br>
<%@ include file="footer.jsp"%>  
</body>
</html>
