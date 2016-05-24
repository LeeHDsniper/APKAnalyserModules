package com.behance.sdk.dto.location;

import java.io.Serializable;

public class BehanceSDKStateDTO
  extends BehanceSDKLocationDTO
  implements Serializable, Comparable<BehanceSDKStateDTO>
{
  private static final long serialVersionUID = 3513138659097266778L;
  
  public BehanceSDKStateDTO() {}
  
  public int compareTo(BehanceSDKStateDTO paramBehanceSDKStateDTO)
  {
    if ((paramBehanceSDKStateDTO != null) && (getDisplayName() != null) && (paramBehanceSDKStateDTO.getDisplayName() != null)) {
      return getDisplayName().compareTo(paramBehanceSDKStateDTO.getDisplayName());
    }
    return 0;
  }
  
  public String toString()
  {
    return getDisplayName();
  }
}
