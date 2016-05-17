package LBS;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class Wifi
  extends JceStruct
{
  public long lMac = -1L;
  public short shRssi = 0;
  
  public Wifi() {}
  
  public Wifi(long paramLong, short paramShort)
  {
    lMac = paramLong;
    shRssi = paramShort;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    lMac = paramJceInputStream.read(lMac, 0, true);
    shRssi = paramJceInputStream.read(shRssi, 1, false);
  }
  
  public String toString()
  {
    return "Wifi[mac=" + lMac + ",rssi=" + shRssi + "]\n";
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(lMac, 0);
    paramJceOutputStream.write(shRssi, 1);
  }
}
