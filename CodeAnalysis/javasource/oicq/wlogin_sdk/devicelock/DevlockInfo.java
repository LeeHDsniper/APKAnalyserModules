package oicq.wlogin_sdk.devicelock;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class DevlockInfo
  implements Parcelable, Cloneable
{
  public static final Parcelable.Creator<DevlockInfo> CREATOR = new c();
  public int AllowSet;
  public int AvailableMsgCount;
  public String BakCountryCode;
  public String BakMobile;
  public int BakMobileState;
  public String CountryCode;
  public int DevSetup;
  public String MbGuideInfo;
  public int MbGuideInfoType;
  public String MbGuideMsg;
  public int MbGuideType;
  public int MbItemSmsCodeStatus;
  public String Mobile;
  public String ProtectIntro;
  public int TimeLimit;
  public byte[] TransferInfo;
  public String UnionVerifyUrl;
  public String VerifyReason;
  public String WarningInfo;
  public int WarningInfoType;
  public String WarningMsg;
  public String WarningTitle;
  
  public DevlockInfo() {}
  
  private DevlockInfo(Parcel paramParcel)
  {
    readFromParcel(paramParcel);
  }
  
  public Object clone()
  {
    return super.clone();
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void readFromParcel(Parcel paramParcel)
  {
    DevSetup = paramParcel.readInt();
    AllowSet = paramParcel.readInt();
    ProtectIntro = paramParcel.readString();
    WarningTitle = paramParcel.readString();
    WarningMsg = paramParcel.readString();
    WarningInfo = paramParcel.readString();
    WarningInfoType = paramParcel.readInt();
    CountryCode = paramParcel.readString();
    Mobile = paramParcel.readString();
    MbItemSmsCodeStatus = paramParcel.readInt();
    AvailableMsgCount = paramParcel.readInt();
    TimeLimit = paramParcel.readInt();
    MbGuideMsg = paramParcel.readString();
    MbGuideInfo = paramParcel.readString();
    MbGuideType = paramParcel.readInt();
    MbGuideInfoType = paramParcel.readInt();
    UnionVerifyUrl = paramParcel.readString();
    VerifyReason = paramParcel.readString();
    BakMobileState = paramParcel.readInt();
    BakCountryCode = paramParcel.readString();
    BakMobile = paramParcel.readString();
    int i = paramParcel.readInt();
    if (i > 0)
    {
      TransferInfo = new byte[i];
      paramParcel.readByteArray(TransferInfo);
    }
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeInt(DevSetup);
    paramParcel.writeInt(AllowSet);
    paramParcel.writeString(ProtectIntro);
    paramParcel.writeString(WarningTitle);
    paramParcel.writeString(WarningMsg);
    paramParcel.writeString(WarningInfo);
    paramParcel.writeInt(WarningInfoType);
    paramParcel.writeString(CountryCode);
    paramParcel.writeString(Mobile);
    paramParcel.writeInt(MbItemSmsCodeStatus);
    paramParcel.writeInt(AvailableMsgCount);
    paramParcel.writeInt(TimeLimit);
    paramParcel.writeString(MbGuideMsg);
    paramParcel.writeString(MbGuideInfo);
    paramParcel.writeInt(MbGuideType);
    paramParcel.writeInt(MbGuideInfoType);
    paramParcel.writeString(UnionVerifyUrl);
    paramParcel.writeString(VerifyReason);
    paramParcel.writeInt(BakMobileState);
    paramParcel.writeString(BakCountryCode);
    paramParcel.writeString(BakMobile);
    if ((TransferInfo != null) && (TransferInfo.length > 0))
    {
      paramParcel.writeInt(TransferInfo.length);
      paramParcel.writeByteArray(TransferInfo);
      return;
    }
    paramParcel.writeInt(0);
  }
}
