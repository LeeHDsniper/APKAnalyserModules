package android.support.v7.app;

import android.content.Context;
import android.support.v7.internal.view.SupportActionModeWrapper.CallbackWrapper;
import android.view.ActionMode.Callback;
import android.view.Window;
import android.view.Window.Callback;

class AppCompatDelegateImplV14
  extends AppCompatDelegateImplV11
{
  private boolean mHandleNativeActionModes = true;
  
  AppCompatDelegateImplV14(Context paramContext, Window paramWindow, AppCompatCallback paramAppCompatCallback)
  {
    super(paramContext, paramWindow, paramAppCompatCallback);
  }
  
  Window.Callback wrapWindowCallback(Window.Callback paramCallback)
  {
    return new AppCompatWindowCallbackV14(paramCallback);
  }
  
  class AppCompatWindowCallbackV14
    extends AppCompatDelegateImplBase.AppCompatWindowCallbackBase
  {
    AppCompatWindowCallbackV14(Window.Callback paramCallback)
    {
      super(paramCallback);
    }
    
    public android.view.ActionMode onWindowStartingActionMode(ActionMode.Callback paramCallback)
    {
      if (mHandleNativeActionModes) {
        return startAsSupportActionMode(paramCallback);
      }
      return super.onWindowStartingActionMode(paramCallback);
    }
    
    final android.view.ActionMode startAsSupportActionMode(ActionMode.Callback paramCallback)
    {
      paramCallback = new SupportActionModeWrapper.CallbackWrapper(mContext, paramCallback);
      android.support.v7.view.ActionMode localActionMode = startSupportActionMode(paramCallback);
      if (localActionMode != null) {
        return paramCallback.getActionModeWrapper(localActionMode);
      }
      return null;
    }
  }
}
