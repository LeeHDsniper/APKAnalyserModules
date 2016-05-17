package com.qq.jce.wup;

import com.qq.taf.RequestPacket;
import java.util.HashMap;
import java.util.Map;

public class TafUniPacket
  extends UniPacket
{
  private static final long serialVersionUID = 1L;
  
  public TafUniPacket()
  {
    _package.iVersion = 2;
    _package.cPacketType = 0;
    _package.iMessageType = 0;
    _package.iTimeout = 0;
    _package.sBuffer = new byte[0];
    _package.context = new HashMap();
    _package.status = new HashMap();
  }
  
  public byte[] getTafBuffer()
  {
    return _package.sBuffer;
  }
  
  public Map<String, String> getTafContext()
  {
    return _package.context;
  }
  
  public int getTafMessageType()
  {
    return _package.iMessageType;
  }
  
  public byte getTafPacketType()
  {
    return _package.cPacketType;
  }
  
  public int getTafResultCode()
  {
    String str = (String)_package.status.get("STATUS_RESULT_CODE");
    if (str != null) {
      return Integer.parseInt(str);
    }
    return 0;
  }
  
  public String getTafResultDesc()
  {
    String str = (String)_package.status.get("STATUS_RESULT_DESC");
    if (str != null) {
      return str;
    }
    return "";
  }
  
  public Map<String, String> getTafStatus()
  {
    return _package.status;
  }
  
  public int getTafTimeout()
  {
    return _package.iTimeout;
  }
  
  public short getTafVersion()
  {
    return _package.iVersion;
  }
  
  public void setTafBuffer(byte[] paramArrayOfByte)
  {
    _package.sBuffer = paramArrayOfByte;
  }
  
  public void setTafContext(Map<String, String> paramMap)
  {
    _package.context = paramMap;
  }
  
  public void setTafMessageType(int paramInt)
  {
    _package.iMessageType = paramInt;
  }
  
  public void setTafPacketType(byte paramByte)
  {
    _package.cPacketType = paramByte;
  }
  
  public void setTafStatus(Map<String, String> paramMap)
  {
    _package.status = paramMap;
  }
  
  public void setTafTimeout(int paramInt)
  {
    _package.iTimeout = paramInt;
  }
  
  public void setTafVersion(short paramShort)
  {
    _package.iVersion = paramShort;
    if (paramShort == 3) {
      useVersion3();
    }
  }
}
