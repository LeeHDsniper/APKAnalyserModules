package com.facebook;

import android.os.Handler;
import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

class ProgressOutputStream
  extends FilterOutputStream
  implements RequestOutputStream
{
  private long batchProgress;
  private RequestProgress currentRequestProgress;
  private long lastReportedProgress;
  private long maxProgress;
  private final Map<Request, RequestProgress> progressMap;
  private final RequestBatch requests;
  private final long threshold;
  
  ProgressOutputStream(OutputStream paramOutputStream, RequestBatch paramRequestBatch, Map<Request, RequestProgress> paramMap, long paramLong)
  {
    super(paramOutputStream);
    requests = paramRequestBatch;
    progressMap = paramMap;
    maxProgress = paramLong;
    threshold = Settings.getOnProgressThreshold();
  }
  
  private void addProgress(long paramLong)
  {
    if (currentRequestProgress != null) {
      currentRequestProgress.addProgress(paramLong);
    }
    batchProgress += paramLong;
    if ((batchProgress >= lastReportedProgress + threshold) || (batchProgress >= maxProgress)) {
      reportBatchProgress();
    }
  }
  
  private void reportBatchProgress()
  {
    Iterator localIterator;
    if (batchProgress > lastReportedProgress) {
      localIterator = requests.getCallbacks().iterator();
    }
    for (;;)
    {
      if (!localIterator.hasNext())
      {
        lastReportedProgress = batchProgress;
        return;
      }
      Object localObject = (RequestBatch.Callback)localIterator.next();
      if ((localObject instanceof RequestBatch.OnProgressCallback))
      {
        Handler localHandler = requests.getCallbackHandler();
        localObject = (RequestBatch.OnProgressCallback)localObject;
        if (localHandler == null) {
          ((RequestBatch.OnProgressCallback)localObject).onBatchProgress(requests, batchProgress, maxProgress);
        } else {
          localHandler.post(new Runnable()
          {
            public void run()
            {
              val$progressCallback.onBatchProgress(requests, batchProgress, maxProgress);
            }
          });
        }
      }
    }
  }
  
  public void close()
    throws IOException
  {
    super.close();
    Iterator localIterator = progressMap.values().iterator();
    for (;;)
    {
      if (!localIterator.hasNext())
      {
        reportBatchProgress();
        return;
      }
      ((RequestProgress)localIterator.next()).reportProgress();
    }
  }
  
  public void setCurrentRequest(Request paramRequest)
  {
    if (paramRequest != null) {}
    for (paramRequest = (RequestProgress)progressMap.get(paramRequest);; paramRequest = null)
    {
      currentRequestProgress = paramRequest;
      return;
    }
  }
  
  public void write(int paramInt)
    throws IOException
  {
    out.write(paramInt);
    addProgress(1L);
  }
  
  public void write(byte[] paramArrayOfByte)
    throws IOException
  {
    out.write(paramArrayOfByte);
    addProgress(paramArrayOfByte.length);
  }
  
  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    out.write(paramArrayOfByte, paramInt1, paramInt2);
    addProgress(paramInt2);
  }
}
