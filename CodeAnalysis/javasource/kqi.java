import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.tencent.mobileqq.activity.aio.ForwardUtils.Section_Pic;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class kqi
  implements Parcelable.Creator
{
  public kqi()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public ForwardUtils.Section_Pic a(Parcel paramParcel)
  {
    return new ForwardUtils.Section_Pic(paramParcel);
  }
  
  public ForwardUtils.Section_Pic[] a(int paramInt)
  {
    return new ForwardUtils.Section_Pic[paramInt];
  }
}
