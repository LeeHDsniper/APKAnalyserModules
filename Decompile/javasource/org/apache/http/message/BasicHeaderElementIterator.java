package org.apache.http.message;

import java.util.NoSuchElementException;
import org.apache.http.FormattedHeader;
import org.apache.http.Header;
import org.apache.http.HeaderElement;
import org.apache.http.HeaderElementIterator;
import org.apache.http.HeaderIterator;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;

@NotThreadSafe
public class BasicHeaderElementIterator
  implements HeaderElementIterator
{
  private CharArrayBuffer buffer = null;
  private HeaderElement currentElement = null;
  private ParserCursor cursor = null;
  private final HeaderIterator headerIt;
  private final HeaderValueParser parser;
  
  public BasicHeaderElementIterator(HeaderIterator paramHeaderIterator)
  {
    this(paramHeaderIterator, BasicHeaderValueParser.INSTANCE);
  }
  
  public BasicHeaderElementIterator(HeaderIterator paramHeaderIterator, HeaderValueParser paramHeaderValueParser)
  {
    headerIt = ((HeaderIterator)Args.notNull(paramHeaderIterator, "Header iterator"));
    parser = ((HeaderValueParser)Args.notNull(paramHeaderValueParser, "Parser"));
  }
  
  private void bufferHeaderValue()
  {
    cursor = null;
    buffer = null;
    Object localObject;
    do
    {
      if (headerIt.hasNext())
      {
        localObject = headerIt.nextHeader();
        if ((localObject instanceof FormattedHeader))
        {
          buffer = ((FormattedHeader)localObject).getBuffer();
          cursor = new ParserCursor(0, buffer.length());
          cursor.updatePos(((FormattedHeader)localObject).getValuePos());
        }
      }
      else
      {
        return;
      }
      localObject = ((Header)localObject).getValue();
    } while (localObject == null);
    buffer = new CharArrayBuffer(((String)localObject).length());
    buffer.append((String)localObject);
    cursor = new ParserCursor(0, buffer.length());
  }
  
  private void parseNextElement()
  {
    for (;;)
    {
      if ((headerIt.hasNext()) || (cursor != null))
      {
        if ((cursor == null) || (cursor.atEnd())) {
          bufferHeaderValue();
        }
        if (cursor == null) {}
      }
      else
      {
        while (!cursor.atEnd())
        {
          HeaderElement localHeaderElement = parser.parseHeaderElement(buffer, cursor);
          if ((localHeaderElement.getName().length() != 0) || (localHeaderElement.getValue() != null))
          {
            currentElement = localHeaderElement;
            return;
          }
        }
        if (cursor.atEnd())
        {
          cursor = null;
          buffer = null;
        }
      }
    }
  }
  
  public boolean hasNext()
  {
    if (currentElement == null) {
      parseNextElement();
    }
    return currentElement != null;
  }
  
  public final Object next()
    throws NoSuchElementException
  {
    return nextElement();
  }
  
  public HeaderElement nextElement()
    throws NoSuchElementException
  {
    if (currentElement == null) {
      parseNextElement();
    }
    if (currentElement == null) {
      throw new NoSuchElementException("No more header elements available");
    }
    HeaderElement localHeaderElement = currentElement;
    currentElement = null;
    return localHeaderElement;
  }
  
  public void remove()
    throws UnsupportedOperationException
  {
    throw new UnsupportedOperationException("Remove not supported");
  }
}
