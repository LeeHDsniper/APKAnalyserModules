package oicq.wlogin_sdk.tools;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class ErrMsg
  implements Parcelable, Cloneable
{
  public static final Parcelable.Creator<ErrMsg> CREATOR = new ErrMsg.1();
  private String message;
  private String otherinfo;
  private String title;
  private int type;
  
  public ErrMsg()
  {
    type = 0;
    title = InternationMsg.a(InternationMsg.MSG_TYPE.MSG_0);
    message = InternationMsg.a(InternationMsg.MSG_TYPE.MSG_1);
    otherinfo = "";
  }
  
  public ErrMsg(int paramInt, String paramString1, String paramString2, String paramString3)
  {
    type = paramInt;
    title = paramString1;
    message = paramString2;
    otherinfo = paramString3;
  }
  
  private ErrMsg(Parcel paramParcel)
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
  
  public String getMessage()
  {
    return message;
  }
  
  public String getOtherinfo()
  {
    return otherinfo;
  }
  
  public String getTitle()
  {
    return title;
  }
  
  public int getType()
  {
    return type;
  }
  
  public void readFromParcel(Parcel paramParcel)
  {
    type = paramParcel.readInt();
    title = paramParcel.readString();
    message = paramParcel.readString();
    otherinfo = paramParcel.readString();
  }
  
  public void setMessage(String paramString)
  {
    message = paramString;
  }
  
  public void setOtherinfo(String paramString)
  {
    otherinfo = paramString;
  }
  
  public void setTitle(String paramString)
  {
    title = paramString;
  }
  
  public void setType(int paramInt)
  {
    type = paramInt;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder().append("(");
    if (type < 0) {}
    for (Object localObject = Integer.valueOf(type);; localObject = Integer.toString(type))
    {
      localObject = localObject + ")[";
      return (String)localObject + title + "]" + message + "[" + otherinfo + "]";
    }
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeInt(type);
    paramParcel.writeString(title);
    paramParcel.writeString(message);
    paramParcel.writeString(otherinfo);
  }
}
