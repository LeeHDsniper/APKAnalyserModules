package com.tencent.mobileqq.pb;

import java.io.IOException;

public final class PBSFixed32Field
  extends PBPrimitiveField<Integer>
{
  public static final PBSFixed32Field __repeatHelper__ = new PBSFixed32Field(0, false);
  private int value = 0;
  
  public PBSFixed32Field(int paramInt, boolean paramBoolean)
  {
    set(paramInt, paramBoolean);
  }
  
  public void clear(Object paramObject)
  {
    if ((paramObject instanceof Integer)) {}
    for (value = ((Integer)paramObject).intValue();; value = 0)
    {
      setHasFlag(false);
      return;
    }
  }
  
  public int computeSize(int paramInt)
  {
    if (has()) {
      return CodedOutputStreamMicro.computeSFixed32Size(paramInt, value);
    }
    return 0;
  }
  
  protected int computeSizeDirectly(int paramInt, Integer paramInteger)
  {
    return CodedOutputStreamMicro.computeSFixed32Size(paramInt, paramInteger.intValue());
  }
  
  protected void copyFrom(PBField<Integer> paramPBField)
  {
    paramPBField = (PBSFixed32Field)paramPBField;
    set(value, paramPBField.has());
  }
  
  public int get()
  {
    return value;
  }
  
  public void readFrom(CodedInputStreamMicro paramCodedInputStreamMicro)
    throws IOException
  {
    value = paramCodedInputStreamMicro.readSFixed32();
    setHasFlag(true);
  }
  
  protected Integer readFromDirectly(CodedInputStreamMicro paramCodedInputStreamMicro)
    throws IOException
  {
    return Integer.valueOf(paramCodedInputStreamMicro.readSFixed32());
  }
  
  public void set(int paramInt)
  {
    set(paramInt, true);
  }
  
  public void set(int paramInt, boolean paramBoolean)
  {
    value = paramInt;
    setHasFlag(paramBoolean);
  }
  
  public void writeTo(CodedOutputStreamMicro paramCodedOutputStreamMicro, int paramInt)
    throws IOException
  {
    if (has()) {
      paramCodedOutputStreamMicro.writeSFixed32(paramInt, value);
    }
  }
  
  protected void writeToDirectly(CodedOutputStreamMicro paramCodedOutputStreamMicro, int paramInt, Integer paramInteger)
    throws IOException
  {
    paramCodedOutputStreamMicro.writeSFixed32(paramInt, paramInteger.intValue());
  }
}
