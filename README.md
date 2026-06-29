# 📚 Library Management System

A comprehensive, production-ready MySQL database solution for managing library operations. Designed with best practices in relational database design, normalization, and scalability in mind.

---

## 🎯 Overview

This project demonstrates a complete library management system with:
- **Normalized database schema** (3NF) with proper relationship modeling
- **Relational integrity** through primary and foreign keys
- **SQL constraints** for data validation and consistency
- **ER diagram** for visual understanding of data relationships
- **Sample data** for immediate testing and demonstrations
- **Scalable architecture** suitable for production environments

---

## 📋 Features

- ✅ **Authors Management** - Track book authors with origin information
- ✅ **Categories System** - Organize books by genre/category
- ✅ **Books Database** - Complete book information with ISBN and publication details
- ✅ **Member Registry** - Manage library members and contact information
- ✅ **Borrow History** - Track borrowing and return dates with full audit trail
- ✅ **Referential Integrity** - CASCADE delete operations for data consistency
- ✅ **Unique Constraints** - ISBN and email validation
- ✅ **Auto-increment IDs** - Automatic primary key management

---

## 📊 Database Schema

### Tables Overview

| Table | Purpose | Key Fields |
|-------|---------|-----------|
| **Authors** | Store author information | author_id, author_name, country |
| **Categories** | Organize books by type | category_id, category_name |
| **Books** | Book inventory | book_id, title, isbn, publish_year, author_id, category_id |
| **Members** | Library members | member_id, member_name, phone, email, join_date |
| **Borrow** | Borrowing transactions | borrow_id, member_id, book_id, borrow_date, return_date |

### Relationships

```
Authors (1) ──→ (M) Books
Categories (1) ──→ (M) Books
Members (1) ──→ (M) Borrow
Books (1) ──→ (M) Borrow
```

---

## 🚀 Quick Start

### Prerequisites
- MySQL Server 5.7 or higher
- MySQL Client or GUI tool (MySQL Workbench, DBeaver, etc.)

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/kxnux-builds/library-management-db.git
cd library-management-db
```

2. **Import the database**
```bash
mysql -u your_username -p < main.sql
```

Or using MySQL Workbench:
- Open MySQL Workbench → File → Open SQL Script
- Select `main.sql`
- Click Execute (⚡)

3. **Verify installation**
```sql
USE LibraryDB;
SELECT * FROM Authors;
SELECT * FROM Books;
SELECT * FROM Members;
```

---

## 📁 Project Structure

```
library-management-db/
├── main.sql              # Complete database schema & sample data
├── ER_diagram.png        # Visual entity relationship diagram
├── README.md            # This file
└── LICENSE              # MIT License
```

---

## 💡 Usage Examples

### Query Books by Author
```sql
SELECT b.title, b.publish_year, a.author_name 
FROM Books b
JOIN Authors a ON b.author_id = a.author_id
WHERE a.author_name = 'J.K. Rowling';
```

### Get Borrow History
```sql
SELECT m.member_name, b.title, bo.borrow_date, bo.return_date
FROM Borrow bo
JOIN Members m ON bo.member_id = m.member_id
JOIN Books b ON bo.book_id = b.book_id
ORDER BY bo.borrow_date DESC;
```

### Find Unreturned Books
```sql
SELECT m.member_name, b.title, bo.borrow_date
FROM Borrow bo
JOIN Members m ON bo.member_id = m.member_id
JOIN Books b ON bo.book_id = b.book_id
WHERE bo.return_date IS NULL;
```

### Book Count by Category
```sql
SELECT c.category_name, COUNT(b.book_id) as total_books
FROM Categories c
LEFT JOIN Books b ON c.category_id = b.category_id
GROUP BY c.category_id, c.category_name;
```

---

## 🔑 Key Design Principles

### Normalization
- **First Normal Form (1NF)** - No repeating groups or arrays
- **Second Normal Form (2NF)** - All non-key attributes depend on primary key
- **Third Normal Form (3NF)** - No transitive dependencies

### Integrity Constraints
- **Primary Keys** - Unique identification for each record
- **Foreign Keys** - Maintain referential integrity across tables
- **NOT NULL** - Ensure critical data is always present
- **UNIQUE** - Prevent duplicate ISBN and email entries
- **CASCADE DELETE** - Automatic cleanup when related records are deleted

### Best Practices
- ✓ Meaningful table and column names
- ✓ Appropriate data types for each field
- ✓ Comprehensive comments and documentation
- ✓ Sample data for testing and demonstration
- ✓ Scalable structure for future enhancements

---

## 🔧 Extension Ideas

- Add fine calculation system for overdue returns
- Implement reservation system for books
- Create book rating and review system
- Add staff/admin user management
- Implement book copy tracking
- Add automated email notifications
- Create backup and archival procedures

---

## 📊 Sample Data Included

The database comes preloaded with:
- **2 Authors** (J.K. Rowling, George Orwell)
- **3 Categories** (Fantasy, Novel, Education)
- **2 Books** (Harry Potter, 1984)
- **2 Members** (Raj Roy, Anirban Das)
- **2 Borrow Records** with complete transaction history

---

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🤝 Contributing

Contributions are welcome! Feel free to:
- Report bugs and issues
- Suggest improvements
- Submit pull requests
- Share enhancements

---

## 📧 Contact & Support

For questions, suggestions, or support:
- 📧 Create an issue on GitHub
- 🔗 Visit the [repository](https://github.com/kxnux-builds/library-management-db)

---

## 🎓 Learning Resources

This project is perfect for learning:
- SQL fundamentals and advanced queries
- Database normalization and design
- ER modeling and data relationships
- MySQL best practices
- Referential integrity and constraints

---

**Made with ❤️ by [kxnux-builds](https://github.com/kxnux-builds)**

Last Updated: June 29, 2026
