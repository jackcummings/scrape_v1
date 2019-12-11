using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Summary description for Helper
/// </summary>
public static class Helper
{
    public static Control FindAnyControl(Page page, string controlId)
    {
        return FindControlRecursive(controlId, page.Form);
    }

    public static Control FindAnyControl(UserControl control, string controlId)
    {
        return FindControlRecursive(controlId, control);
    }

    public static Control FindControlRecursive(string controlId, Control parent)
    {
        foreach (Control control in parent.Controls)
        {
            Control result = FindControlRecursive(controlId, control);
            if (result != null)
            {
                return result;
            }
        }
        return parent.FindControl(controlId);
    }
}