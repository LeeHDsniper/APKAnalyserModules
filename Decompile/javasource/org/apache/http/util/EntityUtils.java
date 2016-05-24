package org.apache.http.util;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import org.apache.http.Header;
import org.apache.http.HeaderElement;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;

public final class EntityUtils
{
  private EntityUtils() {}
  
  public static void consume(HttpEntity paramHttpEntity)
    throws IOException
  {
    if (paramHttpEntity == null) {}
    do
    {
      do
      {
        return;
      } while (!paramHttpEntity.isStreaming());
      paramHttpEntity = paramHttpEntity.getContent();
    } while (paramHttpEntity == null);
    paramHttpEntity.close();
  }
  
  public static void consumeQuietly(HttpEntity paramHttpEntity)
  {
    try
    {
      consume(paramHttpEntity);
      return;
    }
    catch (IOException paramHttpEntity) {}
  }
  
  @Deprecated
  public static String getContentCharSet(HttpEntity paramHttpEntity)
    throws ParseException
  {
    Args.notNull(paramHttpEntity, "Entity");
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if (paramHttpEntity.getContentType() != null)
    {
      paramHttpEntity = paramHttpEntity.getContentType().getElements();
      localObject1 = localObject2;
      if (paramHttpEntity.length > 0)
      {
        paramHttpEntity = paramHttpEntity[0].getParameterByName("charset");
        localObject1 = localObject2;
        if (paramHttpEntity != null) {
          localObject1 = paramHttpEntity.getValue();
        }
      }
    }
    return localObject1;
  }
  
  @Deprecated
  public static String getContentMimeType(HttpEntity paramHttpEntity)
    throws ParseException
  {
    Args.notNull(paramHttpEntity, "Entity");
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if (paramHttpEntity.getContentType() != null)
    {
      paramHttpEntity = paramHttpEntity.getContentType().getElements();
      localObject1 = localObject2;
      if (paramHttpEntity.length > 0) {
        localObject1 = paramHttpEntity[0].getName();
      }
    }
    return localObject1;
  }
  
  public static byte[] toByteArray(HttpEntity paramHttpEntity)
    throws IOException
  {
    boolean bool = false;
    Args.notNull(paramHttpEntity, "Entity");
    InputStream localInputStream = paramHttpEntity.getContent();
    if (localInputStream == null) {
      return null;
    }
    try
    {
      if (paramHttpEntity.getContentLength() <= 2147483647L) {
        bool = true;
      }
      Args.check(bool, "HTTP entity too large to be buffered in memory");
      int j = (int)paramHttpEntity.getContentLength();
      int i = j;
      if (j < 0) {
        i = 4096;
      }
      paramHttpEntity = new ByteArrayBuffer(i);
      byte[] arrayOfByte = new byte['က'];
      for (;;)
      {
        i = localInputStream.read(arrayOfByte);
        if (i == -1) {
          break;
        }
        paramHttpEntity.append(arrayOfByte, 0, i);
      }
      paramHttpEntity = paramHttpEntity.toByteArray();
    }
    finally
    {
      localInputStream.close();
    }
    localInputStream.close();
    return paramHttpEntity;
  }
  
  public static String toString(HttpEntity paramHttpEntity)
    throws IOException, ParseException
  {
    return toString(paramHttpEntity, (Charset)null);
  }
  
  public static String toString(HttpEntity paramHttpEntity, String paramString)
    throws IOException, ParseException
  {
    if (paramString != null) {}
    for (paramString = Charset.forName(paramString);; paramString = null) {
      return toString(paramHttpEntity, paramString);
    }
  }
  
  /* Error */
  public static String toString(HttpEntity paramHttpEntity, Charset paramCharset)
    throws IOException, ParseException
  {
    // Byte code:
    //   0: iconst_0
    //   1: istore 4
    //   3: aload_0
    //   4: ldc 39
    //   6: invokestatic 45	org/apache/http/util/Args:notNull	(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    //   9: pop
    //   10: aload_0
    //   11: invokeinterface 23 1 0
    //   16: astore 8
    //   18: aload 8
    //   20: ifnonnull +5 -> 25
    //   23: aconst_null
    //   24: areturn
    //   25: aload_0
    //   26: invokeinterface 80 1 0
    //   31: ldc2_w 81
    //   34: lcmp
    //   35: ifgt +6 -> 41
    //   38: iconst_1
    //   39: istore 4
    //   41: iload 4
    //   43: ldc 84
    //   45: invokestatic 88	org/apache/http/util/Args:check	(ZLjava/lang/String;)V
    //   48: aload_0
    //   49: invokeinterface 80 1 0
    //   54: lstore 5
    //   56: lload 5
    //   58: l2i
    //   59: istore_3
    //   60: iload_3
    //   61: istore_2
    //   62: iload_3
    //   63: ifge +7 -> 70
    //   66: sipush 4096
    //   69: istore_2
    //   70: aconst_null
    //   71: astore 7
    //   73: aload_0
    //   74: invokestatic 123	org/apache/http/entity/ContentType:get	(Lorg/apache/http/HttpEntity;)Lorg/apache/http/entity/ContentType;
    //   77: astore 9
    //   79: aload 7
    //   81: astore_0
    //   82: aload 9
    //   84: ifnull +9 -> 93
    //   87: aload 9
    //   89: invokevirtual 127	org/apache/http/entity/ContentType:getCharset	()Ljava/nio/charset/Charset;
    //   92: astore_0
    //   93: aload_0
    //   94: astore 7
    //   96: aload_0
    //   97: ifnonnull +6 -> 103
    //   100: aload_1
    //   101: astore 7
    //   103: aload 7
    //   105: astore_0
    //   106: aload 7
    //   108: ifnonnull +7 -> 115
    //   111: getstatic 133	org/apache/http/protocol/HTTP:DEF_CONTENT_CHARSET	Ljava/nio/charset/Charset;
    //   114: astore_0
    //   115: new 135	java/io/InputStreamReader
    //   118: dup
    //   119: aload 8
    //   121: aload_0
    //   122: invokespecial 138	java/io/InputStreamReader:<init>	(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V
    //   125: astore_0
    //   126: new 140	org/apache/http/util/CharArrayBuffer
    //   129: dup
    //   130: iload_2
    //   131: invokespecial 141	org/apache/http/util/CharArrayBuffer:<init>	(I)V
    //   134: astore_1
    //   135: sipush 1024
    //   138: newarray char
    //   140: astore 7
    //   142: aload_0
    //   143: aload 7
    //   145: invokevirtual 146	java/io/Reader:read	([C)I
    //   148: istore_2
    //   149: iload_2
    //   150: iconst_m1
    //   151: if_icmpeq +35 -> 186
    //   154: aload_1
    //   155: aload 7
    //   157: iconst_0
    //   158: iload_2
    //   159: invokevirtual 149	org/apache/http/util/CharArrayBuffer:append	([CII)V
    //   162: goto -20 -> 142
    //   165: astore_0
    //   166: aload 8
    //   168: invokevirtual 28	java/io/InputStream:close	()V
    //   171: aload_0
    //   172: athrow
    //   173: astore_0
    //   174: new 151	java/io/UnsupportedEncodingException
    //   177: dup
    //   178: aload_0
    //   179: invokevirtual 154	java/nio/charset/UnsupportedCharsetException:getMessage	()Ljava/lang/String;
    //   182: invokespecial 157	java/io/UnsupportedEncodingException:<init>	(Ljava/lang/String;)V
    //   185: athrow
    //   186: aload_1
    //   187: invokevirtual 159	org/apache/http/util/CharArrayBuffer:toString	()Ljava/lang/String;
    //   190: astore_0
    //   191: aload 8
    //   193: invokevirtual 28	java/io/InputStream:close	()V
    //   196: aload_0
    //   197: areturn
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	198	0	paramHttpEntity	HttpEntity
    //   0	198	1	paramCharset	Charset
    //   61	98	2	i	int
    //   59	4	3	j	int
    //   1	41	4	bool	boolean
    //   54	3	5	l	long
    //   71	85	7	localObject	Object
    //   16	176	8	localInputStream	InputStream
    //   77	11	9	localContentType	org.apache.http.entity.ContentType
    // Exception table:
    //   from	to	target	type
    //   25	38	165	finally
    //   41	56	165	finally
    //   73	79	165	finally
    //   87	93	165	finally
    //   111	115	165	finally
    //   115	142	165	finally
    //   142	149	165	finally
    //   154	162	165	finally
    //   174	186	165	finally
    //   186	191	165	finally
    //   73	79	173	java/nio/charset/UnsupportedCharsetException
    //   87	93	173	java/nio/charset/UnsupportedCharsetException
  }
  
  public static void updateEntity(HttpResponse paramHttpResponse, HttpEntity paramHttpEntity)
    throws IOException
  {
    Args.notNull(paramHttpResponse, "Response");
    consume(paramHttpResponse.getEntity());
    paramHttpResponse.setEntity(paramHttpEntity);
  }
}
