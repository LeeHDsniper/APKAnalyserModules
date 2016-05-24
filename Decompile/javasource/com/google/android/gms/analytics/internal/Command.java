package com.google.android.gms.analytics.internal;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class Command
  implements Parcelable
{
  @Deprecated
  public static final Parcelable.Creator<Command> CREATOR = new Parcelable.Creator()
  {
    @Deprecated
    public Command[] zzab(int paramAnonymousInt)
    {
      return new Command[paramAnonymousInt];
    }
    
    @Deprecated
    public Command zzr(Parcel paramAnonymousParcel)
    {
      return new Command(paramAnonymousParcel);
    }
  };
  private String mValue;
  private String zzMI;
  private String zzwj;
  
  @Deprecated
  public Command() {}
  
  @Deprecated
  Command(Parcel paramParcel)
  {
    readFromParcel(paramParcel);
  }
  
  @Deprecated
  private void readFromParcel(Parcel paramParcel)
  {
    zzwj = paramParcel.readString();
    zzMI = paramParcel.readString();
    mValue = paramParcel.readString();
  }
  
  @Deprecated
  public int describeContents()
  {
    return 0;
  }
  
  public String getId()
  {
    return zzwj;
  }
  
  public String getValue()
  {
    return mValue;
  }
  
  @Deprecated
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(zzwj);
    paramParcel.writeString(zzMI);
    paramParcel.writeString(mValue);
  }
}
