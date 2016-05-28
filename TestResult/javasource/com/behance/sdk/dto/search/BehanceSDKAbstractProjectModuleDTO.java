package com.behance.sdk.dto.search;

import com.behance.sdk.enums.BehanceSDKProjectModuleType;
import java.io.Serializable;

public abstract class BehanceSDKAbstractProjectModuleDTO
  implements Serializable
{
  private static final long serialVersionUID = 5665527980106568354L;
  private String id;
  private BehanceSDKProjectModuleType type;
  
  public BehanceSDKAbstractProjectModuleDTO() {}
  
  public void setId(String paramString)
  {
    id = paramString;
  }
  
  public void setType(BehanceSDKProjectModuleType paramBehanceSDKProjectModuleType)
  {
    type = paramBehanceSDKProjectModuleType;
  }
}
