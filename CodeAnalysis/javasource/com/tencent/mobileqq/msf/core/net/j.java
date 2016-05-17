package com.tencent.mobileqq.msf.core.net;

import java.util.ArrayList;
import java.util.Iterator;

class j
  extends Thread
{
  j(h paramH) {}
  
  public void run()
  {
    Iterator localIterator = a.u.iterator();
    while (localIterator.hasNext()) {
      ((h.a)localIterator.next()).a();
    }
    a.v.addAll(a.u);
    a.u.clear();
    a.w = null;
  }
}
