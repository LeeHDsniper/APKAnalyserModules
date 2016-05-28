package com.adobe.creativesdk.aviary.internal.utils;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.v7.graphics.Palette;
import it.sephiroth.android.library.exif2.ExifTag;
import java.util.List;
import java.util.Locale;

public class ImageInfo
  implements Parcelable
{
  static final Parcelable.Creator<ImageInfo> CREATOR = new Parcelable.Creator()
  {
    public ImageInfo createFromParcel(Parcel paramAnonymousParcel)
    {
      return new ImageInfo(paramAnonymousParcel);
    }
    
    public ImageInfo[] newArray(int paramAnonymousInt)
    {
      return new ImageInfo[paramAnonymousInt];
    }
  };
  final int[] decodedSize = { -1, -1 };
  List<ExifTag> exifTagList;
  int orientation;
  final int[] originalSize = { -1, -1 };
  Palette palette;
  Uri uri;
  
  public ImageInfo() {}
  
  public ImageInfo(Parcel paramParcel)
  {
    uri = ((Uri)paramParcel.readParcelable(Uri.class.getClassLoader()));
    paramParcel.readIntArray(originalSize);
    paramParcel.readIntArray(decodedSize);
    orientation = paramParcel.readInt();
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public List<ExifTag> getExifTagList()
  {
    return exifTagList;
  }
  
  public int getOrientation()
  {
    return orientation;
  }
  
  public int[] getOriginalSize()
  {
    return originalSize;
  }
  
  public Palette getPalette()
  {
    return palette;
  }
  
  public Uri getUri()
  {
    return uri;
  }
  
  public void setDecodedSize(int paramInt1, int paramInt2)
  {
    decodedSize[0] = paramInt1;
    decodedSize[1] = paramInt2;
  }
  
  public void setExifTagList(List<ExifTag> paramList)
  {
    exifTagList = paramList;
  }
  
  public void setOrientation(int paramInt)
  {
    orientation = paramInt;
  }
  
  public void setOriginalSize(int paramInt1, int paramInt2)
  {
    originalSize[0] = paramInt1;
    originalSize[1] = paramInt2;
  }
  
  public void setPalette(Palette paramPalette)
  {
    palette = paramPalette;
  }
  
  public void setUri(Uri paramUri)
  {
    uri = paramUri;
  }
  
  public String toString()
  {
    int i = 0;
    Locale localLocale = Locale.US;
    Uri localUri = uri;
    int j = orientation;
    int k = originalSize[0];
    int m = originalSize[1];
    int n = decodedSize[0];
    int i1 = decodedSize[1];
    if (exifTagList != null) {
      i = exifTagList.size();
    }
    return String.format(localLocale, "ImageInfo{uri:%s, orientation:%d, originalSize:%dx%d, decodedSize:%dx%d, tags:%d}", new Object[] { localUri, Integer.valueOf(j), Integer.valueOf(k), Integer.valueOf(m), Integer.valueOf(n), Integer.valueOf(i1), Integer.valueOf(i) });
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeParcelable(uri, paramInt);
    paramParcel.writeIntArray(originalSize);
    paramParcel.writeIntArray(decodedSize);
    paramParcel.writeInt(orientation);
  }
}
