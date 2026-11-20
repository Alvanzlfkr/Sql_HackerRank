**Assignment Specialized SQL Techniques**
by: Mohamad Alvan Zulfikhar
FROM: DIbimbing, Hcakerrank

## Overview

This repository contains solutions and documentation for five SQL case studies from HackerRank as part of the Specialized SQL Techniques assignment.

The assignment focuses on modular query design using CTEs and subqueries, data aggregation, conditional logic, and window functions.


## Case Study 1: The Report

**Problem:** [HackerRank - The Report](https://www.hackerrank.com/challenges/the-report/problem)

### Learning Objectives

Join berdasarkan rentang nilai, pemetaan grade, penggunaan CASE, dan pengurutan multi-kolom.

### Key Concepts
Join Students dengan Grades memakai BETWEEN pada marks ke min_mark..max_mark. CASE WHEN grade < 8 THEN NULL ELSE name END. ORDERBY grade DESC, name ASC, marks ASC.

Langkah disarankan:
Buat CTE untuk memetakan tiap student ke grade (join rentang). Di select final, gunakan CASE untuk menampilkan NULL pada name jika grade < 8. Terapkan urutan seperti ketentuan.

### SQL Solution

[View SQL Solution](Soal%201_TheReport.sql) |

WITH student_grades AS (
    SELECT 
        s.name,
        g.grade,
        s.marks
    FROM students s
    JOIN grades g
        ON s.marks BETWEEN g.min_mark AND g.max_mark
)

SELECT
    CASE 
        WHEN grade < 8 THEN NULL
        ELSE name
    END AS name,
    grade,
    marks
FROM student_grades
ORDER BY 
    grade DESC,
    CASE WHEN grade >= 8 THEN name END ASC,
    CASE WHEN grade < 8 THEN marks END ASC;

