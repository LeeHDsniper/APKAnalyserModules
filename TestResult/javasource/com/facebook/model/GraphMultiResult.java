package com.facebook.model;

public abstract interface GraphMultiResult
  extends GraphObject
{
  public abstract GraphObjectList<GraphObject> getData();
}
