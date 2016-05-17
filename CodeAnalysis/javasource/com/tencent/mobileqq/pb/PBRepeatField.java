package com.tencent.mobileqq.pb;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public final class PBRepeatField<T>
  extends PBField<List<T>>
{
  private final PBField<T> helper;
  private List<T> value = Collections.emptyList();
  
  public PBRepeatField(PBField<T> paramPBField)
  {
    helper = paramPBField;
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
    int i = 0;
    paramList = paramList.iterator();
    while (paramList.hasNext())
    {
      Object localObject = paramList.next();
      i += helper.computeSizeDirectly(paramInt, localObject);
    }
    return i;
  }
  
  protected void copyFrom(PBField<List<T>> paramPBField)
  {
    paramPBField = (PBRepeatField)paramPBField;
    if (paramPBField.isEmpty())
    {
      value = Collections.emptyList();
      return;
    }
    List localList = get();
    localList.clear();
    localList.addAll(value);
  }
  
  public T get(int paramInt)
  {
    return value.get(paramInt);
  }
  
  public List<T> get()
  {
    if (value == Collections.emptyList()) {
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
    add(helper.readFromDirectly(paramCodedInputStreamMicro));
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
      Object localObject = paramList.next();
      helper.writeToDirectly(paramCodedOutputStreamMicro, paramInt, localObject);
    }
  }
}
