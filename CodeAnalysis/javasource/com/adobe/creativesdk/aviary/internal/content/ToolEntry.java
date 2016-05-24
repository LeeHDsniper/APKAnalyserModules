package com.adobe.creativesdk.aviary.internal.content;

import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory.Tools;

public final class ToolEntry
{
  public int iconResourceId;
  public int labelResourceId;
  public ToolLoaderFactory.Tools name;
  
  public ToolEntry(ToolLoaderFactory.Tools paramTools, int paramInt1, int paramInt2)
  {
    name = paramTools;
    iconResourceId = paramInt1;
    labelResourceId = paramInt2;
  }
  
  public String toString()
  {
    return "{name: " + name + "}";
  }
}
