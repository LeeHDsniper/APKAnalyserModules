package com.tencent.mobileqq.activity.aio.photo;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.tencent.device.msg.activities.AIODevLittleVideoData;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.io.File;
import lej;

public abstract class AIORichMediaData
  implements Parcelable
{
  public static final Parcelable.Creator CREATOR = new lej();
  public static final String f = "I:N";
  public static final String g = "I:E";
  public long e;
  public String h;
  public int i = 0;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public AIORichMediaData() {}
  
  public static AIORichMediaData a(String paramString)
  {
    if (AIOImageData.class.getSimpleName().equals(paramString)) {
      return new AIOImageData();
    }
    if (AIOShortVideoData.class.getSimpleName().equals(paramString)) {
      return new AIOShortVideoData();
    }
    if (AIODevLittleVideoData.class.getSimpleName().equals(paramString)) {
      return new AIODevLittleVideoData();
    }
    throw new ClassNotFoundException();
  }
  
  public abstract int a(String paramString);
  
  public abstract File a(int paramInt);
  
  public abstract String a(int paramInt);
  
  public void a(Parcel paramParcel)
  {
    e = paramParcel.readLong();
    i = paramParcel.readInt();
  }
  
  public abstract boolean a(int paramInt);
  
  public int describeContents()
  {
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(getClass().getSimpleName());
    paramParcel.writeLong(e);
    paramParcel.writeInt(i);
  }
}
