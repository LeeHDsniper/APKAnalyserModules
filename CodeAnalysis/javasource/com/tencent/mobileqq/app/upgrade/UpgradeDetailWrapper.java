package com.tencent.mobileqq.app.upgrade;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.tencent.apkupdate.logic.data.ApkUpdateDetail;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import nml;
import protocol.KQQConfig.UpgradeInfo;

public class UpgradeDetailWrapper
  implements Parcelable
{
  public static final Parcelable.Creator CREATOR = new nml();
  public ApkUpdateDetail a;
  public UpgradeDetailWrapper.NewApkInfo a;
  public UpgradeInfo a;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public UpgradeDetailWrapper(UpgradeInfo paramUpgradeInfo, ApkUpdateDetail paramApkUpdateDetail)
  {
    jdField_a_of_type_ProtocolKQQConfigUpgradeInfo = paramUpgradeInfo;
    jdField_a_of_type_ComTencentApkupdateLogicDataApkUpdateDetail = paramApkUpdateDetail;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (jdField_a_of_type_ProtocolKQQConfigUpgradeInfo != null)
    {
      paramParcel.writeInt(1);
      paramParcel.writeInt(jdField_a_of_type_ProtocolKQQConfigUpgradeInfo.iAppid);
      paramParcel.writeByte(jdField_a_of_type_ProtocolKQQConfigUpgradeInfo.bAppType);
      paramParcel.writeInt(jdField_a_of_type_ProtocolKQQConfigUpgradeInfo.iUpgradeType);
      paramParcel.writeInt(jdField_a_of_type_ProtocolKQQConfigUpgradeInfo.iUpgradeSdkId);
      paramParcel.writeString(jdField_a_of_type_ProtocolKQQConfigUpgradeInfo.strTitle);
      paramParcel.writeString(jdField_a_of_type_ProtocolKQQConfigUpgradeInfo.strUpgradeDesc);
      paramParcel.writeString(jdField_a_of_type_ProtocolKQQConfigUpgradeInfo.strUrl);
      paramParcel.writeInt(jdField_a_of_type_ProtocolKQQConfigUpgradeInfo.iActionType);
      paramParcel.writeByte(jdField_a_of_type_ProtocolKQQConfigUpgradeInfo.bNewSwitch);
      paramParcel.writeInt(jdField_a_of_type_ProtocolKQQConfigUpgradeInfo.iNewTimeStamp);
      paramParcel.writeString(jdField_a_of_type_ProtocolKQQConfigUpgradeInfo.strUpgradePageUrl);
      paramParcel.writeInt(jdField_a_of_type_ProtocolKQQConfigUpgradeInfo.iIncrementUpgrade);
      paramParcel.writeInt(jdField_a_of_type_ProtocolKQQConfigUpgradeInfo.iTipsType);
      paramParcel.writeString(jdField_a_of_type_ProtocolKQQConfigUpgradeInfo.strBannerPicUrl);
      paramParcel.writeString(jdField_a_of_type_ProtocolKQQConfigUpgradeInfo.strNewUpgradeDescURL);
      paramParcel.writeInt(jdField_a_of_type_ProtocolKQQConfigUpgradeInfo.iDisplayDay);
      paramParcel.writeInt(jdField_a_of_type_ProtocolKQQConfigUpgradeInfo.iTipsWaitDay);
      paramParcel.writeString(jdField_a_of_type_ProtocolKQQConfigUpgradeInfo.strProgressName);
      paramParcel.writeString(jdField_a_of_type_ProtocolKQQConfigUpgradeInfo.strNewTipsDescURL);
      paramParcel.writeString(jdField_a_of_type_ProtocolKQQConfigUpgradeInfo.strNewSoftwareURL);
    }
    while (jdField_a_of_type_ComTencentApkupdateLogicDataApkUpdateDetail != null)
    {
      paramParcel.writeInt(1);
      paramParcel.writeString(jdField_a_of_type_ComTencentApkupdateLogicDataApkUpdateDetail.fileMd5);
      paramParcel.writeInt(jdField_a_of_type_ComTencentApkupdateLogicDataApkUpdateDetail.newapksize);
      paramParcel.writeString(jdField_a_of_type_ComTencentApkupdateLogicDataApkUpdateDetail.packageName);
      paramParcel.writeInt(jdField_a_of_type_ComTencentApkupdateLogicDataApkUpdateDetail.patchsize);
      paramParcel.writeString(jdField_a_of_type_ComTencentApkupdateLogicDataApkUpdateDetail.sigMd5);
      paramParcel.writeInt(jdField_a_of_type_ComTencentApkupdateLogicDataApkUpdateDetail.updatemethod);
      paramParcel.writeString(jdField_a_of_type_ComTencentApkupdateLogicDataApkUpdateDetail.url);
      paramParcel.writeInt(jdField_a_of_type_ComTencentApkupdateLogicDataApkUpdateDetail.versioncode);
      paramParcel.writeString(jdField_a_of_type_ComTencentApkupdateLogicDataApkUpdateDetail.versionname);
      return;
      paramParcel.writeInt(0);
    }
    paramParcel.writeInt(0);
  }
}
