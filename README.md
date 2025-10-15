# Leaves Management App

## Overview

This Flutter application provides an elegant interface for managing **employee leaves**.  
Each employee can view their leave records, including:

- Leave duration
- Reason
- Type and status  
  The app supports pagination, smooth scrolling with a loading indicator, and auto logout when the authentication token expires.

---

## Technologies Used

### Frontend

- **Flutter**
- **Dart**
- **Bloc (Cubit)** for state management
- **GetX** for navigation
- **Google Fonts** for styling
- **SharedPreferences** for local storage (token, employee info)
- **Dio** for API requests

### 🔹 Backend

- **Django REST Framework (DRF)**
- **JWT Authentication**

---

## Features

Fetch employee leaves dynamically using pagination  
 Circular loading indicator while scrolling  
 Error message with retry button when fetching fails  
 Auto logout when the JWT token expires (15 minutes)  
 Responsive, clean UI using Google Fonts

---

## Project Structure
