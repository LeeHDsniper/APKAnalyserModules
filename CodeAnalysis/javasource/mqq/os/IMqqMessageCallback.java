package mqq.os;

import android.os.Message;

public abstract interface IMqqMessageCallback
{
  public abstract void dispatchMessage(Message paramMessage);
}
