package oicq.wlogin_sdk.sharemem;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.io.Serializable;
import java.util.List;
import java.util.Locale;
import oicq.wlogin_sdk.request.Ticket;
import oicq.wlogin_sdk.tools.util;

public class WloginSigInfo
  implements Parcelable, Serializable
{
  public static final Parcelable.Creator<WloginSigInfo> CREATOR = new WloginSigInfo.1();
  public static final int SIG_RESERVE_LENGTH = 13;
  public static final int SIG_RESERVE_VALID_LENGTH = 7;
  public static byte[] _LHSig = new byte[0];
  public static byte[] _QRPUSHSig = new byte[0];
  private static final long serialVersionUID = 1L;
  public long _A2_create_time = 0L;
  public long _A2_expire_time = 0L;
  public byte[] _D2 = new byte[0];
  public byte[] _D2Key = new byte[0];
  public long _D2_create_time = 0L;
  public long _D2_expire_time = 0L;
  public byte[] _DA2 = new byte[0];
  public byte[] _G = new byte[0];
  public byte[] _TGT = new byte[0];
  public byte[] _TGTKey = new byte[0];
  public byte[] _access_token = new byte[0];
  public long _access_token_create_time = 0L;
  public long _app_pri = 0L;
  public byte[] _aqSig = new byte[0];
  public long _aqSig_create_time = 0L;
  public long _create_time = 0L;
  public byte[] _dpwd = new byte[0];
  public byte[] _en_A1 = new byte[0];
  public int _login_bitmap = 0;
  public byte[] _lsKey = new byte[0];
  public long _lsKey_create_time = 0L;
  public long _lsKey_expire_time = 0L;
  public byte[] _noPicSig = new byte[0];
  public byte[] _openid = new byte[0];
  public byte[] _openkey = new byte[0];
  public long _openkey_create_time = 0L;
  public byte[] _pay_token = new byte[0];
  public byte[] _pf = new byte[0];
  public byte[] _pfKey = new byte[0];
  public byte[] _psKey = new byte[0];
  public long _psKey_create_time = 0L;
  public byte[] _pt4Token = new byte[0];
  public byte[] _randseed = new byte[0];
  public byte[] _sKey = new byte[0];
  public long _sKey_create_time = 0L;
  public long _sKey_expire_time = 0L;
  public byte[] _sid = new byte[0];
  public long _sid_create_time = 0L;
  public long _sid_expire_time = 0L;
  public byte[] _superKey = new byte[0];
  public byte[] _userA5 = new byte[0];
  public long _userA5_create_time = 0L;
  public byte[] _userA8 = new byte[0];
  public long _userA8_create_time = 0L;
  public long _userA8_expire_time = 0L;
  public byte[] _userSig64 = new byte[0];
  public long _userSig64_create_time = 0L;
  public byte[] _userStSig = new byte[0];
  public long _userStSig_create_time = 0L;
  public byte[] _userStWebSig = new byte[0];
  public long _userStWebSig_create_time = 0L;
  public long _userStWebSig_expire_time = 0L;
  public byte[] _userSt_Key = new byte[0];
  public long _vKey_expire_time = 0L;
  public byte[] _vkey = new byte[0];
  public long _vkey_create_time = 0L;
  public transient List<Ticket> cacheTickets = null;
  
  public WloginSigInfo(long paramLong1, long paramLong2, long paramLong3, long paramLong4, byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, byte[] paramArrayOfByte3, byte[] paramArrayOfByte4, byte[] paramArrayOfByte5, byte[] paramArrayOfByte6, byte[] paramArrayOfByte7, byte[] paramArrayOfByte8, byte[] paramArrayOfByte9, byte[] paramArrayOfByte10, byte[] paramArrayOfByte11, byte[] paramArrayOfByte12, byte[][] paramArrayOfByte, long[] paramArrayOfLong, int paramInt)
  {
    SetSigInfo(paramLong1, paramLong2, paramLong3, paramLong4, paramArrayOfByte1, paramArrayOfByte2, paramArrayOfByte3, paramArrayOfByte4, paramArrayOfByte5, paramArrayOfByte6, paramArrayOfByte7, paramArrayOfByte8, paramArrayOfByte9, paramArrayOfByte10, paramArrayOfByte11, paramArrayOfByte12, paramArrayOfByte, paramArrayOfLong, paramInt);
  }
  
  public WloginSigInfo(long paramLong1, long paramLong2, byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
  {
    _app_pri = 4294967295L;
    if ((paramArrayOfByte1 != null) && (paramArrayOfByte1.length > 0))
    {
      _userStSig = ((byte[])paramArrayOfByte1.clone());
      _userStSig_create_time = paramLong1;
    }
    if ((paramArrayOfByte2 != null) && (paramArrayOfByte2.length > 0)) {
      _userSt_Key = ((byte[])paramArrayOfByte2.clone());
    }
  }
  
  private WloginSigInfo(Parcel paramParcel)
  {
    readFromParcel(paramParcel);
  }
  
  public WloginSigInfo Set(long paramLong1, long paramLong2, long paramLong3, long paramLong4, byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, byte[] paramArrayOfByte3, byte[] paramArrayOfByte4, byte[] paramArrayOfByte5, byte[] paramArrayOfByte6, byte[] paramArrayOfByte7, byte[] paramArrayOfByte8, byte[] paramArrayOfByte9, byte[] paramArrayOfByte10, byte[] paramArrayOfByte11, byte[] paramArrayOfByte12, byte[][] paramArrayOfByte, long[] paramArrayOfLong, int paramInt)
  {
    SetSigInfo(paramLong1, paramLong2, paramLong3, paramLong4, paramArrayOfByte1, paramArrayOfByte2, paramArrayOfByte3, paramArrayOfByte4, paramArrayOfByte5, paramArrayOfByte6, paramArrayOfByte7, paramArrayOfByte8, paramArrayOfByte9, paramArrayOfByte10, paramArrayOfByte11, paramArrayOfByte12, paramArrayOfByte, paramArrayOfLong, paramInt);
    return this;
  }
  
  public WloginSigInfo Set(byte[][] paramArrayOfByte, long paramLong)
  {
    if ((paramArrayOfByte != null) && (paramArrayOfByte.length == 5)) {
      if ((paramArrayOfByte[0] != null) && (paramArrayOfByte[0].length > 0))
      {
        _en_A1 = ((byte[])paramArrayOfByte[0].clone());
        _create_time = paramLong;
        if ((paramArrayOfByte[1] == null) || (paramArrayOfByte[1].length <= 0)) {
          break label147;
        }
      }
    }
    label147:
    for (_noPicSig = ((byte[])paramArrayOfByte[1].clone());; _noPicSig = new byte[0])
    {
      if ((paramArrayOfByte[2] != null) && (paramArrayOfByte[2].length > 0)) {
        _G = ((byte[])paramArrayOfByte[2].clone());
      }
      if ((paramArrayOfByte[3] != null) && (paramArrayOfByte[3].length > 0)) {
        _dpwd = ((byte[])paramArrayOfByte[3].clone());
      }
      if ((paramArrayOfByte[4] != null) && (paramArrayOfByte[4].length > 0)) {
        _randseed = ((byte[])paramArrayOfByte[4].clone());
      }
      return this;
    }
  }
  
  public void SetSigInfo(long paramLong1, long paramLong2, long paramLong3, long paramLong4, byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, byte[] paramArrayOfByte3, byte[] paramArrayOfByte4, byte[] paramArrayOfByte5, byte[] paramArrayOfByte6, byte[] paramArrayOfByte7, byte[] paramArrayOfByte8, byte[] paramArrayOfByte9, byte[] paramArrayOfByte10, byte[] paramArrayOfByte11, byte[] paramArrayOfByte12, byte[][] paramArrayOfByte, long[] paramArrayOfLong, int paramInt)
  {
    if ((paramArrayOfByte == null) || (paramArrayOfByte.length != 13)) {
      util.LOGI("ERROR:reserve null or length not right", "");
    }
    for (;;)
    {
      return;
      if ((paramArrayOfLong == null) || (paramArrayOfLong.length != 7))
      {
        util.LOGI("reserve_valid null or length not right", "");
        return;
      }
      _app_pri = paramLong1;
      _A2_expire_time = paramLong4;
      _login_bitmap |= paramInt;
      if ((paramArrayOfByte1 != null) && (paramArrayOfByte1.length > 0))
      {
        _TGT = ((byte[])paramArrayOfByte1.clone());
        _A2_create_time = paramLong2;
      }
      if ((paramArrayOfByte2 != null) && (paramArrayOfByte2.length > 0)) {
        _TGTKey = ((byte[])paramArrayOfByte2.clone());
      }
      if ((paramArrayOfByte3 != null) && (paramArrayOfByte3.length > 0))
      {
        _userStSig = ((byte[])paramArrayOfByte3.clone());
        _userStSig_create_time = paramLong2;
      }
      if ((paramArrayOfByte4 != null) && (paramArrayOfByte4.length > 0)) {
        _userSt_Key = ((byte[])paramArrayOfByte4.clone());
      }
      if ((paramArrayOfByte5 != null) && (paramArrayOfByte5.length > 0))
      {
        _userStWebSig = ((byte[])paramArrayOfByte5.clone());
        _userStWebSig_create_time = paramLong2;
        _userStWebSig_expire_time = (paramArrayOfLong[4] + paramLong2);
      }
      if ((paramArrayOfByte6 != null) && (paramArrayOfByte6.length > 0))
      {
        _userA5 = ((byte[])paramArrayOfByte6.clone());
        _userA5_create_time = paramLong2;
      }
      if ((paramArrayOfByte7 != null) && (paramArrayOfByte7.length > 0))
      {
        _userA8 = ((byte[])paramArrayOfByte7.clone());
        _userA8_create_time = paramLong2;
        _userA8_expire_time = (paramArrayOfLong[3] + paramLong2);
      }
      if ((paramArrayOfByte8 != null) && (paramArrayOfByte8.length > 0))
      {
        _lsKey = ((byte[])paramArrayOfByte8.clone());
        _lsKey_create_time = paramLong2;
        _lsKey_expire_time = (paramArrayOfLong[0] + paramLong2);
      }
      if ((paramArrayOfByte9 != null) && (paramArrayOfByte9.length > 0))
      {
        _sKey = ((byte[])paramArrayOfByte9.clone());
        _sKey_create_time = paramLong2;
        _sKey_expire_time = (paramArrayOfLong[1] + paramLong2);
      }
      if ((paramArrayOfByte10 != null) && (paramArrayOfByte10.length > 0))
      {
        _userSig64 = ((byte[])paramArrayOfByte10.clone());
        _userSig64_create_time = paramLong2;
      }
      if ((paramArrayOfByte11 != null) && (paramArrayOfByte11.length > 0)) {
        _openid = ((byte[])paramArrayOfByte11.clone());
      }
      if ((paramArrayOfByte12 != null) && (paramArrayOfByte12.length > 0))
      {
        _openkey = ((byte[])paramArrayOfByte12.clone());
        _openkey_create_time = paramLong2;
      }
      if ((paramArrayOfByte[0] != null) && (paramArrayOfByte[0].length > 0))
      {
        _vkey = ((byte[])paramArrayOfByte[0].clone());
        _vkey_create_time = paramLong2;
        _vKey_expire_time = (paramArrayOfLong[2] + paramLong2);
      }
      if ((paramArrayOfByte[1] != null) && (paramArrayOfByte[1].length > 0))
      {
        _access_token = ((byte[])paramArrayOfByte[1].clone());
        _access_token_create_time = paramLong2;
      }
      if ((paramArrayOfByte[2] != null) && (paramArrayOfByte[2].length > 0))
      {
        _D2 = ((byte[])paramArrayOfByte[2].clone());
        _D2_create_time = paramLong2;
        _D2_expire_time = (paramArrayOfLong[5] + paramLong2);
      }
      if ((paramArrayOfByte[3] != null) && (paramArrayOfByte[3].length > 0)) {
        _D2Key = ((byte[])paramArrayOfByte[3].clone());
      }
      if ((paramArrayOfByte[4] != null) && (paramArrayOfByte[4].length > 0))
      {
        _sid = ((byte[])paramArrayOfByte[4].clone());
        _sid_create_time = paramLong2;
        _sid_expire_time = (paramArrayOfLong[6] + paramLong2);
      }
      if ((paramArrayOfByte[5] != null) && (paramArrayOfByte[5].length > 0))
      {
        _aqSig = ((byte[])paramArrayOfByte[5].clone());
        _aqSig_create_time = paramLong2;
      }
      if ((paramArrayOfByte[6] != null) && (paramArrayOfByte[6].length > 2))
      {
        _psKey = ((byte[])paramArrayOfByte[6].clone());
        _psKey_create_time = paramLong2;
      }
      if ((paramArrayOfByte[7] != null) && (paramArrayOfByte[7].length > 0))
      {
        _superKey = ((byte[])paramArrayOfByte[7].clone());
        _psKey_create_time = paramLong2;
      }
      if ((paramArrayOfByte[8] != null) && (paramArrayOfByte[8].length > 0)) {
        _pay_token = ((byte[])paramArrayOfByte[8].clone());
      }
      if ((paramArrayOfByte[9] != null) && (paramArrayOfByte[9].length > 0)) {
        _pf = ((byte[])paramArrayOfByte[9].clone());
      }
      if ((paramArrayOfByte[10] != null) && (paramArrayOfByte[10].length > 0)) {
        _pfKey = ((byte[])paramArrayOfByte[10].clone());
      }
      if (paramArrayOfByte[11] != null)
      {
        if (paramArrayOfByte[11].length <= 0) {
          break label892;
        }
        _DA2 = ((byte[])paramArrayOfByte[11].clone());
      }
      while ((paramArrayOfByte[12] != null) && (paramArrayOfByte[12].length > 2))
      {
        _pt4Token = ((byte[])paramArrayOfByte[12].clone());
        return;
        label892:
        _DA2 = new byte[0];
        util.LOGI("clear _DA2", "");
      }
    }
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean iSExpireA2(long paramLong)
  {
    return paramLong > _A2_expire_time;
  }
  
  public void readFromParcel(Parcel paramParcel)
  {
    _TGT = paramParcel.createByteArray();
    _TGTKey = paramParcel.createByteArray();
    _userStSig = paramParcel.createByteArray();
    _userSt_Key = paramParcel.createByteArray();
    _userStWebSig = paramParcel.createByteArray();
    _userA5 = paramParcel.createByteArray();
    _userA8 = paramParcel.createByteArray();
    _lsKey = paramParcel.createByteArray();
    _sKey = paramParcel.createByteArray();
    _userSig64 = paramParcel.createByteArray();
    _openid = paramParcel.createByteArray();
    _openkey = paramParcel.createByteArray();
    _vkey = paramParcel.createByteArray();
    _en_A1 = paramParcel.createByteArray();
    _access_token = paramParcel.createByteArray();
    _D2 = paramParcel.createByteArray();
    _D2Key = paramParcel.createByteArray();
    _sid = paramParcel.createByteArray();
    _noPicSig = paramParcel.createByteArray();
    _aqSig = paramParcel.createByteArray();
    _psKey = paramParcel.createByteArray();
    _superKey = paramParcel.createByteArray();
    _G = paramParcel.createByteArray();
    _dpwd = paramParcel.createByteArray();
    _randseed = paramParcel.createByteArray();
    _login_bitmap = paramParcel.readInt();
    _app_pri = paramParcel.readLong();
    _A2_expire_time = paramParcel.readLong();
    _lsKey_expire_time = paramParcel.readLong();
    _sKey_expire_time = paramParcel.readLong();
    _vKey_expire_time = paramParcel.readLong();
    _userA8_expire_time = paramParcel.readLong();
    _userStWebSig_expire_time = paramParcel.readLong();
    _D2_expire_time = paramParcel.readLong();
    _sid_expire_time = paramParcel.readLong();
    _create_time = paramParcel.readLong();
    _A2_create_time = paramParcel.readLong();
    _userStSig_create_time = paramParcel.readLong();
    _userStWebSig_create_time = paramParcel.readLong();
    _userA5_create_time = paramParcel.readLong();
    _userA8_create_time = paramParcel.readLong();
    _lsKey_create_time = paramParcel.readLong();
    _sKey_create_time = paramParcel.readLong();
    _userSig64_create_time = paramParcel.readLong();
    _openkey_create_time = paramParcel.readLong();
    _vkey_create_time = paramParcel.readLong();
    _access_token_create_time = paramParcel.readLong();
    _D2_create_time = paramParcel.readLong();
    _sid_create_time = paramParcel.readLong();
    _aqSig_create_time = paramParcel.readLong();
    _psKey_create_time = paramParcel.readLong();
    _pay_token = paramParcel.createByteArray();
    _pf = paramParcel.createByteArray();
    _pfKey = paramParcel.createByteArray();
    _DA2 = paramParcel.createByteArray();
    _pt4Token = paramParcel.createByteArray();
  }
  
  public WloginSigInfo setDA2(byte[] paramArrayOfByte)
  {
    if ((paramArrayOfByte == null) || (paramArrayOfByte.length == 0))
    {
      _DA2 = new byte[0];
      return this;
    }
    _DA2 = ((byte[])paramArrayOfByte.clone());
    return this;
  }
  
  public WloginSigInfo setRandSeed(byte[] paramArrayOfByte)
  {
    if ((paramArrayOfByte != null) && (paramArrayOfByte.length > 0)) {
      _randseed = ((byte[])paramArrayOfByte.clone());
    }
    return this;
  }
  
  public String toString()
  {
    try
    {
      String str = String.format(Locale.getDefault(), "{A1:%d,%d A2:%d pskey:%d,%d}", new Object[] { Integer.valueOf(_en_A1.length), Long.valueOf(_create_time), Integer.valueOf(_TGT.length), Integer.valueOf(_psKey.length), Long.valueOf(_psKey_create_time) });
      return str;
    }
    catch (Exception localException)
    {
      util.printException(localException, "");
    }
    return "WloginSigInfo";
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeByteArray(_TGT);
    paramParcel.writeByteArray(_TGTKey);
    paramParcel.writeByteArray(_userStSig);
    paramParcel.writeByteArray(_userSt_Key);
    paramParcel.writeByteArray(_userStWebSig);
    paramParcel.writeByteArray(_userA5);
    paramParcel.writeByteArray(_userA8);
    paramParcel.writeByteArray(_lsKey);
    paramParcel.writeByteArray(_sKey);
    paramParcel.writeByteArray(_userSig64);
    paramParcel.writeByteArray(_openid);
    paramParcel.writeByteArray(_openkey);
    paramParcel.writeByteArray(_vkey);
    paramParcel.writeByteArray(_en_A1);
    paramParcel.writeByteArray(_access_token);
    paramParcel.writeByteArray(_D2);
    paramParcel.writeByteArray(_D2Key);
    paramParcel.writeByteArray(_sid);
    paramParcel.writeByteArray(_noPicSig);
    paramParcel.writeByteArray(_aqSig);
    paramParcel.writeByteArray(_psKey);
    paramParcel.writeByteArray(_superKey);
    paramParcel.writeByteArray(_G);
    paramParcel.writeByteArray(_dpwd);
    paramParcel.writeByteArray(_randseed);
    paramParcel.writeInt(_login_bitmap);
    paramParcel.writeLong(_app_pri);
    paramParcel.writeLong(_A2_expire_time);
    paramParcel.writeLong(_lsKey_expire_time);
    paramParcel.writeLong(_sKey_expire_time);
    paramParcel.writeLong(_vKey_expire_time);
    paramParcel.writeLong(_userA8_expire_time);
    paramParcel.writeLong(_userStWebSig_expire_time);
    paramParcel.writeLong(_D2_expire_time);
    paramParcel.writeLong(_sid_expire_time);
    paramParcel.writeLong(_create_time);
    paramParcel.writeLong(_A2_create_time);
    paramParcel.writeLong(_userStSig_create_time);
    paramParcel.writeLong(_userStWebSig_create_time);
    paramParcel.writeLong(_userA5_create_time);
    paramParcel.writeLong(_userA8_create_time);
    paramParcel.writeLong(_lsKey_create_time);
    paramParcel.writeLong(_sKey_create_time);
    paramParcel.writeLong(_userSig64_create_time);
    paramParcel.writeLong(_openkey_create_time);
    paramParcel.writeLong(_vkey_create_time);
    paramParcel.writeLong(_access_token_create_time);
    paramParcel.writeLong(_D2_create_time);
    paramParcel.writeLong(_sid_create_time);
    paramParcel.writeLong(_aqSig_create_time);
    paramParcel.writeLong(_psKey_create_time);
    paramParcel.writeByteArray(_pay_token);
    paramParcel.writeByteArray(_pf);
    paramParcel.writeByteArray(_pfKey);
    paramParcel.writeByteArray(_DA2);
    paramParcel.writeByteArray(_pt4Token);
  }
}
