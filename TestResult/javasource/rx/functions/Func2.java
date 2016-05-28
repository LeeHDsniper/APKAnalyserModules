package rx.functions;

public abstract interface Func2<T1, T2, R>
{
  public abstract R call(T1 paramT1, T2 paramT2);
}
