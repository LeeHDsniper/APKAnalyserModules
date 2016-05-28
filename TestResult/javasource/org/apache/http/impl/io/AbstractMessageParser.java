package org.apache.http.impl.io;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.Header;
import org.apache.http.HttpException;
import org.apache.http.HttpMessage;
import org.apache.http.MessageConstraintException;
import org.apache.http.ParseException;
import org.apache.http.ProtocolException;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.config.MessageConstraints;
import org.apache.http.io.HttpMessageParser;
import org.apache.http.io.SessionInputBuffer;
import org.apache.http.message.BasicLineParser;
import org.apache.http.message.LineParser;
import org.apache.http.params.HttpParamConfig;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;

@NotThreadSafe
public abstract class AbstractMessageParser<T extends HttpMessage>
  implements HttpMessageParser<T>
{
  private static final int HEADERS = 1;
  private static final int HEAD_LINE = 0;
  private final List<CharArrayBuffer> headerLines;
  protected final LineParser lineParser;
  private T message;
  private final MessageConstraints messageConstraints;
  private final SessionInputBuffer sessionBuffer;
  private int state;
  
  public AbstractMessageParser(SessionInputBuffer paramSessionInputBuffer, LineParser paramLineParser, MessageConstraints paramMessageConstraints)
  {
    sessionBuffer = ((SessionInputBuffer)Args.notNull(paramSessionInputBuffer, "Session input buffer"));
    if (paramLineParser != null)
    {
      lineParser = paramLineParser;
      if (paramMessageConstraints == null) {
        break label59;
      }
    }
    for (;;)
    {
      messageConstraints = paramMessageConstraints;
      headerLines = new ArrayList();
      state = 0;
      return;
      paramLineParser = BasicLineParser.INSTANCE;
      break;
      label59:
      paramMessageConstraints = MessageConstraints.DEFAULT;
    }
  }
  
  @Deprecated
  public AbstractMessageParser(SessionInputBuffer paramSessionInputBuffer, LineParser paramLineParser, HttpParams paramHttpParams)
  {
    Args.notNull(paramSessionInputBuffer, "Session input buffer");
    Args.notNull(paramHttpParams, "HTTP parameters");
    sessionBuffer = paramSessionInputBuffer;
    messageConstraints = HttpParamConfig.getMessageConstraints(paramHttpParams);
    if (paramLineParser != null) {}
    for (;;)
    {
      lineParser = paramLineParser;
      headerLines = new ArrayList();
      state = 0;
      return;
      paramLineParser = BasicLineParser.INSTANCE;
    }
  }
  
  public static Header[] parseHeaders(SessionInputBuffer paramSessionInputBuffer, int paramInt1, int paramInt2, LineParser paramLineParser)
    throws HttpException, IOException
  {
    ArrayList localArrayList = new ArrayList();
    if (paramLineParser != null) {}
    for (;;)
    {
      return parseHeaders(paramSessionInputBuffer, paramInt1, paramInt2, paramLineParser, localArrayList);
      paramLineParser = BasicLineParser.INSTANCE;
    }
  }
  
  public static Header[] parseHeaders(SessionInputBuffer paramSessionInputBuffer, int paramInt1, int paramInt2, LineParser paramLineParser, List<CharArrayBuffer> paramList)
    throws HttpException, IOException
  {
    Args.notNull(paramSessionInputBuffer, "Session input buffer");
    Args.notNull(paramLineParser, "Line parser");
    Args.notNull(paramList, "Header line list");
    Object localObject2 = null;
    Object localObject3 = null;
    if (localObject2 == null) {}
    for (Object localObject1 = new CharArrayBuffer(64); (paramSessionInputBuffer.readLine((CharArrayBuffer)localObject1) == -1) || (((CharArrayBuffer)localObject1).length() < 1); localObject1 = localObject2)
    {
      paramSessionInputBuffer = new Header[paramList.size()];
      paramInt1 = 0;
      while (paramInt1 < paramList.size())
      {
        localObject1 = (CharArrayBuffer)paramList.get(paramInt1);
        try
        {
          paramSessionInputBuffer[paramInt1] = paramLineParser.parseHeader((CharArrayBuffer)localObject1);
          paramInt1 += 1;
        }
        catch (ParseException paramSessionInputBuffer)
        {
          int i;
          Object localObject4;
          throw new ProtocolException(paramSessionInputBuffer.getMessage());
        }
      }
      localObject2.clear();
    }
    if (((((CharArrayBuffer)localObject1).charAt(0) == ' ') || (((CharArrayBuffer)localObject1).charAt(0) == '\t')) && (localObject3 != null))
    {
      i = 0;
      for (;;)
      {
        if (i < ((CharArrayBuffer)localObject1).length())
        {
          int j = ((CharArrayBuffer)localObject1).charAt(i);
          if ((j == 32) || (j == 9)) {}
        }
        else
        {
          if ((paramInt2 <= 0) || (localObject3.length() + 1 + ((CharArrayBuffer)localObject1).length() - i <= paramInt2)) {
            break;
          }
          throw new MessageConstraintException("Maximum line length limit exceeded");
        }
        i += 1;
      }
      localObject3.append(' ');
      localObject3.append((CharArrayBuffer)localObject1, i, ((CharArrayBuffer)localObject1).length() - i);
      localObject4 = localObject3;
    }
    for (;;)
    {
      localObject2 = localObject1;
      localObject3 = localObject4;
      if (paramInt1 <= 0) {
        break;
      }
      localObject2 = localObject1;
      localObject3 = localObject4;
      if (paramList.size() < paramInt1) {
        break;
      }
      throw new MessageConstraintException("Maximum header count exceeded");
      paramList.add(localObject1);
      localObject4 = localObject1;
      localObject1 = null;
    }
    return paramSessionInputBuffer;
  }
  
  public T parse()
    throws IOException, HttpException
  {
    switch (state)
    {
    default: 
      throw new IllegalStateException("Inconsistent parser state");
    }
    try
    {
      message = parseHead(sessionBuffer);
      state = 1;
      Object localObject = parseHeaders(sessionBuffer, messageConstraints.getMaxHeaderCount(), messageConstraints.getMaxLineLength(), lineParser, headerLines);
      message.setHeaders((Header[])localObject);
      localObject = message;
      message = null;
      headerLines.clear();
      state = 0;
      return localObject;
    }
    catch (ParseException localParseException)
    {
      throw new ProtocolException(localParseException.getMessage(), localParseException);
    }
  }
  
  protected abstract T parseHead(SessionInputBuffer paramSessionInputBuffer)
    throws IOException, HttpException, ParseException;
}
