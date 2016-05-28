package com.adobe.creativesdk.aviary.internal.graphics;

import android.os.Parcel;
import android.os.Parcelable.Creator;

public class CircleF
  implements IGeom
{
  public static final Parcelable.Creator<CircleF> CREATOR = new Parcelable.Creator()
  {
    public CircleF createFromParcel(Parcel paramAnonymousParcel)
    {
      CircleF localCircleF = new CircleF();
      localCircleF.readFromParcel(paramAnonymousParcel);
      return localCircleF;
    }
    
    public CircleF[] newArray(int paramAnonymousInt)
    {
      return new CircleF[paramAnonymousInt];
    }
  };
  protected float radius;
  protected float x;
  protected float y;
  
  public CircleF()
  {
    this(0.0F, 0.0F, 0.0F);
  }
  
  public CircleF(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    radius = paramFloat3;
    x = paramFloat1;
    y = paramFloat2;
  }
  
  public float centerX()
  {
    return x;
  }
  
  public float centerY()
  {
    return y;
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
      paramObject = (CircleF)paramObject;
    } while ((Float.valueOf(x).equals(Float.valueOf(x))) && (Float.valueOf(y).equals(Float.valueOf(y))) && (Float.valueOf(radius).equals(Float.valueOf(radius))));
    return false;
  }
  
  public float getRadius()
  {
    return radius;
  }
  
  public int hashCode()
  {
    return ((Float.valueOf(x).hashCode() + 497) * 71 + Float.valueOf(y).hashCode()) * 71 + Float.valueOf(radius).hashCode();
  }
  
  public void readFromParcel(Parcel paramParcel)
  {
    x = paramParcel.readFloat();
    y = paramParcel.readFloat();
    radius = paramParcel.readFloat();
  }
  
  public void set(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    x = paramFloat1;
    y = paramFloat2;
    radius = paramFloat3;
  }
  
  public String toString()
  {
    return "CircleF(" + x + ", " + y + ", r=" + radius + ")";
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeFloat(x);
    paramParcel.writeFloat(y);
    paramParcel.writeFloat(radius);
  }
}
