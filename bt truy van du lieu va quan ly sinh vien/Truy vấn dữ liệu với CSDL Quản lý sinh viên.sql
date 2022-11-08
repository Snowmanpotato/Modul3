use csdl_quanly_sinhvien;
select * from student where StudentName like "H%";
select * from class WHERE StartDate like '%%%%-12-%%';
select * from subjectt WHERE Credit between 3 and 5;
select * from student where StudentName like "Hung";
SET SQL_SAFE_UPDATES = 0;
update student set ClassId = 2 where StudentName like "Hung";
select StudentName, SubName, Mark from student, subjectt, mark where( student.StudentID = mark.StudentId ) and ( mark.SubId = subjectt.SubId);
SELECT StudentName, SubName, Mark
  FROM student
  INNER JOIN mark
  ON student.StudentID = mark.StudentId
  INNER JOIN subjectt
  ON mark.SubId = subjectt.SubId
  order by Mark  DESC, StudentName ASC
  
  