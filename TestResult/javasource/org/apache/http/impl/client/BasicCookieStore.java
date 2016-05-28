package org.apache.http.impl.client;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TreeSet;
import org.apache.http.annotation.GuardedBy;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.client.CookieStore;
import org.apache.http.cookie.Cookie;
import org.apache.http.cookie.CookieIdentityComparator;

@ThreadSafe
public class BasicCookieStore
  implements Serializable, CookieStore
{
  private static final long serialVersionUID = -7581093305228232025L;
  @GuardedBy("this")
  private final TreeSet<Cookie> cookies = new TreeSet(new CookieIdentityComparator());
  
  public BasicCookieStore() {}
  
  public void addCookie(Cookie paramCookie)
  {
    if (paramCookie != null) {}
    try
    {
      cookies.remove(paramCookie);
      if (!paramCookie.isExpired(new Date())) {
        cookies.add(paramCookie);
      }
      return;
    }
    finally
    {
      paramCookie = finally;
      throw paramCookie;
    }
  }
  
  public void addCookies(Cookie[] paramArrayOfCookie)
  {
    if (paramArrayOfCookie != null) {}
    try
    {
      int j = paramArrayOfCookie.length;
      int i = 0;
      while (i < j)
      {
        addCookie(paramArrayOfCookie[i]);
        i += 1;
      }
      return;
    }
    finally {}
  }
  
  public void clear()
  {
    try
    {
      cookies.clear();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  /* Error */
  public boolean clearExpired(Date paramDate)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_1
    //   3: ifnonnull +9 -> 12
    //   6: iconst_0
    //   7: istore_3
    //   8: aload_0
    //   9: monitorexit
    //   10: iload_3
    //   11: ireturn
    //   12: iconst_0
    //   13: istore_2
    //   14: aload_0
    //   15: getfield 33	org/apache/http/impl/client/BasicCookieStore:cookies	Ljava/util/TreeSet;
    //   18: invokevirtual 64	java/util/TreeSet:iterator	()Ljava/util/Iterator;
    //   21: astore 4
    //   23: iload_2
    //   24: istore_3
    //   25: aload 4
    //   27: invokeinterface 70 1 0
    //   32: ifeq -24 -> 8
    //   35: aload 4
    //   37: invokeinterface 74 1 0
    //   42: checkcast 45	org/apache/http/cookie/Cookie
    //   45: aload_1
    //   46: invokeinterface 49 2 0
    //   51: ifeq -28 -> 23
    //   54: aload 4
    //   56: invokeinterface 76 1 0
    //   61: iconst_1
    //   62: istore_2
    //   63: goto -40 -> 23
    //   66: astore_1
    //   67: aload_0
    //   68: monitorexit
    //   69: aload_1
    //   70: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	71	0	this	BasicCookieStore
    //   0	71	1	paramDate	Date
    //   13	50	2	bool1	boolean
    //   7	18	3	bool2	boolean
    //   21	34	4	localIterator	java.util.Iterator
    // Exception table:
    //   from	to	target	type
    //   14	23	66	finally
    //   25	61	66	finally
  }
  
  public List<Cookie> getCookies()
  {
    try
    {
      ArrayList localArrayList = new ArrayList(cookies);
      return localArrayList;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public String toString()
  {
    try
    {
      String str = cookies.toString();
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
}
