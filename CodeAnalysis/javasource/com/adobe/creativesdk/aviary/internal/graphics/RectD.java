package com.adobe.creativesdk.aviary.internal.graphics;

import android.os.Parcel;
import android.os.Parcelable.Creator;

public class RectD
  implements IGeom
{
  public static final Parcelable.Creator<RectD> CREATOR = new Parcelable.Creator()
  {
    public RectD createFromParcel(Parcel paramAnonymousParcel)
    {
      RectD localRectD = new RectD();
      localRectD.readFromParcel(paramAnonymousParcel);
      return localRectD;
    }
    
    public RectD[] newArray(int paramAnonymousInt)
    {
      return new RectD[paramAnonymousInt];
    }
  };
  public double bottom;
  public double left;
  public double right;
  public double top;
  
  public RectD() {}
  
  public RectD(double paramDouble1, double paramDouble2, double paramDouble3, double paramDouble4)
  {
    left = paramDouble1;
    top = paramDouble2;
    right = paramDouble3;
    bottom = paramDouble4;
  }
  
  public RectD(RectD paramRectD)
  {
    left = left;
    top = top;
    right = right;
    bottom = bottom;
  }
  
  public boolean contains(RectD paramRectD)
  {
    return (left < right) && (top < bottom) && (left <= left) && (top <= top) && (right >= right) && (bottom >= bottom);
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass())) {
        return false;
      }
      paramObject = (RectD)paramObject;
    } while ((left == left) && (top == top) && (right == right) && (bottom == bottom));
    return false;
  }
  
  public int hashCode()
  {
    return ((Double.valueOf(left).hashCode() * 31 + Double.valueOf(top).hashCode()) * 31 + Double.valueOf(right).hashCode()) * 31 + Double.valueOf(bottom).hashCode();
  }
  
  public final double height()
  {
    return bottom - top;
  }
  
  public void inset(double paramDouble1, double paramDouble2)
  {
    left += paramDouble1;
    top += paramDouble2;
    right -= paramDouble1;
    bottom -= paramDouble2;
  }
  
  public void offset(double paramDouble1, double paramDouble2)
  {
    left += paramDouble1;
    top += paramDouble2;
    right += paramDouble1;
    bottom += paramDouble2;
  }
  
  public void readFromParcel(Parcel paramParcel)
  {
    left = paramParcel.readDouble();
    top = paramParcel.readDouble();
    right = paramParcel.readDouble();
    bottom = paramParcel.readDouble();
  }
  
  public void set(double paramDouble1, double paramDouble2, double paramDouble3, double paramDouble4)
  {
    left = paramDouble1;
    top = paramDouble2;
    right = paramDouble3;
    bottom = paramDouble4;
  }
  
  public void set(RectD paramRectD)
  {
    left = left;
    top = top;
    right = right;
    bottom = bottom;
  }
  
  public void sort()
  {
    double d;
    if (left > right)
    {
      d = left;
      left = right;
      right = d;
    }
    if (top > bottom)
    {
      d = top;
      top = bottom;
      bottom = d;
    }
  }
  
  public String toString()
  {
    return "RectD(" + left + ", " + top + ", " + right + ", " + bottom + ")";
  }
  
  public final double width()
  {
    return right - left;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeDouble(left);
    paramParcel.writeDouble(top);
    paramParcel.writeDouble(right);
    paramParcel.writeDouble(bottom);
  }
}
