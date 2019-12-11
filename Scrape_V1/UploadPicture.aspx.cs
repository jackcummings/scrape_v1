using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UploadPicture : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] != null) {
            bindGalleryDDL();
            // Add the initial item - you can add this even if the options from the
            // db were not successfully loaded
            //this.galleryDDL.Items.Insert(0, new ListItem("Select State", "0"));
        }
        else
        {
            this.galleryDDL.Items.Insert(0, new ListItem("Error!", "0"));
            this.galleryDDL.Items.Insert(1, new ListItem("Error!", "-1"));
        }
    }

    protected void createGalleryBtn_Click(object sender, EventArgs e)
    {
        Pictures pictures = new Pictures();
        //((TextBox)Login1.FindControl("UserName")).Text;?
        string galleryName = galleryNameText.Text;
        string galleryDescription = this.gallery_description_text.Text;
        // string galleryTags = this.gallery_tags.Value;
        int isPublic = Int32.Parse(this.isPublicGalleryBool.Value.ToString());

        pictures.createGallery(Session["UserID"].ToString(), galleryName, isPublic, galleryDescription);

        bindGalleryDDL();

        int lastGal = 0;
        for (int i = 0; i < this.galleryDDL.Items.Count; i++)
        {
            int curVal;
            string curStrVal = galleryDDL.Items[i].Value;
            bool canConvert = Int32.TryParse(curStrVal, out curVal);
            if(canConvert && curVal > lastGal)
            {
                lastGal = curVal;
            }
        }

        this.galleryDDL.SelectedValue = lastGal.ToString();
        //Response.Redirect("~/UploadPicture.aspx");
    }
    private void bindGalleryDDL()
    {
        DBManager db = new DBManager();
        SqlParameter[] myParameters = new SqlParameter[1];
        DataTable dat;

        myParameters[0] = new SqlParameter("user_id", Int32.Parse(Session["UserID"].ToString()));

        dat = db.createDataSet("spGalleryGetByUserID", myParameters).Tables[0];

        this.galleryDDL.DataSource = dat;
        this.galleryDDL.DataTextField = "gallery_name";
        this.galleryDDL.DataValueField = "gallery_id";
        this.galleryDDL.DataBind();
        this.galleryDDL.Items.Insert(galleryDDL.Items.Count, new ListItem("Create new gallery", "-1"));

    }
}

