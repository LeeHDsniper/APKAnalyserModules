package android.support.v4.media.session;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.text.TextUtils;
import java.util.List;

public final class PlaybackStateCompat
  implements Parcelable
{
  public static final Parcelable.Creator<PlaybackStateCompat> CREATOR = new Parcelable.Creator()
  {
    public PlaybackStateCompat createFromParcel(Parcel paramAnonymousParcel)
    {
      return new PlaybackStateCompat(paramAnonymousParcel, null);
    }
    
    public PlaybackStateCompat[] newArray(int paramAnonymousInt)
    {
      return new PlaybackStateCompat[paramAnonymousInt];
    }
  };
  private final long mActions;
  private final long mActiveItemId;
  private final long mBufferedPosition;
  private List<CustomAction> mCustomActions;
  private final CharSequence mErrorMessage;
  private final Bundle mExtras;
  private final long mPosition;
  private final float mSpeed;
  private final int mState;
  private final long mUpdateTime;
  
  private PlaybackStateCompat(Parcel paramParcel)
  {
    mState = paramParcel.readInt();
    mPosition = paramParcel.readLong();
    mSpeed = paramParcel.readFloat();
    mUpdateTime = paramParcel.readLong();
    mBufferedPosition = paramParcel.readLong();
    mActions = paramParcel.readLong();
    mErrorMessage = ((CharSequence)TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(paramParcel));
    mCustomActions = paramParcel.createTypedArrayList(CustomAction.CREATOR);
    mActiveItemId = paramParcel.readLong();
    mExtras = paramParcel.readBundle();
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder("PlaybackState {");
    localStringBuilder.append("state=").append(mState);
    localStringBuilder.append(", position=").append(mPosition);
    localStringBuilder.append(", buffered position=").append(mBufferedPosition);
    localStringBuilder.append(", speed=").append(mSpeed);
    localStringBuilder.append(", updated=").append(mUpdateTime);
    localStringBuilder.append(", actions=").append(mActions);
    localStringBuilder.append(", error=").append(mErrorMessage);
    localStringBuilder.append(", custom actions=").append(mCustomActions);
    localStringBuilder.append(", active item id=").append(mActiveItemId);
    localStringBuilder.append("}");
    return localStringBuilder.toString();
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeInt(mState);
    paramParcel.writeLong(mPosition);
    paramParcel.writeFloat(mSpeed);
    paramParcel.writeLong(mUpdateTime);
    paramParcel.writeLong(mBufferedPosition);
    paramParcel.writeLong(mActions);
    TextUtils.writeToParcel(mErrorMessage, paramParcel, paramInt);
    paramParcel.writeTypedList(mCustomActions);
    paramParcel.writeLong(mActiveItemId);
    paramParcel.writeBundle(mExtras);
  }
  
  public static final class CustomAction
    implements Parcelable
  {
    public static final Parcelable.Creator<CustomAction> CREATOR = new Parcelable.Creator()
    {
      public PlaybackStateCompat.CustomAction createFromParcel(Parcel paramAnonymousParcel)
      {
        return new PlaybackStateCompat.CustomAction(paramAnonymousParcel, null);
      }
      
      public PlaybackStateCompat.CustomAction[] newArray(int paramAnonymousInt)
      {
        return new PlaybackStateCompat.CustomAction[paramAnonymousInt];
      }
    };
    private final String mAction;
    private final Bundle mExtras;
    private final int mIcon;
    private final CharSequence mName;
    
    private CustomAction(Parcel paramParcel)
    {
      mAction = paramParcel.readString();
      mName = ((CharSequence)TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(paramParcel));
      mIcon = paramParcel.readInt();
      mExtras = paramParcel.readBundle();
    }
    
    public int describeContents()
    {
      return 0;
    }
    
    public String toString()
    {
      return "Action:mName='" + mName + ", mIcon=" + mIcon + ", mExtras=" + mExtras;
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      paramParcel.writeString(mAction);
      TextUtils.writeToParcel(mName, paramParcel, paramInt);
      paramParcel.writeInt(mIcon);
      paramParcel.writeBundle(mExtras);
    }
  }
}
