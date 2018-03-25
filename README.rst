==================================
 Mito Migrations for SQLite3 test
==================================

How to reproduce an "DB Error: database table is locked (Code: LOCKED)" issue:

0. Install Roswell, Qlot and mito::

     ros install fukamachi/mito

1. Generate initial migration::

     qlot exec \
           mito generate-migrations \
                --type sqlite3 \
                --database db.sqlite \
                --system app

2. Apply initial migration::

     qlot exec \
          mito migrate \
               --type sqlite3 \
               --database db.sqlite

3. Run a command from the first step, and you'll see the following
   error::

     DB Error: database table is locked (Code: LOCKED)

4. Try to uncomment second fields in the class user from
   ``models.lisp``, and run command from the first step again. And
   you'll the same error::

     DB Error: database table is locked (Code: LOCKED)

   But expected result is a new migration in the ``db/migrations``
   subdirectory.


The same issue can be reproduced from the REPL, by running::

  (ql:quickload :app)
  (mito:connect-toplevel
     :sqlite3
     :database-name "db.sqlite")
  (mito:generate-migrations "migrations")
  (mito:migrate "migrations")
  (mito:generate-migrations "migrations")


Reproduced with conditions
==========================

* Lisp:
  
  * Clozure Common Lisp Version 1.11-r16635  (DarwinX8664, OSX)
  * Clozure Common Lisp Version 1.11.5  (Ubuntu Trusty, 16.04)
  * SBCL 1.4.3 (OSX)
    
* Quicklisp:
  
  * 2018-02-28
    
* Mito: from Github commit 51034f5f7c5d34c7379569dba2ad79236cbac05b
