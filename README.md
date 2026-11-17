# Movie Ticket Booking System — Group 14

A **Java 17 desktop application** built with **Java Swing, OOP, JDBC, and MySQL**. No HTML, CSS, or JavaScript.

## Team
- Ravneet Singh — Leader
- Akashdeep Singh — Member 1
- Aryan Chaudhary — Member 2
- Etash Sharma — Member 3

## Features
- Add and view movies and showtimes
- Interactive 5 × 10 seat grid using Swing `GridLayout` and `JButton`
- Book one seat per transaction, with database-enforced double-booking prevention
- View bookings and cancel selected tickets
- View movie-wise and overall revenue from **active bookings** (cancelled bookings are excluded)

## Requirements
- JDK 17+
- Apache Maven 3.9+
- MySQL Server 8+
- VS Code with Java Extension Pack (recommended)

## Setup
1. Install and start MySQL Server.
2. Open MySQL Workbench or the MySQL CLI, connect to your local server, and execute **`database.sql`** once. The script creates the `movie_booking` database and demo records. Running the whole script again will add duplicate demo records.
3. Set database environment variables (do **not** commit passwords to GitHub):
   - `DB_URL` (optional): `jdbc:mysql://localhost:3306/movie_booking?useSSL=false&serverTimezone=UTC`
   - `DB_USER` (default: `root`)
   - `DB_PASSWORD` (default: empty string; set to your actual MySQL password)
4. Open the project folder in VS Code and run from the integrated terminal:

   ```bash
   mvn compile exec:java
   ```

   Maven downloads MySQL Connector/J automatically on the first run. The database must be running for the app to load its data.

### Windows PowerShell example
```powershell
$env:DB_USER="root"
$env:DB_PASSWORD="YOUR_MYSQL_PASSWORD"
mvn compile exec:java
```

## OOP / syllabus mapping
- **Unit 1:** `Movie`, `Show`, `Seat`, `Booking`, `Ticket` classes; `this` in constructors; seat grid (5 × 10 buttons).
- **Unit 2:** `Bookable` interface, abstract `Ticket`, concrete `RegularTicket`, packages.
- **Unit 3:** `SeatAlreadyBookedException`, `synchronized` booking method. Database row locks and a unique active-seat constraint also prevent concurrent bookings from different app instances. Thread priorities are **not** demonstrated; they are not needed for safe booking.
- **Unit 4:** JDBC `PreparedStatement`, SQL tables for movies, shows and bookings.
- **Unit 5:** Swing `JFrame`, `JPanel`, `JButton`, `JTable`, `JComboBox`, `GridLayout`, `BorderLayout`, and action listeners.

## Notes
- Each booking reserves **one seat**; users can repeat booking for additional seats.
- This is a classroom demonstration project, not a production payment or authentication system.
- The GUI uses synchronous JDBC calls on the Swing event dispatch thread; a production app would use `SwingWorker` for responsive long-running database requests.
- You must run the application with MySQL locally to verify functionality before submitting your repository.
