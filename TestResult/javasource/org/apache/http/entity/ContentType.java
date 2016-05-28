package org.apache.http.entity;

import java.io.Serializable;
import java.nio.charset.Charset;
import java.nio.charset.UnsupportedCharsetException;
import java.util.Locale;
import org.apache.http.Consts;
import org.apache.http.Header;
import org.apache.http.HeaderElement;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.annotation.Immutable;
import org.apache.http.message.BasicHeaderValueFormatter;
import org.apache.http.message.BasicHeaderValueParser;
import org.apache.http.message.ParserCursor;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;
import org.apache.http.util.TextUtils;

@Immutable
public final class ContentType
  implements Serializable
{
  public static final ContentType APPLICATION_ATOM_XML = create("application/atom+xml", Consts.ISO_8859_1);
  public static final ContentType APPLICATION_FORM_URLENCODED = create("application/x-www-form-urlencoded", Consts.ISO_8859_1);
  public static final ContentType APPLICATION_JSON = create("application/json", Consts.UTF_8);
  public static final ContentType APPLICATION_OCTET_STREAM = create("application/octet-stream", (Charset)null);
  public static final ContentType APPLICATION_SVG_XML = create("application/svg+xml", Consts.ISO_8859_1);
  public static final ContentType APPLICATION_XHTML_XML = create("application/xhtml+xml", Consts.ISO_8859_1);
  public static final ContentType APPLICATION_XML = create("application/xml", Consts.ISO_8859_1);
  public static final ContentType DEFAULT_BINARY = APPLICATION_OCTET_STREAM;
  public static final ContentType DEFAULT_TEXT;
  public static final ContentType MULTIPART_FORM_DATA = create("multipart/form-data", Consts.ISO_8859_1);
  public static final ContentType TEXT_HTML = create("text/html", Consts.ISO_8859_1);
  public static final ContentType TEXT_PLAIN = create("text/plain", Consts.ISO_8859_1);
  public static final ContentType TEXT_XML = create("text/xml", Consts.ISO_8859_1);
  public static final ContentType WILDCARD = create("*/*", (Charset)null);
  private static final long serialVersionUID = -7768694718232371896L;
  private final Charset charset;
  private final String mimeType;
  private final NameValuePair[] params;
  
  static
  {
    DEFAULT_TEXT = TEXT_PLAIN;
  }
  
  ContentType(String paramString, Charset paramCharset)
  {
    mimeType = paramString;
    charset = paramCharset;
    params = null;
  }
  
  ContentType(String paramString, NameValuePair[] paramArrayOfNameValuePair)
    throws UnsupportedCharsetException
  {
    mimeType = paramString;
    params = paramArrayOfNameValuePair;
    paramString = getParameter("charset");
    if (!TextUtils.isBlank(paramString)) {}
    for (paramString = Charset.forName(paramString);; paramString = null)
    {
      charset = paramString;
      return;
    }
  }
  
  public static ContentType create(String paramString)
  {
    return new ContentType(paramString, (Charset)null);
  }
  
  public static ContentType create(String paramString1, String paramString2)
    throws UnsupportedCharsetException
  {
    if (!TextUtils.isBlank(paramString2)) {}
    for (paramString2 = Charset.forName(paramString2);; paramString2 = null) {
      return create(paramString1, paramString2);
    }
  }
  
  public static ContentType create(String paramString, Charset paramCharset)
  {
    paramString = ((String)Args.notBlank(paramString, "MIME type")).toLowerCase(Locale.US);
    Args.check(valid(paramString), "MIME type may not contain reserved characters");
    return new ContentType(paramString, paramCharset);
  }
  
  private static ContentType create(HeaderElement paramHeaderElement)
  {
    String str = paramHeaderElement.getName();
    paramHeaderElement = paramHeaderElement.getParameters();
    if ((paramHeaderElement != null) && (paramHeaderElement.length > 0)) {}
    for (;;)
    {
      return new ContentType(str, paramHeaderElement);
      paramHeaderElement = null;
    }
  }
  
  public static ContentType get(HttpEntity paramHttpEntity)
    throws ParseException, UnsupportedCharsetException
  {
    if (paramHttpEntity == null) {}
    do
    {
      do
      {
        return null;
        paramHttpEntity = paramHttpEntity.getContentType();
      } while (paramHttpEntity == null);
      paramHttpEntity = paramHttpEntity.getElements();
    } while (paramHttpEntity.length <= 0);
    return create(paramHttpEntity[0]);
  }
  
  public static ContentType getOrDefault(HttpEntity paramHttpEntity)
    throws ParseException, UnsupportedCharsetException
  {
    paramHttpEntity = get(paramHttpEntity);
    if (paramHttpEntity != null) {
      return paramHttpEntity;
    }
    return DEFAULT_TEXT;
  }
  
  public static ContentType parse(String paramString)
    throws ParseException, UnsupportedCharsetException
  {
    Args.notNull(paramString, "Content type");
    Object localObject = new CharArrayBuffer(paramString.length());
    ((CharArrayBuffer)localObject).append(paramString);
    ParserCursor localParserCursor = new ParserCursor(0, paramString.length());
    localObject = BasicHeaderValueParser.INSTANCE.parseElements((CharArrayBuffer)localObject, localParserCursor);
    if (localObject.length > 0) {
      return create(localObject[0]);
    }
    throw new ParseException("Invalid content type: " + paramString);
  }
  
  private static boolean valid(String paramString)
  {
    int i = 0;
    while (i < paramString.length())
    {
      int j = paramString.charAt(i);
      if ((j == 34) || (j == 44) || (j == 59)) {
        return false;
      }
      i += 1;
    }
    return true;
  }
  
  public Charset getCharset()
  {
    return charset;
  }
  
  public String getMimeType()
  {
    return mimeType;
  }
  
  public String getParameter(String paramString)
  {
    Args.notEmpty(paramString, "Parameter name");
    if (params == null) {}
    for (;;)
    {
      return null;
      NameValuePair[] arrayOfNameValuePair = params;
      int j = arrayOfNameValuePair.length;
      int i = 0;
      while (i < j)
      {
        NameValuePair localNameValuePair = arrayOfNameValuePair[i];
        if (localNameValuePair.getName().equalsIgnoreCase(paramString)) {
          return localNameValuePair.getValue();
        }
        i += 1;
      }
    }
  }
  
  public String toString()
  {
    CharArrayBuffer localCharArrayBuffer = new CharArrayBuffer(64);
    localCharArrayBuffer.append(mimeType);
    if (params != null)
    {
      localCharArrayBuffer.append("; ");
      BasicHeaderValueFormatter.INSTANCE.formatParameters(localCharArrayBuffer, params, false);
    }
    for (;;)
    {
      return localCharArrayBuffer.toString();
      if (charset != null)
      {
        localCharArrayBuffer.append("; charset=");
        localCharArrayBuffer.append(charset.name());
      }
    }
  }
  
  public ContentType withCharset(String paramString)
  {
    return create(getMimeType(), paramString);
  }
  
  public ContentType withCharset(Charset paramCharset)
  {
    return create(getMimeType(), paramCharset);
  }
}
