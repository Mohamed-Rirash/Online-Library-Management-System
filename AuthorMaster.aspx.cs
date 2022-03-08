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
    public partial class AuthorMaster : System.Web.UI.Page
    {
        MainDB db = new MainDB();

        public static DataSet ds = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            Menu mnu;
            Label lb;

            mnu = (Menu)Page.Master.FindControl("mnuadmin");
            lb = (Label)Page.Master.FindControl("lblloginusr");

            lb.Text = Session["uname"].ToString();

            if (Session["isadmin"].ToString() == "Y")
            {
                mnu.Visible = true;
            }
            if (!IsPostBack)
            {
                
                GridViewDataBind();
                Session["ds"] = ds;


            }

        }

        protected void btninsert_Click(object sender, EventArgs e)
        {
            SqlDataReader dr;
            SqlCommand cmd = new SqlCommand();
            string rid;
            
            dr = db.SqlDataReaderConnection("select [intAuthor_ID] from AuthorMaster", "AuthorMaster");

            if (dr.HasRows == false)
            {
                rid = "AID" + 1;
                txtauthorid.Text = rid;
                txtauthornm .Text = "";
            }
            else
            {
                cmd = db.SqlCommandConnection("select count([intAuthor_ID]) from AuthorMaster", "AuthorMaster");
                rid = cmd.ExecuteScalar().ToString();
                //rid = rid.Substring(3);
                rid = "AID" + (int.Parse(rid) + 1).ToString();

            }
            txtauthorid .Text = rid;
            txtauthornm .Text = "";
            btnsave.Enabled = true;
            btninsert.Enabled = false;
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            SqlDataReader dr;
            string s = e.CommandArgument.ToString();

            switch (e.CommandName)
            {
                case "EditAuthor":
                    int j = -1;
                    int i = Convert.ToInt32(s.Substring(3));
                    dr = db.SqlDataReaderConnection("select intAuthor_ID from AuthorMaster", "AutorMaster");
                    while (dr.Read())
                    {
                        j++;
                        if (dr.GetValue(0).ToString().Substring(3) == i.ToString())
                        {
                            GridView1.EditIndex = j;
                            GridViewDataBind();
                           
                        }
                        
                    }
                    dr.Close();
                    
                    break;

                case "UpdateAuthor":

                    SqlConnection cn = new SqlConnection();
                    SqlCommand cmd;

                    cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionStrigSql"].ToString();
                    cn.Open();
                    foreach (GridViewRow grvrow in GridView1.Rows)
                    {
                        if (e.CommandArgument.ToString() == ((Label)grvrow.FindControl("lblauthorid")).Text)
                        {
                            string authorname = ((TextBox)grvrow.FindControl("txtauthoredt")).Text;
                            String Status = ((TextBox)grvrow.FindControl("txtstatus")).Text; 
                            string strquery = "UPDATE AuthorMaster SET strAuthor_Name = '" + authorname  + "', Status='"+Status+"' WHERE intAuthor_ID = '" + s + "' ";

                            cmd = new SqlCommand(strquery, cn);
                            cmd.ExecuteNonQuery();
                            GridView1.EditIndex = -1;

                        }
                    }

                    GridViewDataBind();

                    cn.Close();


                    break;


                case "CancelAuthor":

                    GridView1.EditIndex = -1;
                    GridViewDataBind();
                    break;
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            if (txtauthorid.Text != "" && txtauthornm.Text != "")
            {
                SqlCommand cmd = new SqlCommand();
                string strQuery = "insert into AuthorMaster (intAuthor_ID,strAuthor_Name,Status)" + "values(@intAuthor_ID,@strAuthor_Name,@Status)";
                cmd = db.SqlCommandConnection(strQuery, "strAuthor_Name");
                cmd.Parameters.AddWithValue("@intAuthor_ID", txtauthorid.Text);
                cmd.Parameters.AddWithValue("@strAuthor_Name", txtauthornm.Text);
                cmd.Parameters.AddWithValue("@Status", "Y");
                cmd.ExecuteNonQuery();
                //db.SqlCommandExecuteNonQuery("INSERT INTO [ItemTypeMaster] ([intItem_Type_ID], [strItem_Name]) VALUES '"+txtitemtp.Text+"','"+ txtitmnm.Text+"'", "ItemTyeMaster");
                GridViewDataBind();
                txtauthorid.Text = "";
                txtauthornm.Text = "";

                btnsave.Enabled = false;
                btninsert.Enabled = true;
            }
            else
            {
                lblerr.Visible = true;
                lblerr.Text = "Please Fill Required Information";
            }
        }
        public void GridViewDataBind()
        {
            ds = db.SqlDataAdapterconnection("select * from AuthorMaster", "AuthorMaster");
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }

        protected void btncancle_Click(object sender, EventArgs e)
        {
            btninsert.Enabled = true;
            txtauthorid.Text = "";
            txtauthornm.Text = "";
        }

    }
}
