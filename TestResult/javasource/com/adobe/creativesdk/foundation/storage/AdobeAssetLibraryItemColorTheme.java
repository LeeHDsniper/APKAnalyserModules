package com.adobe.creativesdk.foundation.storage;

import android.graphics.Color;
import com.adobe.creativesdk.foundation.adobeinternal.storage.dcx.AdobeDCXManifestNode;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

public class AdobeAssetLibraryItemColorTheme
  extends AdobeAssetLibraryItem
{
  private AdobeAssetLibraryColorThemeMood mood;
  private AdobeAssetLibraryColorThemeRule rule;
  private JSONArray swatches;
  private JSONArray tags;
  
  protected AdobeAssetLibraryItemColorTheme(AdobeDCXManifestNode paramAdobeDCXManifestNode, JSONArray paramJSONArray1, String paramString1, String paramString2, JSONArray paramJSONArray2, AdobeAssetLibrary paramAdobeAssetLibrary)
  {
    super(paramAdobeDCXManifestNode, null, paramAdobeAssetLibrary);
    tags = paramJSONArray1;
    swatches = paramJSONArray2;
    rule = themeRuleForStringRule(paramString1);
    mood = themeMoodForStringMood(paramString2);
  }
  
  private static AdobeAssetLibraryColorThemeMood themeMoodForStringMood(String paramString)
  {
    if (paramString != null) {}
    for (paramString = paramString.toLowerCase(); paramString == null; paramString = null) {
      return AdobeAssetLibraryColorThemeMood.AdobeAssetLibraryColorThemeMoodNotSet;
    }
    if (paramString.equals("colorful")) {
      return AdobeAssetLibraryColorThemeMood.AdobeAssetLibraryColorThemeMoodColorful;
    }
    if (paramString.equals("bright")) {
      return AdobeAssetLibraryColorThemeMood.AdobeAssetLibraryColorThemeMoodBright;
    }
    if (paramString.equals("muted")) {
      return AdobeAssetLibraryColorThemeMood.AdobeAssetLibraryColorThemeMoodMuted;
    }
    if (paramString.equals("dark")) {
      return AdobeAssetLibraryColorThemeMood.AdobeAssetLibraryColorThemeMoodDark;
    }
    if (paramString.equals("custom")) {
      return AdobeAssetLibraryColorThemeMood.AdobeAssetLibraryColorThemeMoodCustom;
    }
    return AdobeAssetLibraryColorThemeMood.AdobeAssetLibraryColorThemeMoodUnknown;
  }
  
  private static AdobeAssetLibraryColorThemeRule themeRuleForStringRule(String paramString)
  {
    if (paramString != null) {}
    for (paramString = paramString.toLowerCase(); paramString == null; paramString = null) {
      return AdobeAssetLibraryColorThemeRule.AdobeAssetLibraryColorThemeRuleNotSet;
    }
    if (paramString.equals("analogous")) {
      return AdobeAssetLibraryColorThemeRule.AdobeAssetLibraryColorThemeRuleAnalogous;
    }
    if (paramString.equals("complimentary")) {
      return AdobeAssetLibraryColorThemeRule.AdobeAssetLibraryColorThemeRuleComplimentary;
    }
    if (paramString.equals("monochromatic")) {
      return AdobeAssetLibraryColorThemeRule.AdobeAssetLibraryColorThemeRuleMonochromatic;
    }
    if (paramString.equals("triad")) {
      return AdobeAssetLibraryColorThemeRule.AdobeAssetLibraryColorThemeRuleTriad;
    }
    if (paramString.equals("custom")) {
      return AdobeAssetLibraryColorThemeRule.AdobeAssetLibraryColorThemeRuleCustom;
    }
    return AdobeAssetLibraryColorThemeRule.AdobeAssetLibraryColorThemeRuleUnknown;
  }
  
  public ArrayList<Integer> getRGBColors()
  {
    if (swatches == null) {
      localObject1 = null;
    }
    int j;
    ArrayList localArrayList;
    int i;
    do
    {
      return localObject1;
      j = swatches.length();
      localArrayList = new ArrayList(j);
      i = 0;
      localObject1 = localArrayList;
    } while (i >= j);
    Object localObject2 = swatches.opt(i);
    Object localObject1 = null;
    if ((localObject2 instanceof JSONArray))
    {
      localObject1 = ((JSONArray)localObject2).optJSONObject(0);
      label69:
      if (localObject1 != null)
      {
        Object localObject3 = ((JSONObject)localObject1).opt("value");
        localObject2 = localObject3;
        if (localObject3 == null) {
          localObject2 = ((JSONObject)localObject1).opt("values");
        }
        if (!(localObject2 instanceof JSONObject)) {
          break label166;
        }
        localObject1 = (JSONObject)localObject2;
        localArrayList.add(Integer.valueOf(Color.rgb(((JSONObject)localObject1).optInt("r"), ((JSONObject)localObject1).optInt("g"), ((JSONObject)localObject1).optInt("b"))));
      }
    }
    for (;;)
    {
      i += 1;
      break;
      if (!(localObject2 instanceof JSONObject)) {
        break label69;
      }
      localObject1 = (JSONObject)localObject2;
      break label69;
      label166:
      if ((localObject2 instanceof JSONArray))
      {
        localObject1 = (JSONArray)localObject2;
        localArrayList.add(Integer.valueOf(Color.rgb(new Double(((JSONArray)localObject1).optDouble(0) * 255.0D).intValue(), new Double(((JSONArray)localObject1).optDouble(1) * 255.0D).intValue(), new Double(((JSONArray)localObject1).optDouble(2) * 255.0D).intValue())));
      }
    }
  }
}
