package com.tencent.mobileqq.pb;

import java.io.IOException;

public final class PBSFixed64Field
  extends PBPrimitiveField<Long>
{
  public static final PBSFixed64Field __repeatHelper__ = new PBSFixed64Field(0L, false);
  private long value = 0L;
  
  public PBSFixed64Field(long paramLong, boolean paramBoolean)
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
      return CodedOutputStreamMicro.computeSFixed64Size(paramInt, value);
    }
    return 0;
  }
  
  protected int computeSizeDirectly(int paramInt, Long paramLong)
  {
    return CodedOutputStreamMicro.computeSFixed64Size(paramInt, paramLong.longValue());
  }
  
  protected void copyFrom(PBField<Long> paramPBField)
  {
    paramPBField = (PBSFixed64Field)paramPBField;
    set(value, paramPBField.has());
  }
  
  public long get()
  {
    return value;
  }
  
  public void readFrom(CodedInputStreamMicro paramCodedInputStreamMicro)
    throws IOException
  {
    value = paramCodedInputStreamMicro.readSFixed64();
    setHasFlag(true);
  }
  
  protected Long readFromDirectly(CodedInputStreamMicro paramCodedInputStreamMicro)
    throws IOException
  {
    return Long.valueOf(paramCodedInputStreamMicro.readSFixed64());
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
      paramCodedOutputStreamMicro.writeSFixed64(paramInt, value);
    }
  }
  
  protected void writeToDirectly(CodedOutputStreamMicro paramCodedOutputStreamMicro, int paramInt, Long paramLong)
    throws IOException
  {
    paramCodedOutputStreamMicro.writeSFixed64(paramInt, paramLong.longValue());
  }
}
