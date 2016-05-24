package com.adobe.creativesdk.foundation.storage;

import android.graphics.Color;
import com.adobe.creativesdk.foundation.adobeinternal.storage.dcx.AdobeDCXManifestNode;
import org.json.JSONObject;

public class AdobeAssetLibraryItemColor
  extends AdobeAssetLibraryItem
{
  private Number colorAlpha;
  private Object colorComponents;
  private AdobeAssetLibraryColorMode colorMode;
  private String colorProfileName;
  private AdobeAssetLibraryColorType colorType;
  private Number renditionAlpha;
  private Object renditionComponents;
  private AdobeAssetLibraryColorMode renditionMode;
  private String renditionProfileName;
  private AdobeAssetLibraryColorType renditionType;
  
  protected AdobeAssetLibraryItemColor(AdobeDCXManifestNode paramAdobeDCXManifestNode, String paramString1, String paramString2, String paramString3, Object paramObject1, Number paramNumber1, String paramString4, String paramString5, String paramString6, Object paramObject2, Number paramNumber2, String paramString7, AdobeAssetLibrary paramAdobeAssetLibrary)
  {
    super(paramAdobeDCXManifestNode, paramString1, paramAdobeAssetLibrary);
    colorType = colorTypeForStringType(paramString2);
    colorMode = colorModeForStringMode(paramString3);
    colorComponents = paramObject1;
    colorAlpha = paramNumber1;
    colorProfileName = paramString4;
    renditionType = colorTypeForStringType(paramString5);
    renditionMode = colorModeForStringMode(paramString6);
    renditionComponents = paramObject2;
    renditionAlpha = paramNumber2;
    renditionProfileName = paramString7;
  }
  
  static AdobeAssetLibraryColorMode colorModeForStringMode(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    paramString = paramString.toLowerCase();
    if (paramString.equals("rgb")) {
      return AdobeAssetLibraryColorMode.AdobeAssetLibraryColorModeRGB;
    }
    if (paramString.equals("cmyk")) {
      return AdobeAssetLibraryColorMode.AdobeAssetLibraryColorModeCMYK;
    }
    if (paramString.equals("lab")) {
      return AdobeAssetLibraryColorMode.AdobeAssetLibraryColorModeLab;
    }
    if (paramString.equals("hsb")) {
      return AdobeAssetLibraryColorMode.AdobeAssetLibraryColorModeHSB;
    }
    if (paramString.equals("gray")) {
      return AdobeAssetLibraryColorMode.AdobeAssetLibraryColorModeGray;
    }
    return AdobeAssetLibraryColorMode.AdobeAssetLibraryColorModeUnknown;
  }
  
  static AdobeAssetLibraryColorType colorTypeForStringType(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    if (paramString.toLowerCase().equals("spot")) {
      return AdobeAssetLibraryColorType.AdobeAssetLibraryColorTypeSpot;
    }
    return AdobeAssetLibraryColorType.AdobeAssetLibraryColorTypeProcess;
  }
  
  private String grayHex()
  {
    return String.format("#%02X", new Object[] { Integer.valueOf(((Number)colorComponents).intValue()) });
  }
  
  private String hex()
  {
    switch (1.$SwitchMap$com$adobe$creativesdk$foundation$storage$AdobeAssetLibraryColorMode[colorMode.ordinal()])
    {
    case 2: 
    case 5: 
    case 6: 
    default: 
      return null;
    case 1: 
      return rgbHex();
    case 3: 
      return grayHex();
    }
    return hsbHex();
  }
  
  private String hsbHex()
  {
    JSONObject localJSONObject = (JSONObject)colorComponents;
    return String.format("#%02X%02X%02X", new Object[] { Integer.valueOf(localJSONObject.optInt("h")), Integer.valueOf(localJSONObject.optInt("s")), Integer.valueOf(localJSONObject.optInt("b")) });
  }
  
  private String renditionHex()
  {
    JSONObject localJSONObject = (JSONObject)renditionComponents;
    return String.format("#%02X%02X%02X", new Object[] { Integer.valueOf(localJSONObject.optInt("r")), Integer.valueOf(localJSONObject.optInt("g")), Integer.valueOf(localJSONObject.optInt("b")) });
  }
  
  private String rgbHex()
  {
    JSONObject localJSONObject = (JSONObject)colorComponents;
    return String.format("#%02X%02X%02X", new Object[] { Integer.valueOf(localJSONObject.optInt("r")), Integer.valueOf(localJSONObject.optInt("g")), Integer.valueOf(localJSONObject.optInt("b")) });
  }
  
  public int color()
  {
    if (colorMode == null) {
      return -1;
    }
    switch (1.$SwitchMap$com$adobe$creativesdk$foundation$storage$AdobeAssetLibraryColorMode[colorMode.ordinal()])
    {
    default: 
      return rgbRenditionColor();
    case 1: 
      return rgbColor();
    case 2: 
      return rgbRenditionColor();
    case 3: 
      return grayColor();
    case 4: 
      return hsbColor();
    case 5: 
      return rgbRenditionColor();
    }
    return rgbRenditionColor();
  }
  
  public String colorNameOrHexValue()
  {
    Object localObject;
    if (name != null) {
      localObject = name;
    }
    String str;
    do
    {
      return localObject;
      str = hex();
      localObject = str;
    } while (str != null);
    return renditionHex();
  }
  
  int grayColor()
  {
    int i = new Double(255.0D * ((100.0D - ((Number)colorComponents).doubleValue()) / 100.0D)).intValue();
    return Color.rgb(i, i, i);
  }
  
  int hsbColor()
  {
    JSONObject localJSONObject = (JSONObject)colorComponents;
    return Color.HSVToColor(new float[] { localJSONObject.optInt("h"), localJSONObject.optInt("s"), localJSONObject.optInt("b") });
  }
  
  int rgbColor()
  {
    JSONObject localJSONObject = (JSONObject)colorComponents;
    return Color.argb(255, localJSONObject.optInt("r"), localJSONObject.optInt("g"), localJSONObject.optInt("b"));
  }
  
  int rgbRenditionColor()
  {
    if (renditionComponents != null)
    {
      JSONObject localJSONObject = (JSONObject)renditionComponents;
      return Color.rgb(localJSONObject.optInt("r"), localJSONObject.optInt("g"), localJSONObject.optInt("b"));
    }
    return -1;
  }
}
