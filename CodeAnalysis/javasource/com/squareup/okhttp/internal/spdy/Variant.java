package com.squareup.okhttp.internal.spdy;

import okio.BufferedSink;
import okio.BufferedSource;

public abstract interface Variant
{
  public abstract FrameReader newReader(BufferedSource paramBufferedSource, boolean paramBoolean);
  
  public abstract FrameWriter newWriter(BufferedSink paramBufferedSink, boolean paramBoolean);
}
