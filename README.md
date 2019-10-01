# A Stock Finance Web Application that Uses IEX Cloud API service

Clone:- https://github.com/joeworld/Stock-Finance-App.git

## ```python manage.py show_urls``` to check available urls or patterns for both user interfaces and api endpoints

## Built with Python and Django :sparkling_heart:

With this simple django app, you will be able to perform the following task:-

1. Register and Authenticate users.
2. Users can look up a stock's current quote on IEX
3. Users can look up a stock's current price(realtime)
4. Users can purchase a stock(With money in their wallets)
5. Get and Update User's wallet
6. See the lists of purchased stocks
7. Users can sell/share stocks
8. Users can see their transactions made on the app

> This application embibes both a user interface and a client api for commercial usage

## Database

This application was built with PostgreSQL as DB but you can use other RDB by running migrations.

But if you choose to use the test database for this project check '''sampledb/trade.sql'''

PostgreSQL, also known as Postgres, is a free and open-source relational database management system emphasizing extensibility and technical standards compliance.

## Common Technologies/Libraries used in Building this web app

1. Django==2.2.5 :- Powerful Python Web Framework
2. django-extensions==2.2.1 :- Embibes Django extensions
3. iexfinance==0.4.3 :- Open source IEX libary for python applications
4. kiwisolver==1.1.0 :- A fast implementation of the Cassowary constraint solver
5. matplotlib==3.1.1 :- Python 2D plotting library
6. numpy==1.17.2 :- An efficient multi-dimensional container of generic data
7. pandas==0.25.1 :- BSD-licensed library providing high-performance, easy-to-use data structures
8. psycopg2==2.8.3 :- Psycopg is the most popular PostgreSQL database adapter for Python
9. pyparsing==2.4.2 :- Python parsing module
10. python-dateutil==2.8.0 :- Python Date Utilities
11. pytz==2019.2 :- allows accurate and cross platform timezone calculations using Python
12. requests==2.22.0 :- The requests library is the de facto standard for making HTTP requests in Python
13. six==1.12.0 :- It provides utility functions for smoothing over the differences between the Python versions with the goal of writing
14. sqlparse==0.3.0 :- SQL Parser
15. urllib3==1.25.6 :- urllib3 is a powerful, sanity-friendly HTTP client for Python.
16. zope.interface==4.6.0 :- This package provides an implementation of "object interfaces" for Python

> This application is mainly built with python 3.7.4

> Admin Url:- /admin
> Create login details with:- '''python manage.py createsuperuser'''

## Design Patterns

1. Repository Design Patterns
2. MVC