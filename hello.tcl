if { $argc == 3 } {
    set old_str [lindex $argv 0]
    set old_str [lindex $argv 1]
    set new_str [lindex $argv 2]
} else {
    puts "Usage:\n\tFilename old_string new_string"
    set srcfilename "D:\\test_source\\Multi-Language-Programming\\FileSwapStr\\testfile"
    set old_str "%L57_C9_ROOT%"
    set new_str "%L57_C9_ROOT_R99%"
}
set bakfilename "$srcfilename~"

set srcfile [open $srcfilename r]
set bakfile [open $bakfilename w]

set num 0
while { [gets $srcfile line] >= 0 } {
    #将原字符串替换为新字符串并写入到文件
    puts $bakfile [regsub $old_str $line $new_str]
    incr num
}
puts "Number of lines: $num "
close $srcfile
close $bakfile

file delete $srcfilename
file rename $bakfilename $srcfilename
