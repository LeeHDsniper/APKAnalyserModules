package com.adobe.creativesdk.aviary.internal.cds;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class Operations
  implements Parcelable
{
  public static final Parcelable.Creator<Operations> CREATOR = new Parcelable.Creator()
  {
    public Operations createFromParcel(Parcel paramAnonymousParcel)
    {
      return new Operations(paramAnonymousParcel);
    }
    
    public Operations[] newArray(int paramAnonymousInt)
    {
      return new Operations[paramAnonymousInt];
    }
  };
  private int addedCount;
  private int deletedCount;
  private int hiddenCount;
  private int updatedCount;
  
  public Operations()
  {
    addedCount = 0;
    deletedCount = 0;
    hiddenCount = 0;
    updatedCount = 0;
  }
  
  protected Operations(Parcel paramParcel)
  {
    addedCount = paramParcel.readInt();
    deletedCount = paramParcel.readInt();
    hiddenCount = paramParcel.readInt();
    updatedCount = paramParcel.readInt();
  }
  
  public void add()
  {
    addedCount += 1;
  }
  
  public void delete()
  {
    deletedCount += 1;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void hide()
  {
    hiddenCount += 1;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder("Operations{");
    localStringBuilder.append("added:" + addedCount + ", ");
    localStringBuilder.append("deleted:" + deletedCount + ", ");
    localStringBuilder.append("hidden:" + hiddenCount + ", ");
    localStringBuilder.append("updated:" + updatedCount + "}");
    return localStringBuilder.toString();
  }
  
  public int totalCount()
  {
    return addedCount + deletedCount + hiddenCount + updatedCount;
  }
  
  public void update()
  {
    updatedCount += 1;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeInt(addedCount);
    paramParcel.writeInt(deletedCount);
    paramParcel.writeInt(hiddenCount);
    paramParcel.writeInt(updatedCount);
  }
}
