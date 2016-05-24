package org.apache.http.cookie;

import java.io.Serializable;
import java.util.Comparator;
import org.apache.http.annotation.Immutable;

@Immutable
public class CookieIdentityComparator
  implements Serializable, Comparator<Cookie>
{
  private static final long serialVersionUID = 4466565437490631532L;
  
  public CookieIdentityComparator() {}
  
  public int compare(Cookie paramCookie1, Cookie paramCookie2)
  {
    int j = paramCookie1.getName().compareTo(paramCookie2.getName());
    int i = j;
    Object localObject2;
    Object localObject1;
    String str;
    if (j == 0)
    {
      localObject2 = paramCookie1.getDomain();
      if (localObject2 != null) {
        break label122;
      }
      localObject1 = "";
      str = paramCookie2.getDomain();
      if (str != null) {
        break label162;
      }
      localObject2 = "";
    }
    for (;;)
    {
      i = ((String)localObject1).compareToIgnoreCase((String)localObject2);
      j = i;
      if (i == 0)
      {
        localObject1 = paramCookie1.getPath();
        paramCookie1 = (Cookie)localObject1;
        if (localObject1 == null) {
          paramCookie1 = "/";
        }
        localObject1 = paramCookie2.getPath();
        paramCookie2 = (Cookie)localObject1;
        if (localObject1 == null) {
          paramCookie2 = "/";
        }
        j = paramCookie1.compareTo(paramCookie2);
      }
      return j;
      label122:
      localObject1 = localObject2;
      if (((String)localObject2).indexOf('.') != -1) {
        break;
      }
      localObject1 = (String)localObject2 + ".local";
      break;
      label162:
      localObject2 = str;
      if (str.indexOf('.') == -1) {
        localObject2 = str + ".local";
      }
    }
  }
}
