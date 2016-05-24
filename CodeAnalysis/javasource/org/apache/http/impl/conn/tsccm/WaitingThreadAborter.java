package org.apache.http.impl.conn.tsccm;

@Deprecated
public class WaitingThreadAborter
{
  private boolean aborted;
  private WaitingThread waitingThread;
  
  public WaitingThreadAborter() {}
  
  public void abort()
  {
    aborted = true;
    if (waitingThread != null) {
      waitingThread.interrupt();
    }
  }
  
  public void setWaitingThread(WaitingThread paramWaitingThread)
  {
    waitingThread = paramWaitingThread;
    if (aborted) {
      paramWaitingThread.interrupt();
    }
  }
}
