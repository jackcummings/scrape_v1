using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void loginButton_Click(object sender, EventArgs e)
    {
        Users users = new Users();

        string username = this.username.Text;
        string password = this.password.Text;

        DataSet userData = users.userCheckLogin(username, password);

        if (userData.Tables[0].Rows.Count != 0)
        {
            DataRow row = userData.Tables[0].Rows[0];
            HttpContext context = HttpContext.Current;
            bool isAdmin = false;

            if (row["is_admin"] != DBNull.Value)
            {
                isAdmin = bool.Parse(row["is_admin"].ToString());
            }

            if (isAdmin)
            {
                context.Session["UserRole"] = "ADMIN";
                context.Session["Username"] = row["username"];
                context.Session["UserID"] = row["user_id"];
            }
            else
            {
                context.Session["UserRole"] = "USER";
                context.Session["UserName"] = row["username"];
                context.Session["UserID"] = row["user_id"];
            }

            ScriptManager.RegisterStartupScript(loginUpdatePanel, loginUpdatePanel.GetType(), "LoginSuccessMsg",
                        @"$(document).ready(function(){
                            UIkit.notification({message: 'Successfully logged in!', status: 'success'});
                            location.reload(true);
                        }); ", true);
        }

        else
        {
            ScriptManager.RegisterStartupScript(loginUpdatePanel, loginUpdatePanel.GetType(), "LoginFailedMsg",
                        @"$(document).ready(function(){
                            UIkit.notification({message: 'Error! Wrong username or password!', status: 'warning'})
                        }); ", true);
        }


    }
}