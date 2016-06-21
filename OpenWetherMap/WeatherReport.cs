using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OpenWetherMap
{
    public class WeatherReport
    {
        public coord coord;
        public weather weather;
        public string _base;
        public main main;
        public wind wind;
        public clouds clouds;
        public int dt;
        public sys sys;
        public int id;
        public string name;
        public int cod;
    }

    public class sys
    {
        public decimal message;
        public string country;
        public int sunrise;
        public int sunset;
    }

    public class clouds
    {
        public int all;
    }


    public class wind
    {
        public decimal speed;
        public decimal deg;
    }

    public class main
    {
        public decimal temp;
        public decimal pressure;
        public decimal humidity;
        public decimal temp_min;
        public decimal temp_max;
        public decimal sea_level;
        public decimal grnd_level;

    }

    public class coord
    {
        public decimal lon;
        public decimal lat;
    }

    public class weather
    {
        public int id;
        public string main;
        public string description;
        public string icon;
    }

}