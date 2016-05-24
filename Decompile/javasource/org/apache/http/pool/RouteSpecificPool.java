package org.apache.http.pool;

import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Set;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;

@NotThreadSafe
abstract class RouteSpecificPool<T, C, E extends PoolEntry<T, C>>
{
  private final LinkedList<E> available;
  private final Set<E> leased;
  private final LinkedList<PoolEntryFuture<E>> pending;
  private final T route;
  
  RouteSpecificPool(T paramT)
  {
    route = paramT;
    leased = new HashSet();
    available = new LinkedList();
    pending = new LinkedList();
  }
  
  public E add(C paramC)
  {
    paramC = createEntry(paramC);
    leased.add(paramC);
    return paramC;
  }
  
  protected abstract E createEntry(C paramC);
  
  public void free(E paramE, boolean paramBoolean)
  {
    Args.notNull(paramE, "Pool entry");
    Asserts.check(leased.remove(paramE), "Entry %s has not been leased from this pool", new Object[] { paramE });
    if (paramBoolean) {
      available.addFirst(paramE);
    }
  }
  
  public int getAllocatedCount()
  {
    return available.size() + leased.size();
  }
  
  public int getAvailableCount()
  {
    return available.size();
  }
  
  public E getFree(Object paramObject)
  {
    if (!available.isEmpty())
    {
      Object localObject;
      if (paramObject != null)
      {
        localObject = available.iterator();
        while (((Iterator)localObject).hasNext())
        {
          PoolEntry localPoolEntry = (PoolEntry)((Iterator)localObject).next();
          if (paramObject.equals(localPoolEntry.getState()))
          {
            ((Iterator)localObject).remove();
            leased.add(localPoolEntry);
            return localPoolEntry;
          }
        }
      }
      paramObject = available.iterator();
      while (paramObject.hasNext())
      {
        localObject = (PoolEntry)paramObject.next();
        if (((PoolEntry)localObject).getState() == null)
        {
          paramObject.remove();
          leased.add(localObject);
          return localObject;
        }
      }
    }
    return null;
  }
  
  public E getLastUsed()
  {
    if (!available.isEmpty()) {
      return (PoolEntry)available.getLast();
    }
    return null;
  }
  
  public int getLeasedCount()
  {
    return leased.size();
  }
  
  public int getPendingCount()
  {
    return pending.size();
  }
  
  public final T getRoute()
  {
    return route;
  }
  
  public PoolEntryFuture<E> nextPending()
  {
    return (PoolEntryFuture)pending.poll();
  }
  
  public void queue(PoolEntryFuture<E> paramPoolEntryFuture)
  {
    if (paramPoolEntryFuture == null) {
      return;
    }
    pending.add(paramPoolEntryFuture);
  }
  
  public boolean remove(E paramE)
  {
    Args.notNull(paramE, "Pool entry");
    return (available.remove(paramE)) || (leased.remove(paramE));
  }
  
  public void shutdown()
  {
    Iterator localIterator = pending.iterator();
    while (localIterator.hasNext()) {
      ((PoolEntryFuture)localIterator.next()).cancel(true);
    }
    pending.clear();
    localIterator = available.iterator();
    while (localIterator.hasNext()) {
      ((PoolEntry)localIterator.next()).close();
    }
    available.clear();
    localIterator = leased.iterator();
    while (localIterator.hasNext()) {
      ((PoolEntry)localIterator.next()).close();
    }
    leased.clear();
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("[route: ");
    localStringBuilder.append(route);
    localStringBuilder.append("][leased: ");
    localStringBuilder.append(leased.size());
    localStringBuilder.append("][available: ");
    localStringBuilder.append(available.size());
    localStringBuilder.append("][pending: ");
    localStringBuilder.append(pending.size());
    localStringBuilder.append("]");
    return localStringBuilder.toString();
  }
  
  public void unqueue(PoolEntryFuture<E> paramPoolEntryFuture)
  {
    if (paramPoolEntryFuture == null) {
      return;
    }
    pending.remove(paramPoolEntryFuture);
  }
}
