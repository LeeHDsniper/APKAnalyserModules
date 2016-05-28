package org.apache.http.cookie;

import java.util.Date;

public abstract interface SetCookie
  extends Cookie
{
  public abstract void setComment(String paramString);
  
  public abstract void setDomain(String paramString);
  
  public abstract void setExpiryDate(Date paramDate);
  
  public abstract void setPath(String paramString);
  
  public abstract void setSecure(boolean paramBoolean);
  
  public abstract void setValue(String paramString);
  
  public abstract void setVersion(int paramInt);
}
