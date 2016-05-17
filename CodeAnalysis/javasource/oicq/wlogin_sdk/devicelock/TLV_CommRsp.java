package oicq.wlogin_sdk.devicelock;

import oicq.wlogin_sdk.tools.util;

public class TLV_CommRsp
  extends e
{
  public byte[] ErrInfo = new byte[0];
  public int ErrInfoType;
  public byte[] ErrMsg = new byte[0];
  public byte[] ErrTitle = new byte[0];
  public int Reason = 0;
  public int RetCode = -1;
  
  public TLV_CommRsp()
  {
    _type = 1;
  }
  
  public void parse()
  {
    int i = _head_len;
    RetCode = util.buf_to_int32(_buf, i);
    i += 4;
    Reason = util.buf_to_int32(_buf, i);
    int j = i + 4;
    i = util.buf_to_int16(_buf, j);
    j += 2;
    ErrTitle = new byte[i];
    System.arraycopy(_buf, j, ErrTitle, 0, i);
    j += i;
    i = util.buf_to_int16(_buf, j);
    j += 2;
    ErrMsg = new byte[i];
    System.arraycopy(_buf, j, ErrMsg, 0, i);
    i = j + i;
    ErrInfoType = util.buf_to_int16(_buf, i);
    j = i + 2;
    i = util.buf_to_int16(_buf, j);
    j += 2;
    ErrInfo = new byte[i];
    System.arraycopy(_buf, j, ErrInfo, 0, i);
  }
}
