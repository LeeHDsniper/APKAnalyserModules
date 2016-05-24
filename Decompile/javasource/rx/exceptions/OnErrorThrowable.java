package rx.exceptions;

import java.util.HashSet;
import java.util.Set;
import rx.plugins.RxJavaErrorHandler;
import rx.plugins.RxJavaPlugins;

public final class OnErrorThrowable
  extends RuntimeException
{
  private static final long serialVersionUID = -569558213262703934L;
  private final boolean hasValue;
  private final Object value;
  
  public static Throwable addValueAsLastCause(Throwable paramThrowable, Object paramObject)
  {
    Throwable localThrowable = Exceptions.getFinalCause(paramThrowable);
    if ((localThrowable != null) && ((localThrowable instanceof OnNextValue)) && (((OnNextValue)localThrowable).getValue() == paramObject)) {
      return paramThrowable;
    }
    Exceptions.addCause(paramThrowable, new OnNextValue(paramObject));
    return paramThrowable;
  }
  
  public static class OnNextValue
    extends RuntimeException
  {
    private static final long serialVersionUID = -3454462756050397899L;
    private final Object value;
    
    public OnNextValue(Object paramObject)
    {
      super();
      value = paramObject;
    }
    
    static String renderValue(Object paramObject)
    {
      if (paramObject == null) {
        return "null";
      }
      if (Primitives.INSTANCE.contains(paramObject.getClass())) {
        return paramObject.toString();
      }
      if ((paramObject instanceof String)) {
        return (String)paramObject;
      }
      if ((paramObject instanceof Enum)) {
        return ((Enum)paramObject).name();
      }
      String str = RxJavaPlugins.getInstance().getErrorHandler().handleOnNextValueRendering(paramObject);
      if (str != null) {
        return str;
      }
      return paramObject.getClass().getName() + ".class";
    }
    
    public Object getValue()
    {
      return value;
    }
    
    private static final class Primitives
    {
      static final Set<Class<?>> INSTANCE = ;
      
      private static Set<Class<?>> create()
      {
        HashSet localHashSet = new HashSet();
        localHashSet.add(Boolean.class);
        localHashSet.add(Character.class);
        localHashSet.add(Byte.class);
        localHashSet.add(Short.class);
        localHashSet.add(Integer.class);
        localHashSet.add(Long.class);
        localHashSet.add(Float.class);
        localHashSet.add(Double.class);
        return localHashSet;
      }
    }
  }
}
