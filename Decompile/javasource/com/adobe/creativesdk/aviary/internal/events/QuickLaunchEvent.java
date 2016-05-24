package com.adobe.creativesdk.aviary.internal.events;

import android.os.Bundle;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory.Tools;

public class QuickLaunchEvent
{
  public final Bundle options;
  public final ToolLoaderFactory.Tools tool;
  
  public QuickLaunchEvent(ToolLoaderFactory.Tools paramTools, Bundle paramBundle)
  {
    tool = paramTools;
    options = paramBundle;
  }
}
