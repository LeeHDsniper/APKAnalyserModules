package com.nineoldandroids.util;

public abstract class Property<T, V>
{
  private final String mName;
  private final Class<V> mType;
  
  public Property(Class<V> paramClass, String paramString)
  {
    mName = paramString;
    mType = paramClass;
  }
  
  public abstract V get(T paramT);
  
  public String getName()
  {
    return mName;
  }
  
  public void set(T paramT, V paramV)
  {
    throw new UnsupportedOperationException("Property " + getName() + " is read-only");
  }
}
