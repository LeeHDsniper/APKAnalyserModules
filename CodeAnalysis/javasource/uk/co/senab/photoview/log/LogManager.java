package uk.co.senab.photoview.log;

public final class LogManager
{
  private static Logger logger = new LoggerDefault();
  
  public static Logger getLogger()
  {
    return logger;
  }
}
