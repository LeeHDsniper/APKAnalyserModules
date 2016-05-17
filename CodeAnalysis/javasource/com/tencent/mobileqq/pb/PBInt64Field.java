package com.tencent.mobileqq.pb;

import java.io.IOException;

public final class PBInt64Field
  extends PBPrimitiveField<Long>
{
  public static final PBInt64Field __repeatHelper__ = new PBInt64Field(0L, false);
  private long value = 0L;
  
  public PBInt64Field(long paramLong, boolean paramBoolean)
  {
    set(paramLong, paramBoolean);
  }
  
  public void clear(Object paramObject)
  {
    if ((paramObject instanceof Long)) {}
    for (value = ((Long)paramObject).longValue();; value = 0L)
    {
      setHasFlag(false);
      return;
    }
  }
  
  public int computeSize(int paramInt)
  {
    if (has()) {
      return CodedOutputStreamMicro.computeInt64Size(paramInt, value);
    }
    return 0;
  }
  
  protected int computeSizeDirectly(int paramInt, Long paramLong)
  {
    return CodedOutputStreamMicro.computeInt64Size(paramInt, paramLong.longValue());
  }
  
  protected void copyFrom(PBField<Long> paramPBField)
  {
    paramPBField = (PBInt64Field)paramPBField;
    set(value, paramPBField.has());
  }
  
  public long get()
  {
    return value;
  }
  
  public void readFrom(CodedInputStreamMicro paramCodedInputStreamMicro)
    throws IOException
  {
    value = paramCodedInputStreamMicro.readInt64();
    setHasFlag(true);
  }
  
  protected Long readFromDirectly(CodedInputStreamMicro paramCodedInputStreamMicro)
    throws IOException
  {
    return Long.valueOf(paramCodedInputStreamMicro.readInt64());
  }
  
  public void set(long paramLong)
  {
    set(paramLong, true);
  }
  
  public void set(long paramLong, boolean paramBoolean)
  {
    value = paramLong;
    setHasFlag(paramBoolean);
  }
  
  public void writeTo(CodedOutputStreamMicro paramCodedOutputStreamMicro, int paramInt)
    throws IOException
  {
    if (has()) {
      paramCodedOutputStreamMicro.writeInt64(paramInt, value);
    }
  }
  
  protected void writeToDirectly(CodedOutputStreamMicro paramCodedOutputStreamMicro, int paramInt, Long paramLong)
    throws IOException
  {
    paramCodedOutputStreamMicro.writeInt64(paramInt, paramLong.longValue());
  }
}
