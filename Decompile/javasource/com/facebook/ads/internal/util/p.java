package com.facebook.ads.internal.util;

import java.util.Locale;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicLong;

public class p
  implements ThreadFactory
{
  protected final AtomicLong a = new AtomicLong();
  private int b = Thread.currentThread().getPriority();
  
  public p() {}
  
  protected String a()
  {
    return String.format(Locale.ENGLISH, "com.facebook.ads thread-%d %tF %<tT", new Object[] { Long.valueOf(a.incrementAndGet()), Long.valueOf(System.currentTimeMillis()) });
  }
  
  public Thread newThread(Runnable paramRunnable)
  {
    paramRunnable = new Thread(null, paramRunnable, a(), 0L);
    paramRunnable.setPriority(b);
    return paramRunnable;
  }
}
