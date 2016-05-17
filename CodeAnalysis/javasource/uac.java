import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.AbsListView.SavedState;

public final class uac
  implements Parcelable.Creator
{
  public uac()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public AbsListView.SavedState a(Parcel paramParcel)
  {
    return new AbsListView.SavedState(paramParcel, null);
  }
  
  public AbsListView.SavedState[] a(int paramInt)
  {
    return new AbsListView.SavedState[paramInt];
  }
}
