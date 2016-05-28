package com.adobe.creativesdk.aviary.internal.services;

import com.adobe.creativesdk.aviary.internal.AdobeImageEditorController;
import com.adobe.creativesdk.aviary.internal.threading.Future;
import com.adobe.creativesdk.aviary.internal.threading.FutureListener;
import com.adobe.creativesdk.aviary.internal.threading.ThreadPool;
import com.adobe.creativesdk.aviary.internal.threading.ThreadPool.Job;

public class ThreadPoolService
  extends BaseContextService
{
  private final ThreadPool mExecutor = new ThreadPool(5, 19);
  
  public ThreadPoolService(AdobeImageEditorController paramAdobeImageEditorController)
  {
    super(paramAdobeImageEditorController);
  }
  
  public void dispose()
  {
    mExecutor.dispose();
  }
  
  public <I, O> Future<O> submit(ThreadPool.Job<I, O> paramJob, FutureListener<O> paramFutureListener, I... paramVarArgs)
  {
    return mExecutor.submit(paramJob, paramFutureListener, paramVarArgs);
  }
}
