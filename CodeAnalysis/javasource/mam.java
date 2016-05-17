import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.tencent.mobileqq.activity.photo.ImageInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public final class mam
  implements Parcelable.Creator
{
  public mam()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public ImageInfo a(Parcel paramParcel)
  {
    boolean bool2 = true;
    ImageInfo localImageInfo = new ImageInfo();
    if (paramParcel.readInt() == 0)
    {
      bool1 = false;
      jdField_a_of_type_Boolean = bool1;
      if (paramParcel.readInt() != 0) {
        break label412;
      }
      bool1 = false;
      label35:
      jdField_b_of_type_Boolean = bool1;
      jdField_a_of_type_JavaLangString = paramParcel.readString();
      if (paramParcel.readInt() != 0) {
        break label417;
      }
      bool1 = false;
      label59:
      jdField_c_of_type_Boolean = bool1;
      if (paramParcel.readInt() != 0) {
        break label422;
      }
      bool1 = false;
      label74:
      jdField_d_of_type_Boolean = bool1;
      jdField_b_of_type_JavaLangString = paramParcel.readString();
      jdField_c_of_type_JavaLangString = paramParcel.readString();
      jdField_a_of_type_Int = paramParcel.readInt();
      if (paramParcel.readInt() != 0) {
        break label427;
      }
      bool1 = false;
      label116:
      jdField_e_of_type_Boolean = bool1;
      jdField_d_of_type_JavaLangString = paramParcel.readString();
      jdField_c_of_type_Int = paramParcel.readInt();
      jdField_e_of_type_JavaLangString = paramParcel.readString();
      jdField_d_of_type_Int = paramParcel.readInt();
      jdField_e_of_type_Int = paramParcel.readInt();
      if (paramParcel.readInt() != 0) {
        break label432;
      }
      bool1 = false;
      label176:
      jdField_f_of_type_Boolean = bool1;
      jdField_a_of_type_Long = paramParcel.readLong();
      if (paramParcel.readInt() != 0) {
        break label437;
      }
      bool1 = false;
      label200:
      jdField_h_of_type_Boolean = bool1;
      if (paramParcel.readInt() != 0) {
        break label442;
      }
      bool1 = false;
      label215:
      i = bool1;
      jdField_f_of_type_JavaLangString = paramParcel.readString();
      jdField_b_of_type_Long = paramParcel.readLong();
      g = paramParcel.readString();
      jdField_c_of_type_Long = paramParcel.readLong();
      jdField_h_of_type_JavaLangString = paramParcel.readString();
      jdField_h_of_type_Int = paramParcel.readInt();
      jdField_h_of_type_Int = paramParcel.readInt();
      jdField_j_of_type_Int = paramParcel.readInt();
      jdField_j_of_type_JavaLangString = paramParcel.readString();
      jdField_m_of_type_Int = paramParcel.readInt();
      if (paramParcel.readInt() != 1) {
        break label447;
      }
      bool1 = true;
      label321:
      jdField_o_of_type_Boolean = bool1;
      if (paramParcel.readInt() != 1) {
        break label452;
      }
      bool1 = true;
      label337:
      n = bool1;
      if (paramParcel.readInt() != 1) {
        break label457;
      }
    }
    label412:
    label417:
    label422:
    label427:
    label432:
    label437:
    label442:
    label447:
    label452:
    label457:
    for (boolean bool1 = bool2;; bool1 = false)
    {
      q = bool1;
      jdField_e_of_type_Long = paramParcel.readLong();
      k = paramParcel.readString();
      l = paramParcel.readString();
      jdField_m_of_type_JavaLangString = paramParcel.readString();
      jdField_o_of_type_Int = paramParcel.readInt();
      return localImageInfo;
      bool1 = true;
      break;
      bool1 = true;
      break label35;
      bool1 = true;
      break label59;
      bool1 = true;
      break label74;
      bool1 = true;
      break label116;
      bool1 = true;
      break label176;
      bool1 = true;
      break label200;
      bool1 = true;
      break label215;
      bool1 = false;
      break label321;
      bool1 = false;
      break label337;
    }
  }
  
  public ImageInfo[] a(int paramInt)
  {
    return new ImageInfo[paramInt];
  }
}
