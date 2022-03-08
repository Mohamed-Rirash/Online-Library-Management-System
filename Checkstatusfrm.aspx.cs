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
using System.Data.SqlClient;
namespace Online_Library_Management_System
{
    public partial class Checkstatusfrm : System.Web.UI.Page
    {
        MainDB db = new MainDB();
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label lb;
            lb = (Label)Page.Master.FindControl("lblloginusr");
            lb.Text = Session["uname"].ToString();
            
            if (Session["isadmin"].ToString() == "Y")
            {
                Menu mnu;
                mnu = (Menu)Page.Master.FindControl("mnuadmin");
                
                mnu.Visible = true;
            }
            if (Session["isstaff"].ToString() == "Y")
            {
                dr = db.SqlDataReaderConnection("select intStaff_ID,intItem_ID,intBookDetail_ID,Issue_Date,Due_Date,Status from IssueRenewReturnTable where intStaff_ID= '" + Session["uid"].ToString() + "' and Status='Y'", "IssueRenewReturnTable");
            }
            if (Session["isstaff"].ToString() == "N")
            {
                dr = db.SqlDataReaderConnection("select intStudent_ID,intItem_ID,intBookDetail_ID,Issue_Date,Due_Date,Status from IssueRenewReturnTable where intStudent_ID= '" + Session["uid"].ToString() + "' and Status='Y'", "IssueRenewReturnTable");
            }

            GridView1.DataSource = dr;
            GridView1.DataBind();

        }
    }
}
