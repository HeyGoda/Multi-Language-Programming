#!/usr/bin/ruby

def FileSwapStr(filename, old_str, new_str)    
    if !File::exist?(filename)        
        return nil    
    end    
    new_filename = filename+"~"
    tempfile = File::new(new_filename, "w+")    
    if tempfile == nil        
        return false    
    end        
    IO.foreach(filename) { |line|        
        #puts line        
        newline = line.gsub(old_str, new_str)        
        #puts newline        
        tempfile.puts(newline)    
    }    
    tempfile.close        
    File::delete(filename)
    File::rename(new_filename, filename)
    return true
end

if ARGV.length == 3    
    ret = FileSwapStr(ARGV[0], ARGV[1], ARGV[2])
else    
    puts "Usage: \n\tFilename old_string new_string"
    ret = FileSwapStr("D:\\test_source\\Multi-Language-Programming\\FileSwapStr\\testfile", "L57_C9_ROOT%", "L57_C9_ROOT_R99%")
end

if ret == nil    
    puts "file does not exist"
elsif ret == false    
    puts "file string swap failed"
else    
    puts "file string swap successfully"
end
