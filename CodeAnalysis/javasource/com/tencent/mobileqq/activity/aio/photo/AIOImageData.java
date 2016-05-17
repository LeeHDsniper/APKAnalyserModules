package com.tencent.mobileqq.activity.aio.photo;

import android.os.Parcel;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.io.File;

public class AIOImageData
  extends AIORichMediaData
{
  public static final int a = 1;
  public static final int b = 2;
  public static final int c = 4;
  public static final int d = 8;
  public static final int e = 0;
  public static final int f = 1;
  public long a;
  public Object a;
  public String a;
  public boolean a;
  public long b;
  public String b;
  public boolean b;
  public long c;
  public String c;
  public boolean c;
  public long d;
  public String d;
  public boolean d;
  public String e;
  public boolean e;
  public boolean f;
  public int g;
  public int h;
  
  public AIOImageData()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangString = "I:N";
    jdField_b_of_type_JavaLangString = "I:N";
    jdField_c_of_type_JavaLangString = "I:N";
    jdField_d_of_type_JavaLangString = "I:N";
    jdField_a_of_type_Boolean = false;
    jdField_b_of_type_Boolean = false;
    jdField_c_of_type_Boolean = false;
    jdField_e_of_type_JavaLangString = "I:N";
    h = 0;
  }
  
  public int a(String paramString)
  {
    if (paramString == null) {}
    do
    {
      return 0;
      if (paramString.contains(jdField_a_of_type_JavaLangString)) {
        return 1;
      }
      if (paramString.contains(jdField_b_of_type_JavaLangString)) {
        return 2;
      }
    } while (!paramString.contains(jdField_c_of_type_JavaLangString));
    return 4;
  }
  
  public File a(int paramInt)
  {
    Object localObject;
    switch (paramInt)
    {
    case 3: 
    case 5: 
    case 6: 
    case 7: 
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
      localObject = jdField_a_of_type_JavaLangString;
      continue;
      localObject = jdField_b_of_type_JavaLangString;
      continue;
      localObject = jdField_c_of_type_JavaLangString;
      continue;
      localObject = jdField_d_of_type_JavaLangString;
    }
    return null;
  }
  
  public String a(int paramInt)
  {
    Object localObject2 = null;
    String str;
    switch (paramInt)
    {
    case 3: 
    case 5: 
    case 6: 
    case 7: 
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
      str = jdField_a_of_type_JavaLangString;
      continue;
      str = jdField_b_of_type_JavaLangString;
      continue;
      str = jdField_c_of_type_JavaLangString;
      continue;
      str = jdField_d_of_type_JavaLangString;
    }
    if (str.startsWith("//")) {
      return "file:" + str;
    }
    return "file:" + str;
  }
  
  public void a(Parcel paramParcel)
  {
    boolean bool2 = true;
    super.a(paramParcel);
    jdField_a_of_type_JavaLangString = paramParcel.readString();
    jdField_b_of_type_JavaLangString = paramParcel.readString();
    jdField_c_of_type_JavaLangString = paramParcel.readString();
    jdField_d_of_type_JavaLangString = paramParcel.readString();
    jdField_e_of_type_JavaLangString = paramParcel.readString();
    jdField_c_of_type_Long = paramParcel.readLong();
    jdField_d_of_type_Long = paramParcel.readLong();
    jdField_a_of_type_Long = paramParcel.readLong();
    jdField_b_of_type_Long = paramParcel.readLong();
    if (paramParcel.readByte() != 0)
    {
      bool1 = true;
      jdField_d_of_type_Boolean = bool1;
      if (paramParcel.readByte() == 0) {
        break label152;
      }
      bool1 = true;
      label102:
      jdField_e_of_type_Boolean = bool1;
      if (paramParcel.readByte() == 0) {
        break label157;
      }
    }
    label152:
    label157:
    for (boolean bool1 = bool2;; bool1 = false)
    {
      f = bool1;
      g = paramParcel.readInt();
      h = paramParcel.readInt();
      jdField_a_of_type_JavaLangObject = paramParcel.readValue(null);
      return;
      bool1 = false;
      break;
      bool1 = false;
      break label102;
    }
  }
  
  public boolean a(int paramInt)
  {
    boolean bool = true;
    switch (paramInt)
    {
    case 3: 
    default: 
      bool = false;
    }
    do
    {
      do
      {
        do
        {
          return bool;
        } while (!jdField_a_of_type_JavaLangString.equals("I:N"));
        return false;
      } while (!jdField_b_of_type_JavaLangString.equals("I:N"));
      return false;
    } while (!jdField_c_of_type_JavaLangString.equals("I:N"));
    return false;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    int i = 1;
    super.writeToParcel(paramParcel, paramInt);
    paramParcel.writeString(jdField_a_of_type_JavaLangString);
    paramParcel.writeString(jdField_b_of_type_JavaLangString);
    paramParcel.writeString(jdField_c_of_type_JavaLangString);
    paramParcel.writeString(jdField_d_of_type_JavaLangString);
    paramParcel.writeString(jdField_e_of_type_JavaLangString);
    paramParcel.writeLong(jdField_c_of_type_Long);
    paramParcel.writeLong(jdField_d_of_type_Long);
    paramParcel.writeLong(jdField_a_of_type_Long);
    paramParcel.writeLong(jdField_b_of_type_Long);
    if (jdField_d_of_type_Boolean)
    {
      paramInt = 1;
      paramParcel.writeByte((byte)paramInt);
      if (!jdField_e_of_type_Boolean) {
        break label155;
      }
      paramInt = 1;
      label104:
      paramParcel.writeByte((byte)paramInt);
      if (!f) {
        break label160;
      }
    }
    label155:
    label160:
    for (paramInt = i;; paramInt = 0)
    {
      paramParcel.writeByte((byte)paramInt);
      paramParcel.writeInt(g);
      paramParcel.writeInt(h);
      paramParcel.writeValue(jdField_a_of_type_JavaLangObject);
      return;
      paramInt = 0;
      break;
      paramInt = 0;
      break label104;
    }
  }
}
