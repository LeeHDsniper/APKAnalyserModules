package mqq.app;

import com.qq.jce.wup.UniPacket;
import com.qq.taf.jce.JceStruct;
import com.tencent.qphone.base.remote.ToServiceMsg;
import java.util.HashMap;

public class Packet
{
  private String SSOCommand;
  private String account = "0";
  private HashMap<String, Object> attributes = new HashMap();
  public boolean autoResend;
  private UniPacket client = new UniPacket(true);
  private boolean noResponse;
  public boolean quickSendEnable = false;
  public int quickSendStrategy = 0;
  private byte[] sendData;
  private long timeout = 30000L;
  
  Packet(String paramString)
  {
    client.setEncodeName("UTF-8");
    if (paramString != null) {
      account = paramString;
    }
  }
  
  public static <T> T decodePacket(byte[] paramArrayOfByte, String paramString, T paramT)
  {
    UniPacket localUniPacket = new UniPacket(true);
    localUniPacket.setEncodeName("utf-8");
    localUniPacket.decode(paramArrayOfByte);
    return localUniPacket.getByClass(paramString, paramT);
  }
  
  public Object addAttribute(String paramString, Object paramObject)
  {
    return attributes.put(paramString, paramObject);
  }
  
  public void addRequestPacket(String paramString, JceStruct paramJceStruct)
  {
    client.put(paramString, paramJceStruct);
  }
  
  public HashMap<String, Object> getAttributes()
  {
    return attributes;
  }
  
  public String getFuncName()
  {
    return client.getServantName();
  }
  
  public String getServantName()
  {
    return client.getServantName();
  }
  
  public void putSendData(byte[] paramArrayOfByte)
  {
    sendData = paramArrayOfByte;
  }
  
  public void setAccount(String paramString)
  {
    account = paramString;
  }
  
  public void setAttributes(HashMap<String, Object> paramHashMap)
  {
    attributes = paramHashMap;
  }
  
  public void setFuncName(String paramString)
  {
    client.setFuncName(paramString);
  }
  
  public void setNoResponse()
  {
    noResponse = true;
  }
  
  public void setQuickSend(boolean paramBoolean, int paramInt)
  {
    quickSendEnable = paramBoolean;
    quickSendStrategy = paramInt;
  }
  
  public void setSSOCommand(String paramString)
  {
    SSOCommand = paramString;
  }
  
  public void setServantName(String paramString)
  {
    client.setServantName(paramString);
  }
  
  public void setTimeout(long paramLong)
  {
    timeout = paramLong;
  }
  
  ToServiceMsg toMsg()
  {
    ToServiceMsg localToServiceMsg = null;
    if (SSOCommand != null)
    {
      localToServiceMsg = new ToServiceMsg(null, account, SSOCommand);
      if (timeout > 0L) {
        localToServiceMsg.setTimeout(timeout);
      }
      if (noResponse) {
        localToServiceMsg.setNeedCallback(false);
      }
      if (sendData == null) {
        sendData = client.encode();
      }
      localToServiceMsg.putWupBuffer(sendData);
      localToServiceMsg.setAttributes(attributes);
      localToServiceMsg.setEnableFastResend(autoResend);
      localToServiceMsg.setQuickSend(quickSendEnable, quickSendStrategy);
    }
    return localToServiceMsg;
  }
}
