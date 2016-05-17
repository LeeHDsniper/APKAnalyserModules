package com.qq.jce.wup;

import com.qq.taf.RequestPacket;
import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceUtil;
import java.nio.ByteBuffer;
import java.util.HashMap;

public class UniPacket
  extends UniAttribute
{
  public static final int UniPacketHeadSize = 4;
  static HashMap<String, HashMap<String, byte[]>> cache__tempdata = null;
  static HashMap<String, byte[]> newCache__tempdata = null;
  protected RequestPacket _package = new RequestPacket();
  private int oldRespIret = 0;
  
  public UniPacket()
  {
    _package.iVersion = 2;
  }
  
  public UniPacket(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      useVersion3();
      return;
    }
    _package.iVersion = 2;
  }
  
  private void parseBufferV2()
  {
    JceInputStream localJceInputStream = new JceInputStream(_package.sBuffer);
    localJceInputStream.setServerEncoding(encodeName);
    if (cache__tempdata == null)
    {
      cache__tempdata = new HashMap();
      HashMap localHashMap = new HashMap();
      localHashMap.put("", new byte[0]);
      cache__tempdata.put("", localHashMap);
    }
    _data = localJceInputStream.readMap(cache__tempdata, 0, false);
    cachedClassName = new HashMap();
  }
  
  private void parseBufferV3()
  {
    JceInputStream localJceInputStream = new JceInputStream(_package.sBuffer);
    localJceInputStream.setServerEncoding(encodeName);
    if (newCache__tempdata == null)
    {
      newCache__tempdata = new HashMap();
      newCache__tempdata.put("", new byte[0]);
    }
    _newData = localJceInputStream.readMap(newCache__tempdata, 0, false);
  }
  
  public byte[] createOldRespEncode()
  {
    Object localObject = new JceOutputStream(0);
    ((JceOutputStream)localObject).setServerEncoding(encodeName);
    ((JceOutputStream)localObject).write(_data, 0);
    localObject = JceUtil.getJceBufArray(((JceOutputStream)localObject).getByteBuffer());
    JceOutputStream localJceOutputStream = new JceOutputStream(0);
    localJceOutputStream.setServerEncoding(encodeName);
    localJceOutputStream.write(_package.iVersion, 1);
    localJceOutputStream.write(_package.cPacketType, 2);
    localJceOutputStream.write(_package.iRequestId, 3);
    localJceOutputStream.write(_package.iMessageType, 4);
    localJceOutputStream.write(oldRespIret, 5);
    localJceOutputStream.write((byte[])localObject, 6);
    localJceOutputStream.write(_package.status, 7);
    return JceUtil.getJceBufArray(localJceOutputStream.getByteBuffer());
  }
  
  public UniPacket createResponse()
  {
    UniPacket localUniPacket = new UniPacket();
    localUniPacket.setRequestId(getRequestId());
    localUniPacket.setServantName(getServantName());
    localUniPacket.setFuncName(getFuncName());
    localUniPacket.setEncodeName(encodeName);
    _package.iVersion = _package.iVersion;
    return localUniPacket;
  }
  
  public void decode(byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte.length < 4) {
      throw new IllegalArgumentException("decode package must include size head");
    }
    try
    {
      paramArrayOfByte = new JceInputStream(paramArrayOfByte, 4);
      paramArrayOfByte.setServerEncoding(encodeName);
      _package.readFrom(paramArrayOfByte);
      if (_package.iVersion == 3)
      {
        parseBufferV3();
        return;
      }
      _newData = null;
      parseBufferV2();
      return;
    }
    catch (Exception paramArrayOfByte)
    {
      throw new RuntimeException(paramArrayOfByte);
    }
  }
  
  public void decodeVersion2(byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte.length < 4) {
      throw new IllegalArgumentException("decode package must include size head");
    }
    try
    {
      paramArrayOfByte = new JceInputStream(paramArrayOfByte, 4);
      paramArrayOfByte.setServerEncoding(encodeName);
      _package.readFrom(paramArrayOfByte);
      parseBufferV2();
      return;
    }
    catch (Exception paramArrayOfByte)
    {
      throw new RuntimeException(paramArrayOfByte);
    }
  }
  
  public void decodeVersion3(byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte.length < 4) {
      throw new IllegalArgumentException("decode package must include size head");
    }
    try
    {
      paramArrayOfByte = new JceInputStream(paramArrayOfByte, 4);
      paramArrayOfByte.setServerEncoding(encodeName);
      _package.readFrom(paramArrayOfByte);
      parseBufferV3();
      return;
    }
    catch (Exception paramArrayOfByte)
    {
      throw new RuntimeException(paramArrayOfByte);
    }
  }
  
  public void display(StringBuilder paramStringBuilder, int paramInt)
  {
    _package.display(paramStringBuilder, paramInt);
  }
  
  public byte[] encode()
  {
    if (_package.iVersion == 2)
    {
      if ((_package.sServantName == null) || (_package.sServantName.equals(""))) {
        throw new IllegalArgumentException("servantName can not is null");
      }
      if ((_package.sFuncName == null) || (_package.sFuncName.equals(""))) {
        throw new IllegalArgumentException("funcName can not is null");
      }
    }
    else
    {
      if (_package.sServantName == null) {
        _package.sServantName = "";
      }
      if (_package.sFuncName == null) {
        _package.sFuncName = "";
      }
    }
    Object localObject = new JceOutputStream(0);
    ((JceOutputStream)localObject).setServerEncoding(encodeName);
    if ((_package.iVersion == 2) || (_package.iVersion == 1)) {
      ((JceOutputStream)localObject).write(_data, 0);
    }
    for (;;)
    {
      _package.sBuffer = JceUtil.getJceBufArray(((JceOutputStream)localObject).getByteBuffer());
      localObject = new JceOutputStream(0);
      ((JceOutputStream)localObject).setServerEncoding(encodeName);
      _package.writeTo((JceOutputStream)localObject);
      localObject = JceUtil.getJceBufArray(((JceOutputStream)localObject).getByteBuffer());
      int i = localObject.length;
      ByteBuffer localByteBuffer = ByteBuffer.allocate(i + 4);
      localByteBuffer.putInt(i + 4).put((byte[])localObject).flip();
      return localByteBuffer.array();
      ((JceOutputStream)localObject).write(_newData, 0);
    }
  }
  
  public String getFuncName()
  {
    return _package.sFuncName;
  }
  
  public int getOldRespIret()
  {
    return oldRespIret;
  }
  
  public int getPackageVersion()
  {
    return _package.iVersion;
  }
  
  public int getRequestId()
  {
    return _package.iRequestId;
  }
  
  public String getServantName()
  {
    return _package.sServantName;
  }
  
  public <T> void put(String paramString, T paramT)
  {
    if (paramString.startsWith(".")) {
      throw new IllegalArgumentException("put name can not startwith . , now is " + paramString);
    }
    super.put(paramString, paramT);
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    _package.readFrom(paramJceInputStream);
  }
  
  public void setFuncName(String paramString)
  {
    _package.sFuncName = paramString;
  }
  
  public void setOldRespIret(int paramInt)
  {
    oldRespIret = paramInt;
  }
  
  public void setRequestId(int paramInt)
  {
    _package.iRequestId = paramInt;
  }
  
  public void setServantName(String paramString)
  {
    _package.sServantName = paramString;
  }
  
  public void useVersion3()
  {
    super.useVersion3();
    _package.iVersion = 3;
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    _package.writeTo(paramJceOutputStream);
  }
}
