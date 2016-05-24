package com.behance.sdk.dto.location;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class BehanceSDKCountryDTO
  extends BehanceSDKLocationDTO
  implements Serializable, Comparable<BehanceSDKCountryDTO>
{
  public static final List<String> COUNTRY_CODES_FOR_LOAD_STATES = new ArrayList(2);
  private static final long serialVersionUID = 8229080965935852144L;
  
  static
  {
    COUNTRY_CODES_FOR_LOAD_STATES.add("US");
    COUNTRY_CODES_FOR_LOAD_STATES.add("CA");
  }
  
  public BehanceSDKCountryDTO() {}
  
  public int compareTo(BehanceSDKCountryDTO paramBehanceSDKCountryDTO)
  {
    if ((paramBehanceSDKCountryDTO != null) && (getDisplayName() != null) && (paramBehanceSDKCountryDTO.getDisplayName() != null)) {
      return getDisplayName().compareTo(paramBehanceSDKCountryDTO.getDisplayName());
    }
    return 0;
  }
  
  public String toString()
  {
    return getDisplayName();
  }
}
