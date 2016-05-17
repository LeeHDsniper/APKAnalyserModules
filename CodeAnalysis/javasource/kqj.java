import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.tencent.mobileqq.activity.aio.ForwardUtils.Section_Text;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class kqj
  implements Parcelable.Creator
{
  public kqj()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public ForwardUtils.Section_Text a(Parcel paramParcel)
  {
    return new ForwardUtils.Section_Text(paramParcel);
  }
  
  public ForwardUtils.Section_Text[] a(int paramInt)
  {
    return new ForwardUtils.Section_Text[paramInt];
  }
}
