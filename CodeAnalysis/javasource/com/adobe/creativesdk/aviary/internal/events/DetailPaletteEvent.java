package com.adobe.creativesdk.aviary.internal.events;

import android.support.v7.graphics.Palette;

public class DetailPaletteEvent
{
  public final long packId;
  public final Palette palette;
  
  public DetailPaletteEvent(Palette paramPalette, long paramLong)
  {
    palette = paramPalette;
    packId = paramLong;
  }
}
