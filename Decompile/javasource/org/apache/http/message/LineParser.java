package org.apache.http.message;

import org.apache.http.Header;
import org.apache.http.ParseException;
import org.apache.http.ProtocolVersion;
import org.apache.http.RequestLine;
import org.apache.http.StatusLine;
import org.apache.http.util.CharArrayBuffer;

public abstract interface LineParser
{
  public abstract boolean hasProtocolVersion(CharArrayBuffer paramCharArrayBuffer, ParserCursor paramParserCursor);
  
  public abstract Header parseHeader(CharArrayBuffer paramCharArrayBuffer)
    throws ParseException;
  
  public abstract ProtocolVersion parseProtocolVersion(CharArrayBuffer paramCharArrayBuffer, ParserCursor paramParserCursor)
    throws ParseException;
  
  public abstract RequestLine parseRequestLine(CharArrayBuffer paramCharArrayBuffer, ParserCursor paramParserCursor)
    throws ParseException;
  
  public abstract StatusLine parseStatusLine(CharArrayBuffer paramCharArrayBuffer, ParserCursor paramParserCursor)
    throws ParseException;
}
