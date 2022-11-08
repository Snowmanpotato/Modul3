use csdl_quanly_sinhvien;
create table Class(
ClassID int primary key auto_increment,
ClassName varchar(60) not null,
StartDate datetime not null,
Statuss bit
);
create table Student(
StudentID int primary key auto_increment,
StudentName varchar(30) not null,
Address     VARCHAR(50),
Phone       VARCHAR(20),
Statuss bit,
ClassId     INT         NOT NULL,
FOREIGN KEY (ClassId) REFERENCES Class (ClassID)
);
CREATE TABLE Subjectt
(
    SubId   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubName VARCHAR(30) NOT NULL,
    Credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
    Statuss  BIT      DEFAULT 1
);
CREATE TABLE Mark
(
    MarkId    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubId     INT NOT NULL,
    StudentId INT NOT NULL,
    Mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    ExamTimes TINYINT DEFAULT 1,
    UNIQUE (SubId, StudentId),
    FOREIGN KEY (SubId) REFERENCES Subjectt (SubId),
    FOREIGN KEY (StudentId) REFERENCES Student (StudentId)
);