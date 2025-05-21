<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking ${title}</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/cd12e36558.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

			 <%@ include file="head.jsp"%>
    <div class="m-10">
    <h1 class="text-4xl font-bold mb-4 text-center">${title}</h1>
    
    <div class="max-w-2xl mx-auto">
        <!-- Slideshow -->
        <div class="relative">
            <div class="relative w-full">
                <img class="w-full h-full object-cover rounded-lg" id="slideImage" src="132 (1).webp" alt="Slide Image">
            </div>
            <button class="absolute top-1/2 left-0 transform -translate-y-1/2 bg-gray-800 text-white px-3 py-2 rounded-r-lg" onclick="changeSlide(-1)">❮</button>
            <button class="absolute top-1/2 right-0 transform -translate-y-1/2 bg-gray-800 text-white px-3 py-2 rounded-l-lg" onclick="changeSlide(1)">❯</button>
        </div>
        
        <div class="text-center mt-4">
            <span class="dot inline-block w-4 h-4 bg-gray-400 rounded-full mx-1 cursor-pointer" onclick="setSlide(0)"></span>
            <span class="dot inline-block w-4 h-4 bg-gray-400 rounded-full mx-1 cursor-pointer" onclick="setSlide(1)"></span>
            <span class="dot inline-block w-4 h-4 bg-gray-400 rounded-full mx-1 cursor-pointer" onclick="setSlide(2)"></span>
            <span class="dot inline-block w-4 h-4 bg-gray-400 rounded-full mx-1 cursor-pointer" onclick="setSlide(3)"></span>
        </div>
        
        <p class="mt-4 text-gray-700 text-justify">
        ${description}
        </p>
        
        <h2 class="text-2xl font-bold mt-6">About this activity</h2>
        <ul class="mt-2 space-y-2">
            <li class="flex items-center">
                <i class="far fa-calendar-alt text-blue-500 text-lg mr-2"></i>
                <span><strong>Free cancellation</strong> - Cancel up to 24 hours in advance for a full refund.</span>
            </li>
            <li class="flex items-center">
                <i class="far fa-credit-card text-green-500 text-lg mr-2"></i>
                <span><strong>Reserve now & pay later</strong> - Keep your travel plans flexible.</span>
            </li>
            <li class="flex items-center">
                <i class="far fa-clock text-orange-500 text-lg mr-2"></i>
                <span><strong>Duration: ${duration} hours</strong> - Check availability to see starting times.</span>
            </li>
            <li class="flex items-center">
                <i class="fas fa-user text-purple-500 text-lg mr-2"></i>
                <span><strong>Live tour guide</strong> - ${language}</span>
            </li>
            <li class="flex items-center">
                <i class="fas fa-bus text-red-500 text-lg mr-2"></i>
                <span><strong>Pickup included</strong> - Pickup available in ${destination} area.</span>
            </li>
        </ul>
        
        <div class="bg-blue-900 text-white p-6 rounded-lg mt-6 shadow-lg">
        <form action="${pageContext.request.contextPath}/payment" method="get">
            <h2 class="text-lg font-bold mb-4">Select participants and date</h2>
            <div class="flex space-x-4 mb-4">
            
                <div class="flex items-center bg-white text-black p-3 rounded-full flex-grow">
                    <i class="fas fa-users text-gray-600 mr-2"></i>
                        <input type="text" id="adults" name="ad" class="flex-grow bg-transparent focus:outline-none">
                </div>
                <input type="text" name="ti" value="${title}" id="title" hidden>
                <input type="text" name="to" value="${price}" id="price" hidden>
                <input type="text" name="no" value="${activiNo}" id="activiNo" hidden>
                <div class="flex items-center bg-white text-black p-3 rounded-full flex-grow">
                    <i class="fas fa-calendar-alt text-gray-600 mr-2"></i>
                    <input type="date" name="da" id="datePicker" class="flex-grow bg-transparent focus:outline-none">
                </div>
            </div>
    		<center>
            <h1 onclick="infoDisplay()" class="bg-yellow-500 text-black w-full py-3 rounded-full font-bold hover:bg-yellow-600">
                Check availability
            </h1>
            </center>
        </div>  
        
        
        <div id="bookingfrom" class="m-10 bg-gray-100 border border-blue-400 rounded-lg p-6 shadow-md bg-white">
        
	    <h2 class="text-xl font-bold mb-2">From ${title}</h2>
		
	    <div class="flex items-center mb-4">
	        <i class="far fa-clock text-lg text-gray-600 mr-2"></i>
	        <span class="text-gray-700">${duration} hours</span>
	    </div>
	
	    <h3 class="text-md font-semibold mb-2">Select a starting time</h3>
	    <p class="text-gray-600 mb-2" id="fullDateDisplay"></p>
	
	    <div class="flex space-x-2 mb-4">
	        <p class="px-4 py-2 border rounded-lg bg-gray-900 text-white">${time}</p>
	    </div>
	
	    <div class="flex items-center text-gray-700 mb-2">
	        <i class="far fa-calendar-check text-green-500 mr-2"></i>
	        <span id="cancelDateDisplay"></span>
	    </div>
	
	    <div class="flex items-center text-gray-700 mb-4">
	        <i class="far fa-credit-card text-blue-500 mr-2"></i>
	        <span>You can <a href="#" class="text-blue-600 underline">reserve now & pay later</a> with this activity option.</span>
	    </div>
	
	    <div class="bg-gray-100 p-4 rounded-lg">
	        <p class="text-gray-700"><strong><span id="adultst"></span> adults</strong></p>
	        <p class="text-xl font-bold">$<span id="adultstext"></span></p>
	        <p class="text-gray-500 text-sm">All taxes and fees included</p>
	    </div>
	
	    <div class="flex space-x-4 mt-4">
	        <input type="submit" class="bg-blue-600 text-white font-bold py-2 px-6 rounded-lg" value="Book now">
	    </div>
	</div>
        
    </div>
	</div>
	<%@ include file="footer.jsp"%>
    <script>
        let slideIndex = 0;
        const images = ["assets/A/1${image}", "assets/B/2${image}", "assets/C/3${image}","assets/D/4${image}"];

        function changeSlide(n) {
            slideIndex = (slideIndex + n + images.length) % images.length;
            document.getElementById("slideImage").src = images[slideIndex];
            updateDots();
        }

        function setSlide(n) {
            slideIndex = n;
            document.getElementById("slideImage").src = images[slideIndex];
            updateDots();
        }

        function updateDots() {
            document.querySelectorAll(".dot").forEach((dot, i) => {
                dot.classList.toggle("bg-gray-700", i === slideIndex);
                dot.classList.toggle("bg-gray-400", i !== slideIndex);
            });
        }

        // Auto slideshow function
        function autoSlideShow() {
            changeSlide(1);
            setTimeout(autoSlideShow, 2000); // Change image every 2 seconds
        }

        // Start automatic slideshow
        document.addEventListener("DOMContentLoaded", () => {
            autoSlideShow();
        });
		
        const booking = document.getElementById("bookingfrom");
        booking.style.display = "none";
        var today = new Date().toISOString().split('T')[0];
        document.getElementById("datePicker").setAttribute('min', today);
        
        function infoDisplay() {
            const datePicker = document.getElementById("datePicker");
            const displayFullDate = document.getElementById("fullDateDisplay");
            const displayCancelDate = document.getElementById("cancelDateDisplay");
            const adults = document.getElementById("adults").value;
            const adultst = document.getElementById("adultst");
            const adultstext = document.getElementById("adultstext");
            const price = document.getElementById("price").value;
            booking.style.display = "block";

            if (!datePicker.value) {
                displayFullDate.textContent = "Please select a date.";
                displayCancelDate.textContent = "";
                return;
            }

            const selectedDate = new Date(datePicker.value);
            adultst.textContent = adults;
            adultstext.textContent = (price * adults).toFixed(2);

            if (!isNaN(selectedDate)) {
                const options = { weekday: 'long', month: 'long', day: 'numeric', year: 'numeric' };
                displayFullDate.textContent = selectedDate.toLocaleDateString('en-US', options);

                const cancelDate = new Date(selectedDate);
                cancelDate.setDate(cancelDate.getDate() + 1);
                cancelDate.setHours(3, 0, 0, 0);

                const cancelOptions = { month: 'long', day: 'numeric' };
                const formattedCancelDate = cancelDate.toLocaleDateString('en-US', cancelOptions);
                displayCancelDate.textContent = "Cancel before 12:00 AM on " + formattedCancelDate + " for a full refund.";
            } else {
                displayFullDate.textContent = "";
                displayCancelDate.textContent = "";
            }
        }
        
    </script>
</body>
</html>
