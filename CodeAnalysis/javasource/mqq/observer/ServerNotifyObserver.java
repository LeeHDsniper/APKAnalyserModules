package mqq.observer;

public class ServerNotifyObserver
{
  private String key;
  private int seq;
  
  public ServerNotifyObserver() {}
  
  public String getKey()
  {
    return key;
  }
  
  public int getSeq()
  {
    return seq;
  }
  
  public void onReceiveVerifyCode(String paramString1, int paramInt, String paramString2, byte[] paramArrayOfByte) {}
  
  public void onVerifyClose() {}
  
  public void setKey(String paramString)
  {
    key = paramString;
  }
  
  public void setSeq(int paramInt)
  {
    seq = paramInt;
  }
}
