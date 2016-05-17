import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.tencent.mobileqq.activity.selectmember.ResultRecord;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class mmi
  implements Parcelable.Creator
{
  public mmi()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public ResultRecord a(Parcel paramParcel)
  {
    return new ResultRecord(paramParcel, null);
  }
  
  public ResultRecord[] a(int paramInt)
  {
    return new ResultRecord[paramInt];
  }
}
