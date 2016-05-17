package LBS;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class GPS
  extends JceStruct
{
  static int cache_eType;
  public int eType = 0;
  public int iAlt = -10000000;
  public int iLat = 900000000;
  public int iLon = 900000000;
  
  public GPS() {}
  
  public GPS(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    iLat = paramInt1;
    iLon = paramInt2;
    iAlt = paramInt3;
    eType = paramInt4;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    iLat = paramJceInputStream.read(iLat, 0, true);
    iLon = paramJceInputStream.read(iLon, 1, true);
    iAlt = paramJceInputStream.read(iAlt, 2, true);
    eType = paramJceInputStream.read(eType, 3, false);
  }
  
  public String toString()
  {
    return "GPS[eType=" + eType + ",lat=" + iLat + ",lon=" + iLon + ",alt=" + iAlt + "]\n";
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(iLat, 0);
    paramJceOutputStream.write(iLon, 1);
    paramJceOutputStream.write(iAlt, 2);
    paramJceOutputStream.write(eType, 3);
  }
}
