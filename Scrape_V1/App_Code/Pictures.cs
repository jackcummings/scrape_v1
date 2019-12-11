using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Pictures
/// </summary>
public class Pictures
{
    public Pictures()
    {
    }

    

    public int insertUserPicture(string userID, string galleryID, string path, int width, int height, string name="", string description = "")
    {

        DBManager myDBManager = new DBManager();
        string myQuery = "spPictureInsert";

        SqlParameter[] myParameters = new SqlParameter[7];
        myParameters[0] = new SqlParameter("user_id", Int32.Parse(userID));
        myParameters[1] = new SqlParameter("gallery_id", Int32.Parse(galleryID));
        myParameters[2] = new SqlParameter("picture_name", name);
        myParameters[3] = new SqlParameter("picture_path", path);
        myParameters[4] = new SqlParameter("picture_description", description);
        myParameters[5] = new SqlParameter("picture_width", width);
        myParameters[6] = new SqlParameter("picture_height", height);


        int rows = myDBManager.executeNonQuery(myQuery, myParameters);
        return rows;

    }

    public int insertUserDZI(string userID, string path, int width, int height, string name = "")
    {

        DBManager myDBManager = new DBManager();
        string myQuery = "spDziInsert";

        SqlParameter[] myParameters = new SqlParameter[5];
        myParameters[0] = new SqlParameter("user_id", Int32.Parse(userID));
        myParameters[1] = new SqlParameter("dzi_name", name);
        myParameters[2] = new SqlParameter("dzi_path", path);
        myParameters[3] = new SqlParameter("dzi_width", width);
        myParameters[4] = new SqlParameter("dzi_height", height);


        int rows = myDBManager.executeNonQuery(myQuery, myParameters);
        return rows;

    }

    public int createGallery(string userID, string galleryName, int isPublic, string galleryDescription="", string galleryTags="")
    {
        DBManager myDBManager = new DBManager();
        string myQuery = "spGalleryCreate";
        
                SqlParameter[] myParameters = new SqlParameter[4];
                myParameters[0] = new SqlParameter("gallery_name", galleryName);
                myParameters[1] = new SqlParameter("is_public", isPublic);
                myParameters[2] = new SqlParameter("gallery_description", galleryDescription);
                myParameters[3] = new SqlParameter("user_id", Int32.Parse(userID));


                int rows = myDBManager.executeNonQuery(myQuery, myParameters);
                return rows;
    }
}