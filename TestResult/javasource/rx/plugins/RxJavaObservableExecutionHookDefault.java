package rx.plugins;

class RxJavaObservableExecutionHookDefault
  extends RxJavaObservableExecutionHook
{
  private static RxJavaObservableExecutionHookDefault INSTANCE = new RxJavaObservableExecutionHookDefault();
  
  RxJavaObservableExecutionHookDefault() {}
  
  public static RxJavaObservableExecutionHook getInstance()
  {
    return INSTANCE;
  }
}
