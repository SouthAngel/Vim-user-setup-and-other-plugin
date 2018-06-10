import os
import re
import PyQt5
from PyQt5 import QtWidgets, QtCore, QtGui

def findName(tofile):
    find_target = ('QtWidgets', 'QtGui', 'QtCore')
    all_to_write = []

    for eachm in find_target:
        all_in_modules = eval('dir(%s)'%eachm)
        print(all_in_modules)
        all_to_write.extend(all_in_modules)
        for eachc in iter(all_in_modules):
            all_in_class = ['%s.%s('%(eachc, x) for x in eval('dir(%s.%s)'%(eachm, eachc))]
            all_to_write.extend(all_in_class)

    print('\n'.join(all_to_write))
    opf = open(tofile, 'w')
    opf.write('\n'.join(all_to_write))
    opf.close()

findName('pyqt-complete-dict')
