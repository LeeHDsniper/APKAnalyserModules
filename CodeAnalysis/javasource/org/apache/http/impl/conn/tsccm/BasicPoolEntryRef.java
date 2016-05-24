package org.apache.http.impl.conn.tsccm;

import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.util.Args;

@Deprecated
public class BasicPoolEntryRef
  extends WeakReference<BasicPoolEntry>
{
  private final HttpRoute route;
  
  public BasicPoolEntryRef(BasicPoolEntry paramBasicPoolEntry, ReferenceQueue<Object> paramReferenceQueue)
  {
    super(paramBasicPoolEntry, paramReferenceQueue);
    Args.notNull(paramBasicPoolEntry, "Pool entry");
    route = paramBasicPoolEntry.getPlannedRoute();
  }
  
  public final HttpRoute getRoute()
  {
    return route;
  }
}
