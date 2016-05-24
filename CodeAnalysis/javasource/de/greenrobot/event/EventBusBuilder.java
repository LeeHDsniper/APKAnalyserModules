package de.greenrobot.event;

import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class EventBusBuilder
{
  private static final ExecutorService DEFAULT_EXECUTOR_SERVICE = ;
  boolean eventInheritance = true;
  ExecutorService executorService = DEFAULT_EXECUTOR_SERVICE;
  boolean logNoSubscriberMessages = true;
  boolean logSubscriberExceptions = true;
  boolean sendNoSubscriberEvent = true;
  boolean sendSubscriberExceptionEvent = true;
  List<Class<?>> skipMethodVerificationForClasses;
  boolean throwSubscriberException;
  
  EventBusBuilder() {}
}
