package com.adobe.creativesdk.aviary.internal.utils;

import android.os.Build.VERSION;

public final class ApiHelper
{
  public static final boolean AT_LEAST_11;
  public static final boolean AT_LEAST_12;
  public static final boolean AT_LEAST_13;
  public static final boolean AT_LEAST_14;
  public static final boolean AT_LEAST_16;
  public static final boolean AT_LEAST_17;
  public static final boolean AT_LEAST_19;
  public static final boolean AT_LEAST_20;
  public static final boolean AT_LEAST_21;
  public static final boolean AT_LEAST_22;
  public static final boolean EFFECT_INTENSITY_AVAILABLE;
  public static final boolean HAS_POST_ON_ANIMATION;
  
  static
  {
    boolean bool2 = true;
    if (Build.VERSION.SDK_INT >= 11)
    {
      bool1 = true;
      AT_LEAST_11 = bool1;
      if (Build.VERSION.SDK_INT < 12) {
        break label168;
      }
      bool1 = true;
      label26:
      AT_LEAST_12 = bool1;
      if (Build.VERSION.SDK_INT < 13) {
        break label173;
      }
      bool1 = true;
      label40:
      AT_LEAST_13 = bool1;
      if (Build.VERSION.SDK_INT < 14) {
        break label178;
      }
      bool1 = true;
      label54:
      AT_LEAST_14 = bool1;
      if (Build.VERSION.SDK_INT < 16) {
        break label183;
      }
      bool1 = true;
      label68:
      AT_LEAST_16 = bool1;
      if (Build.VERSION.SDK_INT < 17) {
        break label188;
      }
      bool1 = true;
      label82:
      AT_LEAST_17 = bool1;
      if (Build.VERSION.SDK_INT < 19) {
        break label193;
      }
      bool1 = true;
      label96:
      AT_LEAST_19 = bool1;
      if (Build.VERSION.SDK_INT < 20) {
        break label198;
      }
      bool1 = true;
      label110:
      AT_LEAST_20 = bool1;
      if (Build.VERSION.SDK_INT < 21) {
        break label203;
      }
      bool1 = true;
      label124:
      AT_LEAST_21 = bool1;
      if (Build.VERSION.SDK_INT < 22) {
        break label208;
      }
      bool1 = true;
      label138:
      AT_LEAST_22 = bool1;
      if (Build.VERSION.SDK_INT < 16) {
        break label213;
      }
    }
    label168:
    label173:
    label178:
    label183:
    label188:
    label193:
    label198:
    label203:
    label208:
    label213:
    for (boolean bool1 = bool2;; bool1 = false)
    {
      HAS_POST_ON_ANIMATION = bool1;
      EFFECT_INTENSITY_AVAILABLE = AT_LEAST_14;
      return;
      bool1 = false;
      break;
      bool1 = false;
      break label26;
      bool1 = false;
      break label40;
      bool1 = false;
      break label54;
      bool1 = false;
      break label68;
      bool1 = false;
      break label82;
      bool1 = false;
      break label96;
      bool1 = false;
      break label110;
      bool1 = false;
      break label124;
      bool1 = false;
      break label138;
    }
  }
  
  public static boolean fastPreviewEnabled()
  {
    return fastPreviewEnabled(SystemUtils.CpuInfo.getCpuMhz());
  }
  
  public static boolean fastPreviewEnabled(int paramInt)
  {
    return paramInt >= 1000;
  }
  
  public static boolean isHiResOriginalAvailable()
  {
    return (AT_LEAST_14) && (SystemUtils.MemoryInfo.getSystemTotalMemory() > 1000.0D);
  }
  
  public static boolean isIceCreamSandwich()
  {
    return (Build.VERSION.SDK_INT >= 14) && (Build.VERSION.SDK_INT < 16);
  }
  
  public static boolean isUndoRedoAvailable()
  {
    return (isUndoRedoAvailable(SystemUtils.MemoryInfo.getSystemTotalMemory())) && (SystemUtils.MemoryInfo.getRuntimeTotalMemory() >= 127.0D);
  }
  
  public static boolean isUndoRedoAvailable(double paramDouble)
  {
    return (AT_LEAST_14) && (paramDouble >= 500.0D);
  }
}
