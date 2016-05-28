package com.facebook;

import android.annotation.TargetApi;
import android.os.AsyncTask;
import android.os.Handler;
import android.util.Log;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.util.List;
import java.util.concurrent.Executor;

@TargetApi(3)
public class RequestAsyncTask
  extends AsyncTask<Void, Void, List<Response>>
{
  private static final String TAG = RequestAsyncTask.class.getCanonicalName();
  private static Method executeOnExecutorMethod;
  private final HttpURLConnection connection;
  private Exception exception;
  private final RequestBatch requests;
  
  static
  {
    Method[] arrayOfMethod = AsyncTask.class.getMethods();
    int j = arrayOfMethod.length;
    int i = 0;
    for (;;)
    {
      if (i >= j) {
        return;
      }
      Method localMethod = arrayOfMethod[i];
      if ("executeOnExecutor".equals(localMethod.getName()))
      {
        Class[] arrayOfClass = localMethod.getParameterTypes();
        if ((arrayOfClass.length == 2) && (arrayOfClass[0] == Executor.class) && (arrayOfClass[1].isArray()))
        {
          executeOnExecutorMethod = localMethod;
          return;
        }
      }
      i += 1;
    }
  }
  
  public RequestAsyncTask(RequestBatch paramRequestBatch)
  {
    this(null, paramRequestBatch);
  }
  
  public RequestAsyncTask(HttpURLConnection paramHttpURLConnection, RequestBatch paramRequestBatch)
  {
    requests = paramRequestBatch;
    connection = paramHttpURLConnection;
  }
  
  protected List<Response> doInBackground(Void... paramVarArgs)
  {
    try
    {
      if (connection == null) {
        return requests.executeAndWait();
      }
      paramVarArgs = Request.executeConnectionAndWait(connection, requests);
      return paramVarArgs;
    }
    catch (Exception paramVarArgs)
    {
      exception = paramVarArgs;
    }
    return null;
  }
  
  RequestAsyncTask executeOnSettingsExecutor()
  {
    try
    {
      if (executeOnExecutorMethod != null)
      {
        executeOnExecutorMethod.invoke(this, new Object[] { Settings.getExecutor(), null });
        return this;
      }
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      execute(new Void[0]);
      return this;
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      for (;;) {}
    }
  }
  
  protected void onPostExecute(List<Response> paramList)
  {
    super.onPostExecute(paramList);
    if (exception != null) {
      Log.d(TAG, String.format("onPostExecute: exception encountered during request: %s", new Object[] { exception.getMessage() }));
    }
  }
  
  protected void onPreExecute()
  {
    super.onPreExecute();
    if (requests.getCallbackHandler() == null) {
      requests.setCallbackHandler(new Handler());
    }
  }
  
  public String toString()
  {
    return "{RequestAsyncTask: " + " connection: " + connection + ", requests: " + requests + "}";
  }
}
