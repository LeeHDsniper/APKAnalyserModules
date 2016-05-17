import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class krh
  implements Parcelable.Creator
{
  public krh()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public SessionInfo a(Parcel paramParcel)
  {
    return new SessionInfo(paramParcel);
  }
  
  public SessionInfo[] a(int paramInt)
  {
    return new SessionInfo[paramInt];
  }
}
