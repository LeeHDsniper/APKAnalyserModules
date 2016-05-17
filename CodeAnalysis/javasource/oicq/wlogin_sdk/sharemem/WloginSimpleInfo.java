package oicq.wlogin_sdk.sharemem;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.io.Serializable;

public class WloginSimpleInfo
  implements Parcelable, Serializable
{
  public static final Parcelable.Creator<WloginSimpleInfo> CREATOR = new WloginSimpleInfo.1();
  private static final long serialVersionUID = 1L;
  public byte[] _age;
  public byte[] _face;
  public byte[] _gender;
  public byte[] _img_format;
  public byte[] _img_type;
  public byte[] _img_url;
  public byte[] _nick;
  public long _uin;
  
  public WloginSimpleInfo()
  {
    _uin = 0L;
    _face = new byte[0];
    _age = new byte[0];
    _gender = new byte[0];
    _nick = new byte[0];
    _img_type = new byte[0];
    _img_format = new byte[0];
    _img_url = new byte[0];
  }
  
  public WloginSimpleInfo(long paramLong, byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, byte[] paramArrayOfByte3, byte[] paramArrayOfByte4, byte[] paramArrayOfByte5, byte[] paramArrayOfByte6, byte[] paramArrayOfByte7)
  {
    _uin = paramLong;
    if (paramArrayOfByte1 != null)
    {
      _face = ((byte[])paramArrayOfByte1.clone());
      if (paramArrayOfByte2 == null) {
        break label137;
      }
      _age = ((byte[])paramArrayOfByte2.clone());
      label41:
      if (paramArrayOfByte3 == null) {
        break label147;
      }
      _gender = ((byte[])paramArrayOfByte3.clone());
      label58:
      if (paramArrayOfByte4 == null) {
        break label157;
      }
      _nick = ((byte[])paramArrayOfByte4.clone());
      label75:
      if (paramArrayOfByte5 == null) {
        break label167;
      }
      _img_type = ((byte[])paramArrayOfByte5.clone());
      label92:
      if (paramArrayOfByte6 == null) {
        break label177;
      }
    }
    label137:
    label147:
    label157:
    label167:
    label177:
    for (_img_format = ((byte[])paramArrayOfByte6.clone());; _img_format = new byte[0])
    {
      if (paramArrayOfByte7 == null) {
        break label187;
      }
      _img_url = ((byte[])paramArrayOfByte7.clone());
      return;
      _face = new byte[0];
      break;
      _age = new byte[0];
      break label41;
      _gender = new byte[0];
      break label58;
      _nick = new byte[0];
      break label75;
      _img_type = new byte[0];
      break label92;
    }
    label187:
    _img_url = new byte[0];
  }
  
  public WloginSimpleInfo(long paramLong, byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, byte[] paramArrayOfByte3, byte[] paramArrayOfByte4, byte[][] paramArrayOfByte)
  {
    _uin = paramLong;
    if (paramArrayOfByte1 != null)
    {
      _face = ((byte[])paramArrayOfByte1.clone());
      if (paramArrayOfByte2 == null) {
        break label140;
      }
      _age = ((byte[])paramArrayOfByte2.clone());
      label41:
      if (paramArrayOfByte3 == null) {
        break label150;
      }
      _gender = ((byte[])paramArrayOfByte3.clone());
      label58:
      if (paramArrayOfByte4 == null) {
        break label160;
      }
    }
    label140:
    label150:
    label160:
    for (_nick = ((byte[])paramArrayOfByte4.clone());; _nick = new byte[0])
    {
      if ((paramArrayOfByte == null) || (paramArrayOfByte.length != 3)) {
        break label170;
      }
      _img_type = ((byte[])paramArrayOfByte[0].clone());
      _img_format = ((byte[])paramArrayOfByte[1].clone());
      _img_url = ((byte[])paramArrayOfByte[2].clone());
      return;
      _face = new byte[0];
      break;
      _age = new byte[0];
      break label41;
      _gender = new byte[0];
      break label58;
    }
    label170:
    _img_type = new byte[0];
    _img_format = new byte[0];
    _img_url = new byte[0];
  }
  
  private WloginSimpleInfo(Parcel paramParcel)
  {
    readFromParcel(paramParcel);
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public WloginSimpleInfo get_clone()
  {
    WloginSimpleInfo localWloginSimpleInfo = new WloginSimpleInfo();
    _uin = _uin;
    if (_face != null) {
      _face = ((byte[])_face.clone());
    }
    if (_age != null) {
      _age = ((byte[])_age.clone());
    }
    if (_gender != null) {
      _gender = ((byte[])_gender.clone());
    }
    if (_nick != null) {
      _nick = ((byte[])_nick.clone());
    }
    if (_img_type != null) {
      _img_type = ((byte[])_img_type.clone());
    }
    if (_img_format != null) {
      _img_format = ((byte[])_img_format.clone());
    }
    if (_img_url != null) {
      _img_url = ((byte[])_img_url.clone());
    }
    return localWloginSimpleInfo;
  }
  
  public void get_clone(WloginSimpleInfo paramWloginSimpleInfo)
  {
    _uin = _uin;
    if (_face != null)
    {
      _face = ((byte[])_face.clone());
      if (_age == null) {
        break label166;
      }
      _age = ((byte[])_age.clone());
      label50:
      if (_gender == null) {
        break label176;
      }
      _gender = ((byte[])_gender.clone());
      label71:
      if (_nick == null) {
        break label186;
      }
      _nick = ((byte[])_nick.clone());
      label92:
      if (_img_type == null) {
        break label196;
      }
      _img_type = ((byte[])_img_type.clone());
      label113:
      if (_img_format == null) {
        break label206;
      }
    }
    label166:
    label176:
    label186:
    label196:
    label206:
    for (_img_format = ((byte[])_img_format.clone());; _img_format = new byte[0])
    {
      if (_img_url == null) {
        break label216;
      }
      _img_url = ((byte[])_img_url.clone());
      return;
      _face = new byte[0];
      break;
      _age = new byte[0];
      break label50;
      _gender = new byte[0];
      break label71;
      _nick = new byte[0];
      break label92;
      _img_type = new byte[0];
      break label113;
    }
    label216:
    _img_url = new byte[0];
  }
  
  public void readFromParcel(Parcel paramParcel)
  {
    _uin = paramParcel.readLong();
    _face = paramParcel.createByteArray();
    _age = paramParcel.createByteArray();
    _gender = paramParcel.createByteArray();
    _nick = paramParcel.createByteArray();
    _img_type = paramParcel.createByteArray();
    _img_format = paramParcel.createByteArray();
    _img_url = paramParcel.createByteArray();
  }
  
  public void set_info(long paramLong, byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, byte[] paramArrayOfByte3, byte[] paramArrayOfByte4, byte[][] paramArrayOfByte)
  {
    _uin = paramLong;
    if (paramArrayOfByte1 != null)
    {
      _face = ((byte[])paramArrayOfByte1.clone());
      if (paramArrayOfByte2 == null) {
        break label160;
      }
      _age = ((byte[])paramArrayOfByte2.clone());
      label37:
      if (paramArrayOfByte3 == null) {
        break label170;
      }
      _gender = ((byte[])paramArrayOfByte3.clone());
      label54:
      if (paramArrayOfByte4 == null) {
        break label180;
      }
    }
    label160:
    label170:
    label180:
    for (_nick = ((byte[])paramArrayOfByte4.clone());; _nick = new byte[0])
    {
      if ((paramArrayOfByte != null) && (paramArrayOfByte.length == 3) && (paramArrayOfByte[0].length > 0) && (paramArrayOfByte[1].length > 0) && (paramArrayOfByte[2].length > 0))
      {
        _img_type = ((byte[])paramArrayOfByte[0].clone());
        _img_format = ((byte[])paramArrayOfByte[1].clone());
        _img_url = ((byte[])paramArrayOfByte[2].clone());
      }
      return;
      _face = new byte[0];
      break;
      _age = new byte[0];
      break label37;
      _gender = new byte[0];
      break label54;
    }
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeLong(_uin);
    paramParcel.writeByteArray(_face);
    paramParcel.writeByteArray(_age);
    paramParcel.writeByteArray(_gender);
    paramParcel.writeByteArray(_nick);
    paramParcel.writeByteArray(_img_type);
    paramParcel.writeByteArray(_img_format);
    paramParcel.writeByteArray(_img_url);
  }
}
