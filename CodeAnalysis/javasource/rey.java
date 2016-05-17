import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.UEC.UECItem;

public final class rey
  implements Parcelable.Creator
{
  public rey()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public UEC.UECItem a(Parcel paramParcel)
  {
    UEC.UECItem localUECItem = new UEC.UECItem();
    jdField_a_of_type_JavaLangString = paramParcel.readString();
    jdField_a_of_type_Int = paramParcel.readInt();
    jdField_a_of_type_Long = paramParcel.readLong();
    b = paramParcel.readInt();
    return localUECItem;
  }
  
  public UEC.UECItem[] a(int paramInt)
  {
    return new UEC.UECItem[paramInt];
  }
}
