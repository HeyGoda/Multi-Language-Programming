import sys
import os

def swap_file_str(filename, old_str, new_str):
    fo_r = open(filename, "r")
    new_filename = filename + '~'
    fo_w = open(new_filename, "w+")
    
    for line_r in fo_r.readlines():
        line_w = line_r.replace(old_str, new_str)
        fo_w.write(line_w)

    fo_r.close()
    fo_w.close()
    os.remove(filename)
    os.rename(new_filename, filename)

filename = "D:\\test_source\\Multi-Language-Programming\\FileSwapStr\\testfile"
old_str = "%L57_C9_ROOT%"
new_str = "%L57_C9_ROOT_R99%"

if (len(sys.argv) == 4):
    filename = sys.argv[1]
    old_str = sys.argv[2]
    new_str = sys.argv[3]
else:
    print '''Usage:
    %s filename old_string new_string 
''' %(sys.argv[0])

swap_file_str(filename, old_str, new_str)
