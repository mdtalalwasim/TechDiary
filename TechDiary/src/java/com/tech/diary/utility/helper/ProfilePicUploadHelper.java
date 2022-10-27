package com.tech.diary.utility.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author Md. Talal Wasim
 */
public class ProfilePicUploadHelper {

    //old/ default profile photo delete method.
    public static boolean deleteFile(String path) {//take path. which file is going to delete.

        boolean f = false;

        try {

            File file = new File(path);
            f = file.delete(); //if file delete f becomes true automatically.

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public static boolean saveFile(InputStream is, String path) {
        boolean f = false;

        try {

            //read data from "is"
            byte[] b = new byte[is.available()]; //for storing photo
            is.read(b);

            
            //after read data... it will write in that specific "path"
            //for - write data...
            FileOutputStream fos = new FileOutputStream(path);
            fos.write(b);

            //flush and close the FileOutputStream object.
            fos.flush();
            fos.close();

            //after that set f value is true;
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

}
