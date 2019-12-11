<%@ WebHandler Language="C#" Class="hn_FileUpload" %>

using System;
using System.Web;
using System.IO;

public class hn_FileUpload : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{

    public void ProcessRequest(HttpContext context)
    {
        if (context.Session["UserRole"] != null && (context.Session["UserRole"].Equals("USER") || context.Session["UserRole"].Equals("ADMIN")))
        {
            context.Response.ContentType = "text/plain";

            Pictures pictures = new Pictures();
            string currentUserID = context.Session["UserID"].ToString();
            string dirFullPath = HttpContext.Current.Server.MapPath("~/uploads/" + currentUserID + "/");
            if (!Directory.Exists(dirFullPath))
            {
                Directory.CreateDirectory(dirFullPath);
            }
            string[] files;
            int numFiles;
            files = System.IO.Directory.GetFiles(dirFullPath);
            numFiles = files.Length;

            string str_image = "";

            foreach (string s in context.Request.Files)
            {
                HttpPostedFile file = context.Request.Files[s];
                //  int fileSizeInBytes = file.ContentLength;
                string fileName = file.FileName;
                string fileExtension = file.ContentType;
                if (!string.IsNullOrEmpty(fileName) && IsImage(file))
                {
                    fileExtension = Path.GetExtension(fileName);
                    str_image = currentUserID + numFiles.ToString() + fileExtension;
                    string str_image_thumb = currentUserID + numFiles.ToString() + "_thumb" + fileExtension;
                    string pathToSave = dirFullPath + str_image;
                    file.SaveAs(pathToSave);

                    // thumbnail
                    System.Drawing.Bitmap bmpPostedImage = new System.Drawing.Bitmap(file.InputStream);
                    System.Drawing.Image objImage = ScaleImage(bmpPostedImage, 256);
                    objImage.Save(dirFullPath + str_image_thumb, System.Drawing.Imaging.ImageFormat.Jpeg);

                    int picWidth = bmpPostedImage.Width;
                    int picHeight = bmpPostedImage.Height;

                    string picName = context.Request.Form["name"];
                    string picDescription = context.Request.Form["description"];
                    string gallery_id = context.Request.Form["gallery_id"].Split(',')[0];

                    pictures.insertUserPicture(currentUserID, gallery_id, "~/uploads/" + currentUserID + "/" + str_image, picWidth, picHeight, picName, picDescription);
                    numFiles++;
                }
            }
            context.Response.Write(str_image);
        }
    }

    public static System.Drawing.Image ScaleImage(System.Drawing.Image image, int maxHeight)
    {
        var ratio = (double)maxHeight / image.Height;

        var newWidth = (int)(image.Width * ratio);
        var newHeight = (int)(image.Height * ratio);

        var newImage = new System.Drawing.Bitmap(newWidth, newHeight);
        using (var g = System.Drawing.Graphics.FromImage(newImage))
        {
            g.DrawImage(image, 0, 0, newWidth, newHeight);
        }
        return newImage;
    }

    public bool IsImage(HttpPostedFile postedFile)
    {
        //-------------------------------------------
        //  Check the image mime types
        //-------------------------------------------
        if (!string.Equals(postedFile.ContentType, "image/jpg", StringComparison.OrdinalIgnoreCase) &&
            !string.Equals(postedFile.ContentType, "image/jpeg", StringComparison.OrdinalIgnoreCase) &&
            !string.Equals(postedFile.ContentType, "image/pjpeg", StringComparison.OrdinalIgnoreCase) &&
            !string.Equals(postedFile.ContentType, "image/gif", StringComparison.OrdinalIgnoreCase) &&
            !string.Equals(postedFile.ContentType, "image/x-png", StringComparison.OrdinalIgnoreCase) &&
            !string.Equals(postedFile.ContentType, "image/png", StringComparison.OrdinalIgnoreCase))
        {
            return false;
        }

        //-------------------------------------------
        //  Check the image extension
        //-------------------------------------------
        var postedFileExtension = Path.GetExtension(postedFile.FileName);
        if (!string.Equals(postedFileExtension, ".jpg", StringComparison.OrdinalIgnoreCase)
            && !string.Equals(postedFileExtension, ".png", StringComparison.OrdinalIgnoreCase)
            && !string.Equals(postedFileExtension, ".gif", StringComparison.OrdinalIgnoreCase)
            && !string.Equals(postedFileExtension, ".jpeg", StringComparison.OrdinalIgnoreCase))
        {
            return false;
        }

        return true;
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}