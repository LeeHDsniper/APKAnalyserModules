package com.facebook.internal;

import com.facebook.Settings;
import java.util.concurrent.Executor;

class WorkQueue
{
  private final Executor executor;
  private final int maxConcurrent;
  private int runningCount = 0;
  private WorkNode runningJobs = null;
  private final Object workLock = new Object();
  
  static
  {
    if (!WorkQueue.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }
  
  WorkQueue()
  {
    this(8);
  }
  
  WorkQueue(int paramInt)
  {
    this(paramInt, Settings.getExecutor());
  }
  
  WorkQueue(int paramInt, Executor paramExecutor)
  {
    maxConcurrent = paramInt;
    executor = paramExecutor;
  }
  
  private class WorkNode
  {
    static
    {
      if (!WorkQueue.class.desiredAssertionStatus()) {}
      for (boolean bool = true;; bool = false)
      {
        $assertionsDisabled = bool;
        return;
      }
    }
  }
}
