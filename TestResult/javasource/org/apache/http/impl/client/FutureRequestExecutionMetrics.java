package org.apache.http.impl.client;

import java.util.concurrent.atomic.AtomicLong;

public final class FutureRequestExecutionMetrics
{
  private final AtomicLong activeConnections = new AtomicLong();
  private final DurationCounter failedConnections = new DurationCounter();
  private final DurationCounter requests = new DurationCounter();
  private final AtomicLong scheduledConnections = new AtomicLong();
  private final DurationCounter successfulConnections = new DurationCounter();
  private final DurationCounter tasks = new DurationCounter();
  
  FutureRequestExecutionMetrics() {}
  
  public long getActiveConnectionCount()
  {
    return activeConnections.get();
  }
  
  AtomicLong getActiveConnections()
  {
    return activeConnections;
  }
  
  public long getFailedConnectionAverageDuration()
  {
    return failedConnections.averageDuration();
  }
  
  public long getFailedConnectionCount()
  {
    return failedConnections.count();
  }
  
  DurationCounter getFailedConnections()
  {
    return failedConnections;
  }
  
  public long getRequestAverageDuration()
  {
    return requests.averageDuration();
  }
  
  public long getRequestCount()
  {
    return requests.count();
  }
  
  DurationCounter getRequests()
  {
    return requests;
  }
  
  public long getScheduledConnectionCount()
  {
    return scheduledConnections.get();
  }
  
  AtomicLong getScheduledConnections()
  {
    return scheduledConnections;
  }
  
  public long getSuccessfulConnectionAverageDuration()
  {
    return successfulConnections.averageDuration();
  }
  
  public long getSuccessfulConnectionCount()
  {
    return successfulConnections.count();
  }
  
  DurationCounter getSuccessfulConnections()
  {
    return successfulConnections;
  }
  
  public long getTaskAverageDuration()
  {
    return tasks.averageDuration();
  }
  
  public long getTaskCount()
  {
    return tasks.count();
  }
  
  DurationCounter getTasks()
  {
    return tasks;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("[activeConnections=").append(activeConnections).append(", scheduledConnections=").append(scheduledConnections).append(", successfulConnections=").append(successfulConnections).append(", failedConnections=").append(failedConnections).append(", requests=").append(requests).append(", tasks=").append(tasks).append("]");
    return localStringBuilder.toString();
  }
  
  static class DurationCounter
  {
    private final AtomicLong count = new AtomicLong(0L);
    private final AtomicLong cumulativeDuration = new AtomicLong(0L);
    
    DurationCounter() {}
    
    public long averageDuration()
    {
      long l = count.get();
      return cumulativeDuration.get() / l;
    }
    
    public long count()
    {
      return count.get();
    }
    
    public void increment(long paramLong)
    {
      count.incrementAndGet();
      cumulativeDuration.addAndGet(System.currentTimeMillis() - paramLong);
    }
    
    public String toString()
    {
      StringBuilder localStringBuilder = new StringBuilder();
      localStringBuilder.append("[count=").append(count()).append(", averageDuration=").append(averageDuration()).append("]");
      return localStringBuilder.toString();
    }
  }
}
