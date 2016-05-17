package LBS;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class Attr
  extends JceStruct
{
  public String strImei = "";
  public String strImsi = "";
  public String strPhonenum = "";
  
  public Attr() {}
  
  public Attr(String paramString1, String paramString2, String paramString3)
  {
    strImei = paramString1;
    strImsi = paramString2;
    strPhonenum = paramString3;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    strImei = paramJceInputStream.readString(0, false);
    strImsi = paramJceInputStream.readString(1, false);
    strPhonenum = paramJceInputStream.readString(2, false);
  }
  
  public String toString()
  {
    return "Attr[imei=" + strImei + ",imsi=" + strImsi + ",phoneNum=" + strPhonenum + "]\n";
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    if (strImei != null) {
      paramJceOutputStream.write(strImei, 0);
    }
    if (strImsi != null) {
      paramJceOutputStream.write(strImsi, 1);
    }
    if (strPhonenum != null) {
      paramJceOutputStream.write(strPhonenum, 2);
    }
  }
}
