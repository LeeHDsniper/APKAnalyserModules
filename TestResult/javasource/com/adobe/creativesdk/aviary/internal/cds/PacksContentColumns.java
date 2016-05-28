package com.adobe.creativesdk.aviary.internal.cds;

import android.database.Cursor;

public final class PacksContentColumns
{
  public static final class ContentCursorWrapper
    extends VersionColumns.BaseCursorWrapper
  {
    String author;
    String authorHyperLink;
    int contentDownloadStarted;
    String contentPath;
    String contentURL;
    String contentVersion;
    String detailImageLocalPath;
    String detailImageURL;
    String detailImageVersion;
    String displayDescription;
    String displayName;
    int downloadRequestStatus;
    String featureImageLocalPath;
    String featureImageURL;
    String featureImageVersion;
    int free;
    int iconNeedDownload;
    String iconPath;
    String iconURL;
    String iconVersion;
    int isFreeWithLogin;
    int numItems;
    final long packId;
    String previewPath;
    String previewURL;
    String previewVersion;
    int purchased;
    String shopBackgroundColor;
    String socialMediaString;
    
    ContentCursorWrapper(long paramLong1, long paramLong2)
    {
      super();
      packId = paramLong2;
    }
    
    public static ContentCursorWrapper create(Cursor paramCursor)
    {
      if (VersionColumns.CursorWrapper.isValid(paramCursor))
      {
        ContentCursorWrapper localContentCursorWrapper = new ContentCursorWrapper(paramCursor.getLong(paramCursor.getColumnIndex("content_id")), paramCursor.getLong(paramCursor.getColumnIndex("content_packId")));
        int i = paramCursor.getColumnIndex("content_previewURL");
        if (i > -1) {
          previewURL = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("content_contentURL");
        if (i > -1) {
          contentURL = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("content_iconUrl");
        if (i > -1) {
          iconURL = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("content_displayName");
        if (i > -1) {
          displayName = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("content_displayDescription");
        if (i > -1) {
          displayDescription = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("content_iconPath");
        if (i > -1) {
          iconPath = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("content_previewPath");
        if (i > -1) {
          previewPath = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("content_contentPath");
        if (i > -1) {
          contentPath = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("content_contentVersion");
        if (i > -1) {
          contentVersion = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("content_previewVersion");
        if (i > -1) {
          previewVersion = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("content_iconVersion");
        if (i > -1) {
          iconVersion = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("content_isFree");
        if (i > -1) {
          free = paramCursor.getInt(i);
        }
        i = paramCursor.getColumnIndex("content_isFreeWithLogin");
        if (i > -1) {
          isFreeWithLogin = paramCursor.getInt(i);
        }
        i = paramCursor.getColumnIndex("content_purchased");
        if (i > -1) {
          purchased = paramCursor.getInt(i);
        }
        i = paramCursor.getColumnIndex("content_iconNeedDownload");
        if (i > -1) {
          iconNeedDownload = paramCursor.getInt(i);
        }
        i = paramCursor.getColumnIndex("content_downloadRequested");
        if (i > -1) {
          downloadRequestStatus = paramCursor.getInt(i);
        }
        i = paramCursor.getColumnIndex("content_numItems");
        if (i > -1) {
          numItems = paramCursor.getInt(i);
        }
        i = paramCursor.getColumnIndex("content_author");
        if (i > -1) {
          author = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("content_authorHyperlink");
        if (i > -1) {
          authorHyperLink = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("content_socialMediaString");
        if (i > -1) {
          socialMediaString = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("content_featureImageURL");
        if (i > -1) {
          featureImageURL = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("content_featureImageVersion");
        if (i > -1) {
          featureImageVersion = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("content_detailImageURL");
        if (i > -1) {
          detailImageURL = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("content_detailImageVersion");
        if (i > -1) {
          detailImageVersion = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("content_shopBackgroundColor");
        if (i > -1) {
          shopBackgroundColor = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("content_detailImageLocalPath");
        if (i > -1) {
          detailImageLocalPath = paramCursor.getString(i);
        }
        i = paramCursor.getColumnIndex("content_featureImageLocalPath");
        if (i > -1) {
          featureImageLocalPath = paramCursor.getString(i);
        }
        return localContentCursorWrapper;
      }
      return null;
    }
    
    public Object clone()
    {
      ContentCursorWrapper localContentCursorWrapper = new ContentCursorWrapper(id, packId);
      iconURL = iconURL;
      previewURL = previewURL;
      contentURL = contentURL;
      displayName = displayName;
      displayDescription = displayDescription;
      previewPath = previewPath;
      contentPath = contentPath;
      iconPath = iconPath;
      contentVersion = contentVersion;
      previewVersion = previewVersion;
      iconVersion = iconVersion;
      iconNeedDownload = iconNeedDownload;
      contentDownloadStarted = contentDownloadStarted;
      downloadRequestStatus = downloadRequestStatus;
      free = free;
      purchased = purchased;
      numItems = numItems;
      author = author;
      authorHyperLink = authorHyperLink;
      socialMediaString = socialMediaString;
      featureImageURL = featureImageURL;
      featureImageVersion = featureImageVersion;
      detailImageURL = detailImageURL;
      detailImageVersion = detailImageVersion;
      detailImageLocalPath = detailImageLocalPath;
      featureImageLocalPath = featureImageLocalPath;
      shopBackgroundColor = shopBackgroundColor;
      isFreeWithLogin = isFreeWithLogin;
      return localContentCursorWrapper;
    }
    
    public boolean equals(Object paramObject)
    {
      if (paramObject == null) {}
      do
      {
        do
        {
          return false;
        } while (!(paramObject instanceof ContentCursorWrapper));
        paramObject = (ContentCursorWrapper)paramObject;
      } while ((id != id) || (packId != packId));
      return true;
    }
    
    public String getAuthor()
    {
      return author;
    }
    
    public String getAuthorHyperLink()
    {
      return authorHyperLink;
    }
    
    public String getContentURL()
    {
      return contentURL;
    }
    
    public String getDetailImageLocalPath()
    {
      return detailImageLocalPath;
    }
    
    public String getDetailImageURL()
    {
      return detailImageURL;
    }
    
    public String getDisplayDescription()
    {
      return displayDescription;
    }
    
    public String getDisplayName()
    {
      return displayName;
    }
    
    public String getFeatureImageLocalPath()
    {
      return featureImageLocalPath;
    }
    
    public String getFeatureImageURL()
    {
      return featureImageURL;
    }
    
    public int getIconNeedDownload()
    {
      return iconNeedDownload;
    }
    
    public String getIconPath()
    {
      return iconPath;
    }
    
    public String getIconURL()
    {
      return iconURL;
    }
    
    public long getPackId()
    {
      return packId;
    }
    
    public String getPreviewPath()
    {
      return previewPath;
    }
    
    public String getPreviewURL()
    {
      return previewURL;
    }
    
    public String getShopBackgroundColor()
    {
      return shopBackgroundColor;
    }
    
    public int hashCode()
    {
      return Long.valueOf(id + 99999L + packId).hashCode();
    }
    
    public String toString()
    {
      return "ContentColumns.Content{id: " + id + ", packId: " + packId + ", displayName: " + displayName + ", purchased: " + purchased + ", contentPath: " + contentPath + "}";
    }
  }
}
