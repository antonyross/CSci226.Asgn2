#!/usr/bin/python
# Simply Python <--> MySQL Examples

#import MySQLdb

def test1():
   conn = MySQLdb.connect (host = "localhost",
                           user = "cs126",
                           passwd = "cs126",
                           db = "music")
   cursor = conn.cursor ()
   cursor.execute ("SELECT VERSION()")
   row = cursor.fetchone ()
   print "server version:", row[0]
   cursor.close ()
   conn.close ()

def test2():
   conn = MySQLdb.connect (host = "localhost",
                           user = "cs126",
                           passwd = "cs126",
                           db = "music")
   cursor = conn.cursor ()
   cursor.execute ("SELECT COUNT(*) FROM SONGS")
   row = cursor.fetchone ()
   print "Table Rows:", row[0]
   cursor.close ()
   conn.close ()

def test3():
   conn = MySQLdb.connect (host = "localhost",
                           user = "cs126",
                           passwd = "cs126",
                           db = "music")
   cursor = conn.cursor ()
   cursor.execute ("select artist, count(*) as countit from " +
      "(select * from songs where High = 1) song " +
      "group by artist having count(*) > 15 ")
                   
   row = cursor.fetchone ()
   while row != None:
      print "Table Rows:",
      for i in row:
         print i,
      print " "
      row = cursor.fetchone ()
   cursor.close ()
   conn.close ()
