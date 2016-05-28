package com.behance.sdk.dto;

import android.content.Context;
import android.graphics.Bitmap;
import com.behance.sdk.enums.BehanceSDKAlbumType;
import com.behance.sdk.project.modules.ImageModule;
import java.util.ArrayList;
import java.util.List;

public class BehanceSDKAlbumDTO
{
  private String albumName;
  private BehanceSDKAlbumType albumType;
  private List<ImageModule> imagesList;
  
  public BehanceSDKAlbumDTO(String paramString, BehanceSDKAlbumType paramBehanceSDKAlbumType)
  {
    albumName = paramString;
    if (paramBehanceSDKAlbumType == null)
    {
      albumType = BehanceSDKAlbumType.DEVICE_ALBUM;
      return;
    }
    albumType = paramBehanceSDKAlbumType;
  }
  
  public BehanceSDKAlbumType getAlbumType()
  {
    return albumType;
  }
  
  public Bitmap getCoverBitmap(Context paramContext)
  {
    if (imagesList != null) {
      return ((ImageModule)imagesList.get(0)).getThumbNail(paramContext);
    }
    return null;
  }
  
  public List<ImageModule> getImages()
  {
    return imagesList;
  }
  
  public String getName()
  {
    return albumName;
  }
  
  public void setImages(List<ImageModule> paramList)
  {
    if (imagesList == null) {
      imagesList = new ArrayList();
    }
    if (paramList != null) {
      imagesList.addAll(paramList);
    }
  }
}
