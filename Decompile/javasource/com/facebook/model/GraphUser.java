package com.facebook.model;

public abstract interface GraphUser
  extends GraphObject
{
  public abstract String getBirthday();
  
  public abstract String getFirstName();
  
  public abstract String getId();
  
  public abstract String getLastName();
  
  public abstract String getLink();
  
  public abstract GraphPlace getLocation();
  
  public abstract String getMiddleName();
  
  public abstract String getName();
  
  public abstract String getUsername();
  
  public abstract void setBirthday(String paramString);
  
  public abstract void setFirstName(String paramString);
  
  public abstract void setId(String paramString);
  
  public abstract void setLastName(String paramString);
  
  public abstract void setLink(String paramString);
  
  public abstract void setLocation(GraphPlace paramGraphPlace);
  
  public abstract void setMiddleName(String paramString);
  
  public abstract void setName(String paramString);
  
  public abstract void setUsername(String paramString);
}
