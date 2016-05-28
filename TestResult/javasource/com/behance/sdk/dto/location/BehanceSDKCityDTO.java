package com.behance.sdk.dto.location;

import java.io.Serializable;

public class BehanceSDKCityDTO
  extends BehanceSDKLocationDTO
  implements Serializable, Comparable<BehanceSDKCityDTO>
{
  private static final long serialVersionUID = -4491829944206768894L;
  
  public BehanceSDKCityDTO() {}
  
  public int compareTo(BehanceSDKCityDTO paramBehanceSDKCityDTO)
  {
    if ((paramBehanceSDKCityDTO != null) && (getDisplayName() != null) && (paramBehanceSDKCityDTO.getDisplayName() != null)) {
      return getDisplayName().compareTo(paramBehanceSDKCityDTO.getDisplayName());
    }
    return 0;
  }
  
  public String toString()
  {
    return getDisplayName();
  }
}
