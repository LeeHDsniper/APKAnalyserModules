package com.adobe.creativesdk.aviary.utils;

import java.util.concurrent.ThreadFactory;

public final class CustomPriorityThreadFactory
  implements ThreadFactory
{
  private final int threadPriority;
  
  public CustomPriorityThreadFactory(int paramInt)
  {
    threadPriority = paramInt;
  }
  
  public Thread newThread(Runnable paramRunnable)
  {
    paramRunnable = new Thread(paramRunnable);
    paramRunnable.setPriority(threadPriority);
    return paramRunnable;
  }
}
