
function SwapFileStr(srcfilename, old_str, new_str)
    bakfile = io.tmpfile()

    for line in io.lines(srcfilename) do 
        --print(line)
        myline = string.gsub(line, old_str, new_str)
        bakfile:write(myline)
        bakfile:write("\n")
        --print(myline)
        --print("\n")
    end

    srcfile = io.open(srcfilename, "w+")
    srcfile:flush()

    bakfile:seek("set")
    for new_line in bakfile:lines() do
        --print(new_line)
        srcfile:write(new_line)
        srcfile:write("\n")
    end
    srcfile:close()
end

if (arg[3] ~= nil) then 
    SwapFileStr(arg[1], arg[2], arg[3])
else
    print("Usage: \n\tFilename old_string new_string")
    SwapFileStr("D:\\test_source\\Multi-Language-Programming\\FileSwapStr\\testfile", "%%L57_C9_ROOT%%", "%%L57_C9_ROOT_R99%%")
end
