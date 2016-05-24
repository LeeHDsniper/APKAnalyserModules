package com.facebook;

import android.os.Handler;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

class ProgressNoopOutputStream
  extends OutputStream
  implements RequestOutputStream
{
  private int batchMax;
  private final Handler callbackHandler;
  private Request currentRequest;
  private RequestProgress currentRequestProgress;
  private final Map<Request, RequestProgress> progressMap = new HashMap();
  
  ProgressNoopOutputStream(Handler paramHandler)
  {
    callbackHandler = paramHandler;
  }
  
  void addProgress(long paramLong)
  {
    if (currentRequestProgress == null)
    {
      currentRequestProgress = new RequestProgress(callbackHandler, currentRequest);
      progressMap.put(currentRequest, currentRequestProgress);
    }
    currentRequestProgress.addToMax(paramLong);
    batchMax = ((int)(batchMax + paramLong));
  }
  
  int getMaxProgress()
  {
    return batchMax;
  }
  
  Map<Request, RequestProgress> getProgressMap()
  {
    return progressMap;
  }
  
  public void setCurrentRequest(Request paramRequest)
  {
    currentRequest = paramRequest;
    if (paramRequest != null) {}
    for (paramRequest = (RequestProgress)progressMap.get(paramRequest);; paramRequest = null)
    {
      currentRequestProgress = paramRequest;
      return;
    }
  }
  
  public void write(int paramInt)
  {
    addProgress(1L);
  }
  
  public void write(byte[] paramArrayOfByte)
  {
    addProgress(paramArrayOfByte.length);
  }
  
  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    addProgress(paramInt2);
  }
}
