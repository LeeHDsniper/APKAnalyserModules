package com.facebook.model;

import java.util.List;
import org.json.JSONArray;

public abstract interface GraphObjectList<T>
  extends List<T>
{
  public abstract <U extends GraphObject> GraphObjectList<U> castToListOf(Class<U> paramClass);
  
  public abstract JSONArray getInnerJSONArray();
}
