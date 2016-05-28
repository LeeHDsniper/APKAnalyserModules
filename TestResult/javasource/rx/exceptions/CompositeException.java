package rx.exceptions;

import java.io.PrintStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

public final class CompositeException
  extends RuntimeException
{
  private static final long serialVersionUID = 3026362227162912146L;
  private Throwable cause = null;
  private final List<Throwable> exceptions;
  private final String message;
  
  public CompositeException(String paramString, Collection<? extends Throwable> paramCollection)
  {
    paramString = new LinkedHashSet();
    ArrayList localArrayList = new ArrayList();
    paramCollection = paramCollection.iterator();
    while (paramCollection.hasNext())
    {
      Throwable localThrowable = (Throwable)paramCollection.next();
      if ((localThrowable instanceof CompositeException)) {
        paramString.addAll(((CompositeException)localThrowable).getExceptions());
      } else {
        paramString.add(localThrowable);
      }
    }
    localArrayList.addAll(paramString);
    exceptions = Collections.unmodifiableList(localArrayList);
    message = (exceptions.size() + " exceptions occurred. ");
  }
  
  public CompositeException(Collection<? extends Throwable> paramCollection)
  {
    this(null, paramCollection);
  }
  
  private void appendStackTrace(StringBuilder paramStringBuilder, Throwable paramThrowable, String paramString)
  {
    paramStringBuilder.append(paramString).append(paramThrowable).append("\n");
    paramString = paramThrowable.getStackTrace();
    int j = paramString.length;
    int i = 0;
    while (i < j)
    {
      Object localObject = paramString[i];
      paramStringBuilder.append("\t\tat ").append(localObject).append("\n");
      i += 1;
    }
    if (paramThrowable.getCause() != null)
    {
      paramStringBuilder.append("\tCaused by: ");
      appendStackTrace(paramStringBuilder, paramThrowable.getCause(), "");
    }
  }
  
  private final List<Throwable> getListOfCauses(Throwable paramThrowable)
  {
    ArrayList localArrayList = new ArrayList();
    Throwable localThrowable = paramThrowable.getCause();
    paramThrowable = localThrowable;
    if (localThrowable == null) {
      return localArrayList;
    }
    do
    {
      paramThrowable = paramThrowable.getCause();
      localArrayList.add(paramThrowable);
    } while (paramThrowable.getCause() != null);
    return localArrayList;
  }
  
  private void printStackTrace(PrintStreamOrWriter paramPrintStreamOrWriter)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(this).append("\n");
    ??? = getStackTrace();
    int j = ???.length;
    int i = 0;
    Object localObject2;
    while (i < j)
    {
      localObject2 = ???[i];
      localStringBuilder.append("\tat ").append(localObject2).append("\n");
      i += 1;
    }
    i = 1;
    ??? = exceptions.iterator();
    while (((Iterator)???).hasNext())
    {
      localObject2 = (Throwable)((Iterator)???).next();
      localStringBuilder.append("  ComposedException ").append(i).append(" :").append("\n");
      appendStackTrace(localStringBuilder, (Throwable)localObject2, "\t");
      i += 1;
    }
    synchronized (paramPrintStreamOrWriter.lock())
    {
      paramPrintStreamOrWriter.println(localStringBuilder.toString());
      return;
    }
  }
  
  public Throwable getCause()
  {
    try
    {
      CompositeExceptionCausalChain localCompositeExceptionCausalChain2;
      HashSet localHashSet;
      Iterator localIterator1;
      if (cause == null)
      {
        localCompositeExceptionCausalChain2 = new CompositeExceptionCausalChain();
        localHashSet = new HashSet();
        CompositeExceptionCausalChain localCompositeExceptionCausalChain1 = localCompositeExceptionCausalChain2;
        localIterator1 = exceptions.iterator();
      }
      for (;;)
      {
        Object localObject2;
        if (localIterator1.hasNext())
        {
          localObject2 = (Throwable)localIterator1.next();
          if (localHashSet.contains(localObject2)) {
            continue;
          }
          localHashSet.add(localObject2);
          Iterator localIterator2 = getListOfCauses((Throwable)localObject2).iterator();
          while (localIterator2.hasNext())
          {
            Throwable localThrowable3 = (Throwable)localIterator2.next();
            if (localHashSet.contains(localThrowable3)) {
              localObject2 = new RuntimeException("Duplicate found in causal chain so cropping to prevent loop ...");
            } else {
              localHashSet.add(localThrowable3);
            }
          }
        }
        try
        {
          localObject1.initCause((Throwable)localObject2);
          Throwable localThrowable1 = localObject1.getCause();
          continue;
          cause = localCompositeExceptionCausalChain2;
          localThrowable1 = cause;
          return localThrowable1;
        }
        catch (Throwable localThrowable2)
        {
          for (;;) {}
        }
      }
    }
    finally {}
  }
  
  public List<Throwable> getExceptions()
  {
    return exceptions;
  }
  
  public String getMessage()
  {
    return message;
  }
  
  public void printStackTrace()
  {
    printStackTrace(System.err);
  }
  
  public void printStackTrace(PrintStream paramPrintStream)
  {
    printStackTrace(new WrappedPrintStream(paramPrintStream));
  }
  
  public void printStackTrace(PrintWriter paramPrintWriter)
  {
    printStackTrace(new WrappedPrintWriter(paramPrintWriter));
  }
  
  static final class CompositeExceptionCausalChain
    extends RuntimeException
  {
    static String MESSAGE = "Chain of Causes for CompositeException In Order Received =>";
    private static final long serialVersionUID = 3875212506787802066L;
    
    CompositeExceptionCausalChain() {}
    
    public String getMessage()
    {
      return MESSAGE;
    }
  }
  
  private static abstract class PrintStreamOrWriter
  {
    private PrintStreamOrWriter() {}
    
    abstract Object lock();
    
    abstract void println(Object paramObject);
  }
  
  private static class WrappedPrintStream
    extends CompositeException.PrintStreamOrWriter
  {
    private final PrintStream printStream;
    
    WrappedPrintStream(PrintStream paramPrintStream)
    {
      super();
      printStream = paramPrintStream;
    }
    
    Object lock()
    {
      return printStream;
    }
    
    void println(Object paramObject)
    {
      printStream.println(paramObject);
    }
  }
  
  private static class WrappedPrintWriter
    extends CompositeException.PrintStreamOrWriter
  {
    private final PrintWriter printWriter;
    
    WrappedPrintWriter(PrintWriter paramPrintWriter)
    {
      super();
      printWriter = paramPrintWriter;
    }
    
    Object lock()
    {
      return printWriter;
    }
    
    void println(Object paramObject)
    {
      printWriter.println(paramObject);
    }
  }
}
