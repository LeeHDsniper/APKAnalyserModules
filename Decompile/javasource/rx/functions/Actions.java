package rx.functions;

public final class Actions
{
  private static final EmptyAction EMPTY_ACTION = new EmptyAction(null);
  
  public static final <T0, T1, T2, T3, T4, T5, T6, T7, T8, T9> EmptyAction<T0, T1, T2, T3, T4, T5, T6, T7, T8, T9> empty()
  {
    return EMPTY_ACTION;
  }
  
  private static final class EmptyAction<T0, T1, T2, T3, T4, T5, T6, T7, T8, T9>
    implements Action0, Action1<T0>
  {
    private EmptyAction() {}
    
    public void call() {}
    
    public void call(T0 paramT0) {}
  }
}
