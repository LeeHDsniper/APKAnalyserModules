package android.support.v4.app;

import android.app.RemoteInput;
import android.app.RemoteInput.Builder;

class RemoteInputCompatApi20
{
  static RemoteInput[] fromCompat(RemoteInputCompatBase.RemoteInput[] paramArrayOfRemoteInput)
  {
    Object localObject;
    if (paramArrayOfRemoteInput == null)
    {
      localObject = null;
      return localObject;
    }
    RemoteInput[] arrayOfRemoteInput = new RemoteInput[paramArrayOfRemoteInput.length];
    int i = 0;
    for (;;)
    {
      localObject = arrayOfRemoteInput;
      if (i >= paramArrayOfRemoteInput.length) {
        break;
      }
      localObject = paramArrayOfRemoteInput[i];
      arrayOfRemoteInput[i] = new RemoteInput.Builder(((RemoteInputCompatBase.RemoteInput)localObject).getResultKey()).setLabel(((RemoteInputCompatBase.RemoteInput)localObject).getLabel()).setChoices(((RemoteInputCompatBase.RemoteInput)localObject).getChoices()).setAllowFreeFormInput(((RemoteInputCompatBase.RemoteInput)localObject).getAllowFreeFormInput()).addExtras(((RemoteInputCompatBase.RemoteInput)localObject).getExtras()).build();
      i += 1;
    }
  }
}
