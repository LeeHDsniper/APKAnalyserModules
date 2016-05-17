package com.tencent.msf.service.protocol.serverconfig;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.ArrayList;

public final class i
  extends JceStruct
{
  static ArrayList i;
  static ArrayList j;
  static ArrayList k;
  static ArrayList l;
  public ArrayList a = null;
  public ArrayList b = null;
  public int c = 0;
  public byte d = 0;
  public byte e = 0;
  public int f = 1;
  public ArrayList g = null;
  public ArrayList h = null;
  
  public i() {}
  
  public i(ArrayList paramArrayList1, ArrayList paramArrayList2, int paramInt1, byte paramByte1, byte paramByte2, int paramInt2, ArrayList paramArrayList3, ArrayList paramArrayList4)
  {
    a = paramArrayList1;
    b = paramArrayList2;
    c = paramInt1;
    d = paramByte1;
    e = paramByte2;
    f = paramInt2;
    g = paramArrayList3;
    h = paramArrayList4;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    j localJ;
    if (i == null)
    {
      i = new ArrayList();
      localJ = new j();
      i.add(localJ);
    }
    a = ((ArrayList)paramJceInputStream.read(i, 1, true));
    if (j == null)
    {
      j = new ArrayList();
      localJ = new j();
      j.add(localJ);
    }
    b = ((ArrayList)paramJceInputStream.read(j, 3, true));
    c = paramJceInputStream.read(c, 4, true);
    d = paramJceInputStream.read(d, 5, false);
    e = paramJceInputStream.read(e, 6, false);
    f = paramJceInputStream.read(f, 7, false);
    if (k == null)
    {
      k = new ArrayList();
      localJ = new j();
      k.add(localJ);
    }
    g = ((ArrayList)paramJceInputStream.read(k, 8, false));
    if (l == null)
    {
      l = new ArrayList();
      localJ = new j();
      l.add(localJ);
    }
    h = ((ArrayList)paramJceInputStream.read(l, 9, false));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 1);
    paramJceOutputStream.write(b, 3);
    paramJceOutputStream.write(c, 4);
    paramJceOutputStream.write(d, 5);
    paramJceOutputStream.write(e, 6);
    paramJceOutputStream.write(f, 7);
    if (g != null) {
      paramJceOutputStream.write(g, 8);
    }
    if (h != null) {
      paramJceOutputStream.write(h, 9);
    }
  }
}
