package LBS;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class Cell
  extends JceStruct
{
  public int iCellId = -1;
  public int iLac = -1;
  public short shMcc = -1;
  public short shMnc = -1;
  public short shRssi = 0;
  
  public Cell() {}
  
  public Cell(short paramShort1, short paramShort2, int paramInt1, int paramInt2, short paramShort3)
  {
    shMcc = paramShort1;
    shMnc = paramShort2;
    iLac = paramInt1;
    iCellId = paramInt2;
    shRssi = paramShort3;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    shMcc = paramJceInputStream.read(shMcc, 0, true);
    shMnc = paramJceInputStream.read(shMnc, 1, true);
    iLac = paramJceInputStream.read(iLac, 2, true);
    iCellId = paramJceInputStream.read(iCellId, 3, true);
    shRssi = paramJceInputStream.read(shRssi, 4, false);
  }
  
  public String toString()
  {
    return "Cell[cellId=" + iCellId + ",Lac=" + iLac + ",Mcc=" + shMcc + ",Mnc=" + shMnc + ",rssi=" + shRssi + "]\n";
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(shMcc, 0);
    paramJceOutputStream.write(shMnc, 1);
    paramJceOutputStream.write(iLac, 2);
    paramJceOutputStream.write(iCellId, 3);
    paramJceOutputStream.write(shRssi, 4);
  }
}
