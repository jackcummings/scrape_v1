using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class UserGallery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] != null)
        {
            DBManager db = new DBManager();
            SqlParameter[] myParameters = new SqlParameter[1];
            DataTable dat;
            DataTable galleriesDat;

            if (Request.QueryString["galleryID"] != null)
            {

                myParameters[0] = new SqlParameter("gallery_id", Int32.Parse(Request.QueryString["galleryID"]));

                dat = db.createDataSet("spGalleryGetPicturesByID", myParameters).Tables[0];

                int c = 0;
                foreach (DataRow data in dat.Rows)
                {
                    UserControl template = (UserControl)LoadControl("~/gallery_picture_template.ascx");
                    //PlaceHolder1.Controls.Add(c);
                    if (template != null)
                    {
                        HtmlControl link = (HtmlControl)template.FindControl("pic_template").FindControl("pic_link");

                        link.Attributes["href"] = data["picture_path"].ToString();
                        link.Attributes["data-width"] = data["picture_width"].ToString();
                        link.Attributes["data-height"] = data["picture_height"].ToString();

                        HtmlControl thumb = (HtmlControl)template.FindControl("pic_template").FindControl("pic_link").FindControl("thumb");
                        string[] tmp = data["picture_path"].ToString().Split('.');
                        tmp[tmp.Length - 1] = "_thumb." + tmp[tmp.Length - 1];

                        thumb.Attributes["src"] = string.Join("", tmp);

                        this.gallery.Controls.Add(template);

                        ScriptManager.RegisterStartupScript(this, typeof(Page), "UpdateMsg" + c.ToString(), @"
                    item = {
                        src: """ + data["picture_path"].ToString().Remove(0, 1) + @""",
                        w: " + data["picture_width"].ToString() + @",
                        h: " + data["picture_height"].ToString() + @",
                        title: """ + data["picture_name"] + @"""
                    };
                document.picContainer.push(item);
                console.log(document.picContainer);
                bindClick();

                    ", true);
                        c++;
                    }
                }
            }

            myParameters[0] = new SqlParameter("user_id", Int32.Parse(Session["UserID"].ToString()));
            galleriesDat = db.createDataSet("spGalleryGetByUserID", myParameters).Tables[0];

            this.galleryDDL.DataSource = galleriesDat;
            this.galleryDDL.DataTextField = "gallery_name";
            this.galleryDDL.DataValueField = "gallery_id";
            this.galleryDDL.DataBind();
            this.galleryDDL.Items.Insert(0, new ListItem("Select gallery", "-1"));

        }
    }
}