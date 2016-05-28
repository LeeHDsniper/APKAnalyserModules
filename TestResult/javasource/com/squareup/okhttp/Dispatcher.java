package com.squareup.okhttp;

import java.util.ArrayDeque;
import java.util.Deque;

public final class Dispatcher
{
  private final Deque<Call> executedCalls = new ArrayDeque();
  private int maxRequests = 64;
  private int maxRequestsPerHost = 5;
  private final Deque<Object> readyCalls = new ArrayDeque();
  private final Deque<Object> runningCalls = new ArrayDeque();
  
  public Dispatcher() {}
  
  void executed(Call paramCall)
  {
    try
    {
      executedCalls.add(paramCall);
      return;
    }
    finally
    {
      paramCall = finally;
      throw paramCall;
    }
  }
  
  void finished(Call paramCall)
  {
    try
    {
      if (!executedCalls.remove(paramCall)) {
        throw new AssertionError("Call wasn't in-flight!");
      }
    }
    finally {}
  }
}
