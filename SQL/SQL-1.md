# SQL для простых смертных.

## Главы 1-3

1. SELECT snum, sname, city, comm
    FROM Salespeople;

2. SELECT *
     FROM Salespeople;

3. SELECT sname, comm
    FROM Salespeople;

4. SELECT odate, snum, onum, amt
     FROM Orders:

5. SELECT snum
     FROM Orders;

6. SELECT DISTINCT snum
     FROM Orders; #без повторений

7. SELECT sname, city
     FROM Salespeople
     WHERE city = 'London';

8. SELECT *
     FROM Customers
      WHERE rating = 100;

### Задания главы 3

9. 1. SELECT onum, amt, odate
         FROM Orders;

10. 2. SELECT *
           FROM Customers
           WHERE snum =1001;

11. 3. SELECT city, sname, snum, comm
           FROM Salespeople;

12. 4. SELECT rating, cname
            FROM Customers
             WHERE city ='San Jose';

13. 5. SELECT DISTINCT snum
           FROM Orders;

## Глава 4

14. SELECT *
       FROM Customers
       WHERE rating > 200;

15. FROM Customers
       WHERE city = 'San Jose'
       AND rating > 200;

16. SELECT *
       FROM Customers
       WHERE city = 'San Jose'
       OR rating > 200;

17. FROM Customers
       WHERE city = 'San Jose'
       OR NOT rating > 200;

18. SELECT *
       FROM Customers
       WHERE NOT city = 'San Jose'
       OR rating > 200);
       
19. SELECT *
       FROM Orders
       WHERE NOT((odate = 10/03/1990 AND snum > 1002)
       OR amt > 2000.00);

### Задания главы 4

20. 1. SELECT *
           FROM Orders
           WHERE amt >1000;

21. 2. SELECT sname, city
           FROM Salespeople
            WHERE city ='London'
            AND comm > 10;

22. 3. SELECT *
            FROM Customers
            WHERE rating >100
            OR city ='Rome';
            
23. 4.  SELECT *
            FROM Orders
            WHERE (amt < 1000 ОА
             NOT (odate = 10/03/1990
            AND cnum > 2003));
            
24. 5. SELECT *
           FROM Orders
           WHERE NOT((odate = 10/03/1990 ОА snum > 1006)
           AND amt > = 1500);
           
25. 6. SELECT *
           FROM Salespeople;

## Глава 5

26. SELECT *
       FROM Salespeople
       WHERE city = 'Bагсеlоnа'
       OR city = 'London';

27. SELECT *
      FROM Salespeople
       WHERE city IN ('Barcelona', 'London');

28. SELECT *
       FROM Customers
       WHERE snum IN (1001, 1007, 1004);

29. SELECT *
       FROM Salespeople
       WHERE comm BEТWEEN .10 AND .12;
       
30. SELECT *
       FROM Salespeople
      WHERE (comm BEТWEEN . 10, AND . 12)
      AND NOT comm IN ( .10, .12);

31. SELECT *
      FROM Customers
       WHERE cname BEТWEEN 'A' AND 'G';

32. SELECT *
       FROM Customers
       WHERE cname LIKE 'G%';

33. SELECT *
       FROM Salespeople
       WHERE sname LIKE 'P_ _l';

34. SELECT *
      FROM Salespeople
      WHERE sname LIKE '%/_%' ESCAPE '/';      #поиск символа подчеркивания в столбце sname.

35. SELECT *
       FROM Salespeople
       WHERE sname LIKE '%/_//%'ESCAPE'/';   #поиск строки '_/' в столбце sname.

36. SELECT *
      FROM Customers
      WHERE city IS NULL;

37. SELECT *
       FROM Customers
       WHERE city IS NOT NULL;

38. SELECT *
       FROM Customers
       WHERE NOT city IS NULL;

39. SELECT *
      FROM Salespeople
      WHERE city NOT IN ('London', 'San Jose');              # =40

40. SELECT *
      FROM Salespeople
      WHERE NOT city IN ('London' , 'San Jose');           # =39

### Задания главы 5

41. 2. SELECT *
            FROM Customers
            WHERE snum IN (1001,1004);

42. 4. SELECT *
      FROM Customers
      WHERE cname LIKE  'C%';

43. 5. SELECT *
           FROM Orders
           WHERE amt < > 0
          AND (amt IS NOT NULL);

## Глава 6

44. SELECT SUM(amt)
       FROM Orders;

45. SELECT AVG(amt)
       FROM Orders;

46. SELECT COUNT (DISTINCT snum)
       FROM Orders;                                      # DISTINCT - расчет данных по столбцу.

47. SELECT COUNT (*)
        FROM Customers;                             # подсчет количества строк, а не значений поля.

48. SELECT COUNT (ALL rating)
       FROM Customers;

49. SELECT snum, MAX(amt)
       FROM Orders
       GROUP ВУ snum;

50. SELECT snum, odate, MAX(amt)
      FROM Orders
      GROUP ВУ snum, odate;

51. SELECT snum, odate, MAX(amt)
       FROM Orders
      GROUP ВУ snum, odate
      HAVING MAX(amt) > 3000.00;

52. SELECT snum, MAX(amt)
       FROM Orders
       WHERE odate = 10/03/1990
       GROUP BY snum;     #максимум для каждого продавца за 3 октября 1990 г.

## Глава 7

53. SELECT snum, sname, city, comm * 100
FROM Salespeople;

54. SELECT snum, sname, city, '%', comm * 100
FROM Salespeople;

55. SELECT *
       FROM Orders
       ORDER ВУ cnum DESC;    #по убыванию
       
56.  SELECT *
        FROM Orders
        ORDER ВУ cnum DESC, amt DESC;

57. SELECT snum, odate, MAX(amt)
       FROM Orders
       GROUP ВУ snum, odate
       ORDER ВУ snum;

## Глава 8

58. SELECT Customers.cname, Salespeople.sname, Salespeople.city
       FROM Salespeople, Customers
       WHERE Salespeople.city = Customers.city;

59. SELECT Customers.cname, Salespeople.sname
       FROM Customers, Salespeople
       WHERE Salespeople.snum = Customers.snum;

60. SELECT sname, cname
       FROM Salespeople, Customers
      WHERE sname < cname
       AND rating < 200;

61. SELECT onum, cname, Orders.cnum, Orders.snum
       FROM Salespeople, Customers, Orders
       WHERE Customers.city <> Salespeople.city
       AND Orders.cnum Customers.cnum
       AND Orders.snum Salespeople.snum;

## Глава 9

62. SELECT first.cname, second.cname, first. rating
       FROM Customers first, Customers second
      WHERE first.rating = second. rating;

## Глава 10

63. SELECT *
       FROM Orders
        WHERE snum
        (SELECT snum
        FROM Salespeople
        WHERE sname = 'Motika');

64. SELECT *
     FROM Orders
     WHERE snum =
    (SELECT DISTINCT snum
    FROM Orders
     WHERE cnum = 2001);

65. SELECT *
       FROM Orders
      WHERE amt > (SELECT AVG (amt)
      FROM Orders
      WHERE odate = 10/04/1990);

66. SELECT AVG (comm)
       FROM Salespeople
       WHERE city = 'London';

67. SELECT *
      FROM Orders
       WHERE snum IN
       (SELECT snum
       FROM Salespeople
       WHERE city = 'London');

68. SELECT comm
      FROM Salespeople
      WHERE snum IN
      (SELECT snum
      FROM Customers
      WHERE city = "London");

       


