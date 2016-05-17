package com.tencent.msf.service.protocol.QQWiFi;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class WiFiService
  extends JceStruct
{
  static d cache_wifi;
  public int autoConnFlag = 0;
  public byte fee = 0;
  public String pkgid = "";
  public byte type = 0;
  public d wifi = null;
  
  public WiFiService() {}
  
  public WiFiService(byte paramByte1, byte paramByte2, String paramString, d paramD, int paramInt)
  {
    type = paramByte1;
    fee = paramByte2;
    pkgid = paramString;
    wifi = paramD;
    autoConnFlag = paramInt;
  }
  
  public String getBssid()
  {
    if (wifi != null) {
      return wifi.b;
    }
    return "";
  }
  
  public short getSignal()
  {
    if (wifi != null) {
      return wifi.c;
    }
    return 0;
  }
  
  public String getSsid()
  {
    if (wifi != null) {
      return wifi.a;
    }
    return "";
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    type = paramJceInputStream.read(type, 0, true);
    fee = paramJceInputStream.read(fee, 1, true);
    pkgid = paramJceInputStream.readString(2, false);
    if (cache_wifi == null) {
      cache_wifi = new d();
    }
    wifi = ((d)paramJceInputStream.read(cache_wifi, 3, false));
    autoConnFlag = paramJceInputStream.read(autoConnFlag, 4, false);
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("[pkgid=").append(pkgid);
    if (wifi != null)
    {
      localStringBuilder.append(", ssid=").append(wifi.a);
      localStringBuilder.append(", bssid=").append(wifi.b).append("]");
    }
    for (;;)
    {
      localStringBuilder.append("autoConnFlag=" + autoConnFlag);
      return localStringBuilder.toString();
      localStringBuilder.append("]");
    }
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(type, 0);
    paramJceOutputStream.write(fee, 1);
    if (pkgid != null) {
      paramJceOutputStream.write(pkgid, 2);
    }
    if (wifi != null) {
      paramJceOutputStream.write(wifi, 3);
    }
    paramJceOutputStream.write(autoConnFlag, 4);
  }
}
