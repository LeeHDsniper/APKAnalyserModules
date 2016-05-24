package com.adobe.creativesdk.aviary.internal.events;

import android.os.Bundle;

public class MessageReceivedEvent
{
  public final Bundle extra;
  
  public MessageReceivedEvent(Bundle paramBundle)
  {
    extra = paramBundle;
  }
}
