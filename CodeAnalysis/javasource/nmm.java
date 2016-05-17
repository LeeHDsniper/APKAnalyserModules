import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.tencent.mobileqq.app.utils.DingdongPluginBizObserver.TempLiteMailIndexInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class nmm
  implements Parcelable.Creator
{
  public nmm()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public DingdongPluginBizObserver.TempLiteMailIndexInfo a(Parcel paramParcel)
  {
    DingdongPluginBizObserver.TempLiteMailIndexInfo localTempLiteMailIndexInfo = new DingdongPluginBizObserver.TempLiteMailIndexInfo();
    jdField_a_of_type_JavaLangString = paramParcel.readString();
    jdField_a_of_type_Int = paramParcel.readInt();
    jdField_a_of_type_Long = paramParcel.readLong();
    return localTempLiteMailIndexInfo;
  }
  
  public DingdongPluginBizObserver.TempLiteMailIndexInfo[] a(int paramInt)
  {
    return new DingdongPluginBizObserver.TempLiteMailIndexInfo[paramInt];
  }
}
