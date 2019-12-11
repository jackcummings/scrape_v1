using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TopMenu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["UserRole"] != null && (Session["UserRole"].Equals("USER") || Session["UserRole"].Equals("ADMIN")))
        {
            this.accountItem.Visible = true;
            this.userGalleries.Visible = true;
            this.loginItem.Visible = false;
        }
        else
        {
            this.accountItem.Visible = false;
            this.userGalleries.Visible = false;
            this.loginItem.Visible = true;
        }
    }

    protected void logOut(object sender, EventArgs e)
    {
        Session["UserRole"] = "";
        Session["UserID"] = null;
        ScriptManager.RegisterStartupScript(topMenuUpdatePanel, topMenuUpdatePanel.GetType(), "LoginSuccessMsg",
            @"$(document).ready(function(){
                            UIkit.notification({message: 'Logged out!', status: 'success'});
                            location.reload(true);
                        }); ", true);

    }
}