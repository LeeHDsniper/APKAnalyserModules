package com.behance.sdk.dto.parser;

import com.behance.sdk.dto.search.BehanceSDKAbstractProjectModuleDTO;
import com.behance.sdk.dto.search.BehanceSDKAudioModuleDTO;
import com.behance.sdk.dto.search.BehanceSDKEmbedModuleDTO;
import com.behance.sdk.dto.search.BehanceSDKImageModuleDTO;
import com.behance.sdk.dto.search.BehanceSDKTextModuleDTO;
import com.behance.sdk.dto.search.BehanceSDKVideoModuleDTO;
import com.behance.sdk.enums.BehanceSDKProjectModuleType;
import org.json.JSONException;
import org.json.JSONObject;

public class BehanceSDKProjectModuleFactory
{
  private static BehanceSDKAbstractProjectModuleDTO getAudioModuleInstance(JSONObject paramJSONObject)
    throws JSONException
  {
    BehanceSDKAudioModuleDTO localBehanceSDKAudioModuleDTO = new BehanceSDKAudioModuleDTO();
    localBehanceSDKAudioModuleDTO.setId(paramJSONObject.optString("id"));
    localBehanceSDKAudioModuleDTO.setEmbedHTML(paramJSONObject.optString("embed"));
    localBehanceSDKAudioModuleDTO.setSrcURL(paramJSONObject.optString("src"));
    return localBehanceSDKAudioModuleDTO;
  }
  
  private static BehanceSDKAbstractProjectModuleDTO getEmbedModuleInstance(JSONObject paramJSONObject)
    throws JSONException
  {
    BehanceSDKEmbedModuleDTO localBehanceSDKEmbedModuleDTO = new BehanceSDKEmbedModuleDTO();
    localBehanceSDKEmbedModuleDTO.setId(paramJSONObject.optString("id"));
    localBehanceSDKEmbedModuleDTO.setEmbedHTML(paramJSONObject.optString("embed"));
    return localBehanceSDKEmbedModuleDTO;
  }
  
  private static BehanceSDKAbstractProjectModuleDTO getImageModuleInstance(JSONObject paramJSONObject)
    throws JSONException
  {
    boolean bool = true;
    BehanceSDKImageModuleDTO localBehanceSDKImageModuleDTO = new BehanceSDKImageModuleDTO();
    localBehanceSDKImageModuleDTO.setHeight(paramJSONObject.optInt("height"));
    localBehanceSDKImageModuleDTO.setId(paramJSONObject.optString("id"));
    localBehanceSDKImageModuleDTO.setSrcUrl(paramJSONObject.optString("src"));
    if (paramJSONObject.optInt("full_bleed") == 1) {}
    for (;;)
    {
      localBehanceSDKImageModuleDTO.setFullBleed(bool);
      localBehanceSDKImageModuleDTO.setWidth(paramJSONObject.optInt("width"));
      paramJSONObject = paramJSONObject.opt("sizes");
      if ((paramJSONObject instanceof JSONObject)) {
        localBehanceSDKImageModuleDTO.setHDSrcUrl(((JSONObject)paramJSONObject).optString("max_1240"));
      }
      return localBehanceSDKImageModuleDTO;
      bool = false;
    }
  }
  
  public static BehanceSDKAbstractProjectModuleDTO getProjectModuleInstance(JSONObject paramJSONObject)
    throws JSONException
  {
    BehanceSDKProjectModuleType localBehanceSDKProjectModuleType = BehanceSDKProjectModuleType.fromString(paramJSONObject.getString("type"));
    switch (1.$SwitchMap$com$behance$sdk$enums$BehanceSDKProjectModuleType[localBehanceSDKProjectModuleType.ordinal()])
    {
    default: 
      return null;
    case 1: 
      return getImageModuleInstance(paramJSONObject);
    case 2: 
      return getEmbedModuleInstance(paramJSONObject);
    case 3: 
      return getVideoModuleInstance(paramJSONObject);
    case 4: 
      return getTextModuleInstance(paramJSONObject);
    }
    return getAudioModuleInstance(paramJSONObject);
  }
  
  private static BehanceSDKAbstractProjectModuleDTO getTextModuleInstance(JSONObject paramJSONObject)
    throws JSONException
  {
    BehanceSDKTextModuleDTO localBehanceSDKTextModuleDTO = new BehanceSDKTextModuleDTO();
    localBehanceSDKTextModuleDTO.setId(paramJSONObject.optString("id"));
    localBehanceSDKTextModuleDTO.setFormattedText(paramJSONObject.optString("text"));
    localBehanceSDKTextModuleDTO.setPlainText(paramJSONObject.optString("text_plain"));
    return localBehanceSDKTextModuleDTO;
  }
  
  private static BehanceSDKAbstractProjectModuleDTO getVideoModuleInstance(JSONObject paramJSONObject)
    throws JSONException
  {
    BehanceSDKVideoModuleDTO localBehanceSDKVideoModuleDTO = new BehanceSDKVideoModuleDTO();
    localBehanceSDKVideoModuleDTO.setId(paramJSONObject.optString("id"));
    localBehanceSDKVideoModuleDTO.setEmbedHTML(paramJSONObject.optString("embed"));
    localBehanceSDKVideoModuleDTO.setHeight(paramJSONObject.optInt("height"));
    localBehanceSDKVideoModuleDTO.setWidth(paramJSONObject.optInt("width"));
    localBehanceSDKVideoModuleDTO.setImageSrc(paramJSONObject.optString("image_src"));
    localBehanceSDKVideoModuleDTO.setPlayerSkin(paramJSONObject.optString("player_skin"));
    localBehanceSDKVideoModuleDTO.setPlayerUrl(paramJSONObject.optString("player"));
    localBehanceSDKVideoModuleDTO.setVideoSrc(paramJSONObject.optString("src"));
    return localBehanceSDKVideoModuleDTO;
  }
}
