package org.apache.http.impl.cookie;

import java.io.Serializable;
import java.util.Date;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.cookie.SetCookie2;

@NotThreadSafe
public class BasicClientCookie2
  extends BasicClientCookie
  implements Serializable, SetCookie2
{
  private static final long serialVersionUID = -7744598295706617057L;
  private String commentURL;
  private boolean discard;
  private int[] ports;
  
  public BasicClientCookie2(String paramString1, String paramString2)
  {
    super(paramString1, paramString2);
  }
  
  public Object clone()
    throws CloneNotSupportedException
  {
    BasicClientCookie2 localBasicClientCookie2 = (BasicClientCookie2)super.clone();
    if (ports != null) {
      ports = ((int[])ports.clone());
    }
    return localBasicClientCookie2;
  }
  
  public String getCommentURL()
  {
    return commentURL;
  }
  
  public int[] getPorts()
  {
    return ports;
  }
  
  public boolean isExpired(Date paramDate)
  {
    return (discard) || (super.isExpired(paramDate));
  }
  
  public boolean isPersistent()
  {
    return (!discard) && (super.isPersistent());
  }
  
  public void setCommentURL(String paramString)
  {
    commentURL = paramString;
  }
  
  public void setDiscard(boolean paramBoolean)
  {
    discard = paramBoolean;
  }
  
  public void setPorts(int[] paramArrayOfInt)
  {
    ports = paramArrayOfInt;
  }
}
