package android.support.v4.util;

import android.util.Log;
import java.io.Writer;

public class LogWriter
  extends Writer
{
  private StringBuilder mBuilder = new StringBuilder(128);
  private final String mTag;
  
  public LogWriter(String paramString)
  {
    mTag = paramString;
  }
  
  private void flushBuilder()
  {
    if (mBuilder.length() > 0)
    {
      Log.d(mTag, mBuilder.toString());
      mBuilder.delete(0, mBuilder.length());
    }
  }
  
  public void close()
  {
    flushBuilder();
  }
  
  public void flush()
  {
    flushBuilder();
  }
  
  public void write(char[] paramArrayOfChar, int paramInt1, int paramInt2)
  {
    int i = 0;
    if (i < paramInt2)
    {
      char c = paramArrayOfChar[(paramInt1 + i)];
      if (c == '\n') {
        flushBuilder();
      }
      for (;;)
      {
        i += 1;
        break;
        mBuilder.append(c);
      }
    }
  }
}
