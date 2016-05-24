package com.behance.sdk;

import java.util.ArrayList;

public class BehanceSDKImageSelectorOptions
{
  public static int UNLIMITED_NUM_OF_IMAGES = -1;
  private ArrayList<String> allowedFileExtensions;
  private String imageValidatorType;
  private BehanceSDKImageDimensions maxImageDimensions;
  private long maxImageSizeInBytes = -1L;
  private int maxNumberOfImages;
  private BehanceSDKImageDimensions minImageDimensions;
  private long minImageSizeInBytes = -1L;
  private ArrayList<String> prohibitedFileExtensions;
  private boolean showImageSelectionSources = true;
  
  public BehanceSDKImageSelectorOptions() {}
  
  public static BehanceSDKImageSelectorOptions getSingleImageSelectionOptions()
  {
    return getSingleImageSelectionOptions(null, null);
  }
  
  public static BehanceSDKImageSelectorOptions getSingleImageSelectionOptions(BehanceSDKImageDimensions paramBehanceSDKImageDimensions1, BehanceSDKImageDimensions paramBehanceSDKImageDimensions2)
  {
    BehanceSDKImageSelectorOptions localBehanceSDKImageSelectorOptions = new BehanceSDKImageSelectorOptions();
    localBehanceSDKImageSelectorOptions.setMaxNumberOfImages(1);
    localBehanceSDKImageSelectorOptions.setMinImageDimensions(paramBehanceSDKImageDimensions1);
    localBehanceSDKImageSelectorOptions.setMaxImageDimensions(paramBehanceSDKImageDimensions2);
    return localBehanceSDKImageSelectorOptions;
  }
  
  public static BehanceSDKImageSelectorOptions getUnlimitedImageSelectionOptions()
  {
    return getUnlimitedImageSelectionOptions(null, null);
  }
  
  public static BehanceSDKImageSelectorOptions getUnlimitedImageSelectionOptions(BehanceSDKImageDimensions paramBehanceSDKImageDimensions1, BehanceSDKImageDimensions paramBehanceSDKImageDimensions2)
  {
    BehanceSDKImageSelectorOptions localBehanceSDKImageSelectorOptions = new BehanceSDKImageSelectorOptions();
    localBehanceSDKImageSelectorOptions.setMaxNumberOfImages(UNLIMITED_NUM_OF_IMAGES);
    localBehanceSDKImageSelectorOptions.setMinImageDimensions(paramBehanceSDKImageDimensions1);
    localBehanceSDKImageSelectorOptions.setMaxImageDimensions(paramBehanceSDKImageDimensions2);
    return localBehanceSDKImageSelectorOptions;
  }
  
  public ArrayList<String> getAllowedFileExtensions()
  {
    return allowedFileExtensions;
  }
  
  public String getImageValidatorType()
  {
    return imageValidatorType;
  }
  
  public BehanceSDKImageDimensions getMaxImageDimensions()
  {
    return maxImageDimensions;
  }
  
  public long getMaxImageSizeInBytes()
  {
    return maxImageSizeInBytes;
  }
  
  public int getMaxNumberOfImages()
  {
    return maxNumberOfImages;
  }
  
  public BehanceSDKImageDimensions getMinImageDimensions()
  {
    return minImageDimensions;
  }
  
  public long getMinImageSizeInBytes()
  {
    return minImageSizeInBytes;
  }
  
  public ArrayList<String> getProhibitedFileExtensions()
  {
    return prohibitedFileExtensions;
  }
  
  public void hideImageSelectionSources()
  {
    showImageSelectionSources = false;
  }
  
  public boolean isShowImageImageSelectionSources()
  {
    return showImageSelectionSources;
  }
  
  public void setAllowedFileExtensions(ArrayList<String> paramArrayList)
  {
    allowedFileExtensions = paramArrayList;
  }
  
  public void setImageValidatorType(String paramString)
  {
    imageValidatorType = paramString;
  }
  
  public void setMaxImageDimensions(BehanceSDKImageDimensions paramBehanceSDKImageDimensions)
  {
    maxImageDimensions = paramBehanceSDKImageDimensions;
  }
  
  public void setMaxImageSizeInBytes(long paramLong)
  {
    maxImageSizeInBytes = paramLong;
  }
  
  public void setMaxNumberOfImages(int paramInt)
  {
    int i = paramInt;
    if (paramInt == 0) {
      i = UNLIMITED_NUM_OF_IMAGES;
    }
    maxNumberOfImages = i;
  }
  
  public void setMinImageDimensions(BehanceSDKImageDimensions paramBehanceSDKImageDimensions)
  {
    minImageDimensions = paramBehanceSDKImageDimensions;
  }
}
