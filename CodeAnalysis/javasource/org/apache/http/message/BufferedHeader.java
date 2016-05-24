package org.apache.http.message;

import java.io.Serializable;
import org.apache.http.FormattedHeader;
import org.apache.http.HeaderElement;
import org.apache.http.ParseException;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;

@NotThreadSafe
public class BufferedHeader
  implements Serializable, Cloneable, FormattedHeader
{
  private static final long serialVersionUID = -2768352615787625448L;
  private final CharArrayBuffer buffer;
  private final String name;
  private final int valuePos;
  
  public BufferedHeader(CharArrayBuffer paramCharArrayBuffer)
    throws ParseException
  {
    Args.notNull(paramCharArrayBuffer, "Char array buffer");
    int i = paramCharArrayBuffer.indexOf(58);
    if (i == -1) {
      throw new ParseException("Invalid header: " + paramCharArrayBuffer.toString());
    }
    String str = paramCharArrayBuffer.substringTrimmed(0, i);
    if (str.length() == 0) {
      throw new ParseException("Invalid header: " + paramCharArrayBuffer.toString());
    }
    buffer = paramCharArrayBuffer;
    name = str;
    valuePos = (i + 1);
  }
  
  public Object clone()
    throws CloneNotSupportedException
  {
    return super.clone();
  }
  
  public CharArrayBuffer getBuffer()
  {
    return buffer;
  }
  
  public HeaderElement[] getElements()
    throws ParseException
  {
    ParserCursor localParserCursor = new ParserCursor(0, buffer.length());
    localParserCursor.updatePos(valuePos);
    return BasicHeaderValueParser.INSTANCE.parseElements(buffer, localParserCursor);
  }
  
  public String getName()
  {
    return name;
  }
  
  public String getValue()
  {
    return buffer.substringTrimmed(valuePos, buffer.length());
  }
  
  public int getValuePos()
  {
    return valuePos;
  }
  
  public String toString()
  {
    return buffer.toString();
  }
}
