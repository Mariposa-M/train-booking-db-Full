-- #1 create a database 
-- Create a database named trainbookingDB
CREATE DATABASE IF NOT EXISTS trainbookingDB;

-- #2 create train_station table 
-- ### --
-- Create the train_station table with the following columns:
-- id (int) – Primary Key
-- station_name (varchar)
-- Ensure that id is set as the primary key to uniquely identify
-- each train station.
CREATE TABLE
    IF NOT EXISTS train_station (
        id INT PRIMARY KEY,
        station_name VARCHAR(150) UNIQUE NOT NULL
    );

--  #3 create train_journey table
-- Create the train_journey table with the following columns:
-- id (int) – Primary Key
-- schedule_id (int) – Foreign Key
-- name (varchar)
-- Set id as the primary key.
-- Establish a foreign key relationship for
-- schedule_id with the relevant schedule table.
CREATE TABLE
    IF NOT EXISTS train_journey (
        id INT PRIMARY KEY,
        schedule_id INT,
        name VARCHAR(50) NOT NULL,
        FOREIGN KEY (schedule_id) REFERENCES schedule (id)
    );

-- #4 create journey_station table 
-- Create the journey_station table with the following columns:
-- journey_id (int) – Foreign Key
-- station_id (int) – Foreign Key
-- stop_order (int)
-- departure_time (date/time)
-- Set appropriate foreign key constraints for journey_id & station_id.
CREATE TABLE
    IF NOT EXISTS journey_station (
        journey_id INT NOT NULL,
        station_id INT NOT NULL,
        stop_order INT NOT NULL,
        departure_time DATETIME NOT NULL,
        FOREIGN KEY (journey_id) REFERENCES train_journey (id),
        FOREIGN KEY (station_id) REFERENCES train_station (id)
    );

-- #5 create schedule table 
-- Create the schedule table with the following columns:
-- id (int) – Primary Key
-- name (varchar)
-- Ensure that id is set as the primary key for the table.
CREATE TABLE
    IF NOT EXISTS schedule (id INT PRIMARY KEY, name VARCHAR(100) NOT NULL);

-- #6 create carriage_class table
-- Create the carriage_class table with the following columns:
-- id (int) – Primary Key
-- class_name (varchar)
-- seating_capacity (int)
-- Ensure that id is set as the primary key for the table.
CREATE TABLE
    IF NOT EXISTS carriage_class (
        id INT PRIMARY KEY,
        class_name VARCHAR(150) NOT NULL,
        seating_capacity INT NOT NULL
    );

-- #7 create journey_carriage table
-- Create the journey_carriage table with the following columns:
-- journey_id (int) – Foreign Key
-- carriage_class_id (int) – Foreign Key
-- position (int)
-- Set appropriate foreign key relationships for journey_id and carriage_class_id.
CREATE TABLE
    IF NOT EXISTS journey_carriage (
        journey_id INT NOT NULL,
        carriage_class_id INT NOT NULL,
        position INT NOT NULL,
        FOREIGN KEY (journey_id) REFERENCES train_journey (id),
        FOREIGN KEY (carriage_class_id) REFERENCES carriage_class (id)
    );

-- #8 create carriage_price table
-- Create the carriage_price table with the following columns:
-- schedule_id (int) – Foreign Key
-- carriage_class_id (int) – Foreign Key
-- price (decimal)
-- Set appropriate foreign key relationships for schedule_id and carriage_class_id.
CREATE TABLE
    IF NOT EXISTS carriage_price (
        schedule_id INT NOT NULL,
        carriage_class_id INT NOT NULL,
        price DECIMAL,
        FOREIGN KEY (schedule_id) REFERENCES schedule (id),
        FOREIGN KEY (carriage_class_id) REFERENCES carriage_class (id)
    );

-- #9 create booking table
-- Create the booking table with the following columns:
-- id (int) – Primary Key
-- passenger_id (int) – Foreign Key
-- position (int)
-- status_id (int) – Foreign Key
-- booking_date (date)
-- starting_station_id (int) – Foreign Key
-- ending_station_id (int) – Foreign Key
-- train_journey_id (int) – Foreign Key
-- ticket_class_id (int) – Foreign Key
-- amount_paid (decimal)
-- ticket_no (int)
-- seat_no (int)
-- Set appropriate foreign key relationships 
-- for passenger_id, status_id, starting_station_id, ending_station_id, train_journey_id, and ticket_class_id
CREATE TABLE
    IF NOT EXISTS booking (
        id INT PRIMARY KEY,
        passenger_id INT NOT NULL,
        postition INT NOT NULL,
        status_id INT NOT NULL,
        booking_date DATE,
        starting_station_id INT NOT NULL,
        ending_station_id INT NOT NULL,
        ticket_class_id INT NOT NULL,
        amount_paid DECIMAL,
        ticket_no INT NOT NULL UNIQUE,
        seat_no INT NOT NULL UNIQUE,
        FOREIGN KEY (passenger_id) REFERENCES passenger (id),
        FOREIGN KEY (status_id) REFERENCES booking_status (id),
        FOREIGN KEY (starting_station_id) REFERENCES train_station (id),
        FOREIGN KEY (ending_station_id) REFERENCES train_station (id),
        FOREIGN KEY (train_journey_id) REFERENCES train_journey (id),
        FOREIGN KEY (ticket_class_id) REFERENCES carriage_class (id)
    );

-- #10 create passenger table
-- Create the passenger table with the following columns:
-- id (int) – Primary Key
-- first_name (varchar)
-- last_name (varchar)
-- email_address (varchar)
-- password (varchar)
CREATE TABLE
    IF NOT EXISTS passenger (
        id INT PRIMARY KEY,
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL,
        email_address VARCHAR(200) UNIQUE NOT NULL,
        password VARCHAR(20) NOT NULL
    );

-- #11 create booking_status table 
-- Create the booking_status table with the following columns:
-- id (int) – Primary Key
-- name (varchar)
CREATE TABLE
    IF NOT EXISTS booking_status (id INT PRIMARY KEY, name VARCHAR(50));
