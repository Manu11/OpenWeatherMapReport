using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Xml;
using Newtonsoft.Json;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;

namespace OpenWetherMap
{
    public partial class Home : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["owm"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCapitalCitites();
            }
        }

        // capital cities binding to grid
        public void BindCapitalCitites()
        {
            //
            SqlDataAdapter daGetCapCities = new SqlDataAdapter("SELECT Id, City, Country from ECapCities", con);
            DataSet dsGetCapCities = new DataSet();

            daGetCapCities.Fill(dsGetCapCities, "GetCapCities");

            gvECapCities.DataSource = dsGetCapCities;
            gvECapCities.DataBind();
        }

        protected void gvECapCities_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewReport")
            {
                try
                {
                    GridViewRow row = (GridViewRow)((LinkButton)(e.CommandSource)).NamingContainer;
                    Label lblCapitalCity = (Label)gvECapCities.Rows[row.RowIndex].FindControl("lblCapitalCity");

                    HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://api.openweathermap.org/data/2.5/weather?q=" + lblCapitalCity.Text + "&APPID=74d516f151e31e0ea45dc0d4ca99e055");

                    //using (StreamReader r = new StreamReader(""))
                    //{
                    string sstr = string.Empty;
                    WebResponse response = request.GetResponse();
                    using (Stream responseStream = response.GetResponseStream())
                    {
                        StreamReader reader = new StreamReader(responseStream, Encoding.UTF8);
                        sstr = reader.ReadToEnd();
                    }
                    //string json = reader.ReadToEnd();
                    sstr = sstr.Replace("[", "");
                    sstr = sstr.Replace("]", "");
                    sstr = sstr.Replace("base", "_base");
                    WeatherReport items = JsonConvert.DeserializeObject<WeatherReport>(sstr);
                    //}

                    pnlTab.Visible = true;

                    Sunrise.Text = items.sys.sunrise.ToString();
                    Sunset.Text = items.sys.sunset.ToString();
                    TempMin.Text = items.main.temp_min.ToString();
                    TempMax.Text = items.main.temp_max.ToString();
                    Name.Text = items.name.ToString();
                    Country.Text = items.sys.country.ToString();
                }
                catch (Exception ex)
                {
                    throw;
                }
            }

        }

        protected void gvECapCities_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvECapCities.PageIndex = e.NewPageIndex;
            BindCapitalCitites();
        }

    }
}