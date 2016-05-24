package com.behance.sdk.files;

import com.behance.sdk.project.modules.ImageModule;
import java.util.ArrayList;
import java.util.List;

public class ImageAlbum
{
  private String albumName;
  private List<ImageModule> images;
  
  public ImageAlbum(String paramString)
  {
    albumName = paramString;
  }
  
  public void addImage(ImageModule paramImageModule)
  {
    if (images == null) {
      images = new ArrayList();
    }
    images.add(paramImageModule);
  }
  
  public List<ImageModule> getImages()
  {
    return images;
  }
  
  public String getName()
  {
    return albumName;
  }
}
