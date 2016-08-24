# Import Class Files

import sys
import commands
import time
#import datetime
import codecs
# import IOBase

# Imports the monkeyrunner modules used by this program
from com.android.monkeyrunner import MonkeyRunner, MonkeyDevice

device = MonkeyRunner.waitForConnection(5,'84B7N16128001304')
#device.drag((233,597), (417,605),0.5,50)
device.touch(650,2075,"DOWN_AND_UP")
#test
