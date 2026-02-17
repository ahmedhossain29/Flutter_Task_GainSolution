# **Flutter Task – Gain Solutions Ltd**

This project is a simple Flutter mobile application developed as part of the technical assessment for the Mobile App Developer (Flutter) position at Gain Solutions Ltd.

The goal of this task was to build a multi-screen app using:

* Static data to simulate API responses
* Proper state management
* Clean and maintainable code structure

## **Project Approach**

I implemented the project using a Clean Architecture–inspired structure so that each feature remains:

* Easy to understand
* Scalable for real production use
* Separated by responsibility (data, domain, presentation)

**Each feature follows the same flow:**

##### _Fake Data Source → Repository → Use Case → Cubit → UI_


#### **State Management**

I used Cubit (flutter_bloc) for state management.

Every screen handles:

* Loading state
* Loaded state
* Error state

This keeps the UI predictable and separates business logic from widgets.


## **Implemented Features**

### **1. Tickets**

* Ticket list UI based on the provided design
* Status labels and colored tags
* Proper loading and error handling
* Clean separation between screen and loaded view

### **2. Filter**

* Filter options loaded from simulated API
* Brand checkbox selection
* Priority dropdown
* Tag search UI
* The filter feature follows the same architecture pattern as tickets.

### **3. Contacts**

* Contact list from fake API
* Profile image with circular border
* Popup menu (Edit, View tickets, Delete)
* Structured layout for contact information

### **4. Profile**

* Profile data loaded from fake API
* Basic user info section
* Assigned roles shown in horizontal cards
* Logout UI
* All states handled using the same Cubit pattern.

### **Navigation & UI**

* Bottom navigation with Material icons
* Selected tab uses a soft pill-style highlight
* UI built to closely match the provided Figma
* Reusable common widgets used where possible



### **Notes**

This project focuses on:

* Code structure and clarity
* Proper state handling
* Real-world architecture approach
* Clean and readable UI implementation





**Developed by**
**Hossain Ahmed**
Flutter Developer