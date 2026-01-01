# Dorm Supplies Management System

A database for managing dorm supplies and student orders.

## What It Does
- Student accounts and login
- Item catalog (bed, bath, kitchen supplies)
- Order processing
- Supplier management
- Payment tracking

## Files

**database/** - Run these in order:
1. 01_create_tables.sql - Creates tables
2. 02_import_data.sql - Adds sample data
3. 03_queries.sql - Example queries
4. 04_password_management.sql - Password security
5. 05_security_control.sql - Security features

**examples/** - MySQL and PostgreSQL examples
**presentation/** - Project slides

## Setup

1. Create database:
   CREATE DATABASE dsms;
   USE dsms;

2. Run each SQL file in the database folder (01, 02, 03, 04, 05)

3. Test it:
   SHOW TABLES;
   SELECT * FROM item;

## Requirements
- MySQL 8.0+ or PostgreSQL 12+
