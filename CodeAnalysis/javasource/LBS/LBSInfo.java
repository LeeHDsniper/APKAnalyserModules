package LBS;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.ArrayList;
import java.util.Iterator;

public final class LBSInfo
  extends JceStruct
{
  static Attr cache_stAttr;
  static GPS cache_stGps;
  static ArrayList<Cell> cache_vCells;
  static ArrayList<Wifi> cache_vWifis;
  public Attr stAttr = null;
  public GPS stGps = null;
  public ArrayList<Cell> vCells = null;
  public ArrayList<Wifi> vWifis = null;
  
  public LBSInfo() {}
  
  public LBSInfo(GPS paramGPS, ArrayList<Wifi> paramArrayList, ArrayList<Cell> paramArrayList1, Attr paramAttr)
  {
    stGps = paramGPS;
    vWifis = paramArrayList;
    vCells = paramArrayList1;
    stAttr = paramAttr;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    if (cache_stGps == null) {
      cache_stGps = new GPS();
    }
    stGps = ((GPS)paramJceInputStream.read(cache_stGps, 0, false));
    Object localObject;
    if (cache_vWifis == null)
    {
      cache_vWifis = new ArrayList();
      localObject = new Wifi();
      cache_vWifis.add(localObject);
    }
    vWifis = ((ArrayList)paramJceInputStream.read(cache_vWifis, 1, false));
    if (cache_vCells == null)
    {
      cache_vCells = new ArrayList();
      localObject = new Cell();
      cache_vCells.add(localObject);
    }
    vCells = ((ArrayList)paramJceInputStream.read(cache_vCells, 2, false));
    if (cache_stAttr == null) {
      cache_stAttr = new Attr();
    }
    stAttr = ((Attr)paramJceInputStream.read(cache_stAttr, 3, false));
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("LBSInfo[\n");
    if (stGps != null) {
      localStringBuilder.append(stGps.toString());
    }
    if (stAttr != null) {
      localStringBuilder.append(stAttr.toString());
    }
    Iterator localIterator;
    if ((vCells != null) && (vCells.size() > 0))
    {
      localIterator = vCells.iterator();
      if (localIterator.hasNext()) {}
    }
    else if ((vWifis != null) && (vWifis.size() > 0))
    {
      localIterator = vWifis.iterator();
    }
    for (;;)
    {
      if (!localIterator.hasNext())
      {
        localStringBuilder.append("]");
        return localStringBuilder.toString();
        localStringBuilder.append(((Cell)localIterator.next()).toString());
        break;
      }
      localStringBuilder.append(((Wifi)localIterator.next()).toString());
    }
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    if (stGps != null) {
      paramJceOutputStream.write(stGps, 0);
    }
    if (vWifis != null) {
      paramJceOutputStream.write(vWifis, 1);
    }
    if (vCells != null) {
      paramJceOutputStream.write(vCells, 2);
    }
    if (stAttr != null) {
      paramJceOutputStream.write(stAttr, 3);
    }
  }
}
