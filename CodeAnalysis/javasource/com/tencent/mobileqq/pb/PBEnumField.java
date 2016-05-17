package com.tencent.mobileqq.pb;

import java.io.IOException;

public final class PBEnumField
  extends PBPrimitiveField<Integer>
{
  public static final PBEnumField __repeatHelper__ = new PBEnumField(0, false);
  private int value = 0;
  
  public PBEnumField(int paramInt, boolean paramBoolean)
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
      return CodedOutputStreamMicro.computeEnumSize(paramInt, value);
    }
    return 0;
  }
  
  protected int computeSizeDirectly(int paramInt, Integer paramInteger)
  {
    return CodedOutputStreamMicro.computeEnumSize(paramInt, paramInteger.intValue());
  }
  
  protected void copyFrom(PBField<Integer> paramPBField)
  {
    paramPBField = (PBEnumField)paramPBField;
    set(value, paramPBField.has());
  }
  
  public int get()
  {
    return value;
  }
  
  public void readFrom(CodedInputStreamMicro paramCodedInputStreamMicro)
    throws IOException
  {
    value = paramCodedInputStreamMicro.readEnum();
    setHasFlag(true);
  }
  
  protected Integer readFromDirectly(CodedInputStreamMicro paramCodedInputStreamMicro)
    throws IOException
  {
    return Integer.valueOf(paramCodedInputStreamMicro.readEnum());
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
      paramCodedOutputStreamMicro.writeEnum(paramInt, value);
    }
  }
  
  protected void writeToDirectly(CodedOutputStreamMicro paramCodedOutputStreamMicro, int paramInt, Integer paramInteger)
    throws IOException
  {
    paramCodedOutputStreamMicro.writeEnum(paramInt, paramInteger.intValue());
  }
}
