package KQQ;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class UploadInfo
  extends JceStruct
{
  static byte[] cache_vSignature;
  public long lAppID;
  public long lFromMID;
  public long lToMID;
  public short shType;
  public byte[] vSignature;
  
  public UploadInfo()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    lFromMID = 0L;
    lToMID = 0L;
    lAppID = 0L;
    shType = 0;
    vSignature = null;
  }
  
  public UploadInfo(long paramLong1, long paramLong2, long paramLong3, short paramShort, byte[] paramArrayOfByte)
  {
    lFromMID = 0L;
    lToMID = 0L;
    lAppID = 0L;
    shType = 0;
    vSignature = null;
    lFromMID = paramLong1;
    lToMID = paramLong2;
    lAppID = paramLong3;
    shType = paramShort;
    vSignature = paramArrayOfByte;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    lFromMID = paramJceInputStream.read(lFromMID, 0, true);
    lToMID = paramJceInputStream.read(lToMID, 1, true);
    lAppID = paramJceInputStream.read(lAppID, 2, true);
    shType = paramJceInputStream.read(shType, 3, true);
    if (cache_vSignature == null)
    {
      cache_vSignature = (byte[])new byte[1];
      ((byte[])cache_vSignature)[0] = 0;
    }
    vSignature = ((byte[])paramJceInputStream.read(cache_vSignature, 4, true));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(lFromMID, 0);
    paramJceOutputStream.write(lToMID, 1);
    paramJceOutputStream.write(lAppID, 2);
    paramJceOutputStream.write(shType, 3);
    paramJceOutputStream.write(vSignature, 4);
  }
}
