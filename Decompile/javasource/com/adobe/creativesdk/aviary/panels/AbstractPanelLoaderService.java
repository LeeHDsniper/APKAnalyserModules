package com.adobe.creativesdk.aviary.panels;

import com.adobe.creativesdk.aviary.internal.AdobeImageEditorController;
import com.adobe.creativesdk.aviary.internal.content.ToolEntry;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory.Tools;
import com.adobe.creativesdk.aviary.internal.services.BaseContextService;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.log.LoggerFactory.LoggerType;
import com.aviary.android.feather.sdk.R.drawable;
import com.aviary.android.feather.sdk.R.string;

public class AbstractPanelLoaderService
  extends BaseContextService
{
  static final ToolEntry[] ALL_ENTRIES = { new ToolEntry(ToolLoaderFactory.Tools.ENHANCE, R.drawable.com_adobe_image_tool_ic_enhance, R.string.feather_enhance), new ToolEntry(ToolLoaderFactory.Tools.FOCUS, R.drawable.com_adobe_image_tool_ic_focus, R.string.feather_tool_tiltshift), new ToolEntry(ToolLoaderFactory.Tools.EFFECTS, R.drawable.com_adobe_image_tool_ic_effects, R.string.feather_effects), new ToolEntry(ToolLoaderFactory.Tools.FRAMES, R.drawable.com_adobe_image_tool_ic_frames, R.string.feather_borders), new ToolEntry(ToolLoaderFactory.Tools.STICKERS, R.drawable.com_adobe_image_tool_ic_stickers, R.string.feather_stickers), new ToolEntry(ToolLoaderFactory.Tools.OVERLAYS, R.drawable.com_adobe_image_tool_ic_overlay, R.string.feather_overlays), new ToolEntry(ToolLoaderFactory.Tools.CROP, R.drawable.com_adobe_image_tool_ic_crop, R.string.feather_crop), new ToolEntry(ToolLoaderFactory.Tools.ORIENTATION, R.drawable.com_adobe_image_tool_ic_orientation, R.string.feather_adjust), new ToolEntry(ToolLoaderFactory.Tools.LIGHTING, R.drawable.com_adobe_image_tool_ic_lighting, R.string.feather_tool_lighting), new ToolEntry(ToolLoaderFactory.Tools.COLOR, R.drawable.com_adobe_image_tool_ic_color, R.string.feather_tool_color), new ToolEntry(ToolLoaderFactory.Tools.SHARPNESS, R.drawable.com_adobe_image_tool_ic_sharpen, R.string.feather_sharpen), new ToolEntry(ToolLoaderFactory.Tools.SPLASH, R.drawable.com_adobe_image_tool_ic_colorsplash, R.string.feather_tool_colorsplash), new ToolEntry(ToolLoaderFactory.Tools.DRAW, R.drawable.com_adobe_image_tool_ic_draw, R.string.feather_draw), new ToolEntry(ToolLoaderFactory.Tools.TEXT, R.drawable.com_adobe_image_tool_ic_text, R.string.feather_text), new ToolEntry(ToolLoaderFactory.Tools.REDEYE, R.drawable.com_adobe_image_tool_ic_redeye, R.string.feather_red_eye), new ToolEntry(ToolLoaderFactory.Tools.WHITEN, R.drawable.com_adobe_image_tool_ic_whiten, R.string.feather_whiten), new ToolEntry(ToolLoaderFactory.Tools.BLEMISH, R.drawable.com_adobe_image_tool_ic_blemish, R.string.feather_blemish), new ToolEntry(ToolLoaderFactory.Tools.MEME, R.drawable.com_adobe_image_tool_ic_meme, R.string.feather_meme), new ToolEntry(ToolLoaderFactory.Tools.BLUR, R.drawable.com_adobe_image_tool_ic_blur, R.string.feather_blur), new ToolEntry(ToolLoaderFactory.Tools.VIGNETTE, R.drawable.com_adobe_image_tool_ic_vignette, R.string.feather_vignette) };
  
  public AbstractPanelLoaderService(AdobeImageEditorController paramAdobeImageEditorController)
  {
    super(paramAdobeImageEditorController);
  }
  
  public static int getToolDisplayName(ToolLoaderFactory.Tools paramTools)
  {
    switch (1.$SwitchMap$com$adobe$creativesdk$aviary$internal$filters$ToolLoaderFactory$Tools[paramTools.ordinal()])
    {
    default: 
      return 0;
    case 4: 
      return R.string.feather_sharpen;
    case 6: 
      return R.string.feather_effects;
    case 9: 
      return R.string.feather_red_eye;
    case 8: 
      return R.string.feather_crop;
    case 10: 
      return R.string.feather_whiten;
    case 13: 
      return R.string.feather_draw;
    case 14: 
      return R.string.feather_stickers;
    case 15: 
      return R.string.feather_text;
    case 12: 
      return R.string.feather_blemish;
    case 16: 
      return R.string.feather_meme;
    case 1: 
      return R.string.feather_adjust;
    case 5: 
      return R.string.feather_enhance;
    case 7: 
      return R.string.feather_borders;
    case 17: 
      return R.string.feather_tool_colorsplash;
    case 18: 
      return R.string.feather_tool_tiltshift;
    case 11: 
      return R.string.feather_blur;
    case 19: 
      return R.string.feather_vignette;
    case 2: 
      return R.string.feather_tool_lighting;
    case 3: 
      return R.string.feather_tool_color;
    }
    return R.string.feather_overlays;
  }
  
  public static ToolEntry[] getToolsEntries()
  {
    return ALL_ENTRIES;
  }
  
  public AbstractPanel createNew(ToolEntry paramToolEntry)
  {
    AdobeImageEditorController localAdobeImageEditorController = getContext();
    switch (1.$SwitchMap$com$adobe$creativesdk$aviary$internal$filters$ToolLoaderFactory$Tools[name.ordinal()])
    {
    default: 
      LoggerFactory.getLogger("EffectLoaderService", LoggerFactory.LoggerType.ConsoleLoggerType).error("Effect with " + name + " could not be found");
      return null;
    case 1: 
      return new OrientationPanel(localAdobeImageEditorController, paramToolEntry, ToolLoaderFactory.Tools.ORIENTATION);
    case 2: 
      return new ConsolidatedAdjustToolsPanel(localAdobeImageEditorController, paramToolEntry);
    case 3: 
      return new ConsolidatedAdjustToolsPanel(localAdobeImageEditorController, paramToolEntry);
    case 4: 
      return new NativeEffectRangePanel(localAdobeImageEditorController, paramToolEntry, ToolLoaderFactory.Tools.SHARPNESS);
    case 5: 
      return new EnhanceEffectPanel(localAdobeImageEditorController, paramToolEntry, ToolLoaderFactory.Tools.ENHANCE);
    case 6: 
      return new EffectsPanel(localAdobeImageEditorController, paramToolEntry);
    case 7: 
      return new BordersPanel(localAdobeImageEditorController, paramToolEntry);
    case 8: 
      return new CropPanel(localAdobeImageEditorController, paramToolEntry);
    case 9: 
      return new DelayedSpotDrawPanel(localAdobeImageEditorController, paramToolEntry, ToolLoaderFactory.Tools.REDEYE);
    case 10: 
      return new DelayedSpotDrawPanel(localAdobeImageEditorController, paramToolEntry, ToolLoaderFactory.Tools.WHITEN);
    case 11: 
      return new DelayedSpotDrawPanel(localAdobeImageEditorController, paramToolEntry, ToolLoaderFactory.Tools.BLUR);
    case 12: 
      return new BlemishPanel(localAdobeImageEditorController, paramToolEntry, ToolLoaderFactory.Tools.BLEMISH);
    case 13: 
      return new DrawingPanel(localAdobeImageEditorController, paramToolEntry);
    case 14: 
      return new StickersPanel(localAdobeImageEditorController, paramToolEntry);
    case 15: 
      return new TextPanel(localAdobeImageEditorController, paramToolEntry);
    case 16: 
      return new MemePanel(localAdobeImageEditorController, paramToolEntry);
    case 17: 
      return new ColorSplashPanel(localAdobeImageEditorController, paramToolEntry);
    case 18: 
      return new FocusPanel(localAdobeImageEditorController, paramToolEntry);
    case 19: 
      return new VignettePanel(localAdobeImageEditorController, paramToolEntry);
    }
    return new OverlaysPanel(localAdobeImageEditorController, paramToolEntry);
  }
  
  public void dispose() {}
  
  public ToolEntry findEntry(ToolLoaderFactory.Tools paramTools)
  {
    ToolEntry[] arrayOfToolEntry = ALL_ENTRIES;
    int j = arrayOfToolEntry.length;
    int i = 0;
    while (i < j)
    {
      ToolEntry localToolEntry = arrayOfToolEntry[i];
      if (name.equals(paramTools)) {
        return localToolEntry;
      }
      i += 1;
    }
    return null;
  }
}
