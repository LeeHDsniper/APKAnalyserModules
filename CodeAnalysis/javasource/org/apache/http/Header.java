package org.apache.http;

public abstract interface Header
{
  public abstract HeaderElement[] getElements()
    throws ParseException;
  
  public abstract String getName();
  
  public abstract String getValue();
}
