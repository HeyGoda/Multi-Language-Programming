import java.io.*;
import java.io.File;

class Hello{
    public boolean swapFileStr(String srcFilename, String oldStr, String newStr) {
        try {
            // 
            String bakFilename = srcFilename.concat("~");
            BufferedReader br = new BufferedReader(new FileReader(srcFilename));
            BufferedWriter bw = new BufferedWriter(new FileWriter(bakFilename, false));
            // 替换字符串并写入新文件
            String old_line = null;
            while ((old_line = br.readLine()) != null) {
                String new_line = old_line.replace(oldStr, newStr);
                bw.write(new_line, 0, new_line.length());
                bw.newLine();
                // System.out.println(new_line);
            }
            br.close();
            bw.close();
            // 删除旧文件并重命名新文件
            File fr = new File(srcFilename);
            File fw = new File(bakFilename);
            fr.delete();
            fw.renameTo(fr);
            return true;
        }catch(Exception e)
        {
            System.out.println("Exception thrown :" + e);
            return false;
        }
    }
    
    public static void main(String []args) {
        boolean ret;
        Hello hl = new Hello();
        
        if (args.length == 3) {
            ret = hl.swapFileStr(args[0], args[1], args[2]);
        }
        else {
            System.out.println("Usage: \n\tFilename old_string new_string");
            ret = hl.swapFileStr("D:\\test_source\\Multi-Language-Programming\\FileSwapStr\\testfile", "%L57_C9_ROOT%", "%L57_C9_ROOT_R99%");
        }
        
        if (ret == true) {
            System.out.println("Success!");
        }
        else {
            System.out.println("Failed!");
        }
    }    
}
