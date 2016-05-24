package com.behance.sdk.dto.parser;

import com.behance.sdk.dto.search.BehanceSDKFeaturedDTO;
import com.behance.sdk.dto.search.BehanceSDKUserDTO;
import com.behance.sdk.dto.search.BehanceSDKUserDetailsSectionDTO;
import com.behance.sdk.dto.search.BehanceSDKWebLinkDTO;
import com.behance.sdk.logger.ILogger;
import com.behance.sdk.logger.LoggerFactory;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class BehanceUserDTOParser
{
  private static final ILogger logger = LoggerFactory.getLogger(BehanceUserDTOParser.class);
  
  public BehanceUserDTOParser() {}
  
  public BehanceSDKUserDTO parse(JSONObject paramJSONObject)
    throws JSONException
  {
    if (paramJSONObject != null) {}
    for (;;)
    {
      BehanceSDKUserDTO localBehanceSDKUserDTO;
      int i;
      Object localObject2;
      try
      {
        localBehanceSDKUserDTO = new BehanceSDKUserDTO();
        localBehanceSDKUserDTO.setId(paramJSONObject.optInt("id"));
        localBehanceSDKUserDTO.setFirstName(paramJSONObject.optString("first_name"));
        localBehanceSDKUserDTO.setLastName(paramJSONObject.optString("last_name"));
        localBehanceSDKUserDTO.setUserName(paramJSONObject.optString("username"));
        localBehanceSDKUserDTO.setProfileUrl(paramJSONObject.optString("url"));
        localBehanceSDKUserDTO.setDisplayName(paramJSONObject.optString("display_name"));
        localBehanceSDKUserDTO.setCity(paramJSONObject.optString("city"));
        localBehanceSDKUserDTO.setState(paramJSONObject.optString("state"));
        localBehanceSDKUserDTO.setCountry(paramJSONObject.optString("country"));
        localBehanceSDKUserDTO.setCompany(paramJSONObject.optString("company"));
        localBehanceSDKUserDTO.setOccupation(paramJSONObject.optString("occupation"));
        localBehanceSDKUserDTO.setCreatedOn(paramJSONObject.optLong("created_on"));
        localBehanceSDKUserDTO.setTwitterHandle(paramJSONObject.optString("twitter"));
        localObject1 = paramJSONObject.optJSONArray("links");
        Object localObject3;
        if (localObject1 != null)
        {
          i = 0;
          if (i < ((JSONArray)localObject1).length())
          {
            localObject2 = ((JSONArray)localObject1).optJSONObject(i);
            if (localObject2 == null) {
              break label710;
            }
            localObject3 = new BehanceSDKWebLinkDTO();
            ((BehanceSDKWebLinkDTO)localObject3).setTitle(((JSONObject)localObject2).optString("title"));
            ((BehanceSDKWebLinkDTO)localObject3).setUrl(((JSONObject)localObject2).optString("url"));
            localBehanceSDKUserDTO.addWebLink((BehanceSDKWebLinkDTO)localObject3);
            break label710;
          }
        }
        localObject1 = paramJSONObject.optJSONObject("sections");
        if (localObject1 != null)
        {
          localObject2 = ((JSONObject)localObject1).keys();
          if (((Iterator)localObject2).hasNext())
          {
            localObject3 = String.valueOf(((Iterator)localObject2).next());
            if (localObject3 == null) {
              continue;
            }
            String str = ((JSONObject)localObject1).optString((String)localObject3);
            if (str == null) {
              continue;
            }
            BehanceSDKUserDetailsSectionDTO localBehanceSDKUserDetailsSectionDTO = new BehanceSDKUserDetailsSectionDTO();
            localBehanceSDKUserDetailsSectionDTO.setTitle((String)localObject3);
            localBehanceSDKUserDetailsSectionDTO.setDescription(str);
            localBehanceSDKUserDTO.addDetailsSection(localBehanceSDKUserDetailsSectionDTO);
            continue;
          }
        }
        if (paramJSONObject.optInt("is_following", 0) != 1) {
          break label524;
        }
      }
      catch (JSONException paramJSONObject)
      {
        logger.error(paramJSONObject, "Problem parsing User JSON", new Object[0]);
        throw paramJSONObject;
      }
      localBehanceSDKUserDTO.setCurrentUserFollowing(true);
      for (;;)
      {
        localObject1 = paramJSONObject.optJSONObject("stats");
        if (localObject1 != null)
        {
          localBehanceSDKUserDTO.setFollowingCount(((JSONObject)localObject1).optInt("following"));
          localBehanceSDKUserDTO.setFollowersCount(((JSONObject)localObject1).optInt("followers"));
          localBehanceSDKUserDTO.setAppreciationsCount(((JSONObject)localObject1).optInt("appreciations"));
          localBehanceSDKUserDTO.setCommentsCount(((JSONObject)localObject1).optInt("comments"));
          localBehanceSDKUserDTO.setViewsCount(((JSONObject)localObject1).optInt("views"));
        }
        localObject1 = paramJSONObject.optJSONObject("images");
        if (localObject1 != null)
        {
          localBehanceSDKUserDTO.addImage(50, ((JSONObject)localObject1).optString("50"));
          localBehanceSDKUserDTO.addImage(115, ((JSONObject)localObject1).optString("115"));
          localBehanceSDKUserDTO.addImage(138, ((JSONObject)localObject1).optString("138"));
          localBehanceSDKUserDTO.addImage(276, ((JSONObject)localObject1).optString("276"));
        }
        localObject1 = paramJSONObject.optJSONArray("fields");
        if (localObject1 == null) {
          break;
        }
        i = 0;
        while (i < ((JSONArray)localObject1).length())
        {
          localBehanceSDKUserDTO.addField(((JSONArray)localObject1).optString(i));
          i += 1;
        }
        label524:
        localBehanceSDKUserDTO.setCurrentUserFollowing(false);
      }
      Object localObject1 = paramJSONObject.optJSONArray("features");
      paramJSONObject = localBehanceSDKUserDTO;
      if (localObject1 != null)
      {
        i = 0;
        for (;;)
        {
          paramJSONObject = localBehanceSDKUserDTO;
          if (i >= ((JSONArray)localObject1).length()) {
            break;
          }
          localObject2 = ((JSONArray)localObject1).getJSONObject(i).optJSONObject("site");
          if (localObject2 != null)
          {
            paramJSONObject = new BehanceSDKFeaturedDTO();
            paramJSONObject.setSiteDomain(((JSONObject)localObject2).optString("domain"));
            paramJSONObject.setSiteIcon(((JSONObject)localObject2).optString("icon"));
            paramJSONObject.setSiteId(((JSONObject)localObject2).optString("id"));
            paramJSONObject.setSiteKey(((JSONObject)localObject2).optString("key"));
            paramJSONObject.setSiteName(((JSONObject)localObject2).optString("name"));
            paramJSONObject.setSiteUrl(((JSONObject)localObject2).optString("url"));
            localObject2 = ((JSONObject)localObject2).optJSONObject("ribbon");
            if (localObject2 != null)
            {
              paramJSONObject.setSiteRibbonImage(((JSONObject)localObject2).optString("image"));
              paramJSONObject.setSiteRibbonBiggerImage(((JSONObject)localObject2).optString("image_2x"));
            }
            localBehanceSDKUserDTO.addFeaturedDetail(paramJSONObject);
          }
          i += 1;
        }
        paramJSONObject = null;
      }
      return paramJSONObject;
      label710:
      i += 1;
    }
  }
}
