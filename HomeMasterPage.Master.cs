using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace Online_Library_Management_System
{
    public partial class HomeMasterPage : System.Web.UI.MasterPage
    {

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            
            //Session["isadmin"] = null;
            //Session["isstaff"] = null;
            //Session["uname"] = null;
            //Session["uid"] = null;
            Session.Abandon();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}
