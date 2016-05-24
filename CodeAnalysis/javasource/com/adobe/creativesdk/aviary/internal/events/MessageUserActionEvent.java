package com.adobe.creativesdk.aviary.internal.events;

import android.os.Bundle;

public class MessageUserActionEvent
{
  public final int action;
  public final Bundle extras;
  public final long messageContentId;
  public final long messageId;
  private final String packIdentifier;
  
  public MessageUserActionEvent(int paramInt, Bundle paramBundle, long paramLong1, long paramLong2, String paramString)
  {
    action = paramInt;
    messageId = paramLong1;
    messageContentId = paramLong2;
    packIdentifier = paramString;
    extras = paramBundle;
  }
}
