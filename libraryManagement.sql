create database library;
use library;
create table author(
id int auto_increment primary key,
Aname varchar(20));
 create table book(
 bookId int auto_increment primary key,
 Title VARCHAR(255) NOT NULL,
    AuthorID INT,
    ISBN VARCHAR(20) UNIQUE,
    Genre VARCHAR(100),
    PublicationYear INT,
    CopiesAvailable INT,
    foreign key (AuthorID) references author(id));
    
CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    MembershipStartDate DATE,
    MembershipEndDate DATE
);
CREATE TABLE BorrowedBooks (
    BorrowID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    MemberID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES book(bookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);
 Alter  table author rename to Author;
INSERT INTO book (Title, AuthorID, ISBN, Genre, PublicationYear, CopiesAvailable)
VALUES ('The Great Gatsby', 1, '9780743273565', 'Fiction', 1925, 5);
INSERT INTO Author (Aname) VALUES ('J.K. Rowling');
INSERT INTO Author (Aname) VALUES ('George Orwell');
INSERT INTO Author (Aname) VALUES ('Harper Lee');
INSERT INTO Author (Aname) VALUES ('F. Scott Fitzgerald');
INSERT INTO Author (Aname) VALUES ('J.R.R. Tolkien');

select * from Author;
 select * from book;
select * from  BorrowedBooks;
select * from Members;
insert into BorrowedBooks(BookID, MemberID, BorrowDate, ReturnDate)
VALUES (10, 2, CURDATE(), NULL);
UPDATE book
SET CopiesAvailable = CopiesAvailable - 1
WHERE BookID = 10;



UPDATE BorrowedBooks
SET ReturnDate = CURDATE()
WHERE BookID = 10 AND MemberID = 2 AND ReturnDate IS NULL;

UPDATE book
SET CopiesAvailable = CopiesAvailable + 1
WHERE BookID = 1;
