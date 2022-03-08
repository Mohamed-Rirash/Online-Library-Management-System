using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

namespace Online_Library_Management_System
{
    public partial class HomeUserfrm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            Label lb;
            MainDB db = new MainDB();
            
            lb = (Label)Page.Master.FindControl("lblloginusr");
            lb.Text = Session["uname"].ToString();
            lblunm.Text = Session["uname"].ToString();

            if (Session["isadmin"].ToString() == "Y")
            {
                Menu mnu;
                mnu = (Menu)Page.Master.FindControl("mnuadmin");

                int sigreq= db.SqlCommandExecuteScalar("select count(intUser_Login_ID) from UserLoginDetail where Status='N'", "UserLoginDetail");
                int itmreq = db.SqlCommandExecuteScalar("select count(intRequest_ID) from RequestMaster WHERE Status='N'", "RequestMaster");
                
                lblusrlgn.Text = sigreq.ToString(); ;
                lblitmreqst.Text = itmreq.ToString();
                Panel3.Visible = true;
                mnu.Visible = true;
            }

            
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }
    }
}
