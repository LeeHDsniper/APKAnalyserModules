import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.tencent.mobileqq.activity.aio.photo.AIORichMediaData;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class lej
  implements Parcelable.Creator
{
  public lej()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public AIORichMediaData a(Parcel paramParcel)
  {
    Object localObject = paramParcel.readString();
    try
    {
      localObject = AIORichMediaData.a((String)localObject);
      ((AIORichMediaData)localObject).a(paramParcel);
      return localObject;
    }
    catch (ClassNotFoundException paramParcel)
    {
      throw new RuntimeException(paramParcel);
    }
  }
  
  public AIORichMediaData[] a(int paramInt)
  {
    return new AIORichMediaData[paramInt];
  }
}
