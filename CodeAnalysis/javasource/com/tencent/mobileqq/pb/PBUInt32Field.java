package com.tencent.mobileqq.pb;

import java.io.IOException;

public final class PBUInt32Field
  extends PBPrimitiveField<Integer>
{
  public static final PBUInt32Field __repeatHelper__ = new PBUInt32Field(0, false);
  private int value = 0;
  
  public PBUInt32Field(int paramInt, boolean paramBoolean)
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
      return CodedOutputStreamMicro.computeUInt32Size(paramInt, value);
    }
    return 0;
  }
  
  protected int computeSizeDirectly(int paramInt, Integer paramInteger)
  {
    return CodedOutputStreamMicro.computeUInt32Size(paramInt, paramInteger.intValue());
  }
  
  protected void copyFrom(PBField<Integer> paramPBField)
  {
    paramPBField = (PBUInt32Field)paramPBField;
    set(value, paramPBField.has());
  }
  
  public int get()
  {
    return value;
  }
  
  public void readFrom(CodedInputStreamMicro paramCodedInputStreamMicro)
    throws IOException
  {
    value = paramCodedInputStreamMicro.readUInt32();
    setHasFlag(true);
  }
  
  protected Integer readFromDirectly(CodedInputStreamMicro paramCodedInputStreamMicro)
    throws IOException
  {
    return Integer.valueOf(paramCodedInputStreamMicro.readUInt32());
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
      paramCodedOutputStreamMicro.writeUInt32(paramInt, value);
    }
  }
  
  protected void writeToDirectly(CodedOutputStreamMicro paramCodedOutputStreamMicro, int paramInt, Integer paramInteger)
    throws IOException
  {
    paramCodedOutputStreamMicro.writeUInt32(paramInt, paramInteger.intValue());
  }
}
