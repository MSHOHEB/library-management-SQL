# 📚 Library Management System — SQL Project

![SQL](https://img.shields.io/badge/SQL-SQLite-blue?logo=sqlite)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen)
![Rows](https://img.shields.io/badge/Total_Rows-625-orange)
![Queries](https://img.shields.io/badge/SQL_Queries-20+-purple)

A complete **Library Management System** built with SQL.
625 rows across 6 tables with 20+ advanced queries.

---

## 🗃️ Database Structure

| Table | Rows | Description |
|-------|------|-------------|
| 📂 categories | 10 | Book categories (Fiction, Science, Tech...) |
| 📚 books | 100 | Book details with price and copies |
| 👨‍💼 staff | 15 | Library staff and roles |
| 👥 members | 150 | Library members (Premium/Regular/Student) |
| 📋 issues | 200 | Book issue records |
| 🔄 returns | 150 | Return records with fine details |
| **TOTAL** | **625** | |

---

## 📊 SQL Queries Covered

| # | Query | Concepts Used |
|---|-------|---------------|
| 1 | Top 10 Most Borrowed Books | JOIN, GROUP BY, ORDER BY |
| 2 | Overdue Members with Fine | JOIN, WHERE, Date Functions |
| 3 | Category-wise Borrowing Report | JOIN, GROUP BY, AVG |
| 4 | Members with 3+ Books | GROUP BY, HAVING |
| 5 | Monthly Issue Report | strftime, CASE WHEN |
| 6 | Books Never Borrowed | LEFT JOIN, IS NULL |
| 7 | Fine Collected vs Pending | SUM, CASE WHEN |
| 8 | Staff Performance | LEFT JOIN, COUNT |
| 9 | Top 5 Fine Payers | JOIN, SUM, ORDER BY |
| 10 | Available vs Issued Books | SUM, GROUP BY |
| 11 | Membership Type Analysis | GROUP BY, COUNT |
| 12 | Books with Most Late Returns | JOIN, SUM, HAVING |
| 13 | City-wise Member Distribution | GROUP BY, CASE WHEN |
| 14 | Books Issued Same Day | Self JOIN |
| 15 | Author Popularity Ranking | LEFT JOIN, COUNT DISTINCT |
| 16 | Unpaid Fine Members | WHERE, SUM |
| 17 | Avg Return Time per Category | AVG, Date Functions |
| 18 | Most Active Members 2023 | WHERE with Year Filter |
| 19 | Expensive Late-Return Books | HAVING, ORDER BY |
| 20 | Complete Member History | Subqueries |

---

## 🚀 How to Run

### Option 1 — SQLite (Recommended)
```bash
sqlite3 library.db < library_management.sql
```

### Option 2 — DB Browser for SQLite (GUI)
1. Download [DB Browser for SQLite](https://sqlitebrowser.org/)
2. Open → New Database
3. File → Import SQL → select `library_management.sql`
4. Run any query from the file

### Option 3 — MySQL / PostgreSQL
Minor changes needed (date functions differ slightly)

---

## 📁 Project Structure

| File | Description |
|------|-------------|
| `library_management.sql` | Complete SQL file (tables + data + queries) |
| `README.md` | Project documentation |

---

## 🔍 Sample Query Output

**Top 5 Most Borrowed Books:**

| Title | Author | Category | Times Borrowed |
|-------|--------|----------|----------------|
| Atomic Habits | James Clear | Self-Help | 4 |
| The Alchemist | Paulo Coelho | Self-Help | 4 |
| Sapiens | Yuval Noah Harari | History | 3 |
| Harry Potter | J.K. Rowling | Children | 3 |
| Rich Dad Poor Dad | Robert Kiyosaki | Business | 3 |

---

## 🛠️ Tech Stack

- **SQL** — Core language
- **SQLite** — Database engine
- **DB Browser** — GUI tool (optional)
