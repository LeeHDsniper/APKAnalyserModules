package de.greenrobot.event;

final class PendingPostQueue
{
  private PendingPost head;
  private PendingPost tail;
  
  PendingPostQueue() {}
  
  void enqueue(PendingPost paramPendingPost)
  {
    if (paramPendingPost == null) {
      try
      {
        throw new NullPointerException("null cannot be enqueued");
      }
      finally {}
    }
    if (tail != null)
    {
      tail.next = paramPendingPost;
      tail = paramPendingPost;
    }
    for (;;)
    {
      notifyAll();
      return;
      if (head != null) {
        break;
      }
      tail = paramPendingPost;
      head = paramPendingPost;
    }
    throw new IllegalStateException("Head present, but no tail");
  }
  
  PendingPost poll()
  {
    try
    {
      PendingPost localPendingPost = head;
      if (head != null)
      {
        head = head.next;
        if (head == null) {
          tail = null;
        }
      }
      return localPendingPost;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  PendingPost poll(int paramInt)
    throws InterruptedException
  {
    try
    {
      if (head == null) {
        wait(paramInt);
      }
      PendingPost localPendingPost = poll();
      return localPendingPost;
    }
    finally {}
  }
}
