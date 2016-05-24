package com.facebook;

import android.content.Context;
import com.facebook.internal.FileLruCache;
import com.facebook.internal.FileLruCache.Limits;
import com.facebook.internal.Logger;
import com.facebook.internal.Utility;
import com.facebook.model.GraphObject;
import com.facebook.model.GraphObject.Factory;
import com.facebook.model.GraphObjectList;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

public class Response
{
  private static FileLruCache responseCache;
  private final HttpURLConnection connection;
  private final FacebookRequestError error;
  private final GraphObject graphObject;
  private final GraphObjectList<GraphObject> graphObjectList;
  private final boolean isFromCache;
  private final String rawResponse;
  private final Request request;
  
  static
  {
    if (!Response.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }
  
  Response(Request paramRequest, HttpURLConnection paramHttpURLConnection, FacebookRequestError paramFacebookRequestError)
  {
    this(paramRequest, paramHttpURLConnection, null, null, null, false, paramFacebookRequestError);
  }
  
  Response(Request paramRequest, HttpURLConnection paramHttpURLConnection, String paramString, GraphObject paramGraphObject, GraphObjectList<GraphObject> paramGraphObjectList, boolean paramBoolean, FacebookRequestError paramFacebookRequestError)
  {
    request = paramRequest;
    connection = paramHttpURLConnection;
    rawResponse = paramString;
    graphObject = paramGraphObject;
    graphObjectList = paramGraphObjectList;
    isFromCache = paramBoolean;
    error = paramFacebookRequestError;
  }
  
  Response(Request paramRequest, HttpURLConnection paramHttpURLConnection, String paramString, GraphObject paramGraphObject, boolean paramBoolean)
  {
    this(paramRequest, paramHttpURLConnection, paramString, paramGraphObject, null, paramBoolean, null);
  }
  
  Response(Request paramRequest, HttpURLConnection paramHttpURLConnection, String paramString, GraphObjectList<GraphObject> paramGraphObjectList, boolean paramBoolean)
  {
    this(paramRequest, paramHttpURLConnection, paramString, null, paramGraphObjectList, paramBoolean, null);
  }
  
  static List<Response> constructErrorResponses(List<Request> paramList, HttpURLConnection paramHttpURLConnection, FacebookException paramFacebookException)
  {
    int j = paramList.size();
    ArrayList localArrayList = new ArrayList(j);
    int i = 0;
    for (;;)
    {
      if (i >= j) {
        return localArrayList;
      }
      localArrayList.add(new Response((Request)paramList.get(i), paramHttpURLConnection, new FacebookRequestError(paramHttpURLConnection, paramFacebookException)));
      i += 1;
    }
  }
  
  private static Response createResponseFromObject(Request paramRequest, HttpURLConnection paramHttpURLConnection, Object paramObject1, boolean paramBoolean, Object paramObject2)
    throws JSONException
  {
    Object localObject = paramObject1;
    if ((paramObject1 instanceof JSONObject))
    {
      paramObject1 = (JSONObject)paramObject1;
      paramObject2 = FacebookRequestError.checkResponseAndCreateError(paramObject1, paramObject2, paramHttpURLConnection);
      if (paramObject2 != null)
      {
        if (paramObject2.getErrorCode() == 190)
        {
          paramObject1 = paramRequest.getSession();
          if (paramObject1 != null) {
            paramObject1.closeAndClearTokenInformation();
          }
        }
        return new Response(paramRequest, paramHttpURLConnection, paramObject2);
      }
      paramObject1 = Utility.getStringPropertyAsJSON(paramObject1, "body", "FACEBOOK_NON_JSON_RESULT");
      if ((paramObject1 instanceof JSONObject))
      {
        paramObject2 = GraphObject.Factory.create((JSONObject)paramObject1);
        return new Response(paramRequest, paramHttpURLConnection, paramObject1.toString(), paramObject2, paramBoolean);
      }
      if ((paramObject1 instanceof JSONArray))
      {
        paramObject2 = GraphObject.Factory.createList((JSONArray)paramObject1, GraphObject.class);
        return new Response(paramRequest, paramHttpURLConnection, paramObject1.toString(), paramObject2, paramBoolean);
      }
      localObject = JSONObject.NULL;
    }
    if (localObject == JSONObject.NULL) {
      return new Response(paramRequest, paramHttpURLConnection, localObject.toString(), null, paramBoolean);
    }
    throw new FacebookException("Got unexpected object type in response, class: " + localObject.getClass().getSimpleName());
  }
  
  private static List<Response> createResponsesFromObject(HttpURLConnection paramHttpURLConnection, List<Request> paramList, Object paramObject, boolean paramBoolean)
    throws FacebookException, JSONException
  {
    assert ((paramHttpURLConnection != null) || (paramBoolean));
    int j = paramList.size();
    ArrayList localArrayList = new ArrayList(j);
    Object localObject1 = paramObject;
    Request localRequest;
    if (j == 1) {
      localRequest = (Request)paramList.get(0);
    }
    int i;
    for (;;)
    {
      try
      {
        JSONObject localJSONObject = new JSONObject();
        localJSONObject.put("body", paramObject);
        if (paramHttpURLConnection == null) {
          continue;
        }
        i = paramHttpURLConnection.getResponseCode();
        localJSONObject.put("code", i);
        localObject1 = new JSONArray();
        ((JSONArray)localObject1).put(localJSONObject);
      }
      catch (JSONException localJSONException1)
      {
        localArrayList.add(new Response(localRequest, paramHttpURLConnection, new FacebookRequestError(paramHttpURLConnection, localJSONException1)));
        localObject2 = paramObject;
        continue;
      }
      catch (IOException localIOException)
      {
        localArrayList.add(new Response(localRequest, paramHttpURLConnection, new FacebookRequestError(paramHttpURLConnection, localIOException)));
        localObject3 = paramObject;
        continue;
        localObject3 = (JSONArray)localObject3;
        i = 0;
      }
      if (((localObject1 instanceof JSONArray)) && (((JSONArray)localObject1).length() == j)) {
        continue;
      }
      throw new FacebookException("Unexpected number of results");
      i = 200;
    }
    for (;;)
    {
      Object localObject2;
      Object localObject3;
      if (i >= ((JSONArray)localObject3).length()) {
        return localArrayList;
      }
      localRequest = (Request)paramList.get(i);
      try
      {
        localArrayList.add(createResponseFromObject(localRequest, paramHttpURLConnection, ((JSONArray)localObject3).get(i), paramBoolean, paramObject));
        i += 1;
      }
      catch (JSONException localJSONException2)
      {
        for (;;)
        {
          localArrayList.add(new Response(localRequest, paramHttpURLConnection, new FacebookRequestError(paramHttpURLConnection, localJSONException2)));
        }
      }
      catch (FacebookException localFacebookException)
      {
        for (;;)
        {
          localArrayList.add(new Response(localRequest, paramHttpURLConnection, new FacebookRequestError(paramHttpURLConnection, localFacebookException)));
        }
      }
    }
  }
  
  static List<Response> createResponsesFromStream(InputStream paramInputStream, HttpURLConnection paramHttpURLConnection, RequestBatch paramRequestBatch, boolean paramBoolean)
    throws FacebookException, JSONException, IOException
  {
    paramInputStream = Utility.readStreamToString(paramInputStream);
    Logger.log(LoggingBehavior.INCLUDE_RAW_RESPONSES, "Response", "Response (raw)\n  Size: %d\n  Response:\n%s\n", new Object[] { Integer.valueOf(paramInputStream.length()), paramInputStream });
    return createResponsesFromString(paramInputStream, paramHttpURLConnection, paramRequestBatch, paramBoolean);
  }
  
  static List<Response> createResponsesFromString(String paramString, HttpURLConnection paramHttpURLConnection, RequestBatch paramRequestBatch, boolean paramBoolean)
    throws FacebookException, JSONException, IOException
  {
    paramHttpURLConnection = createResponsesFromObject(paramHttpURLConnection, paramRequestBatch, new JSONTokener(paramString).nextValue(), paramBoolean);
    Logger.log(LoggingBehavior.REQUESTS, "Response", "Response\n  Id: %s\n  Size: %d\n  Responses:\n%s\n", new Object[] { paramRequestBatch.getId(), Integer.valueOf(paramString.length()), paramHttpURLConnection });
    return paramHttpURLConnection;
  }
  
  /* Error */
  static List<Response> fromHttpConnection(HttpURLConnection paramHttpURLConnection, RequestBatch paramRequestBatch)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 11
    //   3: aconst_null
    //   4: astore 4
    //   6: aconst_null
    //   7: astore 6
    //   9: aconst_null
    //   10: astore 7
    //   12: aconst_null
    //   13: astore 5
    //   15: aconst_null
    //   16: astore 9
    //   18: aconst_null
    //   19: astore 10
    //   21: aload 11
    //   23: astore_2
    //   24: aload_1
    //   25: instanceof 268
    //   28: ifeq +168 -> 196
    //   31: aload_1
    //   32: checkcast 268	com/facebook/internal/CacheableRequestBatch
    //   35: astore 12
    //   37: invokestatic 272	com/facebook/Response:getResponseCache	()Lcom/facebook/internal/FileLruCache;
    //   40: astore 8
    //   42: aload 12
    //   44: invokevirtual 275	com/facebook/internal/CacheableRequestBatch:getCacheKeyOverride	()Ljava/lang/String;
    //   47: astore_2
    //   48: aload_2
    //   49: astore_3
    //   50: aload_2
    //   51: invokestatic 279	com/facebook/internal/Utility:isNullOrEmpty	(Ljava/lang/String;)Z
    //   54: ifeq +20 -> 74
    //   57: aload_1
    //   58: invokevirtual 280	com/facebook/RequestBatch:size	()I
    //   61: iconst_1
    //   62: if_icmpne +101 -> 163
    //   65: aload_1
    //   66: iconst_0
    //   67: invokevirtual 283	com/facebook/RequestBatch:get	(I)Lcom/facebook/Request;
    //   70: invokevirtual 286	com/facebook/Request:getUrlForSingleRequest	()Ljava/lang/String;
    //   73: astore_3
    //   74: aload 8
    //   76: astore 9
    //   78: aload_3
    //   79: astore 10
    //   81: aload 11
    //   83: astore_2
    //   84: aload 12
    //   86: invokevirtual 289	com/facebook/internal/CacheableRequestBatch:getForceRoundTrip	()Z
    //   89: ifne +107 -> 196
    //   92: aload 8
    //   94: astore 9
    //   96: aload_3
    //   97: astore 10
    //   99: aload 11
    //   101: astore_2
    //   102: aload 8
    //   104: ifnull +92 -> 196
    //   107: aload 8
    //   109: astore 9
    //   111: aload_3
    //   112: astore 10
    //   114: aload 11
    //   116: astore_2
    //   117: aload_3
    //   118: invokestatic 279	com/facebook/internal/Utility:isNullOrEmpty	(Ljava/lang/String;)Z
    //   121: ifne +75 -> 196
    //   124: aload 8
    //   126: aload_3
    //   127: invokevirtual 294	com/facebook/internal/FileLruCache:get	(Ljava/lang/String;)Ljava/io/InputStream;
    //   130: astore_2
    //   131: aload_2
    //   132: ifnull +183 -> 315
    //   135: aload_2
    //   136: astore 5
    //   138: aload_2
    //   139: astore 4
    //   141: aload_2
    //   142: astore 6
    //   144: aload_2
    //   145: astore 7
    //   147: aload_2
    //   148: aconst_null
    //   149: aload_1
    //   150: iconst_1
    //   151: invokestatic 296	com/facebook/Response:createResponsesFromStream	(Ljava/io/InputStream;Ljava/net/HttpURLConnection;Lcom/facebook/RequestBatch;Z)Ljava/util/List;
    //   154: astore 9
    //   156: aload_2
    //   157: invokestatic 300	com/facebook/internal/Utility:closeQuietly	(Ljava/io/Closeable;)V
    //   160: aload 9
    //   162: areturn
    //   163: getstatic 254	com/facebook/LoggingBehavior:REQUESTS	Lcom/facebook/LoggingBehavior;
    //   166: ldc_w 302
    //   169: ldc_w 304
    //   172: invokestatic 307	com/facebook/internal/Logger:log	(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;)V
    //   175: aload_2
    //   176: astore_3
    //   177: goto -103 -> 74
    //   180: astore_2
    //   181: aload 5
    //   183: invokestatic 300	com/facebook/internal/Utility:closeQuietly	(Ljava/io/Closeable;)V
    //   186: aload 5
    //   188: astore_2
    //   189: aload_3
    //   190: astore 10
    //   192: aload 8
    //   194: astore 9
    //   196: aload_2
    //   197: astore 5
    //   199: aload_2
    //   200: astore 6
    //   202: aload_2
    //   203: astore 7
    //   205: aload_2
    //   206: astore 8
    //   208: aload_2
    //   209: astore_3
    //   210: aload_0
    //   211: invokevirtual 188	java/net/HttpURLConnection:getResponseCode	()I
    //   214: sipush 400
    //   217: if_icmplt +112 -> 329
    //   220: aload_2
    //   221: astore 5
    //   223: aload_2
    //   224: astore 6
    //   226: aload_2
    //   227: astore 7
    //   229: aload_2
    //   230: astore 8
    //   232: aload_2
    //   233: astore_3
    //   234: aload_0
    //   235: invokevirtual 311	java/net/HttpURLConnection:getErrorStream	()Ljava/io/InputStream;
    //   238: astore_2
    //   239: aload_2
    //   240: astore 5
    //   242: aload_2
    //   243: astore 6
    //   245: aload_2
    //   246: astore 7
    //   248: aload_2
    //   249: astore 8
    //   251: aload_2
    //   252: astore_3
    //   253: aload_2
    //   254: aload_0
    //   255: aload_1
    //   256: iconst_0
    //   257: invokestatic 296	com/facebook/Response:createResponsesFromStream	(Ljava/io/InputStream;Ljava/net/HttpURLConnection;Lcom/facebook/RequestBatch;Z)Ljava/util/List;
    //   260: astore 4
    //   262: aload_2
    //   263: invokestatic 300	com/facebook/internal/Utility:closeQuietly	(Ljava/io/Closeable;)V
    //   266: aload 4
    //   268: areturn
    //   269: astore_2
    //   270: aload 4
    //   272: invokestatic 300	com/facebook/internal/Utility:closeQuietly	(Ljava/io/Closeable;)V
    //   275: aload 8
    //   277: astore 9
    //   279: aload_3
    //   280: astore 10
    //   282: aload 4
    //   284: astore_2
    //   285: goto -89 -> 196
    //   288: astore_2
    //   289: aload 6
    //   291: invokestatic 300	com/facebook/internal/Utility:closeQuietly	(Ljava/io/Closeable;)V
    //   294: aload 8
    //   296: astore 9
    //   298: aload_3
    //   299: astore 10
    //   301: aload 6
    //   303: astore_2
    //   304: goto -108 -> 196
    //   307: astore_0
    //   308: aload 7
    //   310: invokestatic 300	com/facebook/internal/Utility:closeQuietly	(Ljava/io/Closeable;)V
    //   313: aload_0
    //   314: athrow
    //   315: aload_2
    //   316: invokestatic 300	com/facebook/internal/Utility:closeQuietly	(Ljava/io/Closeable;)V
    //   319: aload 8
    //   321: astore 9
    //   323: aload_3
    //   324: astore 10
    //   326: goto -130 -> 196
    //   329: aload_2
    //   330: astore 5
    //   332: aload_2
    //   333: astore 6
    //   335: aload_2
    //   336: astore 7
    //   338: aload_2
    //   339: astore 8
    //   341: aload_2
    //   342: astore_3
    //   343: aload_0
    //   344: invokevirtual 314	java/net/HttpURLConnection:getInputStream	()Ljava/io/InputStream;
    //   347: astore 4
    //   349: aload 4
    //   351: astore_2
    //   352: aload 9
    //   354: ifnull -115 -> 239
    //   357: aload 4
    //   359: astore_2
    //   360: aload 10
    //   362: ifnull -123 -> 239
    //   365: aload 4
    //   367: astore_2
    //   368: aload 4
    //   370: ifnull -131 -> 239
    //   373: aload 4
    //   375: astore 5
    //   377: aload 4
    //   379: astore 6
    //   381: aload 4
    //   383: astore 7
    //   385: aload 4
    //   387: astore 8
    //   389: aload 4
    //   391: astore_3
    //   392: aload 9
    //   394: aload 10
    //   396: aload 4
    //   398: invokevirtual 318	com/facebook/internal/FileLruCache:interceptAndPut	(Ljava/lang/String;Ljava/io/InputStream;)Ljava/io/InputStream;
    //   401: astore 9
    //   403: aload 4
    //   405: astore_2
    //   406: aload 9
    //   408: ifnull -169 -> 239
    //   411: aload 9
    //   413: astore_2
    //   414: goto -175 -> 239
    //   417: astore_2
    //   418: aload 5
    //   420: astore_3
    //   421: getstatic 254	com/facebook/LoggingBehavior:REQUESTS	Lcom/facebook/LoggingBehavior;
    //   424: ldc -36
    //   426: ldc_w 320
    //   429: iconst_1
    //   430: anewarray 4	java/lang/Object
    //   433: dup
    //   434: iconst_0
    //   435: aload_2
    //   436: aastore
    //   437: invokestatic 237	com/facebook/internal/Logger:log	(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    //   440: aload 5
    //   442: astore_3
    //   443: aload_1
    //   444: aload_0
    //   445: aload_2
    //   446: invokestatic 322	com/facebook/Response:constructErrorResponses	(Ljava/util/List;Ljava/net/HttpURLConnection;Lcom/facebook/FacebookException;)Ljava/util/List;
    //   449: astore_0
    //   450: aload 5
    //   452: invokestatic 300	com/facebook/internal/Utility:closeQuietly	(Ljava/io/Closeable;)V
    //   455: aload_0
    //   456: areturn
    //   457: astore_2
    //   458: aload 6
    //   460: astore_3
    //   461: getstatic 254	com/facebook/LoggingBehavior:REQUESTS	Lcom/facebook/LoggingBehavior;
    //   464: ldc -36
    //   466: ldc_w 320
    //   469: iconst_1
    //   470: anewarray 4	java/lang/Object
    //   473: dup
    //   474: iconst_0
    //   475: aload_2
    //   476: aastore
    //   477: invokestatic 237	com/facebook/internal/Logger:log	(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    //   480: aload 6
    //   482: astore_3
    //   483: aload_1
    //   484: aload_0
    //   485: new 150	com/facebook/FacebookException
    //   488: dup
    //   489: aload_2
    //   490: invokespecial 325	com/facebook/FacebookException:<init>	(Ljava/lang/Throwable;)V
    //   493: invokestatic 322	com/facebook/Response:constructErrorResponses	(Ljava/util/List;Ljava/net/HttpURLConnection;Lcom/facebook/FacebookException;)Ljava/util/List;
    //   496: astore_0
    //   497: aload 6
    //   499: invokestatic 300	com/facebook/internal/Utility:closeQuietly	(Ljava/io/Closeable;)V
    //   502: aload_0
    //   503: areturn
    //   504: astore_2
    //   505: aload 7
    //   507: astore_3
    //   508: getstatic 254	com/facebook/LoggingBehavior:REQUESTS	Lcom/facebook/LoggingBehavior;
    //   511: ldc -36
    //   513: ldc_w 320
    //   516: iconst_1
    //   517: anewarray 4	java/lang/Object
    //   520: dup
    //   521: iconst_0
    //   522: aload_2
    //   523: aastore
    //   524: invokestatic 237	com/facebook/internal/Logger:log	(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    //   527: aload 7
    //   529: astore_3
    //   530: aload_1
    //   531: aload_0
    //   532: new 150	com/facebook/FacebookException
    //   535: dup
    //   536: aload_2
    //   537: invokespecial 325	com/facebook/FacebookException:<init>	(Ljava/lang/Throwable;)V
    //   540: invokestatic 322	com/facebook/Response:constructErrorResponses	(Ljava/util/List;Ljava/net/HttpURLConnection;Lcom/facebook/FacebookException;)Ljava/util/List;
    //   543: astore_0
    //   544: aload 7
    //   546: invokestatic 300	com/facebook/internal/Utility:closeQuietly	(Ljava/io/Closeable;)V
    //   549: aload_0
    //   550: areturn
    //   551: astore_2
    //   552: aload 8
    //   554: astore_3
    //   555: getstatic 254	com/facebook/LoggingBehavior:REQUESTS	Lcom/facebook/LoggingBehavior;
    //   558: ldc -36
    //   560: ldc_w 320
    //   563: iconst_1
    //   564: anewarray 4	java/lang/Object
    //   567: dup
    //   568: iconst_0
    //   569: aload_2
    //   570: aastore
    //   571: invokestatic 237	com/facebook/internal/Logger:log	(Lcom/facebook/LoggingBehavior;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    //   574: aload 8
    //   576: astore_3
    //   577: aload_1
    //   578: aload_0
    //   579: new 150	com/facebook/FacebookException
    //   582: dup
    //   583: aload_2
    //   584: invokespecial 325	com/facebook/FacebookException:<init>	(Ljava/lang/Throwable;)V
    //   587: invokestatic 322	com/facebook/Response:constructErrorResponses	(Ljava/util/List;Ljava/net/HttpURLConnection;Lcom/facebook/FacebookException;)Ljava/util/List;
    //   590: astore_0
    //   591: aload 8
    //   593: invokestatic 300	com/facebook/internal/Utility:closeQuietly	(Ljava/io/Closeable;)V
    //   596: aload_0
    //   597: areturn
    //   598: astore_0
    //   599: aload_3
    //   600: invokestatic 300	com/facebook/internal/Utility:closeQuietly	(Ljava/io/Closeable;)V
    //   603: aload_0
    //   604: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	605	0	paramHttpURLConnection	HttpURLConnection
    //   0	605	1	paramRequestBatch	RequestBatch
    //   23	153	2	localObject1	Object
    //   180	1	2	localFacebookException1	FacebookException
    //   188	75	2	localObject2	Object
    //   269	1	2	localJSONException1	JSONException
    //   284	1	2	localObject3	Object
    //   288	1	2	localIOException1	IOException
    //   303	111	2	localObject4	Object
    //   417	29	2	localFacebookException2	FacebookException
    //   457	33	2	localJSONException2	JSONException
    //   504	33	2	localIOException2	IOException
    //   551	33	2	localSecurityException	SecurityException
    //   49	551	3	localObject5	Object
    //   4	400	4	localObject6	Object
    //   13	438	5	localObject7	Object
    //   7	491	6	localObject8	Object
    //   10	535	7	localObject9	Object
    //   40	552	8	localObject10	Object
    //   16	396	9	localObject11	Object
    //   19	376	10	localObject12	Object
    //   1	114	11	localObject13	Object
    //   35	50	12	localCacheableRequestBatch	com.facebook.internal.CacheableRequestBatch
    // Exception table:
    //   from	to	target	type
    //   124	131	180	com/facebook/FacebookException
    //   147	156	180	com/facebook/FacebookException
    //   124	131	269	org/json/JSONException
    //   147	156	269	org/json/JSONException
    //   124	131	288	java/io/IOException
    //   147	156	288	java/io/IOException
    //   124	131	307	finally
    //   147	156	307	finally
    //   210	220	417	com/facebook/FacebookException
    //   234	239	417	com/facebook/FacebookException
    //   253	262	417	com/facebook/FacebookException
    //   343	349	417	com/facebook/FacebookException
    //   392	403	417	com/facebook/FacebookException
    //   210	220	457	org/json/JSONException
    //   234	239	457	org/json/JSONException
    //   253	262	457	org/json/JSONException
    //   343	349	457	org/json/JSONException
    //   392	403	457	org/json/JSONException
    //   210	220	504	java/io/IOException
    //   234	239	504	java/io/IOException
    //   253	262	504	java/io/IOException
    //   343	349	504	java/io/IOException
    //   392	403	504	java/io/IOException
    //   210	220	551	java/lang/SecurityException
    //   234	239	551	java/lang/SecurityException
    //   253	262	551	java/lang/SecurityException
    //   343	349	551	java/lang/SecurityException
    //   392	403	551	java/lang/SecurityException
    //   210	220	598	finally
    //   234	239	598	finally
    //   253	262	598	finally
    //   343	349	598	finally
    //   392	403	598	finally
    //   421	440	598	finally
    //   443	450	598	finally
    //   461	480	598	finally
    //   483	497	598	finally
    //   508	527	598	finally
    //   530	544	598	finally
    //   555	574	598	finally
    //   577	591	598	finally
  }
  
  static FileLruCache getResponseCache()
  {
    if (responseCache == null)
    {
      Context localContext = Session.getStaticContext();
      if (localContext != null) {
        responseCache = new FileLruCache(localContext, "ResponseCache", new FileLruCache.Limits());
      }
    }
    return responseCache;
  }
  
  public final FacebookRequestError getError()
  {
    return error;
  }
  
  public final GraphObject getGraphObject()
  {
    return graphObject;
  }
  
  public final <T extends GraphObject> T getGraphObjectAs(Class<T> paramClass)
  {
    if (graphObject == null) {
      return null;
    }
    if (paramClass == null) {
      throw new NullPointerException("Must pass in a valid interface that extends GraphObject");
    }
    return graphObject.cast(paramClass);
  }
  
  public String toString()
  {
    for (;;)
    {
      try
      {
        if (connection == null) {
          continue;
        }
        i = connection.getResponseCode();
        str1 = String.format("%d", new Object[] { Integer.valueOf(i) });
      }
      catch (IOException localIOException)
      {
        int i;
        String str1;
        String str2 = "unknown";
        continue;
      }
      return "{Response: " + " responseCode: " + str1 + ", graphObject: " + graphObject + ", error: " + error + ", isFromCache:" + isFromCache + "}";
      i = 200;
    }
  }
}
