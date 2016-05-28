package com.adobe.creativesdk.foundation.internal.net;

class AdobeNetworkHttpFileUploadTask
  extends AdobeNetworkHttpTask
{
  private String _sourcePath = null;
  
  AdobeNetworkHttpFileUploadTask() {}
  
  protected void captureInputStream()
  {
    captureData(_response);
  }
  
  public void init(AdobeNetworkHttpRequest paramAdobeNetworkHttpRequest, String paramString1, String paramString2, AdobeNetworkHttpResponseHandler paramAdobeNetworkHttpResponseHandler, AdobeNetworkHttpTaskHandle paramAdobeNetworkHttpTaskHandle)
  {
    _sourcePath = paramString2;
    super.init(paramAdobeNetworkHttpRequest, paramString1, paramAdobeNetworkHttpResponseHandler, paramAdobeNetworkHttpTaskHandle);
  }
  
  /* Error */
  protected void writeToOutputStream()
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 6
    //   3: aconst_null
    //   4: astore 9
    //   6: aconst_null
    //   7: astore 10
    //   9: aconst_null
    //   10: astore 12
    //   12: aconst_null
    //   13: astore 11
    //   15: aload 12
    //   17: astore 7
    //   19: aload 6
    //   21: astore 8
    //   23: aload_0
    //   24: getfield 34	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask:_urlConnection	Ljava/net/HttpURLConnection;
    //   27: iconst_1
    //   28: invokevirtual 40	java/net/HttpURLConnection:setDoOutput	(Z)V
    //   31: aload 12
    //   33: astore 7
    //   35: aload 6
    //   37: astore 8
    //   39: aload_0
    //   40: getfield 34	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask:_urlConnection	Ljava/net/HttpURLConnection;
    //   43: iconst_1
    //   44: invokevirtual 43	java/net/HttpURLConnection:setDoInput	(Z)V
    //   47: aload 12
    //   49: astore 7
    //   51: aload 6
    //   53: astore 8
    //   55: aload_0
    //   56: getfield 34	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask:_urlConnection	Ljava/net/HttpURLConnection;
    //   59: sipush 4096
    //   62: invokevirtual 47	java/net/HttpURLConnection:setChunkedStreamingMode	(I)V
    //   65: aload 12
    //   67: astore 7
    //   69: aload 6
    //   71: astore 8
    //   73: new 49	java/io/File
    //   76: dup
    //   77: aload_0
    //   78: getfield 12	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask:_sourcePath	Ljava/lang/String;
    //   81: invokespecial 52	java/io/File:<init>	(Ljava/lang/String;)V
    //   84: invokevirtual 56	java/io/File:length	()J
    //   87: lstore_3
    //   88: aload 12
    //   90: astore 7
    //   92: aload 6
    //   94: astore 8
    //   96: aload_0
    //   97: getfield 60	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask:_request	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    //   100: invokevirtual 66	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest:getUrl	()Ljava/net/URL;
    //   103: invokevirtual 72	java/net/URL:getPath	()Ljava/lang/String;
    //   106: ldc 74
    //   108: invokestatic 80	java/net/URLDecoder:decode	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   111: invokestatic 86	org/apache/commons/io/FilenameUtils:getName	(Ljava/lang/String;)Ljava/lang/String;
    //   114: astore 13
    //   116: aload 12
    //   118: astore 7
    //   120: aload 6
    //   122: astore 8
    //   124: aload_0
    //   125: getfield 34	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask:_urlConnection	Ljava/net/HttpURLConnection;
    //   128: ldc 88
    //   130: aload 13
    //   132: invokevirtual 92	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   135: aload 12
    //   137: astore 7
    //   139: aload 6
    //   141: astore 8
    //   143: aload_0
    //   144: getfield 34	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask:_urlConnection	Ljava/net/HttpURLConnection;
    //   147: ldc 94
    //   149: ldc 96
    //   151: invokevirtual 92	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   154: aload 12
    //   156: astore 7
    //   158: aload 6
    //   160: astore 8
    //   162: new 98	java/io/DataOutputStream
    //   165: dup
    //   166: aload_0
    //   167: getfield 34	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask:_urlConnection	Ljava/net/HttpURLConnection;
    //   170: invokevirtual 102	java/net/HttpURLConnection:getOutputStream	()Ljava/io/OutputStream;
    //   173: invokespecial 105	java/io/DataOutputStream:<init>	(Ljava/io/OutputStream;)V
    //   176: astore 6
    //   178: new 107	java/io/FileInputStream
    //   181: dup
    //   182: aload_0
    //   183: getfield 12	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask:_sourcePath	Ljava/lang/String;
    //   186: invokespecial 108	java/io/FileInputStream:<init>	(Ljava/lang/String;)V
    //   189: astore 7
    //   191: aload 7
    //   193: invokevirtual 112	java/io/FileInputStream:available	()I
    //   196: sipush 4096
    //   199: invokestatic 118	java/lang/Math:min	(II)I
    //   202: istore_1
    //   203: iload_1
    //   204: newarray byte
    //   206: astore 8
    //   208: aload 7
    //   210: aload 8
    //   212: iconst_0
    //   213: iload_1
    //   214: invokevirtual 122	java/io/FileInputStream:read	([BII)I
    //   217: istore_1
    //   218: iconst_0
    //   219: istore_2
    //   220: iload_1
    //   221: ifle +227 -> 448
    //   224: aload_0
    //   225: getfield 126	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask:_requestHandler	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    //   228: invokevirtual 132	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle:isCancelled	()Z
    //   231: istore 5
    //   233: iload 5
    //   235: ifeq +64 -> 299
    //   238: aload 7
    //   240: ifnull +8 -> 248
    //   243: aload 7
    //   245: invokevirtual 135	java/io/FileInputStream:close	()V
    //   248: aload 6
    //   250: ifnull +8 -> 258
    //   253: aload 6
    //   255: invokevirtual 136	java/io/DataOutputStream:close	()V
    //   258: return
    //   259: astore 7
    //   261: getstatic 142	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   264: ldc -112
    //   266: invokevirtual 148	java/lang/Class:getName	()Ljava/lang/String;
    //   269: ldc -106
    //   271: aload 7
    //   273: invokestatic 156	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   276: goto -28 -> 248
    //   279: astore 6
    //   281: getstatic 142	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   284: ldc -112
    //   286: invokevirtual 148	java/lang/Class:getName	()Ljava/lang/String;
    //   289: ldc -106
    //   291: aload 6
    //   293: invokestatic 156	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   296: goto -38 -> 258
    //   299: aload 6
    //   301: aload 8
    //   303: iconst_0
    //   304: iload_1
    //   305: invokevirtual 160	java/io/DataOutputStream:write	([BII)V
    //   308: iload_2
    //   309: iload_1
    //   310: iadd
    //   311: istore_2
    //   312: aload 7
    //   314: aload 8
    //   316: iconst_0
    //   317: aload 7
    //   319: invokevirtual 112	java/io/FileInputStream:available	()I
    //   322: sipush 4096
    //   325: invokestatic 118	java/lang/Math:min	(II)I
    //   328: invokevirtual 122	java/io/FileInputStream:read	([BII)I
    //   331: istore_1
    //   332: aload_0
    //   333: iload_2
    //   334: i2f
    //   335: lload_3
    //   336: l2f
    //   337: fdiv
    //   338: ldc -95
    //   340: fmul
    //   341: f2i
    //   342: invokestatic 167	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   345: invokevirtual 171	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask:onProgressUpdate	(Ljava/lang/Integer;)V
    //   348: goto -128 -> 220
    //   351: astore 9
    //   353: aload 7
    //   355: astore 10
    //   357: aload 6
    //   359: astore 7
    //   361: aload 10
    //   363: astore 8
    //   365: aload 9
    //   367: invokevirtual 174	java/io/IOException:printStackTrace	()V
    //   370: aload 6
    //   372: astore 7
    //   374: aload 10
    //   376: astore 8
    //   378: getstatic 142	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   381: ldc -112
    //   383: invokevirtual 148	java/lang/Class:getName	()Ljava/lang/String;
    //   386: ldc -106
    //   388: aload 9
    //   390: invokestatic 156	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   393: aload 6
    //   395: astore 7
    //   397: aload 10
    //   399: astore 8
    //   401: aload_0
    //   402: getfield 18	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask:_response	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    //   405: iconst_1
    //   406: invokevirtual 179	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse:setHasFileError	(Z)V
    //   409: aload 10
    //   411: ifnull +8 -> 419
    //   414: aload 10
    //   416: invokevirtual 135	java/io/FileInputStream:close	()V
    //   419: aload 6
    //   421: ifnull -163 -> 258
    //   424: aload 6
    //   426: invokevirtual 136	java/io/DataOutputStream:close	()V
    //   429: return
    //   430: astore 6
    //   432: getstatic 142	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   435: ldc -112
    //   437: invokevirtual 148	java/lang/Class:getName	()Ljava/lang/String;
    //   440: ldc -106
    //   442: aload 6
    //   444: invokestatic 156	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   447: return
    //   448: aload_0
    //   449: getfield 18	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpFileUploadTask:_response	Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;
    //   452: iload_2
    //   453: invokevirtual 182	com/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse:setBytesSent	(I)V
    //   456: aload 6
    //   458: invokevirtual 185	java/io/DataOutputStream:flush	()V
    //   461: aload 7
    //   463: ifnull +8 -> 471
    //   466: aload 7
    //   468: invokevirtual 135	java/io/FileInputStream:close	()V
    //   471: aload 6
    //   473: ifnull +180 -> 653
    //   476: aload 6
    //   478: invokevirtual 136	java/io/DataOutputStream:close	()V
    //   481: return
    //   482: astore 7
    //   484: getstatic 142	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   487: ldc -112
    //   489: invokevirtual 148	java/lang/Class:getName	()Ljava/lang/String;
    //   492: ldc -106
    //   494: aload 7
    //   496: invokestatic 156	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   499: goto -28 -> 471
    //   502: astore 6
    //   504: getstatic 142	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   507: ldc -112
    //   509: invokevirtual 148	java/lang/Class:getName	()Ljava/lang/String;
    //   512: ldc -106
    //   514: aload 6
    //   516: invokestatic 156	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   519: return
    //   520: astore 7
    //   522: getstatic 142	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   525: ldc -112
    //   527: invokevirtual 148	java/lang/Class:getName	()Ljava/lang/String;
    //   530: ldc -106
    //   532: aload 7
    //   534: invokestatic 156	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   537: goto -118 -> 419
    //   540: astore 6
    //   542: aload 8
    //   544: ifnull +8 -> 552
    //   547: aload 8
    //   549: invokevirtual 135	java/io/FileInputStream:close	()V
    //   552: aload 7
    //   554: ifnull +8 -> 562
    //   557: aload 7
    //   559: invokevirtual 136	java/io/DataOutputStream:close	()V
    //   562: aload 6
    //   564: athrow
    //   565: astore 8
    //   567: getstatic 142	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   570: ldc -112
    //   572: invokevirtual 148	java/lang/Class:getName	()Ljava/lang/String;
    //   575: ldc -106
    //   577: aload 8
    //   579: invokestatic 156	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   582: goto -30 -> 552
    //   585: astore 7
    //   587: getstatic 142	com/adobe/creativesdk/foundation/internal/utils/logging/Level:ERROR	Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;
    //   590: ldc -112
    //   592: invokevirtual 148	java/lang/Class:getName	()Ljava/lang/String;
    //   595: ldc -106
    //   597: aload 7
    //   599: invokestatic 156	com/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger:log	(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   602: goto -40 -> 562
    //   605: astore 10
    //   607: aload 6
    //   609: astore 7
    //   611: aload 9
    //   613: astore 8
    //   615: aload 10
    //   617: astore 6
    //   619: goto -77 -> 542
    //   622: astore 9
    //   624: aload 7
    //   626: astore 8
    //   628: aload 6
    //   630: astore 7
    //   632: aload 9
    //   634: astore 6
    //   636: goto -94 -> 542
    //   639: astore 9
    //   641: aload 11
    //   643: astore 6
    //   645: goto -288 -> 357
    //   648: astore 9
    //   650: goto -293 -> 357
    //   653: return
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	654	0	this	AdobeNetworkHttpFileUploadTask
    //   202	130	1	i	int
    //   219	234	2	j	int
    //   87	249	3	l	long
    //   231	3	5	bool	boolean
    //   1	253	6	localDataOutputStream	java.io.DataOutputStream
    //   279	146	6	localIOException1	java.io.IOException
    //   430	47	6	localIOException2	java.io.IOException
    //   502	13	6	localIOException3	java.io.IOException
    //   540	68	6	localObject1	Object
    //   617	27	6	localObject2	Object
    //   17	227	7	localObject3	Object
    //   259	95	7	localIOException4	java.io.IOException
    //   359	108	7	localIOException5	java.io.IOException
    //   482	13	7	localIOException6	java.io.IOException
    //   520	38	7	localIOException7	java.io.IOException
    //   585	13	7	localIOException8	java.io.IOException
    //   609	22	7	localObject4	Object
    //   21	527	8	localObject5	Object
    //   565	13	8	localIOException9	java.io.IOException
    //   613	14	8	localObject6	Object
    //   4	1	9	localObject7	Object
    //   351	261	9	localIOException10	java.io.IOException
    //   622	11	9	localObject8	Object
    //   639	1	9	localIOException11	java.io.IOException
    //   648	1	9	localIOException12	java.io.IOException
    //   7	408	10	localObject9	Object
    //   605	11	10	localObject10	Object
    //   13	629	11	localObject11	Object
    //   10	145	12	localObject12	Object
    //   114	17	13	str	String
    // Exception table:
    //   from	to	target	type
    //   243	248	259	java/io/IOException
    //   253	258	279	java/io/IOException
    //   191	218	351	java/io/IOException
    //   224	233	351	java/io/IOException
    //   299	308	351	java/io/IOException
    //   312	348	351	java/io/IOException
    //   448	461	351	java/io/IOException
    //   424	429	430	java/io/IOException
    //   466	471	482	java/io/IOException
    //   476	481	502	java/io/IOException
    //   414	419	520	java/io/IOException
    //   23	31	540	finally
    //   39	47	540	finally
    //   55	65	540	finally
    //   73	88	540	finally
    //   96	116	540	finally
    //   124	135	540	finally
    //   143	154	540	finally
    //   162	178	540	finally
    //   365	370	540	finally
    //   378	393	540	finally
    //   401	409	540	finally
    //   547	552	565	java/io/IOException
    //   557	562	585	java/io/IOException
    //   178	191	605	finally
    //   191	218	622	finally
    //   224	233	622	finally
    //   299	308	622	finally
    //   312	348	622	finally
    //   448	461	622	finally
    //   23	31	639	java/io/IOException
    //   39	47	639	java/io/IOException
    //   55	65	639	java/io/IOException
    //   73	88	639	java/io/IOException
    //   96	116	639	java/io/IOException
    //   124	135	639	java/io/IOException
    //   143	154	639	java/io/IOException
    //   162	178	639	java/io/IOException
    //   178	191	648	java/io/IOException
  }
}
