package com.facebook.model;

public abstract interface GraphPlace
  extends GraphObject
{
  public abstract String getCategory();
  
  public abstract String getId();
  
  public abstract GraphLocation getLocation();
  
  public abstract String getName();
  
  public abstract void setCategory(String paramString);
  
  public abstract void setId(String paramString);
  
  public abstract void setLocation(GraphLocation paramGraphLocation);
  
  public abstract void setName(String paramString);
}
