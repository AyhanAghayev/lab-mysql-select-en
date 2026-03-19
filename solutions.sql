USE za;

-- Challenge 1

SELECT 
    a.au_id AS 'Author ID',
    a.au_lname AS 'Last Name',
    a.au_fname AS 'First Name',
    titles.title AS 'Title',
    publishers.pub_name AS 'Publisher'
FROM
    authors AS a
        JOIN
    titleauthor ON a.au_id = titleauthor.au_id
        JOIN
    titles ON titleauthor.title_id = titles.title_id
        JOIN
    publishers ON publishers.pub_id = titles.pub_id;


-- Challenge 2

SELECT 
    a.au_id AS 'Author ID',
    a.au_lname AS 'Last Name',
    a.au_fname AS 'First Name',
    publishers.pub_name AS 'Publisher',
    COUNT(titles.title_id) AS 'Count'
FROM
    authors AS a
        JOIN
    titleauthor ON a.au_id = titleauthor.au_id
        JOIN
    titles ON titleauthor.title_id = titles.title_id
        JOIN
    publishers ON publishers.pub_id = titles.pub_id
GROUP BY a.au_id , a.au_fname , a.au_lname , publishers.pub_name;

-- Challenge 3

SELECT 
    a.au_id AS 'Author ID',
    a.au_lname AS 'Last Name',
    a.au_fname AS 'First Name',
    SUM(sales.qty) AS 'Total'
FROM
    authors AS a
        JOIN
    titleauthor ON a.au_id = titleauthor.au_id
        JOIN
    titles ON titleauthor.title_id = titles.title_id
        JOIN
    sales ON sales.title_id = titles.title_id
GROUP BY a.au_id , a.au_lname , a.au_fname
ORDER BY Total DESC
LIMIT 3;

-- Challenge 4

SELECT 
    a.au_id AS 'Author ID',
    a.au_lname AS 'Last Name',
    a.au_fname AS 'First Name',
    COALESCE(SUM(sales.qty), 0) AS 'Total'
FROM
    authors AS a
        LEFT JOIN
    titleauthor ON a.au_id = titleauthor.au_id
        LEFT JOIN
    titles ON titleauthor.title_id = titles.title_id
        LEFT JOIN
    sales ON sales.title_id = titles.title_id
GROUP BY a.au_id , a.au_lname , a.au_fname
ORDER BY Total DESC;