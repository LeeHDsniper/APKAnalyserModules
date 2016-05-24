package android.support.v4.media.session;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class ParcelableVolumeInfo
  implements Parcelable
{
  public static final Parcelable.Creator<ParcelableVolumeInfo> CREATOR = new Parcelable.Creator()
  {
    public ParcelableVolumeInfo createFromParcel(Parcel paramAnonymousParcel)
    {
      return new ParcelableVolumeInfo(paramAnonymousParcel);
    }
    
    public ParcelableVolumeInfo[] newArray(int paramAnonymousInt)
    {
      return new ParcelableVolumeInfo[paramAnonymousInt];
    }
  };
  public int audioStream;
  public int controlType;
  public int currentVolume;
  public int maxVolume;
  public int volumeType;
  
  public ParcelableVolumeInfo(Parcel paramParcel)
  {
    volumeType = paramParcel.readInt();
    controlType = paramParcel.readInt();
    maxVolume = paramParcel.readInt();
    currentVolume = paramParcel.readInt();
    audioStream = paramParcel.readInt();
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeInt(volumeType);
    paramParcel.writeInt(controlType);
    paramParcel.writeInt(maxVolume);
    paramParcel.writeInt(currentVolume);
    paramParcel.writeInt(audioStream);
  }
}
