# Library Management System (PL/SQL)

A robust Library Management System implemented using PL/SQL. This project provides a relational database schema, core procedures, and triggers to support common library operations such as rentals, returns, fines management, and account updates for both customers and employees.

## Features

- **Relational schema** for Library, Branches, Customers, Employees, Books, Videos, and Rentals
- **Procedures** for login, viewing items, managing accounts, renting and returning items, paying fines, updating information, and adding/removing entities
- **Triggers** for automatic card creation and fines management
- **Sample data** for initial setup and testing

## Database Schema

Tables included:

- `Card`: Stores library card status and fines
- `Customer`: Customer details, linked to a Card
- `Employee`: Employee details, linked to a Card and Branch
- `Branch`: Library branch information
- `Location`: Physical locations of branches
- `Book`: Book inventory, availability, and costs
- `Video`: Video inventory, availability, and costs
- `Rent`: Tracks which items are currently rented

Foreign key relationships ensure data integrity.

## Key Procedures & Triggers

### Procedures

- **loginCustomer_library**: Authenticate customer login
- **loginEmployee_library**: Authenticate employee login
- **viewItem_library**: View info for a book or video by ID
- **customerAccount_library / employeeAccount_library**: Show account details, rented items, and fines
- **RENTITEM_LIBRARY**: Rent a book or video if available and user is active
- **payFines_library**: Pay fines and unlock card if applicable
- **updateInfoCusto_library / updateInfoEmp_library**: Update personal or employment details
- **addCustomer_library**: Register a new customer
- **allMedia_library**: List all books or videos
- **handleReturns_library**: Return rented items and update status
- **addBook_library / addVideo_library**: Add new books or videos to the inventory
- **removeItem_library**: Remove books or videos from the system

### Triggers

- **addCardCusto_library / addCardEmp_library**: Automatically creates a Card entry after adding a Customer or Employee
- **modifyFines_library**: Updates user fines if an item is returned late

