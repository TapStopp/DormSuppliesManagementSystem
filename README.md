# Dorm Supplies Management System (DSMS)

A comprehensive database system for managing dorm-related supplies and student orders. This project transforms theoretical database models into a working SQL implementation that tracks students, dorm rooms, suppliers, items, and orders in a fully integrated system.

## 📋 Project Overview

The Dorm Supplies Management System is designed to streamline the process of ordering and managing supplies for college dormitories. It provides a complete solution for:

- **Student Management**: Account creation, authentication, and profile management
- **Order Processing**: Complete order lifecycle from creation to fulfillment
- **Inventory Tracking**: Comprehensive item catalog with categories and pricing
- **Supplier Management**: Multiple supplier support with location tracking
- **Dorm Administration**: Building and room assignment management
- **Payment Processing**: Secure payment tracking and history
- **Security**: Admin logging and access control

## 👥 Team

- **Cassandra Dawson** - Team Lead (Senior, Games Major)
- **Colin Boykin** - Developer (Junior, Computer Science)
- **Prisha Satish** - Developer (Sophomore, Computer Science)

## 🗂️ Repository Structure

```
dsms-database-project/
├── database/               # Core database files (run in order)
│   ├── 01_create_tables.sql         # Table creation and views
│   ├── 02_import_data.sql           # Sample data insertion
│   ├── 03_queries.sql               # Common query operations
│   ├── 04_password_management.sql   # Password security implementation
│   └── 05_security_control.sql      # Security measures and controls
├── examples/               # Database-specific examples
│   ├── integer_example_mysql.sql    # MySQL integer handling
│   └── integer_example_postgresql.sql # PostgreSQL integer handling
├── presentation/           # Project documentation
│   └── DSMS_Presentation.pptx       # Full project presentation
├── docs/                   # Additional documentation (optional)
└── README.md              # This file
```

## 🚀 Getting Started

### Prerequisites

- MySQL 8.0+ or PostgreSQL 12+
- Database client (MySQL Workbench, pgAdmin, or command line)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/dsms-database-project.git
   cd dsms-database-project
   ```

2. **Create the database**
   ```sql
   CREATE DATABASE dsms;
   USE dsms;
   ```

3. **Run the SQL files in order**
   ```bash
   # Run each file in the database/ folder sequentially
   mysql -u your_username -p dsms < database/01_create_tables.sql
   mysql -u your_username -p dsms < database/02_import_data.sql
   mysql -u your_username -p dsms < database/03_queries.sql
   mysql -u your_username -p dsms < database/04_password_management.sql
   mysql -u your_username -p dsms < database/05_security_control.sql
   ```

## 📊 Database Schema

### Core Tables

| Table | Description |
|-------|-------------|
| `admin` | Administrator accounts and credentials |
| `student` | Student information and authentication |
| `item` | Product catalog with categories (bed, bath, kitchen) |
| `studentList` | Student shopping lists |
| `dormBuilding` | Dorm building information |
| `room` | Individual room details and amenities |
| `supplier` | Supplier contact information |
| `supplierLocation` | Multiple locations per supplier |
| `orders` | Order tracking and status |
| `payments` | Payment processing and history |
| `adminLog` | Admin activity audit trail |

### Views

- `view_login` - Student authentication
- `view_login_admin` - Admin authentication
- `view_items` - Item catalog display
- `view_students` - Student profile information
- `view_supplier` - Supplier details with locations
- `view_orders` - Current order status

## 🔑 Key Features

### Student Features
- Account creation and secure authentication
- Browse item catalog by category
- Create and manage shopping lists
- Place orders with multiple items
- Track order status and payment history
- View dorm room assignments

### Admin Features
- Manage student accounts
- Add/update/delete items in catalog
- Process and fulfill orders
- Manage supplier relationships
- Track dorm room assignments
- View comprehensive activity logs
- Monitor system security

### Security Features
- Password hashing and encryption
- Role-based access control (Student vs Admin)
- Activity logging for audit trails
- IP address tracking for admin actions
- Secure payment processing

## 📝 Usage Examples

### Query Student Orders
```sql
SELECT * FROM view_orders 
WHERE studentID = 1 
ORDER BY orderDate DESC;
```

### Add New Item to Catalog
```sql
INSERT INTO item (itemName, category, price, quantity) 
VALUES ('Twin XL Bedding Set', 'bed', 49.99, 50);
```

### Check Room Availability
```sql
SELECT dormName, roomNum, roomType 
FROM room 
WHERE numStudents < capacity;
```

## 🛠️ Technologies Used

- **Database**: MySQL / PostgreSQL
- **SQL Features**: 
  - Foreign keys and referential integrity
  - Views for data abstraction
  - ENUM types for constrained values
  - Triggers for automation (in security files)
  - Stored procedures (in password management)

## 📖 Documentation

For detailed information about the project, including ER diagrams, EER models, and system architecture, please refer to the [presentation file](presentation/DSMS_Presentation.pptx).

## 🤝 Contributing

This is an academic project. If you'd like to suggest improvements:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/improvement`)
3. Commit your changes (`git commit -m 'Add improvement'`)
4. Push to the branch (`git push origin feature/improvement`)
5. Open a Pull Request

## 📄 License

This project is created for educational purposes as part of a database systems course.

## 📧 Contact

For questions or feedback about this project, please contact the team members through your institution's email system.

---

**Note**: This system contains sample data for demonstration purposes. Do not use in production without proper security audits and data validation.
