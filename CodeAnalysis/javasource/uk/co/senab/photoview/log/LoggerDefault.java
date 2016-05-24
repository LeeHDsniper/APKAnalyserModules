package uk.co.senab.photoview.log;

import android.util.Log;

public class LoggerDefault
  implements Logger
{
  public LoggerDefault() {}
  
  public int d(String paramString1, String paramString2)
  {
    return Log.d(paramString1, paramString2);
  }
  
  public int i(String paramString1, String paramString2)
  {
    return Log.i(paramString1, paramString2);
  }
}
