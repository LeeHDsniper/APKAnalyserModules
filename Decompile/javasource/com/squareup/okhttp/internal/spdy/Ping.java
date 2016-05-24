package com.squareup.okhttp.internal.spdy;

import java.util.concurrent.CountDownLatch;

public final class Ping
{
  private final CountDownLatch latch = new CountDownLatch(1);
  private long received = -1L;
  private long sent = -1L;
  
  Ping() {}
  
  void cancel()
  {
    if ((received != -1L) || (sent == -1L)) {
      throw new IllegalStateException();
    }
    received = (sent - 1L);
    latch.countDown();
  }
  
  void receive()
  {
    if ((received != -1L) || (sent == -1L)) {
      throw new IllegalStateException();
    }
    received = System.nanoTime();
    latch.countDown();
  }
  
  void send()
  {
    if (sent != -1L) {
      throw new IllegalStateException();
    }
    sent = System.nanoTime();
  }
}
