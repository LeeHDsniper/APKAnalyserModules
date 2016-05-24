package com.behance.sdk.dto.search;

import android.util.SparseArray;
import java.io.Serializable;

public class BehanceSDKProjectCoversDTO
  implements Serializable
{
  private static final long serialVersionUID = -7479303355724199312L;
  private SparseArray<BehanceSDKImageDTO> coverImages = new SparseArray(4);
  
  public BehanceSDKProjectCoversDTO() {}
  
  public void addCoverImages(int paramInt, String paramString)
  {
    if ((paramString != null) && (paramString.length() > 0)) {
      coverImages.put(paramInt, BehanceSDKImageDTO.getNewInstance(paramString));
    }
  }
}
