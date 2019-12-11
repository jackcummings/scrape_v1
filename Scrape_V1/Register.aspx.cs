using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void registerSubmitBtn_Click(object sender, EventArgs e)
    {
        Users users = new Users();

        string firstName = Server.HtmlEncode(this.first_name_text.Value);
        string lastName = Server.HtmlEncode(this.last_name_text.Value);
        string email = Server.HtmlEncode(this.email_text.Value);
        string userName = Server.HtmlEncode(this.username_text.Text);
        string password = Server.HtmlEncode(this.password_text.Value);

        this.registerSubmitBtn.Text = "Processing...";
        this.registerSubmitBtn.Attributes.Add("disabled", "disabled");
        this.registerSubmitBtn.CssClass += " uk-disabled";

        users.insertUser(firstName, lastName, email, userName, password);

        this.registerSubmitBtn.Text = "Success!";

    }
}