#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
import subprocess


def get_message():
    """TODO: Docstring for getMessage.
    :returns: TODO

    """
    mes = (
        "pymode/autopep8.py",
        "pymode/libs/astroid",
        "pymode/libs/logilab",
        "pymode/libs/mccabe.py",
        "pymode/libs/pycodestyle.py",
        "pymode/libs/pydocstyle",
        "pymode/libs/pyflakes",
        "pymode/libs/pylama",
        "pymode/libs/pylint",
        "pymode/libs/rope",
        "pymode/libs/six.py",
        "pymode/libs/snowballstemmer",
    )
    return mes


def expand_file_path(c_path, d_path):
    """TODO: Docstring for expand_file_path.

    :c_path: TODO
    :d_path: TODO
    :returns: TODO

    """
    _d_path_split = d_path.split("/")
    _c_path_temp = c_path
    _d_index = 0
    for i, v in enumerate(_d_path_split):
        print(v)
        if v == "..":
            _c_path_temp = os.path.dirname(_c_path_temp)
            _d_index = i+1
        else:
            break
    return os.path.normpath(os.path.join(
        _c_path_temp, "/".join(_d_path_split[_d_index:])))


def link_file(command):
    """TODO: Docstring for link_file.

    :a_path: TODO
    :b_path: TODO
    :returns: TODO

    """
    p = subprocess.Popen(command, shell=True)
    p.wait()


def deal_path(mode_path):
    """TODO: Docstring for deal_path.

    :mode_path: TODO
    :returns: TODO

    """
    for each in iter(get_message()):
        link_file_o = os.path.normpath(os.path.join(mode_path, each))
        if not os.path.isfile(link_file_o):
            print("File is not exist<%s>" % each)
            continue
        with open(link_file_o, "rb") as opf:
            lines = opf.readlines()
        if len(lines) == 1:
            link_file_n = link_file_o
            source_file_path = expand_file_path(
                os.path.dirname(link_file_o), lines[0])
            command = "mklink "
            if os.path.isfile(source_file_path):
                command += "/H"
            elif os.path.isdir(source_file_path):
                command += "/J"
            else:
                print("Source error <%s>" % each)
                continue
            command += " %s %s" % (link_file_n, source_file_path)
            print command
            os.remove(link_file_o)
            p = subprocess.Popen(command, shell=True)
            p.wait()
            print("Deal complete <%s>" % each)
        else:
            print("File context error!<%s>" % each)


def main():
    mod_path = os.environ["USERPROFILE"] + "/.vim/bundle/python-mode"
    print(mod_path)
    print("main")
    deal_path(mod_path)


if __name__ == "__main__":
    main()
