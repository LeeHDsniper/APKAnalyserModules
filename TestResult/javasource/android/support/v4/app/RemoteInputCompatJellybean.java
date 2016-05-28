package android.support.v4.app;

import android.os.Bundle;

class RemoteInputCompatJellybean
{
  static Bundle toBundle(RemoteInputCompatBase.RemoteInput paramRemoteInput)
  {
    Bundle localBundle = new Bundle();
    localBundle.putString("resultKey", paramRemoteInput.getResultKey());
    localBundle.putCharSequence("label", paramRemoteInput.getLabel());
    localBundle.putCharSequenceArray("choices", paramRemoteInput.getChoices());
    localBundle.putBoolean("allowFreeFormInput", paramRemoteInput.getAllowFreeFormInput());
    localBundle.putBundle("extras", paramRemoteInput.getExtras());
    return localBundle;
  }
  
  static Bundle[] toBundleArray(RemoteInputCompatBase.RemoteInput[] paramArrayOfRemoteInput)
  {
    Object localObject;
    if (paramArrayOfRemoteInput == null)
    {
      localObject = null;
      return localObject;
    }
    Bundle[] arrayOfBundle = new Bundle[paramArrayOfRemoteInput.length];
    int i = 0;
    for (;;)
    {
      localObject = arrayOfBundle;
      if (i >= paramArrayOfRemoteInput.length) {
        break;
      }
      arrayOfBundle[i] = toBundle(paramArrayOfRemoteInput[i]);
      i += 1;
    }
  }
}
