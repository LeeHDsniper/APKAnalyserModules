package android.support.v4.view;

import android.view.KeyEvent;

class KeyEventCompatEclair
{
  KeyEventCompatEclair() {}
  
  public static boolean isTracking(KeyEvent paramKeyEvent)
  {
    return paramKeyEvent.isTracking();
  }
  
  public static void startTracking(KeyEvent paramKeyEvent)
  {
    paramKeyEvent.startTracking();
  }
}
