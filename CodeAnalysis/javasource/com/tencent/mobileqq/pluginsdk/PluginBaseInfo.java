package com.tencent.mobileqq.pluginsdk;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class PluginBaseInfo
  implements Parcelable, Cloneable
{
  public static final Parcelable.Creator CREATOR = new b();
  public static final int INSTALL_TYPE_DEAMON = 0;
  public static final int INSTALL_TYPE_NOTICE = 1;
  public static final int STATE_CANCEL = -1;
  public static final int STATE_DOWNLOADED = 2;
  public static final int STATE_DOWNLOADING = 1;
  public static final int STATE_ERROR = -2;
  public static final int STATE_INSTALLED = 4;
  public static final int STATE_INSTALLING = 3;
  public static final int STATE_NODOWNLOAD = 0;
  public static final int TYPE_APP = 2;
  public static final int TYPE_COUNT = 3;
  public static final int TYPE_PART = 0;
  public static final int TYPE_PLUGIN = 1;
  public static final int UPDATE_TYPE_FORCE = 1;
  public static final int UPDATE_TYPE_OPTIONAL = 0;
  public long mCurVersion = 0L;
  public float mDownloadProgress;
  public int mForceUrl;
  public String mID = "";
  public int mInstallType = 0;
  public String mInstalledPath;
  public long mLength = 0L;
  public String mMD5 = "";
  public String mName = "";
  public String mPackageName = "";
  public String[] mProcesses = new String[0];
  public int mState;
  public int mType;
  public String mURL = "";
  public int mUpdateType = 1;
  public String mVersion = "";
  
  public PluginBaseInfo() {}
  
  public PluginBaseInfo(Parcel paramParcel)
  {
    mProcesses = paramParcel.createStringArray();
    mID = paramParcel.readString();
    mName = paramParcel.readString();
    mVersion = paramParcel.readString();
    mURL = paramParcel.readString();
    mMD5 = paramParcel.readString();
    mLength = paramParcel.readLong();
    mType = paramParcel.readInt();
    mCurVersion = paramParcel.readLong();
    mPackageName = paramParcel.readString();
    mState = paramParcel.readInt();
    mDownloadProgress = paramParcel.readFloat();
    mUpdateType = paramParcel.readInt();
    mInstallType = paramParcel.readInt();
    mInstalledPath = paramParcel.readString();
  }
  
  public PluginBaseInfo clone()
  {
    try
    {
      PluginBaseInfo localPluginBaseInfo = (PluginBaseInfo)super.clone();
      return localPluginBaseInfo;
    }
    catch (CloneNotSupportedException localCloneNotSupportedException) {}
    return null;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public String toString()
  {
    return "" + mID + ", " + mPackageName + ", " + super.hashCode();
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeStringArray(mProcesses);
    paramParcel.writeString(mID);
    paramParcel.writeString(mName);
    paramParcel.writeString(mVersion);
    paramParcel.writeString(mURL);
    paramParcel.writeString(mMD5);
    paramParcel.writeLong(mLength);
    paramParcel.writeInt(mType);
    paramParcel.writeLong(mCurVersion);
    paramParcel.writeString(mPackageName);
    paramParcel.writeInt(mState);
    paramParcel.writeFloat(mDownloadProgress);
    paramParcel.writeInt(mUpdateType);
    paramParcel.writeInt(mInstallType);
    paramParcel.writeString(mInstalledPath);
  }
}
