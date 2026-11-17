CREATE DATABASE IF NOT EXISTS movie_booking;
USE movie_booking;
CREATE TABLE IF NOT EXISTS movies (
 id INT AUTO_INCREMENT PRIMARY KEY,
 title VARCHAR(120) NOT NULL,
 genre VARCHAR(60) NOT NULL,
 duration INT NOT NULL
);
CREATE TABLE IF NOT EXISTS shows (
 id INT AUTO_INCREMENT PRIMARY KEY,
 movie_id INT NOT NULL,
 show_time DATETIME NOT NULL,
 price DECIMAL(10,2) NOT NULL,
 FOREIGN KEY (movie_id) REFERENCES movies(id)
);
CREATE TABLE IF NOT EXISTS bookings (
 id INT AUTO_INCREMENT PRIMARY KEY,
 show_id INT NOT NULL,
 customer_name VARCHAR(120) NOT NULL,
 seat_label VARCHAR(3) NOT NULL,
 amount DECIMAL(10,2) NOT NULL,
 status ENUM('BOOKED','CANCELLED') NOT NULL DEFAULT 'BOOKED',
 active_seat VARCHAR(3) GENERATED ALWAYS AS (CASE WHEN status='BOOKED' THEN seat_label ELSE NULL END) STORED,
 UNIQUE KEY unique_active_seat (show_id,active_seat),
 FOREIGN KEY (show_id) REFERENCES shows(id)
);
INSERT INTO movies(title,genre,duration) VALUES ('Interstellar','Sci-Fi',169),('Inception','Thriller',148),('3 Idiots','Comedy',170);
INSERT INTO shows(movie_id,show_time,price)
SELECT id,'2027-01-15 18:00:00',200 FROM movies WHERE title='Interstellar' ORDER BY id LIMIT 1;
INSERT INTO shows(movie_id,show_time,price)
SELECT id,'2027-01-15 20:00:00',250 FROM movies WHERE title='Inception' ORDER BY id LIMIT 1;
