package android.support.v4.media;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public final class RatingCompat
  implements Parcelable
{
  public static final Parcelable.Creator<RatingCompat> CREATOR = new Parcelable.Creator()
  {
    public RatingCompat createFromParcel(Parcel paramAnonymousParcel)
    {
      return new RatingCompat(paramAnonymousParcel.readInt(), paramAnonymousParcel.readFloat(), null);
    }
    
    public RatingCompat[] newArray(int paramAnonymousInt)
    {
      return new RatingCompat[paramAnonymousInt];
    }
  };
  private final int mRatingStyle;
  private final float mRatingValue;
  
  private RatingCompat(int paramInt, float paramFloat)
  {
    mRatingStyle = paramInt;
    mRatingValue = paramFloat;
  }
  
  public int describeContents()
  {
    return mRatingStyle;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder().append("Rating:style=").append(mRatingStyle).append(" rating=");
    if (mRatingValue < 0.0F) {}
    for (String str = "unrated";; str = String.valueOf(mRatingValue)) {
      return str;
    }
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeInt(mRatingStyle);
    paramParcel.writeFloat(mRatingValue);
  }
}
