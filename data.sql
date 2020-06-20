INSERT INTO `client` (`lastname`,`name`,`middlename`,`phone`,`email`) VALUES
('Shcherbinina', 'Alina', 'Dmitrievna', 89086617630, 'alinkash@gmail.com'),
('Dodd', 'Ajwa', '', 2628272980, 'bsourabhroy24p@spherinde.ga'),
('Farrow', 'Christy', '', 8164957376, 'youness.alkashep@erelthy.ml'),
('Stott', 'Eesha', '', 2022222739, 'mslime@altxxx.site'),
('Jawad', 'Jarvis', '', 9499451513, 'fmohislam09z@ketpgede.ml'),
('Kiara', 'Drummond', '', 3033465915, 'aymeengangster6@v-kv.com');

INSERT INTO `comics` (`name`,`price`,`instock`) VALUES
('Calvin and Hobbes', '1500', 1),
('Maus', '2000', 1),
('Fun Home: A Family Tragicomic', '1400', 0),
('Batman: The Killing Joke', '2500', 1);

INSERT INTO `author` (`name`,`lastname`) VALUES
('Bill', 'Watterson'),
('Art', 'Spiegelman'),
('Alison', 'Bechdel'),
('Alan', 'Moore');

INSERT INTO `comic_author` (`comic_id`,`author_id`) VALUES
( 1, 1),
( 3, 3),
( 4, 4),
( 2, 2);

INSERT INTO `employees` (`lastname`,`name`,`middlename`,`dateofbirth`,`position`,`salary`,`email`, `phone`) VALUES
('Shcherbinina', 'Alina', 'Dmitrievna', '2001-03-06', 'manager', 20000, 'alinkash@gmail.com', 89086617630),
('Kendall', 'Yasmin', '', '1999-10-15', 'ads', 15000, 'kendall@gmail.com', 89086617630),
('Porter', 'Dotty', '', '2000-01-20', 'sales', 10000,'`porter@gmail.com', 89086617630);

INSERT INTO `rent` (`employee_id`,`client_id`,`comics_id`,`date_start`,`date_end`, `price`) VALUES
(3, 2, 5, '2020-03-04', '2020-03-06', 400),
(3, 4, 2, '2020-03-05', '2020-03-15', 800),
(3, 3, 4, '2020-03-01', '2020-03-05', 450),
(3, 1, 1, '2020-03-03', '2020-03-10', 700);
