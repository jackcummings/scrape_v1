using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.DeepZoomTools;

public partial class DeepZoom : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] != null)
        {
            DBManager db = new DBManager();
            SqlParameter[] myParameters = new SqlParameter[1];
            DataTable dat;
            DataTable galleriesDat;

            if (Request.QueryString["dziID"] != null)
            {
                myParameters[0] = new SqlParameter("dzi_id", Int32.Parse(Request.QueryString["dziID"]));

                dat = db.createDataSet("spDziGetById", myParameters).Tables[0];

                ScriptManager.RegisterStartupScript(this, typeof(Page), "UpdateMsg", @"
                            var viewer = OpenSeadragon({
                                id: ""seadragon-viewer"",
                                prefixUrl: ""//openseadragon.github.io/openseadragon/images/"",
                                tileSources: """ + dat.Rows[0]["dzi_path"] + @"""
                            });", true);

            }

            myParameters[0] = new SqlParameter("user_id", Int32.Parse(Session["UserID"].ToString()));
            galleriesDat = db.createDataSet("spDziGetByUserID", myParameters).Tables[0];

            this.dziDDL.DataSource = galleriesDat;
            this.dziDDL.DataTextField = "dzi_name";
            this.dziDDL.DataValueField = "dzi_id";
            this.dziDDL.DataBind();
            this.dziDDL.Items.Insert(0, new ListItem("Select DeepZoom", "-1"));
        }
    }
}