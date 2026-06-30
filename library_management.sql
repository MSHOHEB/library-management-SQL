-- ============================================================
-- 📚 LIBRARY MANAGEMENT SYSTEM
-- ============================================================
-- Tables  : 6
-- Total Rows: 625+
-- Features : Books, Members, Issues, Returns, Staff, Categories
-- Queries  : 20+ Advanced SQL Queries
-- ============================================================

-- ── Drop tables if exist ─────────────────────────────────────
DROP TABLE IF EXISTS returns;
DROP TABLE IF EXISTS issues;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS categories;

-- ============================================================
-- 1. CATEGORIES TABLE (10 rows)
-- ============================================================
CREATE TABLE categories (
    category_id   INTEGER PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL,
    description   VARCHAR(200)
);

INSERT INTO categories VALUES
(1,  'Fiction',          'Novels, short stories and fictional works'),
(2,  'Non-Fiction',      'Real events, biographies and true stories'),
(3,  'Science',          'Physics, Chemistry, Biology and more'),
(4,  'Technology',       'Computers, AI, Programming books'),
(5,  'History',          'World history, Indian history, Wars'),
(6,  'Self-Help',        'Motivation, productivity and personal growth'),
(7,  'Children',         'Books for kids and young readers'),
(8,  'Mathematics',      'Algebra, Calculus, Statistics'),
(9,  'Literature',       'Poetry, Drama, Classic literature'),
(10, 'Business',         'Entrepreneurship, Finance, Marketing');

-- ============================================================
-- 2. BOOKS TABLE (100 rows)
-- ============================================================
CREATE TABLE books (
    book_id       INTEGER PRIMARY KEY,
    title         VARCHAR(150) NOT NULL,
    author        VARCHAR(100) NOT NULL,
    category_id   INTEGER REFERENCES categories(category_id),
    isbn          VARCHAR(20) UNIQUE,
    publisher     VARCHAR(100),
    publish_year  INTEGER,
    total_copies  INTEGER DEFAULT 1,
    available     INTEGER DEFAULT 1,
    price         DECIMAL(8,2),
    pages         INTEGER,
    language      VARCHAR(30) DEFAULT 'English'
);

INSERT INTO books VALUES
(1,  'The Great Gatsby',              'F. Scott Fitzgerald',  1, '978-0743273565', 'Scribner',         1925, 5, 3, 299.00,  180, 'English'),
(2,  'To Kill a Mockingbird',         'Harper Lee',           1, '978-0061935466', 'Harper Perennial', 1960, 4, 2, 349.00,  281, 'English'),
(3,  'Pride and Prejudice',           'Jane Austen',          1, '978-0141439518', 'Penguin Classics',  1813, 6, 4, 199.00,  432, 'English'),
(4,  'The Alchemist',                 'Paulo Coelho',         6, '978-0062315007', 'HarperOne',        1988, 8, 5, 250.00,  208, 'English'),
(5,  'Harry Potter and the Philosopher Stone', 'J.K. Rowling',7,'978-0439708180', 'Scholastic',       1997, 10,6, 399.00,  309, 'English'),
(6,  'A Brief History of Time',       'Stephen Hawking',      3, '978-0553380163', 'Bantam Books',     1988, 5, 3, 450.00,  212, 'English'),
(7,  'Clean Code',                    'Robert C. Martin',     4, '978-0132350884', 'Prentice Hall',    2008, 6, 4, 599.00,  431, 'English'),
(8,  'The Lean Startup',              'Eric Ries',            10,'978-0307887894', 'Crown Business',   2011, 4, 2, 499.00,  336, 'English'),
(9,  'Sapiens',                       'Yuval Noah Harari',    5, '978-0062316097', 'Harper Perennial', 2011, 7, 5, 550.00,  443, 'English'),
(10, 'Atomic Habits',                 'James Clear',          6, '978-0735211292', 'Avery',            2018, 9, 6, 499.00,  320, 'English'),
(11, 'The Power of Now',              'Eckhart Tolle',        6, '978-1577314806', 'New World Library', 1997,5, 3, 350.00,  236, 'English'),
(12, 'Rich Dad Poor Dad',             'Robert Kiyosaki',      10,'978-1612680194', 'Plata Publishing', 1997, 8, 5, 299.00,  336, 'English'),
(13, 'Think and Grow Rich',           'Napoleon Hill',        6, '978-1585424337', 'Tarcher',          1937, 6, 4, 249.00,  238, 'English'),
(14, 'The 7 Habits',                  'Stephen Covey',        6, '978-0743269513', 'Free Press',       1989, 5, 3, 399.00,  372, 'English'),
(15, 'Python Crash Course',           'Eric Matthes',         4, '978-1593279288', 'No Starch Press',  2019, 7, 5, 649.00,  544, 'English'),
(16, 'Introduction to Algorithms',    'Cormen et al.',        8, '978-0262033848', 'MIT Press',        2009, 4, 2, 999.00,  1292,'English'),
(17, 'Wings of Fire',                 'A.P.J. Abdul Kalam',   2, '978-8173711466', 'Universities Press',1999,10,7, 199.00,  196, 'English'),
(18, 'Discovery of India',            'Jawaharlal Nehru',     5, '978-0143031031', 'Penguin Books',    1946, 5, 3, 350.00,  572, 'English'),
(19, 'Malgudi Days',                  'R.K. Narayan',         9, '978-0143031534', 'Penguin Books',    1943, 6, 4, 199.00,  256, 'English'),
(20, 'The White Tiger',               'Aravind Adiga',        1, '978-1416562603', 'Free Press',       2008, 5, 3, 299.00,  321, 'English'),
(21, 'Five Point Someone',            'Chetan Bhagat',        1, '978-8129104595', 'Rupa Publications',2004, 8, 6, 150.00,  248, 'English'),
(22, 'The Immortals of Meluha',       'Amish Tripathi',       1, '978-9380658742', 'Westland',         2010, 9, 7, 250.00,  412, 'English'),
(23, 'Data Structures in C',          'Reema Thareja',        4, '978-0198099307', 'Oxford Press',     2014, 6, 4, 450.00,  512, 'English'),
(24, 'Operating Systems',             'Galvin',               4, '978-1118063330', 'Wiley',            2012, 4, 2, 750.00,  976, 'English'),
(25, 'Database Management Systems',   'Ramakrishnan',         4, '978-0072465631', 'McGraw Hill',      2002, 5, 3, 699.00,  1065,'English'),
(26, 'Calculus',                      'James Stewart',        8, '978-1285740621', 'Cengage',          2015, 4, 2, 850.00,  1368,'English'),
(27, 'Linear Algebra',                'Gilbert Strang',       8, '978-0980232776', 'Wellesley',        2016, 3, 2, 750.00,  574, 'English'),
(28, 'The God of Small Things',       'Arundhati Roy',        9, '978-0812979657', 'Random House',     1997, 5, 3, 299.00,  321, 'English'),
(29, 'Midnight Children',             'Salman Rushdie',       9, '978-0812976533', 'Random House',     1981, 4, 2, 350.00,  647, 'English'),
(30, 'Train to Pakistan',             'Khushwant Singh',      5, '978-0143065883', 'Penguin Books',    1956, 5, 3, 199.00,  181, 'English'),
(31, 'The Jungle Book',               'Rudyard Kipling',      7, '978-0142437209', 'Puffin Classics',  1894, 6, 4, 150.00,  224, 'English'),
(32, 'Charlotte Web',                 'E.B. White',           7, '978-0061124952', 'HarperCollins',    1952, 5, 3, 199.00,  192, 'English'),
(33, 'Good to Great',                 'Jim Collins',          10,'978-0066620992', 'HarperBusiness',   2001, 4, 2, 499.00,  320, 'English'),
(34, 'Zero to One',                   'Peter Thiel',          10,'978-0804139021', 'Crown Business',   2014, 5, 3, 399.00,  224, 'English'),
(35, 'Deep Work',                     'Cal Newport',          6, '978-1455586691', 'Grand Central',    2016, 6, 4, 399.00,  296, 'English'),
(36, 'Ikigai',                        'Hector Garcia',        6, '978-0143130727', 'Penguin Books',    2016, 8, 6, 299.00,  208, 'English'),
(37, 'The Psychology of Money',       'Morgan Housel',        10,'978-0857197689', 'Harriman House',   2020, 7, 5, 449.00,  256, 'English'),
(38, 'Thinking Fast and Slow',        'Daniel Kahneman',      6, '978-0374533557', 'FSG',              2011, 5, 3, 599.00,  499, 'English'),
(39, 'Outliers',                      'Malcolm Gladwell',     2, '978-0316017930', 'Little Brown',     2008, 6, 4, 450.00,  309, 'English'),
(40, 'The Tipping Point',             'Malcolm Gladwell',     2, '978-0316346627', 'Little Brown',     2000, 4, 2, 399.00,  301, 'English'),
(41, 'Cosmos',                        'Carl Sagan',           3, '978-0345539434', 'Ballantine Books', 1980, 5, 3, 499.00,  365, 'English'),
(42, 'The Selfish Gene',              'Richard Dawkins',      3, '978-0198788607', 'Oxford Press',     1976, 4, 2, 450.00,  360, 'English'),
(43, 'Freakonomics',                  'Steven Levitt',        2, '978-0060731335', 'HarperCollins',    2005, 5, 3, 399.00,  315, 'English'),
(44, 'The Art of War',                'Sun Tzu',              5, '978-1599869773', 'Filiquarian',      500,  6, 4, 150.00,  68,  'English'),
(45, 'Man Search for Meaning',        'Viktor Frankl',        6, '978-0807014271', 'Beacon Press',     1946, 5, 3, 299.00,  165, 'English'),
(46, 'The Diary of Young Girl',       'Anne Frank',           2, '978-0553296983', 'Bantam Books',     1947, 6, 4, 249.00,  283, 'English'),
(47, '1984',                          'George Orwell',        1, '978-0451524935', 'Signet Classic',   1949, 7, 5, 299.00,  328, 'English'),
(48, 'Animal Farm',                   'George Orwell',        1, '978-0451526342', 'Signet Classic',   1945, 6, 4, 199.00,  112, 'English'),
(49, 'Brave New World',               'Aldous Huxley',        1, '978-0060850524', 'HarperPerennial',  1932, 5, 3, 299.00,  311, 'English'),
(50, 'Lord of the Flies',             'William Golding',      1, '978-0399501487', 'Perigee',          1954, 4, 2, 249.00,  224, 'English'),
(51, 'The Catcher in the Rye',        'J.D. Salinger',        1, '978-0316769174', 'Little Brown',     1951, 5, 3, 299.00,  277, 'English'),
(52, 'Of Mice and Men',               'John Steinbeck',       1, '978-0140177398', 'Penguin Books',    1937, 4, 2, 199.00,  112, 'English'),
(53, 'The Grapes of Wrath',           'John Steinbeck',       1, '978-0143039433', 'Penguin Books',    1939, 4, 2, 349.00,  464, 'English'),
(54, 'Hamlet',                        'William Shakespeare',  9, '978-0743477123', 'Simon Schuster',   1603, 6, 4, 199.00,  342, 'English'),
(55, 'Macbeth',                       'William Shakespeare',  9, '978-0743477109', 'Simon Schuster',   1606, 5, 3, 149.00,  192, 'English'),
(56, 'The Odyssey',                   'Homer',                9, '978-0140268867', 'Penguin Classics',  800,  4, 2, 299.00,  541, 'English'),
(57, 'Ramayana',                      'Valmiki',              9, '978-0143029496', 'Penguin Books',    200,  8, 6, 250.00,  690, 'Hindi'),
(58, 'Mahabharata',                   'Vyasa',                9, '978-0143029519', 'Penguin Books',    400,  6, 4, 350.00,  912, 'Hindi'),
(59, 'Gitanjali',                     'Rabindranath Tagore',  9, '978-8172010980', 'Rupa Publications',1910, 5, 3, 150.00,  114, 'English'),
(60, 'Godan',                         'Munshi Premchand',     1, '978-8180317194', 'Rajkamal',         1936, 6, 4, 150.00,  348, 'Hindi'),
(61, 'Machine Learning',              'Tom Mitchell',         4, '978-0070428072', 'McGraw Hill',      1997, 4, 2, 799.00,  414, 'English'),
(62, 'Artificial Intelligence',       'Russell Norvig',       4, '978-0136042594', 'Prentice Hall',    2009, 3, 1, 999.00,  1152,'English'),
(63, 'The Pragmatic Programmer',      'Hunt Thomas',          4, '978-0135957059', 'Addison Wesley',   2019, 5, 3, 699.00,  352, 'English'),
(64, 'Design Patterns',               'Gang of Four',         4, '978-0201633610', 'Addison Wesley',   1994, 4, 2, 799.00,  395, 'English'),
(65, 'Computer Networks',             'Andrew Tanenbaum',     4, '978-0132126953', 'Prentice Hall',    2010, 5, 3, 750.00,  960, 'English'),
(66, 'Statistics for Data Science',   'Peter Bruce',          8, '978-1491952962', 'OReilly',          2017, 6, 4, 699.00,  395, 'English'),
(67, 'The Elements of Style',         'Strunk White',         9, '978-0205309023', 'Longman',          1959, 5, 3, 199.00,  105, 'English'),
(68, 'How to Win Friends',            'Dale Carnegie',        6, '978-0671027032', 'Simon Schuster',   1936, 8, 6, 299.00,  291, 'English'),
(69, 'The Subtle Art',                'Mark Manson',          6, '978-0062457714', 'HarperOne',        2016, 7, 5, 349.00,  224, 'English'),
(70, 'Can Hurt Me',                   'David Goggins',        6, '978-1544512907', 'Lioncrest',        2018, 6, 4, 499.00,  364, 'English'),
(71, 'The 48 Laws of Power',          'Robert Greene',        10,'978-0140280197', 'Penguin Books',    1998, 5, 3, 599.00,  452, 'English'),
(72, 'Meditations',                   'Marcus Aurelius',      6, '978-0812968255', 'Modern Library',   180,  6, 4, 299.00,  254, 'English'),
(73, 'Bhagavad Gita',                 'A.C. Bhaktivedanta',  9, '978-0892131198', 'BBT',              200,  10,8, 250.00,  924, 'English'),
(74, 'Steve Jobs',                    'Walter Isaacson',      2, '978-1451648539', 'Simon Schuster',   2011, 6, 4, 599.00,  656, 'English'),
(75, 'Elon Musk',                     'Ashlee Vance',         2, '978-0062301239', 'Ecco',             2015, 5, 3, 499.00,  400, 'English'),
(76, 'Long Walk to Freedom',          'Nelson Mandela',       2, '978-0316548182', 'Little Brown',     1994, 4, 2, 499.00,  656, 'English'),
(77, 'My Experiments with Truth',     'Mahatma Gandhi',       2, '978-0807059098', 'Beacon Press',     1927, 8, 6, 199.00,  528, 'English'),
(78, 'Abdul Kalam My Journey',        'A.P.J. Abdul Kalam',  2, '978-8129135667', 'Rupa Publications',2013, 7, 5, 150.00,  216, 'English'),
(79, 'The Road Ahead',                'Bill Gates',           10,'978-0140260403', 'Penguin Books',    1995, 4, 2, 349.00,  368, 'English'),
(80, 'India After Gandhi',            'Ramachandra Guha',     5, '978-0330396836', 'Picador',          2007, 5, 3, 699.00,  900, 'English'),
(81, 'The Secret',                    'Rhonda Byrne',         6, '978-1582701707', 'Atria Books',      2006, 7, 5, 299.00,  198, 'English'),
(82, 'Eat Pray Love',                 'Elizabeth Gilbert',    2, '978-0143038412', 'Penguin Books',    2006, 5, 3, 349.00,  334, 'English'),
(83, 'Gone Girl',                     'Gillian Flynn',        1, '978-0307588371', 'Crown',            2012, 5, 3, 349.00,  422, 'English'),
(84, 'The Da Vinci Code',             'Dan Brown',            1, '978-0307474278', 'Anchor',           2003, 8, 6, 349.00,  689, 'English'),
(85, 'Angels and Demons',             'Dan Brown',            1, '978-0671027360', 'Pocket Books',     2000, 6, 4, 299.00,  736, 'English'),
(86, 'Inferno',                       'Dan Brown',            1, '978-0804172288', 'Anchor',           2013, 5, 3, 349.00,  624, 'English'),
(87, 'The Notebook',                  'Nicholas Sparks',      1, '978-0446605236', 'Grand Central',    1996, 6, 4, 249.00,  214, 'English'),
(88, 'The Fault in Our Stars',        'John Green',           1, '978-0525478812', 'Dutton Books',     2012, 7, 5, 299.00,  313, 'English'),
(89, 'Divergent',                     'Veronica Roth',        7, '978-0062024039', 'Katherine Tegen',  2011, 6, 4, 299.00,  487, 'English'),
(90, 'The Hunger Games',              'Suzanne Collins',      7, '978-0439023481', 'Scholastic',       2008, 8, 6, 349.00,  374, 'English'),
(91, 'Number the Stars',              'Lois Lowry',           7, '978-0547577098', 'HMH Books',        1989, 5, 3, 199.00,  208, 'English'),
(92, 'Charlie Chocolate Factory',     'Roald Dahl',           7, '978-0142410318', 'Puffin Books',     1964, 7, 5, 199.00,  176, 'English'),
(93, 'James Giant Peach',             'Roald Dahl',           7, '978-0142410363', 'Puffin Books',     1961, 5, 3, 175.00,  146, 'English'),
(94, 'The Little Prince',             'Antoine de Exupery',  7, '978-0156012195', 'HBJ',              1943, 6, 4, 199.00,  96,  'English'),
(95, 'Geronimo Stilton',              'Elisabetta Dami',      7, '978-0439559690', 'Scholastic',       2000, 8, 6, 150.00,  128, 'English'),
(96, 'Environmental Science',         'G. Tyler Miller',      3, '978-1305090446', 'Cengage',          2015, 4, 2, 699.00,  832, 'English'),
(97, 'Organic Chemistry',             'Morrison Boyd',        3, '978-0136436690', 'Prentice Hall',    1992, 4, 2, 850.00,  1278,'English'),
(98, 'Physics Concepts',              'Paul Tipler',          3, '978-1429201247', 'Freeman',          2007, 5, 3, 799.00,  1360,'English'),
(99, 'The Innovators',                'Walter Isaacson',      4, '978-1476708706', 'Simon Schuster',   2014, 5, 3, 549.00,  560, 'English'),
(100,'Superintelligence',             'Nick Bostrom',         4, '978-0198739838', 'Oxford Press',     2014, 4, 2, 599.00,  352, 'English');

-- ============================================================
-- 3. STAFF TABLE (15 rows)
-- ============================================================
CREATE TABLE staff (
    staff_id    INTEGER PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    role        VARCHAR(50),
    email       VARCHAR(100) UNIQUE,
    phone       VARCHAR(15),
    join_date   DATE,
    salary      DECIMAL(10,2)
);

INSERT INTO staff VALUES
(1,  'Rajesh Kumar',    'Head Librarian',    'rajesh@library.com',   '9876543210', '2015-06-01', 55000.00),
(2,  'Priya Sharma',    'Assistant Librarian','priya@library.com',   '9876543211', '2017-03-15', 38000.00),
(3,  'Amit Singh',      'Cataloger',          'amit@library.com',    '9876543212', '2018-07-20', 32000.00),
(4,  'Sunita Patel',    'Data Entry',         'sunita@library.com',  '9876543213', '2019-01-10', 28000.00),
(5,  'Vikram Rao',      'Security',           'vikram@library.com',  '9876543214', '2016-11-05', 25000.00),
(6,  'Meena Joshi',     'Assistant Librarian','meena@library.com',   '9876543215', '2020-04-12', 36000.00),
(7,  'Deepak Verma',    'IT Support',         'deepak@library.com',  '9876543216', '2019-08-30', 40000.00),
(8,  'Kavita Nair',     'Cataloger',          'kavita@library.com',  '9876543217', '2021-02-14', 30000.00),
(9,  'Suresh Menon',    'Data Entry',         'suresh@library.com',  '9876543218', '2020-09-01', 27000.00),
(10, 'Anita Gupta',     'Receptionist',       'anita@library.com',   '9876543219', '2018-05-22', 26000.00),
(11, 'Ravi Tiwari',     'Book Keeper',        'ravi@library.com',    '9876543220', '2022-01-15', 29000.00),
(12, 'Pooja Mishra',    'Assistant Librarian','pooja@library.com',   '9876543221', '2021-07-08', 35000.00),
(13, 'Nitin Kulkarni',  'Security',           'nitin@library.com',   '9876543222', '2017-12-01', 24000.00),
(14, 'Sonal Desai',     'Cataloger',          'sonal@library.com',   '9876543223', '2023-03-20', 31000.00),
(15, 'Harish Pandey',   'IT Support',         'harish@library.com',  '9876543224', '2022-06-10', 38000.00);

-- ============================================================
-- 4. MEMBERS TABLE (150 rows)
-- ============================================================
CREATE TABLE members (
    member_id    INTEGER PRIMARY KEY,
    name         VARCHAR(100) NOT NULL,
    email        VARCHAR(100) UNIQUE,
    phone        VARCHAR(15),
    address      VARCHAR(200),
    city         VARCHAR(50),
    join_date    DATE,
    membership   VARCHAR(20) DEFAULT 'Regular',
    is_active    BOOLEAN DEFAULT TRUE
);

INSERT INTO members VALUES
(1,  'Aarav Sharma',     'aarav@gmail.com',      '9001001001', 'MG Road',        'Mumbai',    '2020-01-15', 'Premium', TRUE),
(2,  'Priya Singh',      'priya.s@gmail.com',    '9001001002', 'Lal Bagh',       'Bangalore', '2020-02-20', 'Regular', TRUE),
(3,  'Rohit Patel',      'rohit.p@gmail.com',    '9001001003', 'Ashram Road',    'Ahmedabad', '2020-03-10', 'Regular', TRUE),
(4,  'Sneha Gupta',      'sneha.g@gmail.com',    '9001001004', 'Connaught Place','Delhi',     '2020-04-05', 'Premium', TRUE),
(5,  'Amit Kumar',       'amit.k@gmail.com',     '9001001005', 'Park Street',    'Kolkata',   '2020-05-18', 'Regular', TRUE),
(6,  'Divya Nair',       'divya.n@gmail.com',    '9001001006', 'Marine Drive',   'Mumbai',    '2020-06-22', 'Student', TRUE),
(7,  'Karan Mehta',      'karan.m@gmail.com',    '9001001007', 'Anna Salai',     'Chennai',   '2020-07-14', 'Regular', TRUE),
(8,  'Pooja Joshi',      'pooja.j@gmail.com',    '9001001008', 'Banjara Hills',  'Hyderabad', '2020-08-30', 'Student', TRUE),
(9,  'Arjun Verma',      'arjun.v@gmail.com',    '9001001009', 'Civil Lines',    'Nagpur',    '2020-09-12', 'Regular', TRUE),
(10, 'Nisha Reddy',      'nisha.r@gmail.com',    '9001001010', 'Jubilee Hills',  'Hyderabad', '2020-10-08', 'Premium', TRUE),
(11, 'Vikram Tiwari',    'vikram.t@gmail.com',   '9001001011', 'Hazratganj',     'Lucknow',   '2020-11-25', 'Regular', TRUE),
(12, 'Anjali Mishra',    'anjali.m@gmail.com',   '9001001012', 'Janpath',        'Delhi',     '2020-12-15', 'Student', TRUE),
(13, 'Sanjay Kulkarni',  'sanjay.k@gmail.com',   '9001001013', 'FC Road',        'Pune',      '2021-01-20', 'Regular', TRUE),
(14, 'Rekha Desai',      'rekha.d@gmail.com',    '9001001014', 'CG Road',        'Ahmedabad', '2021-02-14', 'Premium', TRUE),
(15, 'Manoj Pandey',     'manoj.p@gmail.com',    '9001001015', 'Alkapuri',       'Vadodara',  '2021-03-08', 'Regular', TRUE),
(16, 'Sunita Rao',       'sunita.r@gmail.com',   '9001001016', 'Koramangala',    'Bangalore', '2021-04-19', 'Student', TRUE),
(17, 'Rahul Saxena',     'rahul.s@gmail.com',    '9001001017', 'Arera Colony',   'Bhopal',    '2021-05-30', 'Regular', TRUE),
(18, 'Kavita Jain',      'kavita.j@gmail.com',   '9001001018', 'MI Road',        'Jaipur',    '2021-06-11', 'Premium', TRUE),
(19, 'Deepak Chandra',   'deepak.c@gmail.com',   '9001001019', 'Boring Road',    'Patna',     '2021-07-22', 'Regular', TRUE),
(20, 'Meena Pillai',     'meena.pi@gmail.com',   '9001001020', 'MG Road',        'Kochi',     '2021-08-05', 'Student', TRUE),
(21, 'Suresh Iyer',      'suresh.i@gmail.com',   '9001001021', 'T Nagar',        'Chennai',   '2021-09-16', 'Regular', TRUE),
(22, 'Geeta Bhatt',      'geeta.b@gmail.com',    '9001001022', 'Navrangpura',    'Ahmedabad', '2021-10-27', 'Regular', TRUE),
(23, 'Anil Patil',       'anil.pa@gmail.com',    '9001001023', 'Deccan',         'Pune',      '2021-11-08', 'Student', TRUE),
(24, 'Swati Bose',       'swati.b@gmail.com',    '9001001024', 'Salt Lake',      'Kolkata',   '2021-12-19', 'Premium', TRUE),
(25, 'Rajiv Menon',      'rajiv.m@gmail.com',    '9001001025', 'Indiranagar',    'Bangalore', '2022-01-30', 'Regular', TRUE),
(26, 'Lalitha Nambiar',  'lalitha.n@gmail.com',  '9001001026', 'Calicut Road',   'Kozhikode', '2022-02-10', 'Regular', TRUE),
(27, 'Mohan Tripathi',   'mohan.t@gmail.com',    '9001001027', 'Sigra',          'Varanasi',  '2022-03-21', 'Student', TRUE),
(28, 'Usha Banerjee',    'usha.b@gmail.com',     '9001001028', 'Ballygunge',     'Kolkata',   '2022-04-12', 'Regular', TRUE),
(29, 'Ramesh Shetty',    'ramesh.sh@gmail.com',  '9001001029', 'Mangalore Road', 'Mangalore', '2022-05-23', 'Regular', TRUE),
(30, 'Shobha Kaur',      'shobha.k@gmail.com',   '9001001030', 'Sector 17',      'Chandigarh','2022-06-14', 'Premium', TRUE),
(31, 'Girish Nanda',     'girish.n@gmail.com',   '9001001031', 'Raj Nagar',      'Ghaziabad', '2022-07-05', 'Regular', TRUE),
(32, 'Pallavi Ghosh',    'pallavi.g@gmail.com',  '9001001032', 'New Alipore',    'Kolkata',   '2022-08-16', 'Student', TRUE),
(33, 'Naresh Bajaj',     'naresh.b@gmail.com',   '9001001033', 'Karol Bagh',     'Delhi',     '2022-09-27', 'Regular', TRUE),
(34, 'Sarita Malhotra',  'sarita.m@gmail.com',   '9001001034', 'Patel Nagar',    'Delhi',     '2022-10-18', 'Premium', TRUE),
(35, 'Tarun Aggarwal',   'tarun.a@gmail.com',    '9001001035', 'Model Town',     'Delhi',     '2022-11-09', 'Regular', TRUE),
(36, 'Uday Bhosle',      'uday.bh@gmail.com',    '9001001036', 'Dadar',          'Mumbai',    '2022-12-20', 'Student', TRUE),
(37, 'Vandana Shukla',   'vandana.s@gmail.com',  '9001001037', 'Gomti Nagar',    'Lucknow',   '2023-01-11', 'Regular', TRUE),
(38, 'Wasim Ansari',     'wasim.a@gmail.com',    '9001001038', 'Aminabad',       'Lucknow',   '2023-02-22', 'Regular', TRUE),
(39, 'Xena Pinto',       'xena.p@gmail.com',     '9001001039', 'Panjim',         'Goa',       '2023-03-05', 'Student', TRUE),
(40, 'Yogesh Wagle',     'yogesh.w@gmail.com',   '9001001040', 'Thane',          'Mumbai',    '2023-04-16', 'Regular', TRUE),
(41, 'Zara Sheikh',      'zara.sh@gmail.com',    '9001001041', 'Bandra',         'Mumbai',    '2023-05-27', 'Premium', TRUE),
(42, 'Akash Dubey',      'akash.d@gmail.com',    '9001001042', 'Lanka',          'Varanasi',  '2023-06-08', 'Student', TRUE),
(43, 'Bhavna Kothari',   'bhavna.k@gmail.com',   '9001001043', 'Satellite',      'Ahmedabad', '2023-07-19', 'Regular', TRUE),
(44, 'Chirag Lal',       'chirag.l@gmail.com',   '9001001044', 'Borivali',       'Mumbai',    '2023-08-30', 'Regular', TRUE),
(45, 'Deepali Sawant',   'deepali.s@gmail.com',  '9001001045', 'Andheri',        'Mumbai',    '2023-09-10', 'Student', TRUE),
(46, 'Eshan Mistry',     'eshan.m@gmail.com',    '9001001046', 'Powai',          'Mumbai',    '2023-10-21', 'Regular', TRUE),
(47, 'Falak Siddiqui',   'falak.s@gmail.com',    '9001001047', 'Malad',          'Mumbai',    '2020-01-15', 'Regular', FALSE),
(48, 'Ganesh Pillai',    'ganesh.pi@gmail.com',  '9001001048', 'Ernakulam',      'Kochi',     '2020-02-26', 'Student', TRUE),
(49, 'Hema Krishnan',    'hema.k@gmail.com',     '9001001049', 'Trivandrum',     'Thiruvananthapuram','2020-03-08','Regular',TRUE),
(50, 'Irfan Qureshi',    'irfan.q@gmail.com',    '9001001050', 'Shivajinagar',   'Pune',      '2020-04-19', 'Premium', TRUE),
(51, 'Jagdish Solanki',  'jagdish.s@gmail.com',  '9001001051', 'Vastrapur',      'Ahmedabad', '2020-05-30', 'Regular', TRUE),
(52, 'Kamla Rawat',      'kamla.r@gmail.com',    '9001001052', 'Dehradun Road',  'Haridwar',  '2020-06-10', 'Student', TRUE),
(53, 'Lokesh Rathore',   'lokesh.r@gmail.com',   '9001001053', 'Tonk Road',      'Jaipur',    '2020-07-21', 'Regular', TRUE),
(54, 'Manju Yadav',      'manju.y@gmail.com',    '9001001054', 'Crossing Republik','Ghaziabad','2020-08-01','Regular', TRUE),
(55, 'Naveen Reddy',     'naveen.r@gmail.com',   '9001001055', 'Kondapur',       'Hyderabad', '2020-09-12', 'Premium', TRUE),
(56, 'Omprakash Verma',  'om.v@gmail.com',       '9001001056', 'Cantonment',     'Kanpur',    '2020-10-23', 'Regular', TRUE),
(57, 'Pankaj Srivastava','pankaj.s@gmail.com',   '9001001057', 'Hazratganj',     'Lucknow',   '2020-11-03', 'Student', TRUE),
(58, 'Qasim Ali',        'qasim.a@gmail.com',    '9001001058', 'Charminar',      'Hyderabad', '2020-12-14', 'Regular', TRUE),
(59, 'Ritu Bajpai',      'ritu.b@gmail.com',     '9001001059', 'Alambagh',       'Lucknow',   '2021-01-25', 'Regular', TRUE),
(60, 'Sameer Kapoor',    'sameer.k@gmail.com',   '9001001060', 'South Extension','Delhi',     '2021-02-05', 'Premium', TRUE),
(61, 'Tanvi Pawar',      'tanvi.p@gmail.com',    '9001001061', 'Wakad',          'Pune',      '2021-03-16', 'Student', TRUE),
(62, 'Uma Shankar',      'uma.sh@gmail.com',     '9001001062', 'Sector 22',      'Noida',     '2021-04-27', 'Regular', TRUE),
(63, 'Vijay Goswami',    'vijay.g@gmail.com',    '9001001063', 'Vesu',           'Surat',     '2021-05-08', 'Regular', TRUE),
(64, 'Waqar Hussain',    'waqar.h@gmail.com',    '9001001064', 'Lal Darwaza',    'Surat',     '2021-06-19', 'Student', TRUE),
(65, 'Yasmin Irani',     'yasmin.i@gmail.com',   '9001001065', 'Colaba',         'Mumbai',    '2021-07-30', 'Premium', TRUE),
(66, 'Zaira Qazi',       'zaira.q@gmail.com',    '9001001066', 'Rajouri Garden', 'Delhi',     '2021-08-10', 'Regular', TRUE),
(67, 'Abhay Tomar',      'abhay.t@gmail.com',    '9001001067', 'Sector 4',       'Gurgaon',   '2021-09-21', 'Regular', TRUE),
(68, 'Bindiya Roy',      'bindiya.r@gmail.com',  '9001001068', 'Alipore',        'Kolkata',   '2021-10-02', 'Student', TRUE),
(69, 'Chandan Sinha',    'chandan.s@gmail.com',  '9001001069', 'Patliputra',     'Patna',     '2021-11-13', 'Regular', TRUE),
(70, 'Dolly Khanna',     'dolly.k@gmail.com',    '9001001070', 'Ludhiana',       'Ludhiana',  '2021-12-24', 'Premium', TRUE),
(71, 'Eshan Chauhan',    'eshan.c@gmail.com',    '9001001071', 'Saharanpur',     'Saharanpur','2022-01-04', 'Regular', FALSE),
(72, 'Farah Syed',       'farah.sy@gmail.com',   '9001001072', 'Frazer Town',    'Bangalore', '2022-02-15', 'Student', TRUE),
(73, 'Govind Swami',     'govind.s@gmail.com',   '9001001073', 'Jodhpur',        'Jodhpur',   '2022-03-26', 'Regular', TRUE),
(74, 'Harpreet Gill',    'harpreet.g@gmail.com', '9001001074', 'Amritsar',       'Amritsar',  '2022-04-06', 'Regular', TRUE),
(75, 'Indrani Das',      'indrani.d@gmail.com',  '9001001075', 'Lake Town',      'Kolkata',   '2022-05-17', 'Premium', TRUE),
(76, 'Jayesh Shah',      'jayesh.sh@gmail.com',  '9001001076', 'Maninagar',      'Ahmedabad', '2022-06-28', 'Regular', TRUE),
(77, 'Komal Vyas',       'komal.v@gmail.com',    '9001001077', 'Palasia',        'Indore',    '2022-07-09', 'Student', TRUE),
(78, 'Lalit Saxena',     'lalit.s@gmail.com',    '9001001078', 'Vijaynagar',     'Indore',    '2022-08-20', 'Regular', TRUE),
(79, 'Mamta Devi',       'mamta.d@gmail.com',    '9001001079', 'Rajendra Nagar', 'Patna',     '2022-09-01', 'Regular', TRUE),
(80, 'Nilesh Marathe',   'nilesh.m@gmail.com',   '9001001080', 'Nashik Road',    'Nashik',    '2022-10-12', 'Student', TRUE),
(81, 'Ojas Kulkarni',    'ojas.k@gmail.com',     '9001001081', 'Karve Road',     'Pune',      '2022-11-23', 'Regular', TRUE),
(82, 'Pratibha Shinde',  'pratibha.s@gmail.com', '9001001082', 'Kolhapur',       'Kolhapur',  '2022-12-04', 'Premium', TRUE),
(83, 'Qutubuddin Khan',  'qutub.k@gmail.com',    '9001001083', 'Bhopal Road',    'Bhopal',    '2023-01-15', 'Regular', TRUE),
(84, 'Ranjit Maan',      'ranjit.m@gmail.com',   '9001001084', 'Patiala',        'Patiala',   '2023-02-26', 'Regular', TRUE),
(85, 'Sundar Pichai',    'sundar.p@gmail.com',   '9001001085', 'Madurai',        'Madurai',   '2023-03-08', 'Student', TRUE),
(86, 'Tara Krishnamurti','tara.k@gmail.com',     '9001001086', 'Mysore Road',    'Mysore',    '2023-04-19', 'Regular', TRUE),
(87, 'Uddhav Thackeray', 'uddhav.t@gmail.com',   '9001001087', 'Worli',          'Mumbai',    '2023-05-30', 'Premium', TRUE),
(88, 'Varsha Bhatia',    'varsha.bh@gmail.com',  '9001001088', 'Dwarka',         'Delhi',     '2023-06-10', 'Regular', TRUE),
(89, 'Waman Deshpande',  'waman.d@gmail.com',    '9001001089', 'Aurangabad',     'Aurangabad','2023-07-21', 'Student', TRUE),
(90, 'Xavier Gomes',     'xavier.g@gmail.com',   '9001001090', 'Margao',         'Goa',       '2023-08-01', 'Regular', TRUE),
(91, 'Yashoda Nair',     'yashoda.n@gmail.com',  '9001001091', 'Thrissur',       'Thrissur',  '2023-09-12', 'Regular', TRUE),
(92, 'Zehra Mirza',      'zehra.m@gmail.com',    '9001001092', 'Hazratganj',     'Lucknow',   '2023-10-23', 'Student', TRUE),
(93, 'Aditya Thakur',    'aditya.t@gmail.com',   '9001001093', 'Rohtak',         'Rohtak',    '2020-01-05', 'Regular', TRUE),
(94, 'Bharati Gokhale',  'bharati.g@gmail.com',  '9001001094', 'Nagpur Road',    'Nagpur',    '2020-02-16', 'Premium', TRUE),
(95, 'Chandresh Modi',   'chandresh.m@gmail.com','9001001095', 'Surat Road',     'Navsari',   '2020-03-27', 'Regular', TRUE),
(96, 'Dhanashree Patil', 'dhana.p@gmail.com',    '9001001096', 'Sangli',         'Sangli',    '2020-04-07', 'Student', TRUE),
(97, 'Ekta Kapoor',      'ekta.ka@gmail.com',    '9001001097', 'Juhu',           'Mumbai',    '2020-05-18', 'Regular', FALSE),
(98, 'Farhan Akhtar',    'farhan.a@gmail.com',   '9001001098', 'Khar',           'Mumbai',    '2020-06-29', 'Regular', TRUE),
(99, 'Ganga Devi',       'ganga.d@gmail.com',    '9001001099', 'Allahabad',      'Prayagraj', '2020-07-10', 'Student', TRUE),
(100,'Harsh Vardhan',    'harsh.v@gmail.com',    '9001001100', 'Rohini',         'Delhi',     '2020-08-21', 'Regular', TRUE),
(101,'Isha Deol',        'isha.d@gmail.com',      '9001001101', 'Versova',        'Mumbai',    '2020-09-01', 'Premium', TRUE),
(102,'Jagannath Misra',  'jagannath.m@gmail.com', '9001001102', 'Cuttack',        'Cuttack',   '2020-10-12', 'Regular', TRUE),
(103,'Kamakshi Menon',   'kamakshi.m@gmail.com',  '9001001103', 'Vellore',        'Vellore',   '2020-11-23', 'Student', TRUE),
(104,'Lavanya Suresh',   'lavanya.s@gmail.com',   '9001001104', 'Coimbatore',     'Coimbatore','2020-12-04', 'Regular', TRUE),
(105,'Mukesh Ambani',    'mukesh.a@gmail.com',    '9001001105', 'Altamount Road', 'Mumbai',    '2021-01-15', 'Premium', TRUE),
(106,'Nidhi Agarwal',    'nidhi.ag@gmail.com',    '9001001106', 'Vasundhara',     'Ghaziabad', '2021-02-26', 'Regular', TRUE),
(107,'Onkar Sahay',      'onkar.s@gmail.com',     '9001001107', 'Lucknow Road',   'Kanpur',    '2021-03-08', 'Student', TRUE),
(108,'Preethi Nayak',    'preethi.n@gmail.com',   '9001001108', 'Manipal',        'Udupi',     '2021-04-19', 'Regular', TRUE),
(109,'Quamar Abbas',     'quamar.a@gmail.com',    '9001001109', 'Patna Sahib',    'Patna',     '2021-05-30', 'Regular', TRUE),
(110,'Roshni Walia',     'roshni.w@gmail.com',    '9001001110', 'Sector 7',       'Chandigarh','2021-06-10', 'Premium', TRUE),
(111,'Sachin Tendulkar', 'sachin.t@gmail.com',    '9001001111', 'Bandra West',    'Mumbai',    '2021-07-21', 'Regular', TRUE),
(112,'Trisha Krishnan',  'trisha.k@gmail.com',    '9001001112', 'Adyar',          'Chennai',   '2021-08-01', 'Student', TRUE),
(113,'Urvashi Rautela',  'urvashi.r@gmail.com',   '9001001113', 'Haridwar',       'Haridwar',  '2021-09-12', 'Regular', TRUE),
(114,'Varun Dhawan',     'varun.d@gmail.com',      '9001001114', 'Juhu',           'Mumbai',    '2021-10-23', 'Regular', TRUE),
(115,'Waseem Barelvi',   'waseem.b@gmail.com',     '9001001115', 'Bareilly',       'Bareilly',  '2021-11-03', 'Student', FALSE),
(116,'Xenobia Dcosta',   'xenobia.d@gmail.com',    '9001001116', 'Bandra',         'Mumbai',    '2021-12-14', 'Regular', TRUE),
(117,'Yuvraj Singh',     'yuvraj.s@gmail.com',     '9001001117', 'Chandigarh',     'Chandigarh','2022-01-25', 'Premium', TRUE),
(118,'Zaid Hamid',       'zaid.h@gmail.com',       '9001001118', 'F-6 Markaz',     'Islamabad', '2022-02-05', 'Regular', TRUE),
(119,'Aditi Rao',        'aditi.r@gmail.com',      '9001001119', 'Indiranagar',    'Bangalore', '2022-03-16', 'Student', TRUE),
(120,'Brijesh Tripathi', 'brijesh.t@gmail.com',    '9001001120', 'Sigra',          'Varanasi',  '2022-04-27', 'Regular', TRUE),
(121,'Chandni Chawla',   'chandni.ch@gmail.com',   '9001001121', 'Kamla Nagar',    'Delhi',     '2022-05-08', 'Regular', TRUE),
(122,'Dinesh Karthik',   'dinesh.ka@gmail.com',    '9001001122', 'Nungambakkam',   'Chennai',   '2022-06-19', 'Premium', TRUE),
(123,'Elina Samantha',   'elina.s@gmail.com',      '9001001123', 'Jubilee Hills',  'Hyderabad', '2022-07-30', 'Regular', TRUE),
(124,'Farida Jalal',     'farida.j@gmail.com',     '9001001124', 'Defence Colony', 'Delhi',     '2022-08-10', 'Student', TRUE),
(125,'Gaurav Chopra',    'gaurav.ch@gmail.com',    '9001001125', 'Vasant Kunj',    'Delhi',     '2022-09-21', 'Regular', TRUE),
(126,'Hina Khan',        'hina.kh@gmail.com',      '9001001126', 'Saki Naka',      'Mumbai',    '2022-10-02', 'Regular', TRUE),
(127,'Irrfan Khan',      'irrfan.kh@gmail.com',    '9001001127', 'Versova',        'Mumbai',    '2022-11-13', 'Premium', FALSE),
(128,'Jaya Bachchan',    'jaya.b@gmail.com',       '9001001128', 'Juhu',           'Mumbai',    '2022-12-24', 'Regular', TRUE),
(129,'Kiran Bedi',       'kiran.be@gmail.com',     '9001001129', 'Sector 9',       'Chandigarh','2023-01-04', 'Student', TRUE),
(130,'Lara Dutta',       'lara.d@gmail.com',       '9001001130', 'Bandra',         'Mumbai',    '2023-02-15', 'Regular', TRUE),
(131,'Mahesh Babu',      'mahesh.ba@gmail.com',    '9001001131', 'Jubilee Hills',  'Hyderabad', '2023-03-26', 'Premium', TRUE),
(132,'Naga Chaitanya',   'naga.ch@gmail.com',      '9001001132', 'Filmnagar',      'Hyderabad', '2023-04-06', 'Regular', TRUE),
(133,'Ozzy Fernandes',   'ozzy.f@gmail.com',       '9001001133', 'Panaji',         'Goa',       '2023-05-17', 'Student', TRUE),
(134,'Prabhas',          'prabhas.p@gmail.com',    '9001001134', 'Jubilee Hills',  'Hyderabad', '2023-06-28', 'Regular', TRUE),
(135,'Quentin Tarantino','quentin.t@gmail.com',    '9001001135', 'Colaba',         'Mumbai',    '2023-07-09', 'Premium', TRUE),
(136,'Rajkumar Hirani',  'rajkumar.h@gmail.com',   '9001001136', 'Andheri',        'Mumbai',    '2023-08-20', 'Regular', TRUE),
(137,'Sonu Nigam',       'sonu.n@gmail.com',       '9001001137', 'Juhu',           'Mumbai',    '2023-09-01', 'Regular', TRUE),
(138,'Taapsee Pannu',    'taapsee.p@gmail.com',    '9001001138', 'Versova',        'Mumbai',    '2023-10-12', 'Student', TRUE),
(139,'Udit Narayan',     'udit.n@gmail.com',       '9001001139', 'Andheri',        'Mumbai',    '2020-01-23', 'Regular', TRUE),
(140,'Vidya Balan',      'vidya.b@gmail.com',      '9001001140', 'Juhu',           'Mumbai',    '2020-03-05', 'Premium', TRUE),
(141,'Waheeda Rehman',   'waheeda.r@gmail.com',    '9001001141', 'Bandra',         'Mumbai',    '2020-04-16', 'Regular', TRUE),
(142,'Xerxes Dastur',    'xerxes.d@gmail.com',     '9001001142', 'Dadar',          'Mumbai',    '2020-05-27', 'Student', TRUE),
(143,'Yami Gautam',      'yami.g@gmail.com',       '9001001143', 'Bilaspur',       'Bilaspur',  '2020-07-08', 'Regular', TRUE),
(144,'Zeenat Aman',      'zeenat.a@gmail.com',     '9001001144', 'Bandra',         'Mumbai',    '2020-08-19', 'Regular', TRUE),
(145,'Arshad Warsi',     'arshad.w@gmail.com',     '9001001145', 'Versova',        'Mumbai',    '2020-09-30', 'Premium', TRUE),
(146,'Bipasha Basu',     'bipasha.b@gmail.com',    '9001001146', 'Juhu',           'Mumbai',    '2020-11-10', 'Regular', TRUE),
(147,'Chunky Pandey',    'chunky.p@gmail.com',     '9001001147', 'Andheri',        'Mumbai',    '2020-12-21', 'Student', TRUE),
(148,'Diana Penty',      'diana.pe@gmail.com',     '9001001148', 'Colaba',         'Mumbai',    '2021-02-01', 'Regular', TRUE),
(149,'Emraan Hashmi',    'emraan.h@gmail.com',     '9001001149', 'Juhu',           'Mumbai',    '2021-03-14', 'Regular', TRUE),
(150,'Fatima Sana',      'fatima.sn@gmail.com',    '9001001150', 'Versova',        'Mumbai',    '2021-04-25', 'Premium', TRUE);

-- ============================================================
-- 5. ISSUES TABLE (200 rows)
-- ============================================================
CREATE TABLE issues (
    issue_id     INTEGER PRIMARY KEY,
    member_id    INTEGER REFERENCES members(member_id),
    book_id      INTEGER REFERENCES books(book_id),
    staff_id     INTEGER REFERENCES staff(staff_id),
    issue_date   DATE NOT NULL,
    due_date     DATE NOT NULL,
    status       VARCHAR(20) DEFAULT 'Issued'
);

INSERT INTO issues VALUES
(1,  1,  10, 1, '2023-01-05', '2023-01-19', 'Returned'),
(2,  2,  22, 2, '2023-01-06', '2023-01-20', 'Returned'),
(3,  3,  84, 1, '2023-01-07', '2023-01-21', 'Returned'),
(4,  4,  9,  3, '2023-01-08', '2023-01-22', 'Returned'),
(5,  5,  5,  2, '2023-01-09', '2023-01-23', 'Returned'),
(6,  6,  36, 1, '2023-01-10', '2023-01-24', 'Returned'),
(7,  7,  47, 4, '2023-01-11', '2023-01-25', 'Returned'),
(8,  8,  17, 2, '2023-01-12', '2023-01-26', 'Returned'),
(9,  9,  68, 1, '2023-01-13', '2023-01-27', 'Returned'),
(10, 10, 12, 3, '2023-01-14', '2023-01-28', 'Returned'),
(11, 11, 74, 2, '2023-01-15', '2023-01-29', 'Returned'),
(12, 12, 37, 1, '2023-01-16', '2023-01-30', 'Returned'),
(13, 13, 4,  4, '2023-01-17', '2023-01-31', 'Returned'),
(14, 14, 81, 2, '2023-01-18', '2023-02-01', 'Returned'),
(15, 15, 21, 1, '2023-01-19', '2023-02-02', 'Returned'),
(16, 16, 90, 3, '2023-01-20', '2023-02-03', 'Returned'),
(17, 17, 35, 2, '2023-01-21', '2023-02-04', 'Returned'),
(18, 18, 69, 1, '2023-01-22', '2023-02-05', 'Returned'),
(19, 19, 15, 4, '2023-01-23', '2023-02-06', 'Returned'),
(20, 20, 38, 2, '2023-01-24', '2023-02-07', 'Returned'),
(21, 21, 7,  1, '2023-02-01', '2023-02-15', 'Returned'),
(22, 22, 99, 3, '2023-02-02', '2023-02-16', 'Returned'),
(23, 23, 45, 2, '2023-02-03', '2023-02-17', 'Returned'),
(24, 24, 88, 1, '2023-02-04', '2023-02-18', 'Returned'),
(25, 25, 29, 4, '2023-02-05', '2023-02-19', 'Returned'),
(26, 26, 72, 2, '2023-02-06', '2023-02-20', 'Returned'),
(27, 27, 13, 1, '2023-02-07', '2023-02-21', 'Returned'),
(28, 28, 56, 3, '2023-02-08', '2023-02-22', 'Returned'),
(29, 29, 33, 2, '2023-02-09', '2023-02-23', 'Returned'),
(30, 30, 77, 1, '2023-02-10', '2023-02-24', 'Returned'),
(31, 31, 19, 4, '2023-02-11', '2023-02-25', 'Returned'),
(32, 32, 62, 2, '2023-02-12', '2023-02-26', 'Returned'),
(33, 33, 41, 1, '2023-02-13', '2023-02-27', 'Returned'),
(34, 34, 85, 3, '2023-02-14', '2023-02-28', 'Returned'),
(35, 35, 26, 2, '2023-02-15', '2023-03-01', 'Returned'),
(36, 36, 70, 1, '2023-02-16', '2023-03-02', 'Returned'),
(37, 37, 8,  4, '2023-02-17', '2023-03-03', 'Returned'),
(38, 38, 53, 2, '2023-02-18', '2023-03-04', 'Returned'),
(39, 39, 30, 1, '2023-02-19', '2023-03-05', 'Returned'),
(40, 40, 95, 3, '2023-02-20', '2023-03-06', 'Returned'),
(41, 41, 16, 2, '2023-03-01', '2023-03-15', 'Returned'),
(42, 42, 59, 1, '2023-03-02', '2023-03-16', 'Returned'),
(43, 43, 43, 4, '2023-03-03', '2023-03-17', 'Returned'),
(44, 44, 86, 2, '2023-03-04', '2023-03-18', 'Returned'),
(45, 45, 27, 1, '2023-03-05', '2023-03-19', 'Returned'),
(46, 46, 71, 3, '2023-03-06', '2023-03-20', 'Returned'),
(47, 47, 11, 2, '2023-03-07', '2023-03-21', 'Returned'),
(48, 48, 54, 1, '2023-03-08', '2023-03-22', 'Returned'),
(49, 49, 34, 4, '2023-03-09', '2023-03-23', 'Returned'),
(50, 50, 78, 2, '2023-03-10', '2023-03-24', 'Returned'),
(51, 51, 20, 1, '2023-03-11', '2023-03-25', 'Returned'),
(52, 52, 63, 3, '2023-03-12', '2023-03-26', 'Returned'),
(53, 53, 48, 2, '2023-03-13', '2023-03-27', 'Returned'),
(54, 54, 91, 1, '2023-03-14', '2023-03-28', 'Returned'),
(55, 55, 28, 4, '2023-03-15', '2023-03-29', 'Returned'),
(56, 56, 73, 2, '2023-03-16', '2023-03-30', 'Returned'),
(57, 57, 14, 1, '2023-03-17', '2023-03-31', 'Returned'),
(58, 58, 57, 3, '2023-03-18', '2023-04-01', 'Returned'),
(59, 59, 39, 2, '2023-03-19', '2023-04-02', 'Returned'),
(60, 60, 82, 1, '2023-03-20', '2023-04-03', 'Returned'),
(61, 1,  3,  4, '2023-04-01', '2023-04-15', 'Returned'),
(62, 2,  46, 2, '2023-04-02', '2023-04-16', 'Returned'),
(63, 3,  23, 1, '2023-04-03', '2023-04-17', 'Returned'),
(64, 4,  67, 3, '2023-04-04', '2023-04-18', 'Returned'),
(65, 5,  44, 2, '2023-04-05', '2023-04-19', 'Returned'),
(66, 6,  87, 1, '2023-04-06', '2023-04-20', 'Returned'),
(67, 7,  25, 4, '2023-04-07', '2023-04-21', 'Returned'),
(68, 8,  64, 2, '2023-04-08', '2023-04-22', 'Returned'),
(69, 9,  42, 1, '2023-04-09', '2023-04-23', 'Returned'),
(70, 10, 89, 3, '2023-04-10', '2023-04-24', 'Returned'),
(71, 11, 31, 2, '2023-04-11', '2023-04-25', 'Returned'),
(72, 12, 76, 1, '2023-04-12', '2023-04-26', 'Returned'),
(73, 13, 18, 4, '2023-04-13', '2023-04-27', 'Returned'),
(74, 14, 61, 2, '2023-04-14', '2023-04-28', 'Returned'),
(75, 15, 49, 1, '2023-04-15', '2023-04-29', 'Returned'),
(76, 16, 92, 3, '2023-04-16', '2023-04-30', 'Returned'),
(77, 17, 32, 2, '2023-04-17', '2023-05-01', 'Returned'),
(78, 18, 75, 1, '2023-04-18', '2023-05-02', 'Returned'),
(79, 19, 24, 4, '2023-04-19', '2023-05-03', 'Returned'),
(80, 20, 65, 2, '2023-04-20', '2023-05-04', 'Returned'),
(81, 21, 51, 1, '2023-05-01', '2023-05-15', 'Returned'),
(82, 22, 94, 3, '2023-05-02', '2023-05-16', 'Returned'),
(83, 23, 40, 2, '2023-05-03', '2023-05-17', 'Returned'),
(84, 24, 83, 1, '2023-05-04', '2023-05-18', 'Returned'),
(85, 25, 6,  4, '2023-05-05', '2023-05-19', 'Returned'),
(86, 26, 50, 2, '2023-05-06', '2023-05-20', 'Returned'),
(87, 27, 93, 1, '2023-05-07', '2023-05-21', 'Returned'),
(88, 28, 36, 3, '2023-05-08', '2023-05-22', 'Returned'),
(89, 29, 79, 2, '2023-05-09', '2023-05-23', 'Returned'),
(90, 30, 1,  1, '2023-05-10', '2023-05-24', 'Returned'),
(91, 31, 55, 4, '2023-05-11', '2023-05-25', 'Returned'),
(92, 32, 98, 2, '2023-05-12', '2023-05-26', 'Returned'),
(93, 33, 37, 1, '2023-05-13', '2023-05-27', 'Returned'),
(94, 34, 80, 3, '2023-05-14', '2023-05-28', 'Returned'),
(95, 35, 2,  2, '2023-05-15', '2023-05-29', 'Returned'),
(96, 36, 58, 1, '2023-05-16', '2023-05-30', 'Returned'),
(97, 37, 96, 4, '2023-05-17', '2023-05-31', 'Returned'),
(98, 38, 66, 2, '2023-05-18', '2023-06-01', 'Returned'),
(99, 39, 100,1, '2023-05-19', '2023-06-02', 'Returned'),
(100,40, 52, 3, '2023-05-20', '2023-06-03', 'Returned'),
(101,41, 10, 2, '2023-06-01', '2023-06-15', 'Returned'),
(102,42, 22, 1, '2023-06-02', '2023-06-16', 'Returned'),
(103,43, 84, 4, '2023-06-03', '2023-06-17', 'Returned'),
(104,44, 9,  2, '2023-06-04', '2023-06-18', 'Returned'),
(105,45, 5,  1, '2023-06-05', '2023-06-19', 'Returned'),
(106,46, 36, 3, '2023-06-06', '2023-06-20', 'Returned'),
(107,47, 47, 2, '2023-06-07', '2023-06-21', 'Returned'),
(108,48, 17, 1, '2023-06-08', '2023-06-22', 'Returned'),
(109,49, 68, 4, '2023-06-09', '2023-06-23', 'Returned'),
(110,50, 12, 2, '2023-06-10', '2023-06-24', 'Returned'),
(111,51, 74, 1, '2023-06-11', '2023-06-25', 'Returned'),
(112,52, 37, 3, '2023-06-12', '2023-06-26', 'Returned'),
(113,53, 4,  2, '2023-06-13', '2023-06-27', 'Returned'),
(114,54, 81, 1, '2023-06-14', '2023-06-28', 'Returned'),
(115,55, 21, 4, '2023-06-15', '2023-06-29', 'Returned'),
(116,56, 90, 2, '2023-06-16', '2023-06-30', 'Returned'),
(117,57, 35, 1, '2023-06-17', '2023-07-01', 'Returned'),
(118,58, 69, 3, '2023-06-18', '2023-07-02', 'Returned'),
(119,59, 15, 2, '2023-06-19', '2023-07-03', 'Returned'),
(120,60, 38, 1, '2023-06-20', '2023-07-04', 'Returned'),
(121,61, 7,  4, '2023-07-01', '2023-07-15', 'Returned'),
(122,62, 99, 2, '2023-07-02', '2023-07-16', 'Returned'),
(123,63, 45, 1, '2023-07-03', '2023-07-17', 'Returned'),
(124,64, 88, 3, '2023-07-04', '2023-07-18', 'Returned'),
(125,65, 29, 2, '2023-07-05', '2023-07-19', 'Returned'),
(126,66, 72, 1, '2023-07-06', '2023-07-20', 'Returned'),
(127,67, 13, 4, '2023-07-07', '2023-07-21', 'Returned'),
(128,68, 56, 2, '2023-07-08', '2023-07-22', 'Returned'),
(129,69, 33, 1, '2023-07-09', '2023-07-23', 'Returned'),
(130,70, 77, 3, '2023-07-10', '2023-07-24', 'Returned'),
(131,71, 19, 2, '2023-07-11', '2023-07-25', 'Returned'),
(132,72, 62, 1, '2023-07-12', '2023-07-26', 'Returned'),
(133,73, 41, 4, '2023-07-13', '2023-07-27', 'Returned'),
(134,74, 85, 2, '2023-07-14', '2023-07-28', 'Returned'),
(135,75, 26, 1, '2023-07-15', '2023-07-29', 'Returned'),
(136,76, 70, 3, '2023-07-16', '2023-07-30', 'Returned'),
(137,77, 8,  2, '2023-07-17', '2023-07-31', 'Returned'),
(138,78, 53, 1, '2023-07-18', '2023-08-01', 'Returned'),
(139,79, 30, 4, '2023-07-19', '2023-08-02', 'Returned'),
(140,80, 95, 2, '2023-07-20', '2023-08-03', 'Returned'),
(141,81, 10, 1, '2023-08-01', '2023-08-15', 'Returned'),
(142,82, 4,  3, '2023-08-02', '2023-08-16', 'Returned'),
(143,83, 84, 2, '2023-08-03', '2023-08-17', 'Returned'),
(144,84, 22, 1, '2023-08-04', '2023-08-18', 'Returned'),
(145,85, 36, 4, '2023-08-05', '2023-08-19', 'Returned'),
(146,86, 68, 2, '2023-08-06', '2023-08-20', 'Returned'),
(147,87, 17, 1, '2023-08-07', '2023-08-21', 'Returned'),
(148,88, 47, 3, '2023-08-08', '2023-08-22', 'Returned'),
(149,89, 9,  2, '2023-08-09', '2023-08-23', 'Returned'),
(150,90, 5,  1, '2023-08-10', '2023-08-24', 'Returned'),
(151,91, 12, 4, '2023-08-11', '2023-08-25', 'Returned'),
(152,92, 74, 2, '2023-08-12', '2023-08-26', 'Returned'),
(153,93, 37, 1, '2023-08-13', '2023-08-27', 'Returned'),
(154,94, 81, 3, '2023-08-14', '2023-08-28', 'Returned'),
(155,95, 21, 2, '2023-08-15', '2023-08-29', 'Returned'),
(156,96, 90, 1, '2023-08-16', '2023-08-30', 'Returned'),
(157,97, 35, 4, '2023-08-17', '2023-08-31', 'Returned'),
(158,98, 69, 2, '2023-08-18', '2023-09-01', 'Returned'),
(159,99, 15, 1, '2023-08-19', '2023-09-02', 'Returned'),
(160,100,38, 3, '2023-08-20', '2023-09-03', 'Returned'),
(161,101,10, 2, '2023-09-01', '2023-09-15', 'Issued'),
(162,102,22, 1, '2023-09-02', '2023-09-16', 'Issued'),
(163,103,84, 4, '2023-09-03', '2023-09-17', 'Issued'),
(164,104,9,  2, '2023-09-04', '2023-09-18', 'Overdue'),
(165,105,5,  1, '2023-09-05', '2023-09-19', 'Overdue'),
(166,106,36, 3, '2023-09-06', '2023-09-20', 'Issued'),
(167,107,47, 2, '2023-09-07', '2023-09-21', 'Overdue'),
(168,108,17, 1, '2023-09-08', '2023-09-22', 'Issued'),
(169,109,68, 4, '2023-09-09', '2023-09-23', 'Overdue'),
(170,110,12, 2, '2023-09-10', '2023-09-24', 'Issued'),
(171,111,74, 1, '2023-09-11', '2023-09-25', 'Overdue'),
(172,112,37, 3, '2023-09-12', '2023-09-26', 'Issued'),
(173,113,4,  2, '2023-09-13', '2023-09-27', 'Overdue'),
(174,114,81, 1, '2023-09-14', '2023-09-28', 'Issued'),
(175,115,21, 4, '2023-09-15', '2023-09-29', 'Overdue'),
(176,116,90, 2, '2023-09-16', '2023-09-30', 'Issued'),
(177,117,35, 1, '2023-09-17', '2023-10-01', 'Issued'),
(178,118,69, 3, '2023-09-18', '2023-10-02', 'Issued'),
(179,119,15, 2, '2023-09-19', '2023-10-03', 'Issued'),
(180,120,38, 1, '2023-09-20', '2023-10-04', 'Issued'),
(181,121,7,  4, '2023-10-01', '2023-10-15', 'Issued'),
(182,122,99, 2, '2023-10-02', '2023-10-16', 'Issued'),
(183,123,45, 1, '2023-10-03', '2023-10-17', 'Issued'),
(184,124,88, 3, '2023-10-04', '2023-10-18', 'Issued'),
(185,125,29, 2, '2023-10-05', '2023-10-19', 'Issued'),
(186,126,72, 1, '2023-10-06', '2023-10-20', 'Issued'),
(187,127,13, 4, '2023-10-07', '2023-10-21', 'Issued'),
(188,128,56, 2, '2023-10-08', '2023-10-22', 'Issued'),
(189,129,33, 1, '2023-10-09', '2023-10-23', 'Issued'),
(190,130,77, 3, '2023-10-10', '2023-10-24', 'Issued'),
(191,131,19, 2, '2023-10-11', '2023-10-25', 'Issued'),
(192,132,62, 1, '2023-10-12', '2023-10-26', 'Issued'),
(193,133,41, 4, '2023-10-13', '2023-10-27', 'Issued'),
(194,134,85, 2, '2023-10-14', '2023-10-28', 'Issued'),
(195,135,26, 1, '2023-10-15', '2023-10-29', 'Issued'),
(196,136,70, 3, '2023-10-16', '2023-10-30', 'Issued'),
(197,137,8,  2, '2023-10-17', '2023-10-31', 'Issued'),
(198,138,53, 1, '2023-10-18', '2023-11-01', 'Issued'),
(199,139,30, 4, '2023-10-19', '2023-11-02', 'Issued'),
(200,140,95, 2, '2023-10-20', '2023-11-03', 'Issued');

-- ============================================================
-- 6. RETURNS TABLE (150 rows)
-- ============================================================
CREATE TABLE returns (
    return_id    INTEGER PRIMARY KEY,
    issue_id     INTEGER REFERENCES issues(issue_id),
    member_id    INTEGER REFERENCES members(member_id),
    book_id      INTEGER REFERENCES books(book_id),
    return_date  DATE NOT NULL,
    fine_per_day DECIMAL(5,2) DEFAULT 2.00,
    days_late    INTEGER DEFAULT 0,
    fine_amount  DECIMAL(8,2) DEFAULT 0.00,
    fine_paid    BOOLEAN DEFAULT FALSE
);

INSERT INTO returns VALUES
(1,  1,  1,  10, '2023-01-18', 2.00, 0,  0.00,  TRUE),
(2,  2,  2,  22, '2023-01-22', 2.00, 2,  4.00,  TRUE),
(3,  3,  3,  84, '2023-01-21', 2.00, 0,  0.00,  TRUE),
(4,  4,  4,  9,  '2023-01-25', 2.00, 3,  6.00,  TRUE),
(5,  5,  5,  5,  '2023-01-23', 2.00, 0,  0.00,  TRUE),
(6,  6,  6,  36, '2023-01-28', 2.00, 4,  8.00,  TRUE),
(7,  7,  7,  47, '2023-01-25', 2.00, 0,  0.00,  TRUE),
(8,  8,  8,  17, '2023-01-30', 2.00, 4,  8.00,  FALSE),
(9,  9,  9,  68, '2023-01-27', 2.00, 0,  0.00,  TRUE),
(10, 10, 10, 12, '2023-02-01', 2.00, 4,  8.00,  TRUE),
(11, 11, 11, 74, '2023-01-29', 2.00, 0,  0.00,  TRUE),
(12, 12, 12, 37, '2023-02-03', 2.00, 4,  8.00,  FALSE),
(13, 13, 13, 4,  '2023-01-31', 2.00, 0,  0.00,  TRUE),
(14, 14, 14, 81, '2023-02-05', 2.00, 4,  8.00,  TRUE),
(15, 15, 15, 21, '2023-02-02', 2.00, 0,  0.00,  TRUE),
(16, 16, 16, 90, '2023-02-07', 2.00, 4,  8.00,  TRUE),
(17, 17, 17, 35, '2023-02-04', 2.00, 0,  0.00,  TRUE),
(18, 18, 18, 69, '2023-02-09', 2.00, 4,  8.00,  FALSE),
(19, 19, 19, 15, '2023-02-06', 2.00, 0,  0.00,  TRUE),
(20, 20, 20, 38, '2023-02-11', 2.00, 4,  8.00,  TRUE),
(21, 21, 21, 7,  '2023-02-15', 2.00, 0,  0.00,  TRUE),
(22, 22, 22, 99, '2023-02-20', 2.00, 4,  8.00,  TRUE),
(23, 23, 23, 45, '2023-02-17', 2.00, 0,  0.00,  TRUE),
(24, 24, 24, 88, '2023-02-22', 2.00, 4,  8.00,  FALSE),
(25, 25, 25, 29, '2023-02-19', 2.00, 0,  0.00,  TRUE),
(26, 26, 26, 72, '2023-02-24', 2.00, 4,  8.00,  TRUE),
(27, 27, 27, 13, '2023-02-21', 2.00, 0,  0.00,  TRUE),
(28, 28, 28, 56, '2023-02-26', 2.00, 4,  8.00,  TRUE),
(29, 29, 29, 33, '2023-02-23', 2.00, 0,  0.00,  TRUE),
(30, 30, 30, 77, '2023-02-28', 2.00, 4,  8.00,  FALSE),
(31, 31, 31, 19, '2023-02-25', 2.00, 0,  0.00,  TRUE),
(32, 32, 32, 62, '2023-03-02', 2.00, 4,  8.00,  TRUE),
(33, 33, 33, 41, '2023-02-27', 2.00, 0,  0.00,  TRUE),
(34, 34, 34, 85, '2023-03-04', 2.00, 4,  8.00,  TRUE),
(35, 35, 35, 26, '2023-03-01', 2.00, 0,  0.00,  TRUE),
(36, 36, 36, 70, '2023-03-06', 2.00, 4,  8.00,  FALSE),
(37, 37, 37, 8,  '2023-03-03', 2.00, 0,  0.00,  TRUE),
(38, 38, 38, 53, '2023-03-08', 2.00, 4,  8.00,  TRUE),
(39, 39, 39, 30, '2023-03-05', 2.00, 0,  0.00,  TRUE),
(40, 40, 40, 95, '2023-03-10', 2.00, 4,  8.00,  TRUE),
(41, 41, 41, 16, '2023-03-15', 2.00, 0,  0.00,  TRUE),
(42, 42, 42, 59, '2023-03-20', 2.00, 4,  8.00,  FALSE),
(43, 43, 43, 43, '2023-03-17', 2.00, 0,  0.00,  TRUE),
(44, 44, 44, 86, '2023-03-22', 2.00, 4,  8.00,  TRUE),
(45, 45, 45, 27, '2023-03-19', 2.00, 0,  0.00,  TRUE),
(46, 46, 46, 71, '2023-03-24', 2.00, 4,  8.00,  TRUE),
(47, 47, 47, 11, '2023-03-21', 2.00, 0,  0.00,  TRUE),
(48, 48, 48, 54, '2023-03-26', 2.00, 4,  8.00,  FALSE),
(49, 49, 49, 34, '2023-03-23', 2.00, 0,  0.00,  TRUE),
(50, 50, 50, 78, '2023-03-28', 2.00, 4,  8.00,  TRUE),
(51, 51, 51, 20, '2023-03-25', 2.00, 0,  0.00,  TRUE),
(52, 52, 52, 63, '2023-03-30', 2.00, 4,  8.00,  TRUE),
(53, 53, 53, 48, '2023-03-27', 2.00, 0,  0.00,  TRUE),
(54, 54, 54, 91, '2023-04-01', 2.00, 4,  8.00,  FALSE),
(55, 55, 55, 28, '2023-03-29', 2.00, 0,  0.00,  TRUE),
(56, 56, 56, 73, '2023-04-03', 2.00, 4,  8.00,  TRUE),
(57, 57, 57, 14, '2023-03-31', 2.00, 0,  0.00,  TRUE),
(58, 58, 58, 57, '2023-04-05', 2.00, 4,  8.00,  TRUE),
(59, 59, 59, 39, '2023-04-02', 2.00, 0,  0.00,  TRUE),
(60, 60, 60, 82, '2023-04-07', 2.00, 4,  8.00,  FALSE),
(61, 61, 1,  3,  '2023-04-15', 2.00, 0,  0.00,  TRUE),
(62, 62, 2,  46, '2023-04-20', 2.00, 4,  8.00,  TRUE),
(63, 63, 3,  23, '2023-04-17', 2.00, 0,  0.00,  TRUE),
(64, 64, 4,  67, '2023-04-22', 2.00, 4,  8.00,  TRUE),
(65, 65, 5,  44, '2023-04-19', 2.00, 0,  0.00,  TRUE),
(66, 66, 6,  87, '2023-04-24', 2.00, 4,  8.00,  FALSE),
(67, 67, 7,  25, '2023-04-21', 2.00, 0,  0.00,  TRUE),
(68, 68, 8,  64, '2023-04-26', 2.00, 4,  8.00,  TRUE),
(69, 69, 9,  42, '2023-04-23', 2.00, 0,  0.00,  TRUE),
(70, 70, 10, 89, '2023-04-28', 2.00, 4,  8.00,  TRUE),
(71, 71, 11, 31, '2023-04-25', 2.00, 0,  0.00,  TRUE),
(72, 72, 12, 76, '2023-04-30', 2.00, 4,  8.00,  FALSE),
(73, 73, 13, 18, '2023-04-27', 2.00, 0,  0.00,  TRUE),
(74, 74, 14, 61, '2023-05-02', 2.00, 4,  8.00,  TRUE),
(75, 75, 15, 49, '2023-04-29', 2.00, 0,  0.00,  TRUE),
(76, 76, 16, 92, '2023-05-04', 2.00, 4,  8.00,  TRUE),
(77, 77, 17, 32, '2023-05-01', 2.00, 0,  0.00,  TRUE),
(78, 78, 18, 75, '2023-05-06', 2.00, 4,  8.00,  FALSE),
(79, 79, 19, 24, '2023-05-03', 2.00, 0,  0.00,  TRUE),
(80, 80, 20, 65, '2023-05-08', 2.00, 4,  8.00,  TRUE),
(81, 81, 21, 51, '2023-05-15', 2.00, 0,  0.00,  TRUE),
(82, 82, 22, 94, '2023-05-20', 2.00, 4,  8.00,  TRUE),
(83, 83, 23, 40, '2023-05-17', 2.00, 0,  0.00,  TRUE),
(84, 84, 24, 83, '2023-05-22', 2.00, 4,  8.00,  FALSE),
(85, 85, 25, 6,  '2023-05-19', 2.00, 0,  0.00,  TRUE),
(86, 86, 26, 50, '2023-05-24', 2.00, 4,  8.00,  TRUE),
(87, 87, 27, 93, '2023-05-21', 2.00, 0,  0.00,  TRUE),
(88, 88, 28, 36, '2023-05-26', 2.00, 4,  8.00,  TRUE),
(89, 89, 29, 79, '2023-05-23', 2.00, 0,  0.00,  TRUE),
(90, 90, 30, 1,  '2023-05-28', 2.00, 4,  8.00,  FALSE),
(91, 91, 31, 55, '2023-05-25', 2.00, 0,  0.00,  TRUE),
(92, 92, 32, 98, '2023-05-30', 2.00, 4,  8.00,  TRUE),
(93, 93, 33, 37, '2023-05-27', 2.00, 0,  0.00,  TRUE),
(94, 94, 34, 80, '2023-06-01', 2.00, 4,  8.00,  TRUE),
(95, 95, 35, 2,  '2023-05-29', 2.00, 0,  0.00,  TRUE),
(96, 96, 36, 58, '2023-06-03', 2.00, 4,  8.00,  FALSE),
(97, 97, 37, 96, '2023-05-31', 2.00, 0,  0.00,  TRUE),
(98, 98, 38, 66, '2023-06-05', 2.00, 4,  8.00,  TRUE),
(99, 99, 39, 100,'2023-06-02', 2.00, 0,  0.00,  TRUE),
(100,100,40, 52, '2023-06-07', 2.00, 4,  8.00,  TRUE),
(101,101,41, 10, '2023-06-15', 2.00, 0,  0.00,  TRUE),
(102,102,42, 22, '2023-06-20', 2.00, 4,  8.00,  FALSE),
(103,103,43, 84, '2023-06-17', 2.00, 0,  0.00,  TRUE),
(104,104,44, 9,  '2023-06-22', 2.00, 4,  8.00,  TRUE),
(105,105,45, 5,  '2023-06-19', 2.00, 0,  0.00,  TRUE),
(106,106,46, 36, '2023-06-24', 2.00, 4,  8.00,  TRUE),
(107,107,47, 47, '2023-06-21', 2.00, 0,  0.00,  TRUE),
(108,108,48, 17, '2023-06-26', 2.00, 4,  8.00,  FALSE),
(109,109,49, 68, '2023-06-23', 2.00, 0,  0.00,  TRUE),
(110,110,50, 12, '2023-06-28', 2.00, 4,  8.00,  TRUE),
(111,111,51, 74, '2023-06-25', 2.00, 0,  0.00,  TRUE),
(112,112,52, 37, '2023-06-30', 2.00, 4,  8.00,  TRUE),
(113,113,53, 4,  '2023-06-27', 2.00, 0,  0.00,  TRUE),
(114,114,54, 81, '2023-07-02', 2.00, 4,  8.00,  FALSE),
(115,115,55, 21, '2023-06-29', 2.00, 0,  0.00,  TRUE),
(116,116,56, 90, '2023-07-04', 2.00, 4,  8.00,  TRUE),
(117,117,57, 35, '2023-07-01', 2.00, 0,  0.00,  TRUE),
(118,118,58, 69, '2023-07-06', 2.00, 4,  8.00,  TRUE),
(119,119,59, 15, '2023-07-03', 2.00, 0,  0.00,  TRUE),
(120,120,60, 38, '2023-07-08', 2.00, 4,  8.00,  FALSE),
(121,121,61, 7,  '2023-07-15', 2.00, 0,  0.00,  TRUE),
(122,122,62, 99, '2023-07-20', 2.00, 4,  8.00,  TRUE),
(123,123,63, 45, '2023-07-17', 2.00, 0,  0.00,  TRUE),
(124,124,64, 88, '2023-07-22', 2.00, 4,  8.00,  TRUE),
(125,125,65, 29, '2023-07-19', 2.00, 0,  0.00,  TRUE),
(126,126,66, 72, '2023-07-24', 2.00, 4,  8.00,  FALSE),
(127,127,67, 13, '2023-07-21', 2.00, 0,  0.00,  TRUE),
(128,128,68, 56, '2023-07-26', 2.00, 4,  8.00,  TRUE),
(129,129,69, 33, '2023-07-23', 2.00, 0,  0.00,  TRUE),
(130,130,70, 77, '2023-07-28', 2.00, 4,  8.00,  TRUE),
(131,131,71, 19, '2023-07-25', 2.00, 0,  0.00,  TRUE),
(132,132,72, 62, '2023-07-30', 2.00, 4,  8.00,  FALSE),
(133,133,73, 41, '2023-07-27', 2.00, 0,  0.00,  TRUE),
(134,134,74, 85, '2023-08-01', 2.00, 4,  8.00,  TRUE),
(135,135,75, 26, '2023-07-29', 2.00, 0,  0.00,  TRUE),
(136,136,76, 70, '2023-08-03', 2.00, 4,  8.00,  TRUE),
(137,137,77, 8,  '2023-07-31', 2.00, 0,  0.00,  TRUE),
(138,138,78, 53, '2023-08-05', 2.00, 4,  8.00,  FALSE),
(139,139,79, 30, '2023-08-02', 2.00, 0,  0.00,  TRUE),
(140,140,80, 95, '2023-08-07', 2.00, 4,  8.00,  TRUE),
(141,141,81, 10, '2023-08-15', 2.00, 0,  0.00,  TRUE),
(142,142,82, 4,  '2023-08-20', 2.00, 4,  8.00,  TRUE),
(143,143,83, 84, '2023-08-17', 2.00, 0,  0.00,  TRUE),
(144,144,84, 22, '2023-08-22', 2.00, 4,  8.00,  FALSE),
(145,145,85, 36, '2023-08-19', 2.00, 0,  0.00,  TRUE),
(146,146,86, 68, '2023-08-24', 2.00, 4,  8.00,  TRUE),
(147,147,87, 17, '2023-08-21', 2.00, 0,  0.00,  TRUE),
(148,148,88, 47, '2023-08-26', 2.00, 4,  8.00,  TRUE),
(149,149,89, 9,  '2023-08-23', 2.00, 0,  0.00,  TRUE),
(150,150,90, 5,  '2023-08-28', 2.00, 4,  8.00,  FALSE);


-- ============================================================
-- 📊 20+ ADVANCED SQL QUERIES
-- ============================================================

-- ── Query 1: Top 10 Most Borrowed Books ──────────────────────
SELECT
    b.title,
    b.author,
    c.category_name,
    COUNT(i.issue_id) AS times_borrowed
FROM books b
JOIN issues i ON b.book_id = i.book_id
JOIN categories c ON b.category_id = c.category_id
GROUP BY b.book_id, b.title, b.author, c.category_name
ORDER BY times_borrowed DESC
LIMIT 10;

-- ── Query 2: Overdue Members with Fine Details ───────────────
SELECT
    m.name,
    m.email,
    m.phone,
    b.title AS book_title,
    i.issue_date,
    i.due_date,
    (julianday('now') - julianday(i.due_date)) AS days_overdue,
    ((julianday('now') - julianday(i.due_date)) * 2) AS fine_due
FROM issues i
JOIN members m ON i.member_id = m.member_id
JOIN books b ON i.book_id = b.book_id
WHERE i.status = 'Overdue'
ORDER BY days_overdue DESC;

-- ── Query 3: Category-wise Borrowing Report ──────────────────
SELECT
    c.category_name,
    COUNT(i.issue_id)    AS total_issues,
    COUNT(DISTINCT i.member_id) AS unique_members,
    ROUND(AVG(b.price), 2) AS avg_book_price
FROM categories c
JOIN books b ON c.category_id = b.category_id
JOIN issues i ON b.book_id = i.book_id
GROUP BY c.category_name
ORDER BY total_issues DESC;

-- ── Query 4: Members Who Borrowed More Than 3 Books ──────────
SELECT
    m.name,
    m.membership,
    m.city,
    COUNT(i.issue_id) AS total_books_borrowed
FROM members m
JOIN issues i ON m.member_id = i.member_id
GROUP BY m.member_id, m.name, m.membership, m.city
HAVING COUNT(i.issue_id) > 3
ORDER BY total_books_borrowed DESC;

-- ── Query 5: Monthly Issue Report ────────────────────────────
SELECT
    strftime('%Y-%m', issue_date) AS month,
    COUNT(*)                      AS total_issues,
    COUNT(CASE WHEN status = 'Returned' THEN 1 END) AS returned,
    COUNT(CASE WHEN status = 'Issued'   THEN 1 END) AS still_issued,
    COUNT(CASE WHEN status = 'Overdue'  THEN 1 END) AS overdue
FROM issues
GROUP BY month
ORDER BY month;

-- ── Query 6: Books Never Borrowed ────────────────────────────
SELECT b.book_id, b.title, b.author, c.category_name
FROM books b
JOIN categories c ON b.category_id = c.category_id
LEFT JOIN issues i ON b.book_id = i.book_id
WHERE i.issue_id IS NULL
ORDER BY b.title;

-- ── Query 7: Total Fine Collected vs Pending ─────────────────
SELECT
    SUM(CASE WHEN fine_paid = TRUE  THEN fine_amount END) AS fine_collected,
    SUM(CASE WHEN fine_paid = FALSE THEN fine_amount END) AS fine_pending,
    SUM(fine_amount) AS total_fine
FROM returns;

-- ── Query 8: Staff Performance (Issues Handled) ──────────────
SELECT
    s.name AS staff_name,
    s.role,
    COUNT(i.issue_id) AS issues_handled
FROM staff s
LEFT JOIN issues i ON s.staff_id = i.staff_id
GROUP BY s.staff_id, s.name, s.role
ORDER BY issues_handled DESC;

-- ── Query 9: Top 5 Members by Fine Paid ──────────────────────
SELECT
    m.name,
    m.membership,
    SUM(r.fine_amount) AS total_fine,
    COUNT(r.return_id) AS times_late
FROM members m
JOIN returns r ON m.member_id = r.member_id
WHERE r.days_late > 0
GROUP BY m.member_id, m.name, m.membership
ORDER BY total_fine DESC
LIMIT 5;

-- ── Query 10: Available vs Issued Books by Category ──────────
SELECT
    c.category_name,
    SUM(b.total_copies) AS total_copies,
    SUM(b.available)    AS available_copies,
    SUM(b.total_copies) - SUM(b.available) AS issued_copies
FROM books b
JOIN categories c ON b.category_id = c.category_id
GROUP BY c.category_name
ORDER BY issued_copies DESC;

-- ── Query 11: Membership Type Analysis ───────────────────────
SELECT
    membership,
    COUNT(*)  AS total_members,
    COUNT(CASE WHEN is_active = TRUE THEN 1 END) AS active
FROM members
GROUP BY membership
ORDER BY total_members DESC;

-- ── Query 12: Books with Most Late Returns ───────────────────
SELECT
    b.title,
    b.author,
    COUNT(r.return_id)  AS total_returns,
    SUM(r.days_late)    AS total_late_days,
    SUM(r.fine_amount)  AS total_fine_generated
FROM books b
JOIN returns r ON b.book_id = r.book_id
WHERE r.days_late > 0
GROUP BY b.book_id, b.title, b.author
ORDER BY total_fine_generated DESC
LIMIT 10;

-- ── Query 13: City-wise Member Distribution ──────────────────
SELECT
    city,
    COUNT(*) AS total_members,
    COUNT(CASE WHEN membership = 'Premium' THEN 1 END) AS premium,
    COUNT(CASE WHEN membership = 'Regular' THEN 1 END) AS regular,
    COUNT(CASE WHEN membership = 'Student' THEN 1 END) AS student
FROM members
GROUP BY city
ORDER BY total_members DESC
LIMIT 10;

-- ── Query 14: Books Issued on Same Day (Joins) ───────────────
SELECT
    i1.issue_date,
    b1.title AS book_1,
    b2.title AS book_2,
    m.name   AS member
FROM issues i1
JOIN issues i2 ON i1.member_id = i2.member_id
               AND i1.issue_date = i2.issue_date
               AND i1.issue_id < i2.issue_id
JOIN books b1 ON i1.book_id = b1.book_id
JOIN books b2 ON i2.book_id = b2.book_id
JOIN members m ON i1.member_id = m.member_id
LIMIT 10;

-- ── Query 15: Author Popularity Ranking ──────────────────────
SELECT
    b.author,
    COUNT(i.issue_id)     AS times_borrowed,
    COUNT(DISTINCT b.book_id) AS books_in_library
FROM books b
LEFT JOIN issues i ON b.book_id = i.book_id
GROUP BY b.author
ORDER BY times_borrowed DESC
LIMIT 10;

-- ── Query 16: Fine Unpaid Members ────────────────────────────
SELECT
    m.name,
    m.email,
    m.phone,
    SUM(r.fine_amount) AS total_unpaid_fine
FROM members m
JOIN returns r ON m.member_id = r.member_id
WHERE r.fine_paid = FALSE AND r.fine_amount > 0
GROUP BY m.member_id, m.name, m.email, m.phone
ORDER BY total_unpaid_fine DESC;

-- ── Query 17: Average Return Time per Category ───────────────
SELECT
    c.category_name,
    ROUND(AVG(julianday(r.return_date) - julianday(i.issue_date)), 1) AS avg_days_to_return
FROM returns r
JOIN issues i  ON r.issue_id  = i.issue_id
JOIN books b   ON r.book_id   = b.book_id
JOIN categories c ON b.category_id = c.category_id
GROUP BY c.category_name
ORDER BY avg_days_to_return DESC;

-- ── Query 18: Most Active Members (Current Year) ─────────────
SELECT
    m.name,
    m.membership,
    COUNT(i.issue_id) AS books_in_2023
FROM members m
JOIN issues i ON m.member_id = i.member_id
WHERE strftime('%Y', i.issue_date) = '2023'
GROUP BY m.member_id, m.name, m.membership
ORDER BY books_in_2023 DESC
LIMIT 10;

-- ── Query 19: Expensive Books Never Returned on Time ─────────
SELECT
    b.title,
    b.author,
    b.price,
    COUNT(r.return_id) AS late_returns
FROM books b
JOIN returns r ON b.book_id = r.book_id
WHERE r.days_late > 0
GROUP BY b.book_id, b.title, b.author, b.price
HAVING COUNT(r.return_id) >= 2
ORDER BY b.price DESC;

-- ── Query 20: Complete Member History (Subquery) ─────────────
SELECT
    m.name,
    m.membership,
    (SELECT COUNT(*) FROM issues i WHERE i.member_id = m.member_id)  AS total_borrowed,
    (SELECT COUNT(*) FROM returns r WHERE r.member_id = m.member_id
                          AND r.days_late > 0)                        AS times_late,
    (SELECT COALESCE(SUM(r.fine_amount), 0) FROM returns r
      WHERE r.member_id = m.member_id)                                AS total_fine_paid
FROM members m
WHERE m.is_active = TRUE
ORDER BY total_borrowed DESC
LIMIT 20;

-- Query 21: Books Published After 2010
SELECT title, author, publish_year
FROM books
WHERE publish_year > 2010
ORDER BY publish_year DESC;

-- Query 22: Members Who Never Borrowed
SELECT m.name, m.email, m.join_date
FROM members m
LEFT JOIN issues i ON m.member_id = i.member_id
WHERE i.issue_id IS NULL;
