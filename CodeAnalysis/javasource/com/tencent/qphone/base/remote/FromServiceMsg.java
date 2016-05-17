package com.tencent.qphone.base.remote;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.util.Log;
import com.tencent.mobileqq.msf.sdk.MsfCommand;
import com.tencent.mobileqq.msf.sdk.MsfSdkUtils;
import java.util.HashMap;

public class FromServiceMsg
  implements Parcelable, Cloneable
{
  public static final Parcelable.Creator CREATOR = new FromServiceMsg.1();
  private static final String tag = "FromServiceMsg";
  private static final String version = "version";
  private int appId;
  private int appSeq = -1;
  public HashMap attributes = new HashMap();
  private String errorMsg = "";
  public Bundle extraData = new Bundle();
  private int flag;
  private byte fromVersion = 1;
  private MsfCommand msfCommand = MsfCommand.unknown;
  private byte[] msgCookie = new byte[0];
  private int resultCode;
  private String serviceCmd;
  private int ssoSeq = -1;
  private String uin;
  private byte[] wupBuffer = new byte[0];
  
  public FromServiceMsg()
  {
    extraData.putByte("version", fromVersion);
  }
  
  public FromServiceMsg(int paramInt1, int paramInt2, String paramString1, String paramString2)
  {
    resultCode = 1001;
    appId = paramInt1;
    appSeq = paramInt2;
    uin = paramString1;
    serviceCmd = paramString2;
    extraData.putByte("version", fromVersion);
  }
  
  public FromServiceMsg(int paramInt1, int paramInt2, String paramString1, String paramString2, byte[] paramArrayOfByte)
  {
    resultCode = 1001;
    appId = paramInt1;
    appSeq = paramInt2;
    uin = paramString1;
    serviceCmd = paramString2;
    msgCookie = paramArrayOfByte;
    extraData.putByte("version", fromVersion);
  }
  
  public FromServiceMsg(Parcel paramParcel)
  {
    readFromParcel(paramParcel);
  }
  
  public FromServiceMsg(String paramString1, String paramString2)
  {
    this(-1, -1, paramString1, paramString2);
    extraData.putByte("version", fromVersion);
  }
  
  public Object addAttribute(String paramString, Object paramObject)
  {
    return attributes.put(paramString, paramObject);
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public int getAppId()
  {
    return appId;
  }
  
  public int getAppSeq()
  {
    return appSeq;
  }
  
  public Object getAttribute(String paramString)
  {
    return attributes.get(paramString);
  }
  
  public Object getAttribute(String paramString, Object paramObject)
  {
    if (!attributes.containsKey(paramString)) {
      return paramObject;
    }
    return attributes.get(paramString);
  }
  
  public HashMap getAttributes()
  {
    return attributes;
  }
  
  public int getBusinessFailCode()
  {
    return resultCode;
  }
  
  public int getBusinessFailCode(int paramInt)
  {
    if (resultCode == -1) {
      return paramInt;
    }
    return resultCode;
  }
  
  public String getBusinessFailMsg()
  {
    return errorMsg;
  }
  
  public int getFlag()
  {
    return flag;
  }
  
  public byte getFromVersion()
  {
    return fromVersion;
  }
  
  public MsfCommand getMsfCommand()
  {
    return msfCommand;
  }
  
  public byte[] getMsgCookie()
  {
    return msgCookie;
  }
  
  public int getRequestSsoSeq()
  {
    return ssoSeq;
  }
  
  public int getResultCode()
  {
    return resultCode;
  }
  
  public String getServiceCmd()
  {
    return serviceCmd;
  }
  
  public String getStringForLog()
  {
    try
    {
      int j = "FromServiceMsg".length();
      int k = msfCommand.toString().length();
      int m = errorMsg.length();
      if (serviceCmd == null) {}
      for (int i = 4;; i = serviceCmd.length())
      {
        StringBuilder localStringBuilder = new StringBuilder(i + (j + 8 + k + 8 + 10 + 10 + 10 + 10 + m + 5 + 10 + 12) + 7 + 10 + 8 + 10 + 10);
        localStringBuilder.append("FromServiceMsg");
        localStringBuilder.append(" msName:");
        localStringBuilder.append(msfCommand);
        localStringBuilder.append(" ssoSeq:");
        localStringBuilder.append(getRequestSsoSeq());
        localStringBuilder.append(" failCode:");
        localStringBuilder.append(resultCode);
        localStringBuilder.append(" errorMsg:");
        localStringBuilder.append(errorMsg);
        localStringBuilder.append(" uin:");
        localStringBuilder.append(MsfSdkUtils.getShortUin(uin));
        localStringBuilder.append(" serviceCmd:");
        localStringBuilder.append(serviceCmd);
        localStringBuilder.append(" appId:");
        localStringBuilder.append(appId);
        localStringBuilder.append(" appSeq:");
        localStringBuilder.append(appSeq);
        return localStringBuilder.toString();
      }
      return "fsm getString error";
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  public String getUin()
  {
    return uin;
  }
  
  public byte[] getWupBuffer()
  {
    return wupBuffer;
  }
  
  public boolean isSuccess()
  {
    return resultCode == 1000;
  }
  
  public void putWupBuffer(byte[] paramArrayOfByte)
  {
    wupBuffer = paramArrayOfByte;
  }
  
  public void readFromParcel(Parcel paramParcel)
  {
    try
    {
      appId = paramParcel.readInt();
      appSeq = paramParcel.readInt();
      resultCode = paramParcel.readInt();
      uin = paramParcel.readString();
      serviceCmd = paramParcel.readString();
      extraData.clear();
      extraData = paramParcel.readBundle();
      attributes.clear();
      paramParcel.readMap(attributes, getClass().getClassLoader());
      if (extraData.getByte("version") > 0)
      {
        msfCommand = ((MsfCommand)paramParcel.readSerializable());
        ssoSeq = paramParcel.readInt();
        errorMsg = paramParcel.readString();
        wupBuffer = new byte[paramParcel.readInt()];
        paramParcel.readByteArray(wupBuffer);
        msgCookie = new byte[paramParcel.readInt()];
        paramParcel.readByteArray(msgCookie);
        flag = paramParcel.readInt();
      }
      return;
    }
    catch (RuntimeException paramParcel)
    {
      Log.d("FromServiceMsg", "readFromParcel RuntimeException", paramParcel);
      throw paramParcel;
    }
  }
  
  public void setAppId(int paramInt)
  {
    appId = paramInt;
  }
  
  public void setAppSeq(int paramInt)
  {
    appSeq = paramInt;
  }
  
  public void setBusinessFail(int paramInt)
  {
    resultCode = paramInt;
  }
  
  public void setBusinessFail(int paramInt1, int paramInt2, String paramString)
  {
    resultCode = paramInt2;
    errorMsg = paramString;
  }
  
  public void setBusinessFail(int paramInt, String paramString)
  {
    resultCode = paramInt;
    errorMsg = paramString;
  }
  
  public void setFromVersion(byte paramByte)
  {
    fromVersion = paramByte;
  }
  
  public void setMsfCommand(MsfCommand paramMsfCommand)
  {
    msfCommand = paramMsfCommand;
  }
  
  public void setMsgCookie(byte[] paramArrayOfByte)
  {
    msgCookie = paramArrayOfByte;
  }
  
  public void setMsgFail()
  {
    resultCode = 1001;
  }
  
  public void setMsgSuccess()
  {
    resultCode = 1000;
  }
  
  public void setRequestSsoSeq(int paramInt)
  {
    ssoSeq = paramInt;
  }
  
  public void setServiceCmd(String paramString)
  {
    serviceCmd = paramString;
  }
  
  public void setUin(String paramString)
  {
    uin = paramString;
  }
  
  public String toString()
  {
    try
    {
      int j = "FromServiceMsg".length();
      int k = msfCommand.toString().length();
      int m = errorMsg.length();
      if (serviceCmd == null) {}
      for (int i = 4;; i = serviceCmd.length())
      {
        StringBuilder localStringBuilder = new StringBuilder(i + (j + 8 + k + 8 + 10 + 10 + 10 + 10 + m + 5 + 10 + 12) + 7 + 10 + 8 + 10 + 10);
        localStringBuilder.append("FromServiceMsg");
        localStringBuilder.append(" msName:");
        localStringBuilder.append(msfCommand);
        localStringBuilder.append(" ssoSeq:");
        localStringBuilder.append(getRequestSsoSeq());
        localStringBuilder.append(" failCode:");
        localStringBuilder.append(resultCode);
        localStringBuilder.append(" errorMsg:");
        localStringBuilder.append(errorMsg);
        localStringBuilder.append(" uin:");
        localStringBuilder.append(uin);
        localStringBuilder.append(" serviceCmd:");
        localStringBuilder.append(serviceCmd);
        localStringBuilder.append(" appId:");
        localStringBuilder.append(appId);
        localStringBuilder.append(" appSeq:");
        localStringBuilder.append(appSeq);
        return localStringBuilder.toString();
      }
      return "fsm toString error";
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    try
    {
      paramParcel.writeInt(appId);
      paramParcel.writeInt(appSeq);
      paramParcel.writeInt(resultCode);
      paramParcel.writeString(uin);
      paramParcel.writeString(serviceCmd);
      paramParcel.writeBundle(extraData);
      paramParcel.writeMap(attributes);
      if (fromVersion > 0)
      {
        paramParcel.writeSerializable(msfCommand);
        paramParcel.writeInt(ssoSeq);
        paramParcel.writeString(errorMsg);
        paramParcel.writeInt(wupBuffer.length);
        paramParcel.writeByteArray(wupBuffer);
        paramParcel.writeInt(msgCookie.length);
        paramParcel.writeByteArray(msgCookie);
        paramParcel.writeInt(flag);
      }
      return;
    }
    catch (RuntimeException paramParcel)
    {
      Log.d("FromServiceMsg", "writeToParcel RuntimeException", paramParcel);
      throw paramParcel;
    }
  }
}
