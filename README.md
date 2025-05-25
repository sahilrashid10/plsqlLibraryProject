# PL/SQL Library Management Project

This project is a comprehensive Library Management System implemented in PL/SQL. It includes database schema creation, sample data, and stored procedures for managing customers, employees, library items (books and videos), rentals, fines, and more.

## Features

- **Database Schema**: Defines tables for Cards, Customers, Employees, Branches, Locations, Books, Videos, and Rents with all necessary relations and constraints.
- **Sample Data**: Includes insert statements for initial records in each table.
- **Stored Procedures & Triggers**:
  - Customer and Employee authentication
  - Viewing item details
  - Managing customer and employee accounts
  - Renting and returning items
  - Paying fines and updating statuses
  - Updating personal information
  - Adding new customers, books, and videos
  - Removing library items
  - Handling overdue returns and fines automatically via triggers

## File Structure

- `Library_managment_PlSql.sql`: Contains all table definitions, sample data, procedures, and triggers.

## How to Use

1. **Setup Database**: Run the SQL file in an Oracle SQL environment. The script will create all tables, insert sample data, and define all procedures and triggers.
2. **Procedures**: Use the defined procedures to interact with the system (login, rent/return items, pay fines, etc.).
3. **Triggers**: Automatic handling of card creation for new customers and employees, and fines on overdue returns.

## Main Tables

- **Card**: Library cards with status and fines
- **Customer**: Library members
- **Employee**: Library staff
- **Branch**: Library branches
- **Location**: Physical addresses
- **Book**: Book items
- **Video**: Video items
- **Rent**: Rental transactions

## Example Procedures

- `loginCustomer_library`
- `loginEmployee_library`
- `viewItem_library`
- `customerAccount_library`
- `employeeAccount_library`
- `RENTITEM_LIBRARY`
- `payFines_library`
- `updateInfoCusto_library`
- `updateInfoEmp_library`
- `addCustomer_library`
- `addBook_library`
- `addVideo_library`
- `removeItem_library`
- `handleReturns_library`

## Triggers

- `addCardCusto_library`: Auto-create a card for new customers
- `addCardEmp_library`: Auto-create a card for new employees
- `modifyFines_library`: Apply fines for overdue returns

## Requirements

- Oracle Database (or compatible PL/SQL environment)

## Getting Started

1. Clone this repository.
2. Open `Library_managment_PlSql.sql` in your SQL editor.
3. Execute the script to set up the project.
