<%@ WebHandler Language="C#" Class="hn_DeepZoomFileUpload" %>

using System;
using System.Web;
using System.IO;
using System.Collections.Generic;
using Microsoft.DeepZoomTools;

public class hn_DeepZoomFileUpload : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{

    public void ProcessRequest(HttpContext context)
    {
        Pictures pictures = new Pictures();

        if (context.Session["UserRole"] != null && (context.Session["UserRole"].Equals("USER") || context.Session["UserRole"].Equals("ADMIN")))
        {
            context.Response.ContentType = "text/plain";

            //Pictures pictures = new Pictures();
            string currentUserID = context.Session["UserID"].ToString();
            string dirFullPath = HttpContext.Current.Server.MapPath("~/uploads/" + currentUserID + "/dzi/");
            if (!Directory.Exists(dirFullPath))
            {
                Directory.CreateDirectory(dirFullPath);
            }

            HttpPostedFile file = context.Request.Files[0];
            if (IsImage(file))
            {
                List<String> data = new List<string>();
                string fname = dirFullPath + file.FileName;
                file.SaveAs(fname);
                context.Response.ContentType = "text/plain";
                context.Response.Write("File Uploaded Successfully!");
                ImageCreator ic = new ImageCreator();

                ic.TileSize = 256;
                ic.TileFormat = ImageFormat.AutoSelect;
                ic.ImageQuality = 0.95;
                ic.TileOverlap = 0;

                string target = dirFullPath + Path.GetFileNameWithoutExtension(fname);

                ic.Create(fname, target);
                data.Add(Path.ChangeExtension(target, ".xml"));

                CollectionCreator cc = new CollectionCreator();

                cc.TileSize = 256;
                cc.TileFormat = ImageFormat.Jpg;
                cc.MaxLevel = 8;
                cc.ImageQuality = 0.95;

                cc.Create(data, dirFullPath);

                pictures.insertUserDZI(currentUserID, "/uploads/" + currentUserID + "/dzi/" + file.FileName.Split('.')[0] + ".xml", 0, 0, file.FileName);

            }
        }
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