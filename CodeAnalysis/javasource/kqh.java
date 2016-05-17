import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.tencent.mobileqq.activity.aio.ForwardUtils.SectionBase;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class kqh
  implements Parcelable.Creator
{
  public kqh()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public ForwardUtils.SectionBase a(Parcel paramParcel)
  {
    return new ForwardUtils.SectionBase(paramParcel);
  }
  
  public ForwardUtils.SectionBase[] a(int paramInt)
  {
    return new ForwardUtils.SectionBase[paramInt];
  }
}
