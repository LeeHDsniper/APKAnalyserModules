package KQQ;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class HttpUploadReq
  extends JceStruct
{
  static byte[] cache_vEncryptUploadInfo;
  static byte[] cache_vFileData;
  public byte[] vEncryptUploadInfo;
  public byte[] vFileData;
  
  public HttpUploadReq()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    vEncryptUploadInfo = null;
    vFileData = null;
  }
  
  public HttpUploadReq(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
  {
    vEncryptUploadInfo = null;
    vFileData = null;
    vEncryptUploadInfo = paramArrayOfByte1;
    vFileData = paramArrayOfByte2;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    if (cache_vEncryptUploadInfo == null)
    {
      cache_vEncryptUploadInfo = (byte[])new byte[1];
      ((byte[])cache_vEncryptUploadInfo)[0] = 0;
    }
    vEncryptUploadInfo = ((byte[])paramJceInputStream.read(cache_vEncryptUploadInfo, 0, true));
    if (cache_vFileData == null)
    {
      cache_vFileData = (byte[])new byte[1];
      ((byte[])cache_vFileData)[0] = 0;
    }
    vFileData = ((byte[])paramJceInputStream.read(cache_vFileData, 1, true));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(vEncryptUploadInfo, 0);
    paramJceOutputStream.write(vFileData, 1);
  }
}
