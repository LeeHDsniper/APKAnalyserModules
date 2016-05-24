package com.facebook;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.net.Uri.Builder;
import android.os.Bundle;
import android.os.Handler;
import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.ParcelFileDescriptor.AutoCloseInputStream;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.text.TextUtils;
import android.util.Log;
import android.util.Pair;
import com.facebook.internal.Logger;
import com.facebook.internal.ServerProtocol;
import com.facebook.internal.Utility;
import com.facebook.internal.Validate;
import com.facebook.model.GraphObject;
import com.facebook.model.GraphObjectList;
import com.facebook.model.GraphUser;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Request
{
  public static final String TAG = Request.class.getSimpleName();
  private static String defaultBatchApplicationId;
  private static volatile String userAgent;
  private static Pattern versionPattern = Pattern.compile("^/?v\\d+\\.\\d+/(.*)");
  private String batchEntryDependsOn;
  private String batchEntryName;
  private boolean batchEntryOmitResultOnSuccess = true;
  private Callback callback;
  private GraphObject graphObject;
  private String graphPath;
  private HttpMethod httpMethod;
  private String overriddenURL;
  private Bundle parameters;
  private Session session;
  private Object tag;
  private String version;
  
  public Request()
  {
    this(null, null, null, null, null);
  }
  
  public Request(Session paramSession, String paramString)
  {
    this(paramSession, paramString, null, null, null);
  }
  
  public Request(Session paramSession, String paramString, Bundle paramBundle, HttpMethod paramHttpMethod, Callback paramCallback)
  {
    this(paramSession, paramString, paramBundle, paramHttpMethod, paramCallback, null);
  }
  
  public Request(Session paramSession, String paramString1, Bundle paramBundle, HttpMethod paramHttpMethod, Callback paramCallback, String paramString2)
  {
    session = paramSession;
    graphPath = paramString1;
    callback = paramCallback;
    version = paramString2;
    setHttpMethod(paramHttpMethod);
    if (paramBundle != null) {}
    for (parameters = new Bundle(paramBundle);; parameters = new Bundle())
    {
      if (version == null) {
        version = ServerProtocol.getAPIVersion();
      }
      return;
    }
  }
  
  private void addCommonParameters()
  {
    String str1;
    if (session != null)
    {
      if (!session.isOpened()) {
        throw new FacebookException("Session provided to a Request in un-opened state.");
      }
      if (!parameters.containsKey("access_token"))
      {
        str1 = session.getAccessToken();
        Logger.registerAccessToken(str1);
        parameters.putString("access_token", str1);
      }
    }
    for (;;)
    {
      parameters.putString("sdk", "android");
      parameters.putString("format", "json");
      return;
      if (!parameters.containsKey("access_token"))
      {
        str1 = Settings.getApplicationId();
        String str2 = Settings.getClientToken();
        if ((!Utility.isNullOrEmpty(str1)) && (!Utility.isNullOrEmpty(str2)))
        {
          str1 = str1 + "|" + str2;
          parameters.putString("access_token", str1);
        }
        else
        {
          Log.d(TAG, "Warning: Sessionless Request needs token but missing either application ID or client token.");
        }
      }
    }
  }
  
  private String appendParametersToBaseUrl(String paramString)
  {
    Uri.Builder localBuilder = new Uri.Builder().encodedPath(paramString);
    Iterator localIterator = parameters.keySet().iterator();
    do
    {
      for (;;)
      {
        if (!localIterator.hasNext()) {
          return localBuilder.toString();
        }
        String str = (String)localIterator.next();
        Object localObject = parameters.get(str);
        paramString = localObject;
        if (localObject == null) {
          paramString = "";
        }
        if (!isSupportedParameterType(paramString)) {
          break;
        }
        localBuilder.appendQueryParameter(str, parameterToString(paramString).toString());
      }
    } while (httpMethod != HttpMethod.GET);
    throw new IllegalArgumentException(String.format("Unsupported parameter type for GET request: %s", new Object[] { paramString.getClass().getSimpleName() }));
  }
  
  static HttpURLConnection createConnection(URL paramURL)
    throws IOException
  {
    paramURL = (HttpURLConnection)paramURL.openConnection();
    paramURL.setRequestProperty("User-Agent", getUserAgent());
    paramURL.setRequestProperty("Content-Type", getMimeContentType());
    paramURL.setRequestProperty("Accept-Language", Locale.getDefault().toString());
    paramURL.setChunkedStreamingMode(0);
    return paramURL;
  }
  
  public static Response executeAndWait(Request paramRequest)
  {
    paramRequest = executeBatchAndWait(new Request[] { paramRequest });
    if ((paramRequest == null) || (paramRequest.size() != 1)) {
      throw new FacebookException("invalid state: expected a single response");
    }
    return (Response)paramRequest.get(0);
  }
  
  public static List<Response> executeBatchAndWait(RequestBatch paramRequestBatch)
  {
    Validate.notEmptyAndContainsNoNulls(paramRequestBatch, "requests");
    try
    {
      HttpURLConnection localHttpURLConnection = toHttpConnection(paramRequestBatch);
      return executeConnectionAndWait(localHttpURLConnection, paramRequestBatch);
    }
    catch (Exception localException)
    {
      List localList = Response.constructErrorResponses(paramRequestBatch.getRequests(), null, new FacebookException(localException));
      runCallbacks(paramRequestBatch, localList);
      return localList;
    }
  }
  
  public static List<Response> executeBatchAndWait(Collection<Request> paramCollection)
  {
    return executeBatchAndWait(new RequestBatch(paramCollection));
  }
  
  public static List<Response> executeBatchAndWait(Request... paramVarArgs)
  {
    Validate.notNull(paramVarArgs, "requests");
    return executeBatchAndWait(Arrays.asList(paramVarArgs));
  }
  
  public static RequestAsyncTask executeBatchAsync(RequestBatch paramRequestBatch)
  {
    Validate.notEmptyAndContainsNoNulls(paramRequestBatch, "requests");
    paramRequestBatch = new RequestAsyncTask(paramRequestBatch);
    paramRequestBatch.executeOnSettingsExecutor();
    return paramRequestBatch;
  }
  
  public static RequestAsyncTask executeBatchAsync(Collection<Request> paramCollection)
  {
    return executeBatchAsync(new RequestBatch(paramCollection));
  }
  
  public static RequestAsyncTask executeBatchAsync(Request... paramVarArgs)
  {
    Validate.notNull(paramVarArgs, "requests");
    return executeBatchAsync(Arrays.asList(paramVarArgs));
  }
  
  public static List<Response> executeConnectionAndWait(HttpURLConnection paramHttpURLConnection, RequestBatch paramRequestBatch)
  {
    List localList = Response.fromHttpConnection(paramHttpURLConnection, paramRequestBatch);
    Utility.disconnectQuietly(paramHttpURLConnection);
    int i = paramRequestBatch.size();
    if (i != localList.size()) {
      throw new FacebookException(String.format("Received %d responses while expecting %d", new Object[] { Integer.valueOf(localList.size()), Integer.valueOf(i) }));
    }
    runCallbacks(paramRequestBatch, localList);
    paramHttpURLConnection = new HashSet();
    paramRequestBatch = paramRequestBatch.iterator();
    if (!paramRequestBatch.hasNext()) {
      paramHttpURLConnection = paramHttpURLConnection.iterator();
    }
    for (;;)
    {
      if (!paramHttpURLConnection.hasNext())
      {
        return localList;
        Request localRequest = (Request)paramRequestBatch.next();
        if (session == null) {
          break;
        }
        paramHttpURLConnection.add(session);
        break;
      }
      ((Session)paramHttpURLConnection.next()).extendAccessTokenIfNeeded();
    }
  }
  
  private static String getBatchAppId(RequestBatch paramRequestBatch)
  {
    if (!Utility.isNullOrEmpty(paramRequestBatch.getBatchApplicationId())) {
      return paramRequestBatch.getBatchApplicationId();
    }
    paramRequestBatch = paramRequestBatch.iterator();
    Session localSession;
    do
    {
      if (!paramRequestBatch.hasNext()) {
        return defaultBatchApplicationId;
      }
      localSession = nextsession;
    } while (localSession == null);
    return localSession.getApplicationId();
  }
  
  private String getGraphPathWithVersion()
  {
    if (versionPattern.matcher(graphPath).matches()) {
      return graphPath;
    }
    return String.format("%s/%s", new Object[] { version, graphPath });
  }
  
  private static String getMimeContentType()
  {
    return String.format("multipart/form-data; boundary=%s", new Object[] { "3i2ndDfv2rTHiSisAbouNdArYfORhtTPEefj3q2f" });
  }
  
  private static String getUserAgent()
  {
    if (userAgent == null) {
      userAgent = String.format("%s.%s", new Object[] { "FBAndroidSDK", "3.18.1" });
    }
    return userAgent;
  }
  
  private static boolean hasOnProgressCallbacks(RequestBatch paramRequestBatch)
  {
    Iterator localIterator = paramRequestBatch.getCallbacks().iterator();
    if (!localIterator.hasNext()) {
      paramRequestBatch = paramRequestBatch.iterator();
    }
    do
    {
      if (!paramRequestBatch.hasNext())
      {
        return false;
        if (!((RequestBatch.Callback)localIterator.next() instanceof RequestBatch.OnProgressCallback)) {
          break;
        }
        return true;
      }
    } while (!(((Request)paramRequestBatch.next()).getCallback() instanceof OnProgressCallback));
    return true;
  }
  
  private static boolean isMeRequest(String paramString)
  {
    Matcher localMatcher = versionPattern.matcher(paramString);
    if (localMatcher.matches()) {
      paramString = localMatcher.group(1);
    }
    return (paramString.startsWith("me/")) || (paramString.startsWith("/me/"));
  }
  
  private static boolean isSupportedAttachmentType(Object paramObject)
  {
    return ((paramObject instanceof Bitmap)) || ((paramObject instanceof byte[])) || ((paramObject instanceof ParcelFileDescriptor)) || ((paramObject instanceof ParcelFileDescriptorWithMimeType));
  }
  
  private static boolean isSupportedParameterType(Object paramObject)
  {
    return ((paramObject instanceof String)) || ((paramObject instanceof Boolean)) || ((paramObject instanceof Number)) || ((paramObject instanceof Date));
  }
  
  public static Request newGraphPathRequest(Session paramSession, String paramString, Callback paramCallback)
  {
    return new Request(paramSession, paramString, null, null, paramCallback);
  }
  
  public static Request newMeRequest(Session paramSession, GraphUserCallback paramGraphUserCallback)
  {
    new Request(paramSession, "me", null, null, new Callback()
    {
      public void onCompleted(Response paramAnonymousResponse)
      {
        if (Request.this != null) {
          onCompleted((GraphUser)paramAnonymousResponse.getGraphObjectAs(GraphUser.class), paramAnonymousResponse);
        }
      }
    });
  }
  
  public static Request newPostRequest(Session paramSession, String paramString, GraphObject paramGraphObject, Callback paramCallback)
  {
    paramSession = new Request(paramSession, paramString, null, HttpMethod.POST, paramCallback);
    paramSession.setGraphObject(paramGraphObject);
    return paramSession;
  }
  
  private static String parameterToString(Object paramObject)
  {
    if ((paramObject instanceof String)) {
      return (String)paramObject;
    }
    if (((paramObject instanceof Boolean)) || ((paramObject instanceof Number))) {
      return paramObject.toString();
    }
    if ((paramObject instanceof Date)) {
      return new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssZ", Locale.US).format(paramObject);
    }
    throw new IllegalArgumentException("Unsupported parameter type.");
  }
  
  private static void processGraphObject(GraphObject paramGraphObject, String paramString, KeyValueSerializer paramKeyValueSerializer)
    throws IOException
  {
    int i = 0;
    if (isMeRequest(paramString))
    {
      i = paramString.indexOf(":");
      int j = paramString.indexOf("?");
      if ((i <= 3) || ((j != -1) && (i >= j))) {
        break label72;
      }
    }
    label72:
    for (i = 1;; i = 0)
    {
      paramGraphObject = paramGraphObject.asMap().entrySet().iterator();
      if (paramGraphObject.hasNext()) {
        break;
      }
      return;
    }
    paramString = (Map.Entry)paramGraphObject.next();
    if ((i != 0) && (((String)paramString.getKey()).equalsIgnoreCase("image"))) {}
    for (boolean bool = true;; bool = false)
    {
      processGraphObjectProperty((String)paramString.getKey(), paramString.getValue(), paramKeyValueSerializer, bool);
      break;
    }
  }
  
  private static void processGraphObjectProperty(String paramString, Object paramObject, KeyValueSerializer paramKeyValueSerializer, boolean paramBoolean)
    throws IOException
  {
    Class localClass = paramObject.getClass();
    Object localObject2;
    Object localObject1;
    if (GraphObject.class.isAssignableFrom(localClass))
    {
      localObject2 = ((GraphObject)paramObject).getInnerJSONObject();
      localObject1 = localObject2.getClass();
      if (!JSONObject.class.isAssignableFrom((Class)localObject1)) {
        break label226;
      }
      paramObject = (JSONObject)localObject2;
      if (!paramBoolean) {
        break label157;
      }
      localObject1 = paramObject.keys();
      label62:
      if (((Iterator)localObject1).hasNext()) {
        break label112;
      }
    }
    label112:
    label157:
    label226:
    label301:
    do
    {
      for (;;)
      {
        return;
        localObject1 = localClass;
        localObject2 = paramObject;
        if (!GraphObjectList.class.isAssignableFrom(localClass)) {
          break;
        }
        localObject2 = ((GraphObjectList)paramObject).getInnerJSONArray();
        localObject1 = localObject2.getClass();
        break;
        localObject2 = (String)((Iterator)localObject1).next();
        processGraphObjectProperty(String.format("%s[%s]", new Object[] { paramString, localObject2 }), paramObject.opt((String)localObject2), paramKeyValueSerializer, paramBoolean);
        break label62;
        if (paramObject.has("id"))
        {
          processGraphObjectProperty(paramString, paramObject.optString("id"), paramKeyValueSerializer, paramBoolean);
          return;
        }
        if (paramObject.has("url"))
        {
          processGraphObjectProperty(paramString, paramObject.optString("url"), paramKeyValueSerializer, paramBoolean);
          return;
        }
        if (paramObject.has("fbsdk:create_object"))
        {
          processGraphObjectProperty(paramString, paramObject.toString(), paramKeyValueSerializer, paramBoolean);
          return;
          if (!JSONArray.class.isAssignableFrom((Class)localObject1)) {
            break label301;
          }
          paramObject = (JSONArray)localObject2;
          int j = paramObject.length();
          int i = 0;
          while (i < j)
          {
            processGraphObjectProperty(String.format("%s[%d]", new Object[] { paramString, Integer.valueOf(i) }), paramObject.opt(i), paramKeyValueSerializer, paramBoolean);
            i += 1;
          }
        }
      }
      if ((String.class.isAssignableFrom((Class)localObject1)) || (Number.class.isAssignableFrom((Class)localObject1)) || (Boolean.class.isAssignableFrom((Class)localObject1)))
      {
        paramKeyValueSerializer.writeString(paramString, localObject2.toString());
        return;
      }
    } while (!Date.class.isAssignableFrom((Class)localObject1));
    paramObject = (Date)localObject2;
    paramKeyValueSerializer.writeString(paramString, new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssZ", Locale.US).format(paramObject));
  }
  
  private static void processRequest(RequestBatch paramRequestBatch, Logger paramLogger, int paramInt, URL paramURL, OutputStream paramOutputStream)
    throws IOException, JSONException
  {
    paramOutputStream = new Serializer(paramOutputStream, paramLogger);
    if (paramInt == 1)
    {
      paramRequestBatch = paramRequestBatch.get(0);
      HashMap localHashMap = new HashMap();
      Iterator localIterator = parameters.keySet().iterator();
      for (;;)
      {
        if (!localIterator.hasNext())
        {
          if (paramLogger != null) {
            paramLogger.append("  Parameters:\n");
          }
          serializeParameters(parameters, paramOutputStream, paramRequestBatch);
          if (paramLogger != null) {
            paramLogger.append("  Attachments:\n");
          }
          serializeAttachments(localHashMap, paramOutputStream);
          if (graphObject != null) {
            processGraphObject(graphObject, paramURL.getPath(), paramOutputStream);
          }
          return;
        }
        String str = (String)localIterator.next();
        Object localObject = parameters.get(str);
        if (isSupportedAttachmentType(localObject)) {
          localHashMap.put(str, new Attachment(paramRequestBatch, localObject));
        }
      }
    }
    paramURL = getBatchAppId(paramRequestBatch);
    if (Utility.isNullOrEmpty(paramURL)) {
      throw new FacebookException("At least one request in a batch must have an open Session, or a default app ID must be specified.");
    }
    paramOutputStream.writeString("batch_app_id", paramURL);
    paramURL = new HashMap();
    serializeRequestsAsJSON(paramOutputStream, paramRequestBatch, paramURL);
    if (paramLogger != null) {
      paramLogger.append("  Attachments:\n");
    }
    serializeAttachments(paramURL, paramOutputStream);
  }
  
  static void runCallbacks(final RequestBatch paramRequestBatch, List<Response> paramList)
  {
    int j = paramRequestBatch.size();
    ArrayList localArrayList = new ArrayList();
    int i = 0;
    for (;;)
    {
      if (i >= j)
      {
        if (localArrayList.size() > 0)
        {
          paramList = new Runnable()
          {
            public void run()
            {
              Iterator localIterator = iterator();
              if (!localIterator.hasNext()) {
                localIterator = paramRequestBatch.getCallbacks().iterator();
              }
              for (;;)
              {
                if (!localIterator.hasNext())
                {
                  return;
                  Pair localPair = (Pair)localIterator.next();
                  ((Request.Callback)first).onCompleted((Response)second);
                  break;
                }
                ((RequestBatch.Callback)localIterator.next()).onBatchCompleted(paramRequestBatch);
              }
            }
          };
          paramRequestBatch = paramRequestBatch.getCallbackHandler();
          if (paramRequestBatch != null) {
            break;
          }
          paramList.run();
        }
        return;
      }
      Request localRequest = paramRequestBatch.get(i);
      if (callback != null) {
        localArrayList.add(new Pair(callback, (Response)paramList.get(i)));
      }
      i += 1;
    }
    paramRequestBatch.post(paramList);
  }
  
  private static void serializeAttachments(Map<String, Attachment> paramMap, Serializer paramSerializer)
    throws IOException
  {
    Iterator localIterator = paramMap.keySet().iterator();
    for (;;)
    {
      if (!localIterator.hasNext()) {
        return;
      }
      String str = (String)localIterator.next();
      Attachment localAttachment = (Attachment)paramMap.get(str);
      if (isSupportedAttachmentType(localAttachment.getValue())) {
        paramSerializer.writeObject(str, localAttachment.getValue(), localAttachment.getRequest());
      }
    }
  }
  
  private static void serializeParameters(Bundle paramBundle, Serializer paramSerializer, Request paramRequest)
    throws IOException
  {
    Iterator localIterator = paramBundle.keySet().iterator();
    for (;;)
    {
      if (!localIterator.hasNext()) {
        return;
      }
      String str = (String)localIterator.next();
      Object localObject = paramBundle.get(str);
      if (isSupportedParameterType(localObject)) {
        paramSerializer.writeObject(str, localObject, paramRequest);
      }
    }
  }
  
  private static void serializeRequestsAsJSON(Serializer paramSerializer, Collection<Request> paramCollection, Map<String, Attachment> paramMap)
    throws JSONException, IOException
  {
    JSONArray localJSONArray = new JSONArray();
    Iterator localIterator = paramCollection.iterator();
    for (;;)
    {
      if (!localIterator.hasNext())
      {
        paramSerializer.writeRequestsAsJson("batch", localJSONArray, paramCollection);
        return;
      }
      ((Request)localIterator.next()).serializeToBatch(localJSONArray, paramMap);
    }
  }
  
  private void serializeToBatch(JSONArray paramJSONArray, final Map<String, Attachment> paramMap)
    throws JSONException, IOException
  {
    JSONObject localJSONObject = new JSONObject();
    if (batchEntryName != null)
    {
      localJSONObject.put("name", batchEntryName);
      localJSONObject.put("omit_response_on_success", batchEntryOmitResultOnSuccess);
    }
    if (batchEntryDependsOn != null) {
      localJSONObject.put("depends_on", batchEntryDependsOn);
    }
    String str1 = getUrlForBatchedRequest();
    localJSONObject.put("relative_url", str1);
    localJSONObject.put("method", httpMethod);
    if (session != null) {
      Logger.registerAccessToken(session.getAccessToken());
    }
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = parameters.keySet().iterator();
    for (;;)
    {
      if (!localIterator.hasNext())
      {
        if (!localArrayList.isEmpty()) {
          localJSONObject.put("attached_files", TextUtils.join(",", localArrayList));
        }
        if (graphObject != null)
        {
          paramMap = new ArrayList();
          processGraphObject(graphObject, str1, new KeyValueSerializer()
          {
            public void writeString(String paramAnonymousString1, String paramAnonymousString2)
              throws IOException
            {
              paramMap.add(String.format("%s=%s", new Object[] { paramAnonymousString1, URLEncoder.encode(paramAnonymousString2, "UTF-8") }));
            }
          });
          localJSONObject.put("body", TextUtils.join("&", paramMap));
        }
        paramJSONArray.put(localJSONObject);
        return;
      }
      Object localObject = (String)localIterator.next();
      localObject = parameters.get((String)localObject);
      if (isSupportedAttachmentType(localObject))
      {
        String str2 = String.format("%s%d", new Object[] { "file", Integer.valueOf(paramMap.size()) });
        localArrayList.add(str2);
        paramMap.put(str2, new Attachment(this, localObject));
      }
    }
  }
  
  static final void serializeToUrlConnection(RequestBatch paramRequestBatch, HttpURLConnection paramHttpURLConnection)
    throws IOException, JSONException
  {
    int i = 0;
    Logger localLogger = new Logger(LoggingBehavior.REQUESTS, "Request");
    int j = paramRequestBatch.size();
    if (j == 1) {}
    URL localURL;
    for (Object localObject = get0httpMethod;; localObject = HttpMethod.POST)
    {
      paramHttpURLConnection.setRequestMethod(((HttpMethod)localObject).name());
      localURL = paramHttpURLConnection.getURL();
      localLogger.append("Request:\n");
      localLogger.appendKeyValue("Id", paramRequestBatch.getId());
      localLogger.appendKeyValue("URL", localURL);
      localLogger.appendKeyValue("Method", paramHttpURLConnection.getRequestMethod());
      localLogger.appendKeyValue("User-Agent", paramHttpURLConnection.getRequestProperty("User-Agent"));
      localLogger.appendKeyValue("Content-Type", paramHttpURLConnection.getRequestProperty("Content-Type"));
      paramHttpURLConnection.setConnectTimeout(paramRequestBatch.getTimeout());
      paramHttpURLConnection.setReadTimeout(paramRequestBatch.getTimeout());
      if (localObject == HttpMethod.POST) {
        i = 1;
      }
      if (i != 0) {
        break;
      }
      localLogger.log();
      return;
    }
    paramHttpURLConnection.setDoOutput(true);
    for (;;)
    {
      try
      {
        if (hasOnProgressCallbacks(paramRequestBatch))
        {
          localObject = new ProgressNoopOutputStream(paramRequestBatch.getCallbackHandler());
          processRequest(paramRequestBatch, null, j, localURL, (OutputStream)localObject);
          i = ((ProgressNoopOutputStream)localObject).getMaxProgress();
          localObject = ((ProgressNoopOutputStream)localObject).getProgressMap();
          paramHttpURLConnection = new ProgressOutputStream(new BufferedOutputStream(paramHttpURLConnection.getOutputStream()), paramRequestBatch, (Map)localObject, i);
        }
      }
      finally
      {
        paramHttpURLConnection = null;
      }
      try
      {
        processRequest(paramRequestBatch, localLogger, j, localURL, paramHttpURLConnection);
        paramHttpURLConnection.close();
        localLogger.log();
        return;
      }
      finally {}
      paramHttpURLConnection = new BufferedOutputStream(paramHttpURLConnection.getOutputStream());
    }
    paramHttpURLConnection.close();
    throw paramRequestBatch;
  }
  
  public static HttpURLConnection toHttpConnection(RequestBatch paramRequestBatch)
  {
    for (;;)
    {
      try
      {
        if (paramRequestBatch.size() == 1) {
          localObject = new URL(paramRequestBatch.get(0).getUrlForSingleRequest());
        }
      }
      catch (MalformedURLException paramRequestBatch)
      {
        Object localObject;
        throw new FacebookException("could not construct URL for request", paramRequestBatch);
      }
      try
      {
        localObject = createConnection((URL)localObject);
        serializeToUrlConnection(paramRequestBatch, (HttpURLConnection)localObject);
        return localObject;
      }
      catch (IOException paramRequestBatch)
      {
        throw new FacebookException("could not construct request body", paramRequestBatch);
      }
      catch (JSONException paramRequestBatch)
      {
        throw new FacebookException("could not construct request body", paramRequestBatch);
      }
      localObject = new URL(ServerProtocol.getGraphUrlBase());
    }
  }
  
  public final Response executeAndWait()
  {
    return executeAndWait(this);
  }
  
  public final RequestAsyncTask executeAsync()
  {
    return executeBatchAsync(new Request[] { this });
  }
  
  public final Callback getCallback()
  {
    return callback;
  }
  
  public final GraphObject getGraphObject()
  {
    return graphObject;
  }
  
  public final HttpMethod getHttpMethod()
  {
    return httpMethod;
  }
  
  public final Bundle getParameters()
  {
    return parameters;
  }
  
  public final Session getSession()
  {
    return session;
  }
  
  public final Object getTag()
  {
    return tag;
  }
  
  final String getUrlForBatchedRequest()
  {
    if (overriddenURL != null) {
      throw new FacebookException("Can't override URL for a batch request");
    }
    String str = getGraphPathWithVersion();
    addCommonParameters();
    return appendParametersToBaseUrl(str);
  }
  
  final String getUrlForSingleRequest()
  {
    if (overriddenURL != null) {
      return overriddenURL.toString();
    }
    if ((getHttpMethod() == HttpMethod.POST) && (graphPath != null) && (graphPath.endsWith("/videos"))) {}
    for (String str = ServerProtocol.getGraphVideoUrlBase();; str = ServerProtocol.getGraphUrlBase())
    {
      str = String.format("%s/%s", new Object[] { str, getGraphPathWithVersion() });
      addCommonParameters();
      return appendParametersToBaseUrl(str);
    }
  }
  
  public final void setCallback(Callback paramCallback)
  {
    callback = paramCallback;
  }
  
  public final void setGraphObject(GraphObject paramGraphObject)
  {
    graphObject = paramGraphObject;
  }
  
  public final void setHttpMethod(HttpMethod paramHttpMethod)
  {
    if ((overriddenURL != null) && (paramHttpMethod != HttpMethod.GET)) {
      throw new FacebookException("Can't change HTTP method on request with overridden URL.");
    }
    if (paramHttpMethod != null) {}
    for (;;)
    {
      httpMethod = paramHttpMethod;
      return;
      paramHttpMethod = HttpMethod.GET;
    }
  }
  
  public final void setParameters(Bundle paramBundle)
  {
    parameters = paramBundle;
  }
  
  public final void setTag(Object paramObject)
  {
    tag = paramObject;
  }
  
  public String toString()
  {
    return "{Request: " + " session: " + session + ", graphPath: " + graphPath + ", graphObject: " + graphObject + ", httpMethod: " + httpMethod + ", parameters: " + parameters + "}";
  }
  
  private static class Attachment
  {
    private final Request request;
    private final Object value;
    
    public Attachment(Request paramRequest, Object paramObject)
    {
      request = paramRequest;
      value = paramObject;
    }
    
    public Request getRequest()
    {
      return request;
    }
    
    public Object getValue()
    {
      return value;
    }
  }
  
  public static abstract interface Callback
  {
    public abstract void onCompleted(Response paramResponse);
  }
  
  public static abstract interface GraphUserCallback
  {
    public abstract void onCompleted(GraphUser paramGraphUser, Response paramResponse);
  }
  
  private static abstract interface KeyValueSerializer
  {
    public abstract void writeString(String paramString1, String paramString2)
      throws IOException;
  }
  
  public static abstract interface OnProgressCallback
    extends Request.Callback
  {
    public abstract void onProgress(long paramLong1, long paramLong2);
  }
  
  private static class ParcelFileDescriptorWithMimeType
    implements Parcelable
  {
    public static final Parcelable.Creator<ParcelFileDescriptorWithMimeType> CREATOR = new Parcelable.Creator()
    {
      public Request.ParcelFileDescriptorWithMimeType createFromParcel(Parcel paramAnonymousParcel)
      {
        return new Request.ParcelFileDescriptorWithMimeType(paramAnonymousParcel, null);
      }
      
      public Request.ParcelFileDescriptorWithMimeType[] newArray(int paramAnonymousInt)
      {
        return new Request.ParcelFileDescriptorWithMimeType[paramAnonymousInt];
      }
    };
    private final ParcelFileDescriptor fileDescriptor;
    private final String mimeType;
    
    private ParcelFileDescriptorWithMimeType(Parcel paramParcel)
    {
      mimeType = paramParcel.readString();
      fileDescriptor = paramParcel.readFileDescriptor();
    }
    
    public int describeContents()
    {
      return 1;
    }
    
    public ParcelFileDescriptor getFileDescriptor()
    {
      return fileDescriptor;
    }
    
    public String getMimeType()
    {
      return mimeType;
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      paramParcel.writeString(mimeType);
      paramParcel.writeFileDescriptor(fileDescriptor.getFileDescriptor());
    }
  }
  
  private static class Serializer
    implements Request.KeyValueSerializer
  {
    private boolean firstWrite = true;
    private final Logger logger;
    private final OutputStream outputStream;
    
    public Serializer(OutputStream paramOutputStream, Logger paramLogger)
    {
      outputStream = paramOutputStream;
      logger = paramLogger;
    }
    
    public void write(String paramString, Object... paramVarArgs)
      throws IOException
    {
      if (firstWrite)
      {
        outputStream.write("--".getBytes());
        outputStream.write("3i2ndDfv2rTHiSisAbouNdArYfORhtTPEefj3q2f".getBytes());
        outputStream.write("\r\n".getBytes());
        firstWrite = false;
      }
      outputStream.write(String.format(paramString, paramVarArgs).getBytes());
    }
    
    public void writeBitmap(String paramString, Bitmap paramBitmap)
      throws IOException
    {
      writeContentDisposition(paramString, paramString, "image/png");
      paramBitmap.compress(Bitmap.CompressFormat.PNG, 100, outputStream);
      writeLine("", new Object[0]);
      writeRecordBoundary();
      if (logger != null) {
        logger.appendKeyValue("    " + paramString, "<Image>");
      }
    }
    
    public void writeBytes(String paramString, byte[] paramArrayOfByte)
      throws IOException
    {
      writeContentDisposition(paramString, paramString, "content/unknown");
      outputStream.write(paramArrayOfByte);
      writeLine("", new Object[0]);
      writeRecordBoundary();
      if (logger != null) {
        logger.appendKeyValue("    " + paramString, String.format("<Data: %d>", new Object[] { Integer.valueOf(paramArrayOfByte.length) }));
      }
    }
    
    public void writeContentDisposition(String paramString1, String paramString2, String paramString3)
      throws IOException
    {
      write("Content-Disposition: form-data; name=\"%s\"", new Object[] { paramString1 });
      if (paramString2 != null) {
        write("; filename=\"%s\"", new Object[] { paramString2 });
      }
      writeLine("", new Object[0]);
      if (paramString3 != null) {
        writeLine("%s: %s", new Object[] { "Content-Type", paramString3 });
      }
      writeLine("", new Object[0]);
    }
    
    public void writeFile(String paramString1, ParcelFileDescriptor paramParcelFileDescriptor, String paramString2)
      throws IOException
    {
      String str = paramString2;
      if (paramString2 == null) {
        str = "content/unknown";
      }
      writeContentDisposition(paramString1, paramString1, str);
      int i = 0;
      int j = 0;
      if ((outputStream instanceof ProgressNoopOutputStream))
      {
        ((ProgressNoopOutputStream)outputStream).addProgress(paramParcelFileDescriptor.getStatSize());
        label49:
        writeLine("", new Object[0]);
        writeRecordBoundary();
        if (logger != null) {
          logger.appendKeyValue("    " + paramString1, String.format("<Data: %d>", new Object[] { Integer.valueOf(j) }));
        }
        return;
      }
      str = null;
      paramString2 = null;
      try
      {
        paramParcelFileDescriptor = new ParcelFileDescriptor.AutoCloseInputStream(paramParcelFileDescriptor);
      }
      finally
      {
        try
        {
          localBufferedInputStream = new BufferedInputStream(paramParcelFileDescriptor);
        }
        finally
        {
          label141:
          label209:
          paramString1 = paramParcelFileDescriptor;
          paramParcelFileDescriptor = localObject1;
        }
        try
        {
          paramString2 = new byte[' '];
          j = localBufferedInputStream.read(paramString2);
          if (j == -1)
          {
            if (localBufferedInputStream != null) {
              localBufferedInputStream.close();
            }
            j = i;
            if (paramParcelFileDescriptor == null) {
              break label49;
            }
            paramParcelFileDescriptor.close();
            j = i;
            break label49;
          }
          outputStream.write(paramString2, 0, j);
          i += j;
          break label141;
          paramParcelFileDescriptor = finally;
          paramString1 = str;
        }
        finally
        {
          paramString2 = localBufferedInputStream;
          paramString1 = paramParcelFileDescriptor;
          paramParcelFileDescriptor = localObject2;
          break label209;
        }
        if (paramString2 != null) {
          paramString2.close();
        }
        if (paramString1 != null) {
          paramString1.close();
        }
        throw paramParcelFileDescriptor;
      }
    }
    
    public void writeFile(String paramString, Request.ParcelFileDescriptorWithMimeType paramParcelFileDescriptorWithMimeType)
      throws IOException
    {
      writeFile(paramString, paramParcelFileDescriptorWithMimeType.getFileDescriptor(), paramParcelFileDescriptorWithMimeType.getMimeType());
    }
    
    public void writeLine(String paramString, Object... paramVarArgs)
      throws IOException
    {
      write(paramString, paramVarArgs);
      write("\r\n", new Object[0]);
    }
    
    public void writeObject(String paramString, Object paramObject, Request paramRequest)
      throws IOException
    {
      if ((outputStream instanceof RequestOutputStream)) {
        ((RequestOutputStream)outputStream).setCurrentRequest(paramRequest);
      }
      if (Request.isSupportedParameterType(paramObject))
      {
        writeString(paramString, Request.parameterToString(paramObject));
        return;
      }
      if ((paramObject instanceof Bitmap))
      {
        writeBitmap(paramString, (Bitmap)paramObject);
        return;
      }
      if ((paramObject instanceof byte[]))
      {
        writeBytes(paramString, (byte[])paramObject);
        return;
      }
      if ((paramObject instanceof ParcelFileDescriptor))
      {
        writeFile(paramString, (ParcelFileDescriptor)paramObject, null);
        return;
      }
      if ((paramObject instanceof Request.ParcelFileDescriptorWithMimeType))
      {
        writeFile(paramString, (Request.ParcelFileDescriptorWithMimeType)paramObject);
        return;
      }
      throw new IllegalArgumentException("value is not a supported type: String, Bitmap, byte[]");
    }
    
    public void writeRecordBoundary()
      throws IOException
    {
      writeLine("--%s", new Object[] { "3i2ndDfv2rTHiSisAbouNdArYfORhtTPEefj3q2f" });
    }
    
    public void writeRequestsAsJson(String paramString, JSONArray paramJSONArray, Collection<Request> paramCollection)
      throws IOException, JSONException
    {
      if (!(outputStream instanceof RequestOutputStream)) {
        writeString(paramString, paramJSONArray.toString());
      }
      RequestOutputStream localRequestOutputStream;
      int i;
      do
      {
        return;
        localRequestOutputStream = (RequestOutputStream)outputStream;
        writeContentDisposition(paramString, null, null);
        write("[", new Object[0]);
        i = 0;
        paramCollection = paramCollection.iterator();
        if (paramCollection.hasNext()) {
          break;
        }
        write("]", new Object[0]);
      } while (logger == null);
      logger.appendKeyValue("    " + paramString, paramJSONArray.toString());
      return;
      Request localRequest = (Request)paramCollection.next();
      JSONObject localJSONObject = paramJSONArray.getJSONObject(i);
      localRequestOutputStream.setCurrentRequest(localRequest);
      if (i > 0) {
        write(",%s", new Object[] { localJSONObject.toString() });
      }
      for (;;)
      {
        i += 1;
        break;
        write("%s", new Object[] { localJSONObject.toString() });
      }
    }
    
    public void writeString(String paramString1, String paramString2)
      throws IOException
    {
      writeContentDisposition(paramString1, null, null);
      writeLine("%s", new Object[] { paramString2 });
      writeRecordBoundary();
      if (logger != null) {
        logger.appendKeyValue("    " + paramString1, paramString2);
      }
    }
  }
}
