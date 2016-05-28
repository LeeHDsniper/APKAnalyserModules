package org.apache.http.config;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.util.Args;

@NotThreadSafe
public final class RegistryBuilder<I>
{
  private final Map<String, I> items = new HashMap();
  
  RegistryBuilder() {}
  
  public static <I> RegistryBuilder<I> create()
  {
    return new RegistryBuilder();
  }
  
  public Registry<I> build()
  {
    return new Registry(items);
  }
  
  public RegistryBuilder<I> register(String paramString, I paramI)
  {
    Args.notEmpty(paramString, "ID");
    Args.notNull(paramI, "Item");
    items.put(paramString.toLowerCase(Locale.US), paramI);
    return this;
  }
  
  public String toString()
  {
    return items.toString();
  }
}
