package rx.android.app;

import android.app.Activity;
import android.support.v4.app.FragmentActivity;
import rx.Observable;
import rx.android.internal.Assertions;
import rx.android.schedulers.AndroidSchedulers;
import rx.functions.Func1;

public final class AppObservable
{
  private static final Func1<Activity, Boolean> ACTIVITY_VALIDATOR = new Func1()
  {
    public Boolean call(Activity paramAnonymousActivity)
    {
      if (!paramAnonymousActivity.isFinishing()) {}
      for (boolean bool = true;; bool = false) {
        return Boolean.valueOf(bool);
      }
    }
  };
  private static final Func1<android.support.v4.app.Fragment, Boolean> FRAGMENTV4_VALIDATOR = new Func1()
  {
    public Boolean call(android.support.v4.app.Fragment paramAnonymousFragment)
    {
      if ((paramAnonymousFragment.isAdded()) && (!paramAnonymousFragment.getActivity().isFinishing())) {}
      for (boolean bool = true;; bool = false) {
        return Boolean.valueOf(bool);
      }
    }
  };
  private static final Func1<android.app.Fragment, Boolean> FRAGMENT_VALIDATOR = new Func1()
  {
    public Boolean call(android.app.Fragment paramAnonymousFragment)
    {
      if ((paramAnonymousFragment.isAdded()) && (!paramAnonymousFragment.getActivity().isFinishing())) {}
      for (boolean bool = true;; bool = false) {
        return Boolean.valueOf(bool);
      }
    }
  };
  
  public static <T> Observable<T> bindActivity(Activity paramActivity, Observable<T> paramObservable)
  {
    Assertions.assertUiThread();
    return paramObservable.observeOn(AndroidSchedulers.mainThread()).lift(new OperatorConditionalBinding(paramActivity, ACTIVITY_VALIDATOR));
  }
  
  public static <T> Observable<T> bindSupportFragment(android.support.v4.app.Fragment paramFragment, Observable<T> paramObservable)
  {
    Assertions.assertUiThread();
    return paramObservable.observeOn(AndroidSchedulers.mainThread()).lift(new OperatorConditionalBinding(paramFragment, FRAGMENTV4_VALIDATOR));
  }
}
