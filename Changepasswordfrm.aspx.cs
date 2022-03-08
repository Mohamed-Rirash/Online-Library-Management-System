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
    public partial class Changepasswordfrm : System.Web.UI.Page
    {
        
        protected void btnchange_Click(object sender, EventArgs e)
        {
            SqlConnection conn;
            SqlDataAdapter da;
            DataSet ds;

            conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionStrigSql"].ToString();
            conn.Open();

            da = new SqlDataAdapter("SELECT [intUser_Login_ID], [strPassword] FROM [UserLoginDetail] WHERE ([strUserName] = '"+Session["uname"]+"')", conn);
            ds = new DataSet();

            //txtoldpwd.Text = Session["uname"].ToString();
            da.Fill(ds, "UserLoginDetail");


            if (txtoldpwd.Text == ds.Tables["UserLoginDetail"].Rows[0].ItemArray[1].ToString())
            {
                SqlDataSource ls = new SqlDataSource();

                ls.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionStrigSql"].ToString();
                ls.UpdateCommand = "UPDATE [UserLoginDetail] SET [strPassword] = @strPassword WHERE [intUser_Login_ID] = @intUser_Login_ID";
                ls.UpdateParameters.Add("strPassword", txtnewpwd.Text);
                ls.UpdateParameters.Add("intUser_Login_ID", Session["ulid"].ToString());
                ls.Update();
                lblsucess.Visible = true;
                lblsucess.Text = "Password Updated Successfully";
            }
            else
            {
                lblsucess.Visible = true;
                lblsucess.Text = "Enter Correct Old Password";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            Menu mnu;
            Label lb;

            lb = (Label)Page.Master.FindControl("lblloginusr");

            lb.Text = Session["uname"].ToString();
            if (Session["isadmin"].ToString() == "Y")
            {
                mnu = (Menu)Page.Master.FindControl("mnuadmin");
                mnu.Visible = true;
            }
        }
    }
}
