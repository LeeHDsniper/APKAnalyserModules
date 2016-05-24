package de.greenrobot.event;

import java.util.ArrayList;
import java.util.List;

final class PendingPost
{
  private static final List<PendingPost> pendingPostPool = new ArrayList();
  Object event;
  PendingPost next;
  Subscription subscription;
  
  private PendingPost(Object paramObject, Subscription paramSubscription)
  {
    event = paramObject;
    subscription = paramSubscription;
  }
  
  static PendingPost obtainPendingPost(Subscription paramSubscription, Object paramObject)
  {
    synchronized (pendingPostPool)
    {
      int i = pendingPostPool.size();
      if (i > 0)
      {
        PendingPost localPendingPost = (PendingPost)pendingPostPool.remove(i - 1);
        event = paramObject;
        subscription = paramSubscription;
        next = null;
        return localPendingPost;
      }
      return new PendingPost(paramObject, paramSubscription);
    }
  }
  
  static void releasePendingPost(PendingPost paramPendingPost)
  {
    event = null;
    subscription = null;
    next = null;
    synchronized (pendingPostPool)
    {
      if (pendingPostPool.size() < 10000) {
        pendingPostPool.add(paramPendingPost);
      }
      return;
    }
  }
}
