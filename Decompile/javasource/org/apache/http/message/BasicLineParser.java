package org.apache.http.message;

import org.apache.http.Header;
import org.apache.http.HttpVersion;
import org.apache.http.ParseException;
import org.apache.http.ProtocolVersion;
import org.apache.http.RequestLine;
import org.apache.http.StatusLine;
import org.apache.http.annotation.Immutable;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;

@Immutable
public class BasicLineParser
  implements LineParser
{
  @Deprecated
  public static final BasicLineParser DEFAULT = new BasicLineParser();
  public static final BasicLineParser INSTANCE = new BasicLineParser();
  protected final ProtocolVersion protocol;
  
  public BasicLineParser()
  {
    this(null);
  }
  
  public BasicLineParser(ProtocolVersion paramProtocolVersion)
  {
    if (paramProtocolVersion != null) {}
    for (;;)
    {
      protocol = paramProtocolVersion;
      return;
      paramProtocolVersion = HttpVersion.HTTP_1_1;
    }
  }
  
  public static Header parseHeader(String paramString, LineParser paramLineParser)
    throws ParseException
  {
    Args.notNull(paramString, "Value");
    CharArrayBuffer localCharArrayBuffer = new CharArrayBuffer(paramString.length());
    localCharArrayBuffer.append(paramString);
    if (paramLineParser != null) {}
    for (;;)
    {
      return paramLineParser.parseHeader(localCharArrayBuffer);
      paramLineParser = INSTANCE;
    }
  }
  
  public static ProtocolVersion parseProtocolVersion(String paramString, LineParser paramLineParser)
    throws ParseException
  {
    Args.notNull(paramString, "Value");
    CharArrayBuffer localCharArrayBuffer = new CharArrayBuffer(paramString.length());
    localCharArrayBuffer.append(paramString);
    paramString = new ParserCursor(0, paramString.length());
    if (paramLineParser != null) {}
    for (;;)
    {
      return paramLineParser.parseProtocolVersion(localCharArrayBuffer, paramString);
      paramLineParser = INSTANCE;
    }
  }
  
  public static RequestLine parseRequestLine(String paramString, LineParser paramLineParser)
    throws ParseException
  {
    Args.notNull(paramString, "Value");
    CharArrayBuffer localCharArrayBuffer = new CharArrayBuffer(paramString.length());
    localCharArrayBuffer.append(paramString);
    paramString = new ParserCursor(0, paramString.length());
    if (paramLineParser != null) {}
    for (;;)
    {
      return paramLineParser.parseRequestLine(localCharArrayBuffer, paramString);
      paramLineParser = INSTANCE;
    }
  }
  
  public static StatusLine parseStatusLine(String paramString, LineParser paramLineParser)
    throws ParseException
  {
    Args.notNull(paramString, "Value");
    CharArrayBuffer localCharArrayBuffer = new CharArrayBuffer(paramString.length());
    localCharArrayBuffer.append(paramString);
    paramString = new ParserCursor(0, paramString.length());
    if (paramLineParser != null) {}
    for (;;)
    {
      return paramLineParser.parseStatusLine(localCharArrayBuffer, paramString);
      paramLineParser = INSTANCE;
    }
  }
  
  protected ProtocolVersion createProtocolVersion(int paramInt1, int paramInt2)
  {
    return protocol.forVersion(paramInt1, paramInt2);
  }
  
  protected RequestLine createRequestLine(String paramString1, String paramString2, ProtocolVersion paramProtocolVersion)
  {
    return new BasicRequestLine(paramString1, paramString2, paramProtocolVersion);
  }
  
  protected StatusLine createStatusLine(ProtocolVersion paramProtocolVersion, int paramInt, String paramString)
  {
    return new BasicStatusLine(paramProtocolVersion, paramInt, paramString);
  }
  
  public boolean hasProtocolVersion(CharArrayBuffer paramCharArrayBuffer, ParserCursor paramParserCursor)
  {
    Args.notNull(paramCharArrayBuffer, "Char array buffer");
    Args.notNull(paramParserCursor, "Parser cursor");
    int j = paramParserCursor.getPos();
    paramParserCursor = protocol.getProtocol();
    int k = paramParserCursor.length();
    if (paramCharArrayBuffer.length() < k + 4) {
      break label62;
    }
    int i;
    label62:
    while (i + k + 4 > paramCharArrayBuffer.length())
    {
      return false;
      if (j >= 0) {
        break;
      }
      i = paramCharArrayBuffer.length() - 4 - k;
    }
    boolean bool1 = true;
    j = 0;
    label81:
    if ((bool1) && (j < k))
    {
      if (paramCharArrayBuffer.charAt(i + j) == paramParserCursor.charAt(j)) {}
      for (bool1 = true;; bool1 = false)
      {
        j += 1;
        break label81;
        i = j;
        if (j != 0) {
          break;
        }
        for (;;)
        {
          i = j;
          if (j >= paramCharArrayBuffer.length()) {
            break;
          }
          i = j;
          if (!HTTP.isWhitespace(paramCharArrayBuffer.charAt(j))) {
            break;
          }
          j += 1;
        }
      }
    }
    boolean bool2 = bool1;
    if (bool1) {
      if (paramCharArrayBuffer.charAt(i + k) != '/') {
        break label200;
      }
    }
    label200:
    for (bool2 = true;; bool2 = false) {
      return bool2;
    }
  }
  
  public Header parseHeader(CharArrayBuffer paramCharArrayBuffer)
    throws ParseException
  {
    return new BufferedHeader(paramCharArrayBuffer);
  }
  
  /* Error */
  public ProtocolVersion parseProtocolVersion(CharArrayBuffer paramCharArrayBuffer, ParserCursor paramParserCursor)
    throws ParseException
  {
    // Byte code:
    //   0: aload_1
    //   1: ldc 111
    //   3: invokestatic 47	org/apache/http/util/Args:notNull	(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    //   6: pop
    //   7: aload_2
    //   8: ldc 113
    //   10: invokestatic 47	org/apache/http/util/Args:notNull	(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    //   13: pop
    //   14: aload_0
    //   15: getfield 29	org/apache/http/message/BasicLineParser:protocol	Lorg/apache/http/ProtocolVersion;
    //   18: invokevirtual 120	org/apache/http/ProtocolVersion:getProtocol	()Ljava/lang/String;
    //   21: astore 9
    //   23: aload 9
    //   25: invokevirtual 55	java/lang/String:length	()I
    //   28: istore 7
    //   30: aload_2
    //   31: invokevirtual 116	org/apache/http/message/ParserCursor:getPos	()I
    //   34: istore 6
    //   36: aload_2
    //   37: invokevirtual 142	org/apache/http/message/ParserCursor:getUpperBound	()I
    //   40: istore 5
    //   42: aload_0
    //   43: aload_1
    //   44: aload_2
    //   45: invokevirtual 146	org/apache/http/message/BasicLineParser:skipWhitespace	(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/message/ParserCursor;)V
    //   48: aload_2
    //   49: invokevirtual 116	org/apache/http/message/ParserCursor:getPos	()I
    //   52: istore 8
    //   54: iload 8
    //   56: iload 7
    //   58: iadd
    //   59: iconst_4
    //   60: iadd
    //   61: iload 5
    //   63: if_icmple +37 -> 100
    //   66: new 39	org/apache/http/ParseException
    //   69: dup
    //   70: new 148	java/lang/StringBuilder
    //   73: dup
    //   74: invokespecial 149	java/lang/StringBuilder:<init>	()V
    //   77: ldc -105
    //   79: invokevirtual 154	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   82: aload_1
    //   83: iload 6
    //   85: iload 5
    //   87: invokevirtual 158	org/apache/http/util/CharArrayBuffer:substring	(II)Ljava/lang/String;
    //   90: invokevirtual 154	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   93: invokevirtual 161	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   96: invokespecial 163	org/apache/http/ParseException:<init>	(Ljava/lang/String;)V
    //   99: athrow
    //   100: iconst_1
    //   101: istore_3
    //   102: iconst_0
    //   103: istore 4
    //   105: iload_3
    //   106: ifeq +45 -> 151
    //   109: iload 4
    //   111: iload 7
    //   113: if_icmpge +38 -> 151
    //   116: aload_1
    //   117: iload 8
    //   119: iload 4
    //   121: iadd
    //   122: invokevirtual 125	org/apache/http/util/CharArrayBuffer:charAt	(I)C
    //   125: aload 9
    //   127: iload 4
    //   129: invokevirtual 126	java/lang/String:charAt	(I)C
    //   132: if_icmpne +14 -> 146
    //   135: iconst_1
    //   136: istore_3
    //   137: iload 4
    //   139: iconst_1
    //   140: iadd
    //   141: istore 4
    //   143: goto -38 -> 105
    //   146: iconst_0
    //   147: istore_3
    //   148: goto -11 -> 137
    //   151: iload_3
    //   152: istore 4
    //   154: iload_3
    //   155: ifeq +20 -> 175
    //   158: aload_1
    //   159: iload 8
    //   161: iload 7
    //   163: iadd
    //   164: invokevirtual 125	org/apache/http/util/CharArrayBuffer:charAt	(I)C
    //   167: bipush 47
    //   169: if_icmpne +45 -> 214
    //   172: iconst_1
    //   173: istore 4
    //   175: iload 4
    //   177: ifne +43 -> 220
    //   180: new 39	org/apache/http/ParseException
    //   183: dup
    //   184: new 148	java/lang/StringBuilder
    //   187: dup
    //   188: invokespecial 149	java/lang/StringBuilder:<init>	()V
    //   191: ldc -105
    //   193: invokevirtual 154	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   196: aload_1
    //   197: iload 6
    //   199: iload 5
    //   201: invokevirtual 158	org/apache/http/util/CharArrayBuffer:substring	(II)Ljava/lang/String;
    //   204: invokevirtual 154	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   207: invokevirtual 161	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   210: invokespecial 163	org/apache/http/ParseException:<init>	(Ljava/lang/String;)V
    //   213: athrow
    //   214: iconst_0
    //   215: istore 4
    //   217: goto -42 -> 175
    //   220: iload 8
    //   222: iload 7
    //   224: iconst_1
    //   225: iadd
    //   226: iadd
    //   227: istore 4
    //   229: aload_1
    //   230: bipush 46
    //   232: iload 4
    //   234: iload 5
    //   236: invokevirtual 167	org/apache/http/util/CharArrayBuffer:indexOf	(III)I
    //   239: istore_3
    //   240: iload_3
    //   241: iconst_m1
    //   242: if_icmpne +37 -> 279
    //   245: new 39	org/apache/http/ParseException
    //   248: dup
    //   249: new 148	java/lang/StringBuilder
    //   252: dup
    //   253: invokespecial 149	java/lang/StringBuilder:<init>	()V
    //   256: ldc -87
    //   258: invokevirtual 154	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   261: aload_1
    //   262: iload 6
    //   264: iload 5
    //   266: invokevirtual 158	org/apache/http/util/CharArrayBuffer:substring	(II)Ljava/lang/String;
    //   269: invokevirtual 154	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   272: invokevirtual 161	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   275: invokespecial 163	org/apache/http/ParseException:<init>	(Ljava/lang/String;)V
    //   278: athrow
    //   279: aload_1
    //   280: iload 4
    //   282: iload_3
    //   283: invokevirtual 172	org/apache/http/util/CharArrayBuffer:substringTrimmed	(II)Ljava/lang/String;
    //   286: invokestatic 178	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   289: istore 7
    //   291: iload_3
    //   292: iconst_1
    //   293: iadd
    //   294: istore 8
    //   296: aload_1
    //   297: bipush 32
    //   299: iload 8
    //   301: iload 5
    //   303: invokevirtual 167	org/apache/http/util/CharArrayBuffer:indexOf	(III)I
    //   306: istore 4
    //   308: iload 4
    //   310: istore_3
    //   311: iload 4
    //   313: iconst_m1
    //   314: if_icmpne +6 -> 320
    //   317: iload 5
    //   319: istore_3
    //   320: aload_1
    //   321: iload 8
    //   323: iload_3
    //   324: invokevirtual 172	org/apache/http/util/CharArrayBuffer:substringTrimmed	(II)Ljava/lang/String;
    //   327: invokestatic 178	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   330: istore 4
    //   332: aload_2
    //   333: iload_3
    //   334: invokevirtual 181	org/apache/http/message/ParserCursor:updatePos	(I)V
    //   337: aload_0
    //   338: iload 7
    //   340: iload 4
    //   342: invokevirtual 183	org/apache/http/message/BasicLineParser:createProtocolVersion	(II)Lorg/apache/http/ProtocolVersion;
    //   345: areturn
    //   346: astore_2
    //   347: new 39	org/apache/http/ParseException
    //   350: dup
    //   351: new 148	java/lang/StringBuilder
    //   354: dup
    //   355: invokespecial 149	java/lang/StringBuilder:<init>	()V
    //   358: ldc -71
    //   360: invokevirtual 154	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   363: aload_1
    //   364: iload 6
    //   366: iload 5
    //   368: invokevirtual 158	org/apache/http/util/CharArrayBuffer:substring	(II)Ljava/lang/String;
    //   371: invokevirtual 154	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   374: invokevirtual 161	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   377: invokespecial 163	org/apache/http/ParseException:<init>	(Ljava/lang/String;)V
    //   380: athrow
    //   381: astore_2
    //   382: new 39	org/apache/http/ParseException
    //   385: dup
    //   386: new 148	java/lang/StringBuilder
    //   389: dup
    //   390: invokespecial 149	java/lang/StringBuilder:<init>	()V
    //   393: ldc -69
    //   395: invokevirtual 154	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   398: aload_1
    //   399: iload 6
    //   401: iload 5
    //   403: invokevirtual 158	org/apache/http/util/CharArrayBuffer:substring	(II)Ljava/lang/String;
    //   406: invokevirtual 154	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   409: invokevirtual 161	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   412: invokespecial 163	org/apache/http/ParseException:<init>	(Ljava/lang/String;)V
    //   415: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	416	0	this	BasicLineParser
    //   0	416	1	paramCharArrayBuffer	CharArrayBuffer
    //   0	416	2	paramParserCursor	ParserCursor
    //   101	233	3	i	int
    //   103	238	4	j	int
    //   40	362	5	k	int
    //   34	366	6	m	int
    //   28	311	7	n	int
    //   52	270	8	i1	int
    //   21	105	9	str	String
    // Exception table:
    //   from	to	target	type
    //   279	291	346	java/lang/NumberFormatException
    //   320	332	381	java/lang/NumberFormatException
  }
  
  public RequestLine parseRequestLine(CharArrayBuffer paramCharArrayBuffer, ParserCursor paramParserCursor)
    throws ParseException
  {
    Args.notNull(paramCharArrayBuffer, "Char array buffer");
    Args.notNull(paramParserCursor, "Parser cursor");
    int i = paramParserCursor.getPos();
    int j = paramParserCursor.getUpperBound();
    try
    {
      skipWhitespace(paramCharArrayBuffer, paramParserCursor);
      k = paramParserCursor.getPos();
      m = paramCharArrayBuffer.indexOf(32, k, j);
      if (m < 0) {
        throw new ParseException("Invalid request line: " + paramCharArrayBuffer.substring(i, j));
      }
    }
    catch (IndexOutOfBoundsException paramParserCursor)
    {
      throw new ParseException("Invalid request line: " + paramCharArrayBuffer.substring(i, j));
    }
    String str1 = paramCharArrayBuffer.substringTrimmed(k, m);
    paramParserCursor.updatePos(m);
    skipWhitespace(paramCharArrayBuffer, paramParserCursor);
    int k = paramParserCursor.getPos();
    int m = paramCharArrayBuffer.indexOf(32, k, j);
    if (m < 0) {
      throw new ParseException("Invalid request line: " + paramCharArrayBuffer.substring(i, j));
    }
    String str2 = paramCharArrayBuffer.substringTrimmed(k, m);
    paramParserCursor.updatePos(m);
    ProtocolVersion localProtocolVersion = parseProtocolVersion(paramCharArrayBuffer, paramParserCursor);
    skipWhitespace(paramCharArrayBuffer, paramParserCursor);
    if (!paramParserCursor.atEnd()) {
      throw new ParseException("Invalid request line: " + paramCharArrayBuffer.substring(i, j));
    }
    paramParserCursor = createRequestLine(str1, str2, localProtocolVersion);
    return paramParserCursor;
  }
  
  public StatusLine parseStatusLine(CharArrayBuffer paramCharArrayBuffer, ParserCursor paramParserCursor)
    throws ParseException
  {
    Args.notNull(paramCharArrayBuffer, "Char array buffer");
    Args.notNull(paramParserCursor, "Parser cursor");
    int m = paramParserCursor.getPos();
    int k = paramParserCursor.getUpperBound();
    ProtocolVersion localProtocolVersion;
    int j;
    int i;
    for (;;)
    {
      try
      {
        localProtocolVersion = parseProtocolVersion(paramCharArrayBuffer, paramParserCursor);
        skipWhitespace(paramCharArrayBuffer, paramParserCursor);
        int n = paramParserCursor.getPos();
        j = paramCharArrayBuffer.indexOf(32, n, k);
        i = j;
        if (j < 0) {
          i = k;
        }
        paramParserCursor = paramCharArrayBuffer.substringTrimmed(n, i);
        j = 0;
        if (j >= paramParserCursor.length()) {
          break;
        }
        if (!Character.isDigit(paramParserCursor.charAt(j))) {
          throw new ParseException("Status line contains invalid status code: " + paramCharArrayBuffer.substring(m, k));
        }
      }
      catch (IndexOutOfBoundsException paramParserCursor)
      {
        throw new ParseException("Invalid status line: " + paramCharArrayBuffer.substring(m, k));
      }
      j += 1;
    }
    for (;;)
    {
      try
      {
        j = Integer.parseInt(paramParserCursor);
        if (i < k)
        {
          paramParserCursor = paramCharArrayBuffer.substringTrimmed(i, k);
          return createStatusLine(localProtocolVersion, j, paramParserCursor);
        }
      }
      catch (NumberFormatException paramParserCursor)
      {
        throw new ParseException("Status line contains invalid status code: " + paramCharArrayBuffer.substring(m, k));
      }
      paramParserCursor = "";
    }
  }
  
  protected void skipWhitespace(CharArrayBuffer paramCharArrayBuffer, ParserCursor paramParserCursor)
  {
    int i = paramParserCursor.getPos();
    int j = paramParserCursor.getUpperBound();
    while ((i < j) && (HTTP.isWhitespace(paramCharArrayBuffer.charAt(i)))) {
      i += 1;
    }
    paramParserCursor.updatePos(i);
  }
}
