package com.tencent.mobileqq.activity.aio.photo;

import android.os.Parcel;
import android.os.Parcelable;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.io.File;

public class AIOShortVideoData
  extends AIORichMediaData
  implements Parcelable
{
  public static final int a = 0;
  public static final int b = 1;
  public String a;
  public boolean a;
  public String b;
  public boolean b;
  
  public AIOShortVideoData()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = "I:N";
    b = "I:N";
  }
  
  public int a(String paramString)
  {
    if (paramString == null) {}
    while ((paramString.equals(a)) || (!paramString.equals(b))) {
      return 0;
    }
    return 1;
  }
  
  public File a(int paramInt)
  {
    Object localObject;
    switch (paramInt)
    {
    default: 
      localObject = null;
    }
    while ((localObject != null) && (!((String)localObject).equals("I:N")))
    {
      localObject = new File((String)localObject);
      if (!((File)localObject).exists()) {
        break;
      }
      return localObject;
      localObject = a;
      continue;
      localObject = b;
    }
    return null;
  }
  
  public String a(int paramInt)
  {
    Object localObject2 = null;
    String str;
    switch (paramInt)
    {
    default: 
      str = null;
    }
    for (;;)
    {
      Object localObject1 = localObject2;
      if (str != null)
      {
        localObject1 = localObject2;
        if (!str.equals("I:N"))
        {
          if (str.startsWith("/")) {
            break;
          }
          localObject1 = "file:/" + str;
        }
      }
      return localObject1;
      str = a;
      continue;
      str = b;
    }
    if (str.startsWith("//")) {
      return "file:" + str;
    }
    return "file:" + str;
  }
  
  public void a(Parcel paramParcel)
  {
    super.a(paramParcel);
    a = paramParcel.readString();
    b = paramParcel.readString();
  }
  
  public boolean a(int paramInt)
  {
    boolean bool = true;
    switch (paramInt)
    {
    default: 
      bool = false;
    }
    do
    {
      do
      {
        return bool;
      } while (!a.equals("I:N"));
      return false;
    } while (!b.equals("I:N"));
    return false;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    super.writeToParcel(paramParcel, paramInt);
    paramParcel.writeString(a);
    paramParcel.writeString(b);
  }
}
