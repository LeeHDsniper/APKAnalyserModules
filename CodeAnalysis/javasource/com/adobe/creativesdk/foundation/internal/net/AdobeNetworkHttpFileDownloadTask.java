package com.adobe.creativesdk.foundation.internal.net;

class AdobeNetworkHttpFileDownloadTask
  extends AdobeNetworkHttpTask
{
  String _destinationPath = null;
  
  AdobeNetworkHttpFileDownloadTask() {}
  
  /* Error */
  protected void captureInputStream()
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 6
    //   3: aconst_null
    //   4: astore 7
    //   6: aconst_null
    //   7: astore 8
    //   9: aload 7
    //   11: astore 5
    //   13: aload_0
    //   14: getfield 20	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileDownloadTask:_response	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    //   17: invokevirtual 26	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse:getStatusCode	()I
    //   20: sipush 200
    //   23: if_icmpne +228 -> 251
    //   26: aload 7
    //   28: astore 5
    //   30: aload_0
    //   31: getfield 30	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileDownloadTask:_urlConnection	Ljava/net/HttpURLConnection;
    //   34: invokevirtual 36	java/net/HttpURLConnection:getInputStream	()Ljava/io/InputStream;
    //   37: astore 9
    //   39: aload 7
    //   41: astore 5
    //   43: aload_0
    //   44: getfield 30	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileDownloadTask:_urlConnection	Ljava/net/HttpURLConnection;
    //   47: invokevirtual 39	java/net/HttpURLConnection:getContentLength	()I
    //   50: istore_2
    //   51: aload 7
    //   53: astore 5
    //   55: new 41	java/io/FileOutputStream
    //   58: dup
    //   59: aload_0
    //   60: getfield 12	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileDownloadTask:_destinationPath	Ljava/lang/String;
    //   63: invokespecial 44	java/io/FileOutputStream:<init>	(Ljava/lang/String;)V
    //   66: astore 6
    //   68: iconst_0
    //   69: istore_1
    //   70: sipush 4096
    //   73: newarray byte
    //   75: astore 5
    //   77: aload 9
    //   79: aload 5
    //   81: invokevirtual 50	java/io/InputStream:read	([B)I
    //   84: istore_3
    //   85: iload_3
    //   86: iconst_m1
    //   87: if_icmpeq +151 -> 238
    //   90: aload_0
    //   91: getfield 54	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileDownloadTask:_requestHandler	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    //   94: invokevirtual 60	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle:isCancelled	()Z
    //   97: istore 4
    //   99: iload 4
    //   101: ifeq +34 -> 135
    //   104: aload 6
    //   106: ifnull +8 -> 114
    //   109: aload 6
    //   111: invokevirtual 63	java/io/FileOutputStream:close	()V
    //   114: return
    //   115: astore 5
    //   117: getstatic 69	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   120: ldc 71
    //   122: invokevirtual 77	java/lang/Class:getName	()Ljava/lang/String;
    //   125: ldc 79
    //   127: aload 5
    //   129: invokestatic 85	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   132: goto -18 -> 114
    //   135: aload 6
    //   137: aload 5
    //   139: iconst_0
    //   140: iload_3
    //   141: invokevirtual 89	java/io/FileOutputStream:write	([BII)V
    //   144: iload_1
    //   145: iload_3
    //   146: iadd
    //   147: istore_1
    //   148: aload_0
    //   149: iload_1
    //   150: i2f
    //   151: iload_2
    //   152: i2f
    //   153: fdiv
    //   154: ldc 90
    //   156: fmul
    //   157: f2i
    //   158: invokestatic 96	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   161: invokevirtual 100	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileDownloadTask:onProgressUpdate	(Ljava/lang/Integer;)V
    //   164: goto -87 -> 77
    //   167: astore 7
    //   169: aload 6
    //   171: astore 5
    //   173: aload_0
    //   174: getfield 20	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileDownloadTask:_response	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    //   177: iconst_1
    //   178: invokevirtual 104	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse:setHasFileError	(Z)V
    //   181: aload 6
    //   183: astore 5
    //   185: aload 7
    //   187: invokevirtual 107	java/io/IOException:printStackTrace	()V
    //   190: aload 6
    //   192: astore 5
    //   194: getstatic 69	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   197: ldc 71
    //   199: invokevirtual 77	java/lang/Class:getName	()Ljava/lang/String;
    //   202: ldc 79
    //   204: aload 7
    //   206: invokestatic 85	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   209: aload 6
    //   211: ifnull -97 -> 114
    //   214: aload 6
    //   216: invokevirtual 63	java/io/FileOutputStream:close	()V
    //   219: return
    //   220: astore 5
    //   222: getstatic 69	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   225: ldc 71
    //   227: invokevirtual 77	java/lang/Class:getName	()Ljava/lang/String;
    //   230: ldc 79
    //   232: aload 5
    //   234: invokestatic 85	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   237: return
    //   238: aload_0
    //   239: getfield 20	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileDownloadTask:_response	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    //   242: iload_1
    //   243: invokevirtual 111	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse:setBytesReceived	(I)V
    //   246: aload 9
    //   248: invokevirtual 112	java/io/InputStream:close	()V
    //   251: aload 6
    //   253: ifnull -139 -> 114
    //   256: aload 6
    //   258: invokevirtual 63	java/io/FileOutputStream:close	()V
    //   261: return
    //   262: astore 5
    //   264: getstatic 69	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   267: ldc 71
    //   269: invokevirtual 77	java/lang/Class:getName	()Ljava/lang/String;
    //   272: ldc 79
    //   274: aload 5
    //   276: invokestatic 85	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   279: return
    //   280: astore 6
    //   282: aload 5
    //   284: ifnull +8 -> 292
    //   287: aload 5
    //   289: invokevirtual 63	java/io/FileOutputStream:close	()V
    //   292: aload 6
    //   294: athrow
    //   295: astore 5
    //   297: getstatic 69	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   300: ldc 71
    //   302: invokevirtual 77	java/lang/Class:getName	()Ljava/lang/String;
    //   305: ldc 79
    //   307: aload 5
    //   309: invokestatic 85	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   312: goto -20 -> 292
    //   315: astore 7
    //   317: aload 6
    //   319: astore 5
    //   321: aload 7
    //   323: astore 6
    //   325: goto -43 -> 282
    //   328: astore 7
    //   330: aload 8
    //   332: astore 6
    //   334: goto -165 -> 169
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	337	0	this	AdobeNetworkHttpFileDownloadTask
    //   69	174	1	i	int
    //   50	102	2	j	int
    //   84	63	3	k	int
    //   97	3	4	bool	boolean
    //   11	69	5	localObject1	Object
    //   115	23	5	localIOException1	java.io.IOException
    //   171	22	5	localFileOutputStream1	java.io.FileOutputStream
    //   220	13	5	localIOException2	java.io.IOException
    //   262	26	5	localIOException3	java.io.IOException
    //   295	13	5	localIOException4	java.io.IOException
    //   319	1	5	localObject2	Object
    //   1	256	6	localFileOutputStream2	java.io.FileOutputStream
    //   280	38	6	localObject3	Object
    //   323	10	6	localObject4	Object
    //   4	48	7	localObject5	Object
    //   167	38	7	localIOException5	java.io.IOException
    //   315	7	7	localObject6	Object
    //   328	1	7	localIOException6	java.io.IOException
    //   7	324	8	localObject7	Object
    //   37	210	9	localInputStream	java.io.InputStream
    // Exception table:
    //   from	to	target	type
    //   109	114	115	java/io/IOException
    //   70	77	167	java/io/IOException
    //   77	85	167	java/io/IOException
    //   90	99	167	java/io/IOException
    //   135	144	167	java/io/IOException
    //   148	164	167	java/io/IOException
    //   238	251	167	java/io/IOException
    //   214	219	220	java/io/IOException
    //   256	261	262	java/io/IOException
    //   13	26	280	finally
    //   30	39	280	finally
    //   43	51	280	finally
    //   55	68	280	finally
    //   173	181	280	finally
    //   185	190	280	finally
    //   194	209	280	finally
    //   287	292	295	java/io/IOException
    //   70	77	315	finally
    //   77	85	315	finally
    //   90	99	315	finally
    //   135	144	315	finally
    //   148	164	315	finally
    //   238	251	315	finally
    //   13	26	328	java/io/IOException
    //   30	39	328	java/io/IOException
    //   43	51	328	java/io/IOException
    //   55	68	328	java/io/IOException
  }
  
  public void init(AdobeNetworkHttpRequest paramAdobeNetworkHttpRequest, String paramString1, String paramString2, AdobeNetworkHttpResponseHandler paramAdobeNetworkHttpResponseHandler, AdobeNetworkHttpTaskHandle paramAdobeNetworkHttpTaskHandle)
  {
    _destinationPath = paramString2;
    super.init(paramAdobeNetworkHttpRequest, paramString1, paramAdobeNetworkHttpResponseHandler, paramAdobeNetworkHttpTaskHandle);
  }
}
