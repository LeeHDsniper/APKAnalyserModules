package com.behance.sdk.dto.parser;

import com.behance.sdk.dto.search.BehanceSDKAbstractProjectModuleDTO;
import com.behance.sdk.dto.search.BehanceSDKProjectCopyrightDTO;
import com.behance.sdk.dto.search.BehanceSDKProjectCoversDTO;
import com.behance.sdk.dto.search.BehanceSDKProjectDTO;
import com.behance.sdk.dto.search.BehanceSDKProjectFeaturedDTO;
import com.behance.sdk.dto.search.BehanceSDKProjectStatsDTO;
import com.behance.sdk.exception.BehanceSDKProjectParseException;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class BehanceSDKProjectDTOParser
{
  public BehanceSDKProjectDTOParser() {}
  
  private boolean isProjectPublic(JSONObject paramJSONObject)
  {
    return "public".equalsIgnoreCase(paramJSONObject.optString("privacy"));
  }
  
  private List<BehanceSDKProjectDTO> parseProjects(JSONArray paramJSONArray, boolean paramBoolean)
    throws BehanceSDKProjectParseException
  {
    try
    {
      ArrayList localArrayList = new ArrayList(paramJSONArray.length());
      int i = 0;
      while (i < paramJSONArray.length())
      {
        JSONObject localJSONObject = paramJSONArray.getJSONObject(i);
        if ((localJSONObject != null) && ((isProjectPublic(localJSONObject)) || (paramBoolean))) {
          localArrayList.add(populateProjectDetails(localJSONObject, true));
        }
        i += 1;
      }
      return localArrayList;
    }
    catch (JSONException paramJSONArray)
    {
      throw new BehanceSDKProjectParseException(paramJSONArray.getMessage(), paramJSONArray);
    }
  }
  
  private void populateProjectCopyright(JSONObject paramJSONObject, BehanceSDKProjectDTO paramBehanceSDKProjectDTO)
    throws JSONException
  {
    if (paramJSONObject != null)
    {
      BehanceSDKProjectCopyrightDTO localBehanceSDKProjectCopyrightDTO = new BehanceSDKProjectCopyrightDTO();
      localBehanceSDKProjectCopyrightDTO.setLicenseType(paramJSONObject.optString("license"));
      localBehanceSDKProjectCopyrightDTO.setLicenseDescription(paramJSONObject.optString("description"));
      paramBehanceSDKProjectDTO.setCopyright(localBehanceSDKProjectCopyrightDTO);
    }
  }
  
  private void populateProjectCovers(JSONObject paramJSONObject, BehanceSDKProjectDTO paramBehanceSDKProjectDTO)
    throws JSONException
  {
    if (paramJSONObject != null)
    {
      BehanceSDKProjectCoversDTO localBehanceSDKProjectCoversDTO = new BehanceSDKProjectCoversDTO();
      localBehanceSDKProjectCoversDTO.addCoverImages(115, paramJSONObject.optString(String.valueOf(115)));
      localBehanceSDKProjectCoversDTO.addCoverImages(202, paramJSONObject.optString(String.valueOf(202)));
      localBehanceSDKProjectCoversDTO.addCoverImages(230, paramJSONObject.optString(String.valueOf(230)));
      localBehanceSDKProjectCoversDTO.addCoverImages(404, paramJSONObject.optString(String.valueOf(404)));
      paramBehanceSDKProjectDTO.setCovers(localBehanceSDKProjectCoversDTO);
    }
  }
  
  private BehanceSDKProjectDTO populateProjectDetails(JSONObject paramJSONObject, boolean paramBoolean)
    throws JSONException
  {
    if (paramJSONObject != null)
    {
      BehanceSDKProjectDTO localBehanceSDKProjectDTO = new BehanceSDKProjectDTO();
      localBehanceSDKProjectDTO.setId(paramJSONObject.optString("id"));
      localBehanceSDKProjectDTO.setName(paramJSONObject.optString("name"));
      localBehanceSDKProjectDTO.setPublishedDate(paramJSONObject.optLong("published_on"));
      localBehanceSDKProjectDTO.setCreatedDate(paramJSONObject.optLong("created_on"));
      localBehanceSDKProjectDTO.setModifiedDate(paramJSONObject.optLong("modified_on"));
      localBehanceSDKProjectDTO.setUrl(paramJSONObject.optString("url"));
      localBehanceSDKProjectDTO.setPrivacy(paramJSONObject.optString("privacy"));
      populateProjectCovers(paramJSONObject.optJSONObject("covers"), localBehanceSDKProjectDTO);
      populateProjectStats(paramJSONObject.optJSONObject("stats"), localBehanceSDKProjectDTO);
      populateProjectOwners(paramJSONObject.optJSONArray("owners"), localBehanceSDKProjectDTO);
      populateProjectFields(localBehanceSDKProjectDTO, paramJSONObject);
      if (paramBoolean)
      {
        localBehanceSDKProjectDTO.setMatureAccess(paramJSONObject.optString("mature_access"));
        if (paramJSONObject.optInt("mature_content") == 0) {}
        for (paramBoolean = false;; paramBoolean = true)
        {
          localBehanceSDKProjectDTO.setMatureContent(paramBoolean);
          localBehanceSDKProjectDTO.setDescription(paramJSONObject.optString("description"));
          localBehanceSDKProjectDTO.setCustomCSS(paramJSONObject.optString("custom_css"));
          localBehanceSDKProjectDTO.setShortUrl(paramJSONObject.optString("short_url"));
          localBehanceSDKProjectDTO.setHTML(paramJSONObject.optString("html"));
          JSONArray localJSONArray = paramJSONObject.optJSONArray("tags");
          if (localJSONArray == null) {
            break;
          }
          int i = 0;
          while (i < localJSONArray.length())
          {
            localBehanceSDKProjectDTO.addTag(localJSONArray.getString(i));
            i += 1;
          }
        }
        populateProjectModules(paramJSONObject.optJSONArray("modules"), localBehanceSDKProjectDTO);
        populateProjectFeaturedDetails(paramJSONObject.optJSONArray("features"), localBehanceSDKProjectDTO);
        populateProjectCopyright(paramJSONObject.optJSONObject("copyright"), localBehanceSDKProjectDTO);
      }
      return localBehanceSDKProjectDTO;
    }
    return null;
  }
  
  private void populateProjectFeaturedDetails(JSONArray paramJSONArray, BehanceSDKProjectDTO paramBehanceSDKProjectDTO)
    throws JSONException
  {
    if (paramJSONArray != null)
    {
      int i = 0;
      while (i < paramJSONArray.length())
      {
        JSONObject localJSONObject = paramJSONArray.getJSONObject(i);
        BehanceSDKProjectFeaturedDTO localBehanceSDKProjectFeaturedDTO = new BehanceSDKProjectFeaturedDTO();
        localBehanceSDKProjectFeaturedDTO.setFeaturedDate(localJSONObject.optLong("featured_on"));
        localBehanceSDKProjectFeaturedDTO.setProjectUrl(localJSONObject.optString("url"));
        localJSONObject = localJSONObject.optJSONObject("site");
        if (localJSONObject != null)
        {
          localBehanceSDKProjectFeaturedDTO.setSiteDomain(localJSONObject.optString("domain"));
          localBehanceSDKProjectFeaturedDTO.setSiteIcon(localJSONObject.optString("icon"));
          localBehanceSDKProjectFeaturedDTO.setSiteId(localJSONObject.optString("id"));
          localBehanceSDKProjectFeaturedDTO.setSiteKey(localJSONObject.optString("key"));
          localBehanceSDKProjectFeaturedDTO.setSiteName(localJSONObject.optString("name"));
          localBehanceSDKProjectFeaturedDTO.setSiteUrl(localJSONObject.optString("url"));
          localBehanceSDKProjectFeaturedDTO.setNetworkId(localJSONObject.optString("network_id"));
          localJSONObject = localJSONObject.optJSONObject("ribbon");
          if (localJSONObject != null)
          {
            localBehanceSDKProjectFeaturedDTO.setSiteRibbonImage(localJSONObject.optString("image"));
            localBehanceSDKProjectFeaturedDTO.setSiteRibbonBiggerImage(localJSONObject.optString("image_2x"));
          }
          paramBehanceSDKProjectDTO.addFeature(localBehanceSDKProjectFeaturedDTO);
        }
        i += 1;
      }
    }
  }
  
  private void populateProjectFields(BehanceSDKProjectDTO paramBehanceSDKProjectDTO, JSONObject paramJSONObject)
  {
    paramJSONObject = paramJSONObject.optJSONArray("fields");
    if (paramJSONObject != null)
    {
      ArrayList localArrayList = new ArrayList(paramJSONObject.length());
      int i = 0;
      while (i < paramJSONObject.length())
      {
        localArrayList.add(paramJSONObject.optString(i));
        i += 1;
      }
      paramBehanceSDKProjectDTO.setFields(localArrayList);
    }
  }
  
  private void populateProjectModules(JSONArray paramJSONArray, BehanceSDKProjectDTO paramBehanceSDKProjectDTO)
    throws JSONException
  {
    if (paramJSONArray != null)
    {
      int i = 0;
      while (i < paramJSONArray.length())
      {
        BehanceSDKAbstractProjectModuleDTO localBehanceSDKAbstractProjectModuleDTO = BehanceSDKProjectModuleFactory.getProjectModuleInstance(paramJSONArray.optJSONObject(i));
        if (localBehanceSDKAbstractProjectModuleDTO != null) {
          paramBehanceSDKProjectDTO.addModule(localBehanceSDKAbstractProjectModuleDTO);
        }
        i += 1;
      }
    }
  }
  
  private void populateProjectOwners(JSONArray paramJSONArray, BehanceSDKProjectDTO paramBehanceSDKProjectDTO)
    throws JSONException
  {
    if (paramJSONArray != null)
    {
      BehanceUserDTOParser localBehanceUserDTOParser = new BehanceUserDTOParser();
      int i = 0;
      while (i < paramJSONArray.length())
      {
        paramBehanceSDKProjectDTO.addOwner(localBehanceUserDTOParser.parse(paramJSONArray.optJSONObject(i)));
        i += 1;
      }
    }
  }
  
  private void populateProjectStats(JSONObject paramJSONObject, BehanceSDKProjectDTO paramBehanceSDKProjectDTO)
    throws JSONException
  {
    if (paramJSONObject != null)
    {
      BehanceSDKProjectStatsDTO localBehanceSDKProjectStatsDTO = new BehanceSDKProjectStatsDTO();
      localBehanceSDKProjectStatsDTO.setAppreciationsCount(paramJSONObject.optInt("appreciations"));
      localBehanceSDKProjectStatsDTO.setViewsCount(paramJSONObject.optInt("views"));
      localBehanceSDKProjectStatsDTO.setCommentsCount(paramJSONObject.optInt("comments"));
      paramBehanceSDKProjectDTO.setStats(localBehanceSDKProjectStatsDTO);
    }
  }
  
  public List<BehanceSDKProjectDTO> parseProjects(String paramString)
    throws BehanceSDKProjectParseException
  {
    try
    {
      paramString = parseProjects(new JSONObject(paramString).getJSONArray("projects"), true);
      return paramString;
    }
    catch (JSONException paramString)
    {
      throw new BehanceSDKProjectParseException(paramString.getMessage(), paramString);
    }
  }
}
