import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.tencent.apkupdate.logic.data.ApkUpdateDetail;
import com.tencent.mobileqq.app.ConfigHandler;
import com.tencent.mobileqq.app.upgrade.UpgradeDetailWrapper;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import protocol.KQQConfig.UpgradeInfo;

public final class nml
  implements Parcelable.Creator
{
  public nml()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public UpgradeDetailWrapper a(Parcel paramParcel)
  {
    ApkUpdateDetail localApkUpdateDetail = null;
    UpgradeInfo localUpgradeInfo;
    if (paramParcel.readInt() == 1)
    {
      localUpgradeInfo = new UpgradeInfo();
      iAppid = paramParcel.readInt();
      bAppType = paramParcel.readByte();
      iUpgradeType = paramParcel.readInt();
      iUpgradeSdkId = paramParcel.readInt();
      strTitle = paramParcel.readString();
      strUpgradeDesc = paramParcel.readString();
      strUrl = paramParcel.readString();
      iActionType = paramParcel.readInt();
      bNewSwitch = paramParcel.readByte();
      iNewTimeStamp = paramParcel.readInt();
      strUpgradePageUrl = paramParcel.readString();
      iIncrementUpgrade = paramParcel.readInt();
      iTipsType = paramParcel.readInt();
      strBannerPicUrl = paramParcel.readString();
      strNewUpgradeDescURL = paramParcel.readString();
      iDisplayDay = paramParcel.readInt();
      iTipsWaitDay = paramParcel.readInt();
      strProgressName = paramParcel.readString();
      strNewTipsDescURL = paramParcel.readString();
      strNewSoftwareURL = paramParcel.readString();
    }
    for (;;)
    {
      if (paramParcel.readInt() == 1)
      {
        localApkUpdateDetail = new ApkUpdateDetail();
        fileMd5 = paramParcel.readString();
        newapksize = paramParcel.readInt();
        packageName = paramParcel.readString();
        patchsize = paramParcel.readInt();
        sigMd5 = paramParcel.readString();
        updatemethod = paramParcel.readInt();
        url = paramParcel.readString();
        versioncode = paramParcel.readInt();
        versionname = paramParcel.readString();
      }
      paramParcel = new UpgradeDetailWrapper(localUpgradeInfo, localApkUpdateDetail);
      a = ConfigHandler.a(localUpgradeInfo);
      return paramParcel;
      localUpgradeInfo = null;
    }
  }
  
  public UpgradeDetailWrapper[] a(int paramInt)
  {
    return new UpgradeDetailWrapper[paramInt];
  }
}
