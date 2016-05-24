package org.apache.http.impl.cookie;

import org.apache.http.annotation.Immutable;
import org.apache.http.cookie.MalformedCookieException;
import org.apache.http.cookie.SetCookie;
import org.apache.http.util.Args;

@Immutable
public class BasicCommentHandler
  extends AbstractCookieAttributeHandler
{
  public BasicCommentHandler() {}
  
  public void parse(SetCookie paramSetCookie, String paramString)
    throws MalformedCookieException
  {
    Args.notNull(paramSetCookie, "Cookie");
    paramSetCookie.setComment(paramString);
  }
}
