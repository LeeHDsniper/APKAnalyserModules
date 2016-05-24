package rx.functions;

public final class Functions
{
  public static <T0, T1, R> FuncN<R> fromFunc(Func2<? super T0, ? super T1, ? extends R> paramFunc2)
  {
    new FuncN()
    {
      public R call(Object... paramAnonymousVarArgs)
      {
        if (paramAnonymousVarArgs.length != 2) {
          throw new RuntimeException("Func2 expecting 2 arguments.");
        }
        return val$f.call(paramAnonymousVarArgs[0], paramAnonymousVarArgs[1]);
      }
    };
  }
}
