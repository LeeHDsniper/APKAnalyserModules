package com.facebook;

import android.os.Handler;

class RequestProgress
{
  private final Handler callbackHandler;
  private long lastReportedProgress;
  private long maxProgress;
  private long progress;
  private final Request request;
  private final long threshold;
  
  RequestProgress(Handler paramHandler, Request paramRequest)
  {
    request = paramRequest;
    callbackHandler = paramHandler;
    threshold = Settings.getOnProgressThreshold();
  }
  
  void addProgress(long paramLong)
  {
    progress += paramLong;
    if ((progress >= lastReportedProgress + threshold) || (progress >= maxProgress)) {
      reportProgress();
    }
  }
  
  void addToMax(long paramLong)
  {
    maxProgress += paramLong;
  }
  
  void reportProgress()
  {
    Object localObject;
    final long l1;
    long l2;
    if (progress > lastReportedProgress)
    {
      localObject = request.getCallback();
      if ((maxProgress > 0L) && ((localObject instanceof Request.OnProgressCallback)))
      {
        l1 = progress;
        l2 = maxProgress;
        localObject = (Request.OnProgressCallback)localObject;
        if (callbackHandler != null) {
          break label80;
        }
        ((Request.OnProgressCallback)localObject).onProgress(l1, l2);
      }
    }
    for (;;)
    {
      lastReportedProgress = progress;
      return;
      label80:
      callbackHandler.post(new Runnable()
      {
        public void run()
        {
          val$callbackCopy.onProgress(l1, val$maxProgressCopy);
        }
      });
    }
  }
}
