import sys
import os

b = open("blacklist.txt","r")
bList = b.readlines()
u = open("userlist.txt","r")
uList = u.readlines()
time = 0
while time < 3:
  userN = raw_input("Enter your name: ").strip()
  if len(userN) == 0:
    print "Username can't be empty!"
    continue
  user = userN + "\n"
  passwdN = raw_input("Enter your password: ").strip()
  if len(passwdN) == 0:
    print "Password can't be empty!"
    continue
  passwd = passwdN + "\n"
  if user in bList:
    sys.exit("Your name is in the blacklist!")
  else:
    if "%s:%s" % (userN,passwd) in uList:
      b.close()
      u.close()
      sys.exit("Welcome to login!")
    else:
      time += 1
      print "Username or passwd is wrong!"
      continue
else:
  os.system("echo %s>> blacklist.txt" % userN)
  b.close()
  u.close()
  sys.exit("Your name has been add to the blacklist now!")
