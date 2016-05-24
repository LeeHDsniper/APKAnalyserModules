package org.apache.http.message;

import java.io.Serializable;
import org.apache.http.Header;
import org.apache.http.HeaderElement;
import org.apache.http.ParseException;
import org.apache.http.annotation.Immutable;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;

@Immutable
public class BasicHeader
  implements Serializable, Cloneable, Header
{
  private static final long serialVersionUID = -5427236326487562174L;
  private final String name;
  private final String value;
  
  public BasicHeader(String paramString1, String paramString2)
  {
    name = ((String)Args.notNull(paramString1, "Name"));
    value = paramString2;
  }
  
  public Object clone()
    throws CloneNotSupportedException
  {
    return super.clone();
  }
  
  public HeaderElement[] getElements()
    throws ParseException
  {
    if (value != null) {
      return BasicHeaderValueParser.parseElements(value, null);
    }
    return new HeaderElement[0];
  }
  
  public String getName()
  {
    return name;
  }
  
  public String getValue()
  {
    return value;
  }
  
  public String toString()
  {
    return BasicLineFormatter.INSTANCE.formatHeader(null, this).toString();
  }
}
