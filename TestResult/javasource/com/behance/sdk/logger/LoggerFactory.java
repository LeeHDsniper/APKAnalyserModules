package com.behance.sdk.logger;

public class LoggerFactory
{
  public static ILogger getLogger(Class paramClass)
  {
    return new Logger(paramClass);
  }
}
