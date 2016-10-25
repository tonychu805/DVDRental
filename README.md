## Cohort Analysis of DVD rental consumer behaviours

   This analysis is to explore the activities of different cohort based on customer's joining date on the DVD rental services.
Various tables were used and analyzed; Ultimately, a cohort table was formed that includes each cohort's first rental month, month after joining, cohort size, and revenue per month. A pivot table was also created from the cohort table that summarizes each cohort's customer life time value, and each month's total revenue.

#Set up:

1. Install Homebrew through Terminal:
  Open command Prompt/Terminal and type in:
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  (Visit: http://brew.sh/)
 
2. Install MySQL using Homebrew:
  In command prompt/Terminal, type in: brew install mysql
  
3. Set password:

  a.  In command prompt/Terminal, type in: mysql.server start
  
  b.  In command prompt/Terminal, type in: mysql.server stop
  
  c.  In command prompt/Terminal, type in: mysqld_safe --skip-grant-tables
  
  d.  Open New command prompt/terminal window, and type in: mysql -u root
  
  e.  In the newly opened command prompt/terminal window, type in: UPDATE mysql.user SET authentication_string=PASSWORD('password') WHERE User='root';
      !!! Replace 'password' with your desired password !!!
      
  f.  Type in: FLUSH PRIVILEGES; Then Close this window and open a new one
  
  g.  Type in: mysql -u root -p
  
  h.  It will ask you to enter the password, type in the password you just created
  
  i.  Type in: ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';
      !!! Replace 'password' with the password you set earlier !!!
      
  j.  Close all command prompt/terminal windows

4. Download Sequel Pro -> http://www.sequelpro.com/download

5. Open the application and set login info:
  a. Choose Socket
  
  b. Name: SQLforNEWBS
  
  c. USERNAME: root
  
  d. PASSWORD: Enter the one you set earlier
  
  e. Click Connect

6. Drag 'sakila-schema.sql' and 'sakila-data.sql' into the Query tab subsequently in Sequel Pro; Select All, and click Run


