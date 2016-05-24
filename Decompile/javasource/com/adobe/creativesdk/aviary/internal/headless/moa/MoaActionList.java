package com.adobe.creativesdk.aviary.internal.headless.moa;

import java.io.Serializable;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;

public final class MoaActionList
  implements Serializable, Cloneable, List<MoaAction>
{
  private static final long serialVersionUID = 1440677080379147199L;
  protected final List<MoaAction> actions = Collections.synchronizedList(new LinkedList());
  
  protected MoaActionList() {}
  
  public void add(int paramInt, MoaAction paramMoaAction)
  {
    actions.add(paramInt, paramMoaAction);
  }
  
  public boolean add(MoaAction paramMoaAction)
  {
    return actions.add(paramMoaAction);
  }
  
  public boolean addAll(int paramInt, Collection<? extends MoaAction> paramCollection)
  {
    return actions.addAll(paramInt, paramCollection);
  }
  
  public boolean addAll(Collection<? extends MoaAction> paramCollection)
  {
    return actions.addAll(paramCollection);
  }
  
  public void clear()
  {
    actions.clear();
  }
  
  public Object clone()
  {
    MoaActionList localMoaActionList = new MoaActionList();
    synchronized (actions)
    {
      Iterator localIterator = actions.iterator();
      for (;;)
      {
        boolean bool = localIterator.hasNext();
        if (bool) {
          try
          {
            localMoaActionList.add((MoaAction)((MoaAction)localIterator.next()).clone());
          }
          catch (CloneNotSupportedException localCloneNotSupportedException)
          {
            localCloneNotSupportedException.printStackTrace();
          }
        }
      }
    }
    return localObject;
  }
  
  public boolean contains(Object paramObject)
  {
    return actions.contains(paramObject);
  }
  
  public boolean containsAll(Collection<?> paramCollection)
  {
    return actions.containsAll(paramCollection);
  }
  
  public MoaAction get(int paramInt)
  {
    return (MoaAction)actions.get(paramInt);
  }
  
  public MoaAction get(String paramString)
  {
    synchronized (actions)
    {
      Iterator localIterator = actions.iterator();
      while (localIterator.hasNext())
      {
        MoaAction localMoaAction = (MoaAction)localIterator.next();
        if (paramString.equals(localMoaAction.getName())) {
          return localMoaAction;
        }
      }
      return null;
    }
  }
  
  public int indexOf(Object paramObject)
  {
    return actions.indexOf(paramObject);
  }
  
  public boolean isEmpty()
  {
    return actions.isEmpty();
  }
  
  public Iterator<MoaAction> iterator()
  {
    return actions.iterator();
  }
  
  public int lastIndexOf(Object paramObject)
  {
    return actions.lastIndexOf(paramObject);
  }
  
  public ListIterator<MoaAction> listIterator()
  {
    return actions.listIterator();
  }
  
  public ListIterator<MoaAction> listIterator(int paramInt)
  {
    return actions.listIterator(paramInt);
  }
  
  public MoaAction remove(int paramInt)
  {
    return (MoaAction)actions.remove(paramInt);
  }
  
  public boolean remove(Object paramObject)
  {
    return actions.remove(paramObject);
  }
  
  public boolean removeAll(Collection<?> paramCollection)
  {
    return actions.removeAll(paramCollection);
  }
  
  public boolean retainAll(Collection<?> paramCollection)
  {
    return false;
  }
  
  public MoaAction set(int paramInt, MoaAction paramMoaAction)
  {
    return (MoaAction)actions.set(paramInt, paramMoaAction);
  }
  
  public int size()
  {
    return actions.size();
  }
  
  public List<MoaAction> subList(int paramInt1, int paramInt2)
  {
    return actions.subList(paramInt1, paramInt2);
  }
  
  public Object[] toArray()
  {
    return actions.toArray();
  }
  
  public <T> T[] toArray(T[] paramArrayOfT)
  {
    return actions.toArray(paramArrayOfT);
  }
}
