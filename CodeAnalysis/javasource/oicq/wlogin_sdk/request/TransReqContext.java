package oicq.wlogin_sdk.request;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class TransReqContext
  implements Parcelable
{
  public static final Parcelable.Creator<TransReqContext> CREATOR = new TransReqContext.1();
  public byte[] _body;
  public int _subcmd = 0;
  public int _type = 0;
  public long _uin = 0L;
  
  public TransReqContext() {}
  
  private TransReqContext(Parcel paramParcel)
  {
    readFromParcel(paramParcel);
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public byte[] get_body()
  {
    return _body;
  }
  
  public int get_subcmd()
  {
    return _subcmd;
  }
  
  public long get_uin()
  {
    return _uin;
  }
  
  public boolean is_code2d_func_req()
  {
    return _type == 3;
  }
  
  public boolean is_devlock_req()
  {
    return _type == 5;
  }
  
  public boolean is_name_func_req()
  {
    return _type == 2;
  }
  
  public boolean is_oidb_func_req()
  {
    return _type == 4;
  }
  
  public boolean is_register_req()
  {
    return _type == 1;
  }
  
  public void readFromParcel(Parcel paramParcel)
  {
    _body = paramParcel.createByteArray();
    _type = paramParcel.readInt();
    _subcmd = paramParcel.readInt();
    _uin = paramParcel.readLong();
  }
  
  public void set_body(byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte == null)
    {
      _body = new byte[0];
      return;
    }
    _body = paramArrayOfByte;
  }
  
  public void set_code2d_func_req()
  {
    _type = 3;
  }
  
  public void set_devlock_req()
  {
    _type = 5;
  }
  
  public void set_name_func_req()
  {
    _type = 2;
  }
  
  public void set_oidb_func_req()
  {
    _type = 4;
  }
  
  public void set_register_req()
  {
    _type = 1;
  }
  
  public void set_subcmd(int paramInt)
  {
    _subcmd = paramInt;
  }
  
  public void set_uin(long paramLong)
  {
    _uin = paramLong;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeByteArray(_body);
    paramParcel.writeInt(_type);
    paramParcel.writeInt(_subcmd);
    paramParcel.writeLong(_uin);
  }
}
