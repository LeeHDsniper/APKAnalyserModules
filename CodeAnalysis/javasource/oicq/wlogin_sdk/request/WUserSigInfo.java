package oicq.wlogin_sdk.request;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.util.ArrayList;
import java.util.List;
import oicq.wlogin_sdk.sharemem.WloginSigInfo;

public class WUserSigInfo
  implements Parcelable
{
  public static final Parcelable.Creator<WUserSigInfo> CREATOR = new WUserSigInfo.1();
  public List<String> _domains = new ArrayList();
  public byte[] _fastLoginBuf;
  public byte[] _in_ksid;
  public int _login_bitmap = 0;
  public byte[] _reserveData;
  public long _seqence = 0L;
  public List<Ticket> _tickets = new ArrayList();
  public String uin = "";
  
  public WUserSigInfo() {}
  
  private WUserSigInfo(Parcel paramParcel)
  {
    readFromParcel(paramParcel);
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void get_clone(WloginSigInfo paramWloginSigInfo)
  {
    if (cacheTickets != null)
    {
      _tickets = cacheTickets;
      return;
    }
    _tickets.clear();
    _tickets.add(new Ticket(2, _userA5, null, _userA5_create_time, 0L));
    _tickets.add(new Ticket(2097152, _aqSig, null, _aqSig_create_time, 0L));
    _tickets.add(new Ticket(8192, _userSig64, null, _userSig64_create_time, 0L));
    _tickets.add(new Ticket(1048576, _superKey, null, _psKey_create_time, _psKey, _pt4Token));
    _tickets.add(new Ticket(16384, _openkey, _openid, _openkey_create_time, 0L));
    _tickets.add(new Ticket(32768, _access_token, _openid, _access_token_create_time, 0L));
    _tickets.add(new Ticket(128, _userStSig, _userSt_Key, _userStSig_create_time, 0L));
    _tickets.add(new Ticket(16, _userA8, null, _userA8_create_time, _userA8_expire_time));
    _tickets.add(new Ticket(512, _lsKey, null, _lsKey_create_time, _lsKey_expire_time));
    _tickets.add(new Ticket(4096, _sKey, null, _sKey_create_time, _sKey_expire_time));
    _tickets.add(new Ticket(131072, _vkey, null, _vkey_create_time, _vKey_expire_time));
    _tickets.add(new Ticket(64, _TGT, _TGTKey, _A2_create_time, _A2_expire_time));
    _tickets.add(new Ticket(262144, _D2, _D2Key, _D2_create_time, _D2_expire_time));
    _tickets.add(new Ticket(524288, _sid, null, _sid_create_time, _sid_expire_time));
    _tickets.add(new Ticket(32, _userStWebSig, null, _userStWebSig_create_time, _userStWebSig_expire_time));
    _tickets.add(new Ticket(8388608, _pay_token, null, 0L, 0L));
    _tickets.add(new Ticket(16777216, _pf, _pfKey, 0L, 0L));
    _tickets.add(new Ticket(33554432, _DA2, null, 0L, 0L));
    cacheTickets = _tickets;
  }
  
  public void readFromParcel(Parcel paramParcel)
  {
    _in_ksid = paramParcel.createByteArray();
    _reserveData = paramParcel.createByteArray();
    _fastLoginBuf = paramParcel.createByteArray();
    _seqence = paramParcel.readLong();
    _login_bitmap = paramParcel.readInt();
    _domains = paramParcel.readArrayList(List.class.getClassLoader());
    paramParcel.readTypedList(_tickets, Ticket.CREATOR);
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeByteArray(_in_ksid);
    paramParcel.writeByteArray(_reserveData);
    paramParcel.writeByteArray(_fastLoginBuf);
    paramParcel.writeLong(_seqence);
    paramParcel.writeInt(_login_bitmap);
    paramParcel.writeList(_domains);
    paramParcel.writeTypedList(_tickets);
  }
}
