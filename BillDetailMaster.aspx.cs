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
    public partial class BillDetailMster : System.Web.UI.Page
    {
        MainDB db = new MainDB();
        SqlDataReader dr;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            Label lb;
            MainDB db = new MainDB();
           
            lb = (Label)Page.Master.FindControl("lblloginusr");

            lb.Text = Session["uname"].ToString();

            if (Session["isadmin"].ToString() == "Y")
            {
                Menu mnu;
                mnu = (Menu)Page.Master.FindControl("mnuadmin");
                mnu.Visible = true;
            }
            if (!IsPostBack)
            {

                GridViewDataBind();
                Session["ds"] = ds;


            }
            dr = db.SqlDataReaderConnection("select intSupplier_ID from SupplierMaster", "SupplierMaster");
            ddlspid.DataSource = dr;
            ddlspid.DataTextField = "intSupplier_ID";
            ddlspid.DataBind();
        }
        protected void btninsert_Click(object sender, EventArgs e)
        {
            SqlDataReader dr;
            SqlCommand cmd = new SqlCommand();
            string rid;

            dr = db.SqlDataReaderConnection("select [intBill_ID] from BillDetailMaster", "BillDetailMaster");

            if (dr.HasRows == false)
            {
                rid = "BID" + 1;
                txtbid.Text = rid;
                txtbrno.Text = "";
                txtdscnt.Text = "";
                txtamt.Text = "";
            }
            else
            {
                cmd = db.SqlCommandConnection("select max([intBill_ID]) from BillDetailMaster", "BillDetailMaster");
                rid = cmd.ExecuteScalar().ToString();
                rid = rid.Substring(3);
                rid = "BID" + (int.Parse(rid) + 1).ToString();

            }
            txtbid.Text = rid;
            txtbrno.Text = "";
            txtdscnt.Text = "";
            txtamt.Text = "";

            btnsave.Enabled = true;
            btninsert.Enabled = false;
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            string s = e.CommandArgument.ToString();

            switch (e.CommandName)
            {
                case "EditBill":

                    int j = -1;
                    int i = Convert.ToInt32(s.Substring(3));
                    dr = db.SqlDataReaderConnection("select intBill_ID from BillDetailMaster", "BillDetailMaster");
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

                case "UpdateBill":

                    SqlConnection cn = new SqlConnection();
                    SqlCommand cmd;

                    cn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionStrigSql"].ToString();
                    cn.Open();
            
                    foreach (GridViewRow grvrow in GridView1.Rows)
                    {
                        if (e.CommandArgument.ToString() == ((Label)grvrow.FindControl("lblbid")).Text)
                        {
                            
                            string brno = ((TextBox)grvrow.FindControl("txtbrno")).Text;
                            string spid = ((TextBox)grvrow.FindControl("txtspid")).Text;
                            string discount = ((TextBox)grvrow.FindControl("txtdscnt")).Text;
                            string tamt = ((TextBox)grvrow.FindControl("txttamt")).Text;

                            string strquery = "UPDATE BillDetailMaster SET intBill_Ref_No = '" + brno + "',intSupplier_ID = '" + ddlspid.SelectedItem.Text + "',intDiscount_Amount = '" + discount+ "', intTotal_Bill_Amount = '" + tamt + "' WHERE intBill_ID = '" + s + "' ";

                            cmd = new SqlCommand(strquery, cn);
                            cmd.ExecuteNonQuery();
                            GridView1.EditIndex = -1;

                        }
                    }

                    GridViewDataBind();

                    cn.Close();


                    break;


                case "Cancel":

                    GridView1.EditIndex = -1;
                    GridViewDataBind();
                    break;
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
           
                SqlCommand cmd = new SqlCommand();

                string strQuery = "insert into BillDetailMaster(intBill_ID,intBill_Ref_No,intSupplier_ID,Sys_Date,intDiscount_Amount,intTotal_Bill_Amount)" + "values(@intBill_ID,@intBill_Ref_No,@intSupplier_ID,@Sys_Date,@intDiscount_Amount,@intTotal_Bill_Amount)";
                cmd = db.SqlCommandConnection(strQuery, "BillDetailMaster");

                cmd.Parameters.AddWithValue("@intBill_ID", txtbid.Text);
                cmd.Parameters.AddWithValue("@intBill_Ref_No", txtbrno.Text);
                cmd.Parameters.AddWithValue("@intSupplier_ID", ddlspid.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Sys_Date",DateTime.Today.Date.ToString("dd/MM/yyyy"));
                cmd.Parameters.AddWithValue("@intDiscount_Amount", txtdscnt.Text.ToString());
                cmd.Parameters.AddWithValue("@intTotal_Bill_Amount", txtamt.Text.ToString());
                
                cmd.ExecuteNonQuery();
                
                GridViewDataBind();

                txtbid.Text = "";
                txtbrno.Text = "";
                txtdscnt.Text = "";
                txtamt.Text = "";
               
                btnsave.Enabled = false;
                btninsert.Enabled = true;

           
        }
        public void GridViewDataBind()
        {
            ds = db.SqlDataAdapterconnection("select * from BillDetailMaster", "BillDetailMaster");
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }

        protected void btncancle_Click(object sender, EventArgs e)
        {
            btninsert.Enabled = true;
            txtbid.Text = "";
            txtbrno.Text = "";
            txtdscnt.Text = "";
            txtamt.Text = "";
        }

    }
    
}
