package com.behance.sdk.dto;

import com.behance.sdk.enums.BehanceSDKCreativeFieldCategory;
import java.io.Serializable;

public class BehanceSDKCreativeFieldDTO
  implements Serializable
{
  private static final long serialVersionUID = 5332689791475823644L;
  private BehanceSDKCreativeFieldCategory category = BehanceSDKCreativeFieldCategory.NONE;
  private String id = "";
  private String name;
  
  public BehanceSDKCreativeFieldDTO() {}
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    do
    {
      return true;
      if (paramObject == null) {
        return false;
      }
      if (getClass() != paramObject.getClass()) {
        return false;
      }
      paramObject = (BehanceSDKCreativeFieldDTO)paramObject;
      if (id != null)
      {
        if (!id.equals(id)) {
          return false;
        }
      }
      else if (id != null) {
        return false;
      }
      if (name != null)
      {
        if (!name.equals(name)) {
          return false;
        }
      }
      else if (name != null) {
        return false;
      }
    } while (category == category);
    return false;
  }
  
  public BehanceSDKCreativeFieldCategory getCategory()
  {
    return category;
  }
  
  public String getId()
  {
    return id;
  }
  
  public String getName()
  {
    return name;
  }
  
  public void setCategory(BehanceSDKCreativeFieldCategory paramBehanceSDKCreativeFieldCategory)
  {
    category = paramBehanceSDKCreativeFieldCategory;
  }
  
  public void setId(String paramString)
  {
    id = paramString;
  }
  
  public void setName(String paramString)
  {
    name = paramString;
  }
}
