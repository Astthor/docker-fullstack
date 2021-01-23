package com.example.stormrider_2020.GeoIP2API;

import com.maxmind.geoip2.DatabaseReader;
import com.maxmind.geoip2.exception.GeoIp2Exception;
import com.maxmind.geoip2.model.CityResponse;
import com.maxmind.geoip2.record.Country;

import java.io.File;
import java.io.IOException;
import java.net.Inet4Address;
import java.net.InetAddress;

public class GeoIP2
{
    File database = new File("C:/Users/Juste/Google Drive/@ MANO/Mokslai/@KEA/AP Computer Science_/3rd. Semester/Programming 2/@Projects/Mandatory Project 1 - Storm Rider/stormrider_2020/GetLite2-City.mmdb");
    DatabaseReader dbReader = new DatabaseReader.Builder(database).build();

    InetAddress ipAddress = InetAddress.getByName("128.101.101.101");

    CityResponse response = dbReader.city(ipAddress);

    Country country = response.getCountry();


    public GeoIP2() throws IOException, GeoIp2Exception {
    }
}
