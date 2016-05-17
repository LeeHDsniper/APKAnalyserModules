package com.tencent.mobileqq.pb;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public final class PBRepeatMessageField<T extends MessageMicro<T>>
  extends PBField<List<T>>
{
  private final Class<T> helper;
  private List<T> value = Collections.emptyList();
  
  public PBRepeatMessageField(Class<T> paramClass)
  {
    helper = paramClass;
  }
  
  public void add(T paramT)
  {
    get().add(paramT);
  }
  
  public void addAll(Collection<T> paramCollection)
  {
    get().addAll(paramCollection);
  }
  
  public void clear(Object paramObject)
  {
    value = Collections.emptyList();
  }
  
  public int computeSize(int paramInt)
  {
    return computeSizeDirectly(paramInt, value);
  }
  
  protected int computeSizeDirectly(int paramInt, List<T> paramList)
  {
    paramList = paramList.iterator();
    MessageMicro localMessageMicro;
    for (int i = 0; paramList.hasNext(); i = localMessageMicro.computeSizeDirectly(paramInt, localMessageMicro) + i) {
      localMessageMicro = (MessageMicro)paramList.next();
    }
    return i;
  }
  
  protected void copyFrom(PBField<List<T>> paramPBField)
  {
    paramPBField = (PBRepeatMessageField)paramPBField;
    if (paramPBField.isEmpty()) {
      value = Collections.emptyList();
    }
    for (;;)
    {
      return;
      List localList = get();
      Class localClass = paramPBField.get(0).getClass();
      int j = value.size() - localList.size();
      if (j > 0)
      {
        i = 0;
        for (;;)
        {
          if (i >= j) {
            break label133;
          }
          try
          {
            localList.add((MessageMicro)localClass.newInstance());
            i += 1;
          }
          catch (InstantiationException localInstantiationException)
          {
            for (;;)
            {
              localInstantiationException.printStackTrace();
            }
          }
          catch (IllegalAccessException localIllegalAccessException)
          {
            for (;;)
            {
              localIllegalAccessException.printStackTrace();
            }
          }
        }
      }
      if (j < 0) {
        localList.subList(-j, localList.size()).clear();
      }
      label133:
      int i = 0;
      while (i < localList.size())
      {
        ((MessageMicro)localList.get(i)).copyFrom((MessageMicro)value.get(i));
        i += 1;
      }
    }
  }
  
  public T get(int paramInt)
  {
    return (MessageMicro)value.get(paramInt);
  }
  
  public List<T> get()
  {
    List localList = Collections.emptyList();
    if (value == localList) {
      value = new ArrayList();
    }
    return value;
  }
  
  public boolean has()
  {
    return !isEmpty();
  }
  
  public boolean isEmpty()
  {
    return value.isEmpty();
  }
  
  public void readFrom(CodedInputStreamMicro paramCodedInputStreamMicro)
    throws IOException
  {
    try
    {
      MessageMicro localMessageMicro = (MessageMicro)helper.newInstance();
      paramCodedInputStreamMicro.readMessage(localMessageMicro);
      add(localMessageMicro);
      return;
    }
    catch (InstantiationException paramCodedInputStreamMicro)
    {
      paramCodedInputStreamMicro.printStackTrace();
      return;
    }
    catch (IllegalAccessException paramCodedInputStreamMicro)
    {
      paramCodedInputStreamMicro.printStackTrace();
    }
  }
  
  protected List<T> readFromDirectly(CodedInputStreamMicro paramCodedInputStreamMicro)
    throws IOException
  {
    throw new RuntimeException("PBRepeatField not support readFromDirectly method.");
  }
  
  public void remove(int paramInt)
  {
    get().remove(paramInt);
  }
  
  public void set(int paramInt, T paramT)
  {
    value.set(paramInt, paramT);
  }
  
  public void set(List<T> paramList)
  {
    value = paramList;
  }
  
  public int size()
  {
    return value.size();
  }
  
  public void writeTo(CodedOutputStreamMicro paramCodedOutputStreamMicro, int paramInt)
    throws IOException
  {
    writeToDirectly(paramCodedOutputStreamMicro, paramInt, value);
  }
  
  protected void writeToDirectly(CodedOutputStreamMicro paramCodedOutputStreamMicro, int paramInt, List<T> paramList)
    throws IOException
  {
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      MessageMicro localMessageMicro = (MessageMicro)paramList.next();
      localMessageMicro.writeToDirectly(paramCodedOutputStreamMicro, paramInt, localMessageMicro);
    }
  }
}
