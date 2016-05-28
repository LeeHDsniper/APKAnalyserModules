package com.adobe.creativesdk.aviary.internal.graphics;

import android.graphics.PointF;
import android.graphics.RectF;
import android.os.Parcel;
import android.os.Parcelable.Creator;

public class LineF
  implements IGeom
{
  public static final Parcelable.Creator<LineF> CREATOR = new Parcelable.Creator()
  {
    public LineF createFromParcel(Parcel paramAnonymousParcel)
    {
      LineF localLineF = new LineF();
      localLineF.readFromParcel(paramAnonymousParcel);
      return localLineF;
    }
    
    public LineF[] newArray(int paramAnonymousInt)
    {
      return new LineF[paramAnonymousInt];
    }
  };
  private final PointF end;
  private final PointF start;
  
  public LineF()
  {
    this(0.0F, 0.0F, 0.0F, 0.0F);
  }
  
  public LineF(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    start = new PointF(paramFloat1, paramFloat2);
    end = new PointF(paramFloat3, paramFloat4);
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
      paramObject = (LineF)paramObject;
    } while ((start.x == start.x) && (start.y == start.y) && (end.x == end.x) && (end.y == end.y));
    return false;
  }
  
  public float getEndX()
  {
    return end.x;
  }
  
  public float getEndY()
  {
    return end.y;
  }
  
  public float getStartX()
  {
    return start.x;
  }
  
  public float getStartY()
  {
    return start.y;
  }
  
  public int hashCode()
  {
    return (((Float.valueOf(start.x).hashCode() + 629) * 37 + Float.valueOf(start.y).hashCode()) * 37 + Float.valueOf(end.x).hashCode()) * 37 + Float.valueOf(end.y).hashCode();
  }
  
  public PointF intersect(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    double d1 = (paramFloat4 - paramFloat2) * (end.x - start.x) - (paramFloat3 - paramFloat1) * (end.y - start.y);
    double d3 = (paramFloat3 - paramFloat1) * (start.y - paramFloat2) - (paramFloat4 - paramFloat2) * (start.x - paramFloat1);
    double d2 = (end.x - start.x) * (start.y - paramFloat2) - (end.y - start.y) * (start.x - paramFloat1);
    if (d1 == 0.0D) {
      return null;
    }
    d3 /= d1;
    d1 = d2 / d1;
    if ((d3 >= 0.0D) && (d3 <= 1.0D) && (d1 >= 0.0D) && (d1 <= 1.0D))
    {
      PointF localPointF = new PointF();
      x = ((float)(start.x + (end.x - start.x) * d3));
      y = ((float)(start.y + (end.y - start.y) * d3));
      return localPointF;
    }
    return null;
  }
  
  public PointF[] intersect(RectF paramRectF)
  {
    int i = 0;
    PointF[] arrayOfPointF = new PointF[2];
    PointF localPointF = intersect(left, top, right, top);
    if (localPointF != null)
    {
      arrayOfPointF[0] = localPointF;
      i = 0 + 1;
    }
    localPointF = intersect(right, top, right, bottom);
    int j;
    if (localPointF != null)
    {
      j = i + 1;
      arrayOfPointF[i] = localPointF;
    }
    for (;;)
    {
      i = j;
      if (j < 2)
      {
        localPointF = intersect(left, bottom, right, bottom);
        i = j;
        if (localPointF != null)
        {
          arrayOfPointF[j] = localPointF;
          i = j + 1;
        }
      }
      if (i < 2)
      {
        paramRectF = intersect(left, top, left, bottom);
        if (paramRectF != null)
        {
          j = i + 1;
          arrayOfPointF[i] = paramRectF;
          i = j;
        }
      }
      for (;;)
      {
        if (i == 2) {
          return arrayOfPointF;
        }
        if (i == 1) {
          return new PointF[] { arrayOfPointF[0] };
        }
        return null;
      }
      j = i;
    }
  }
  
  public void readFromParcel(Parcel paramParcel)
  {
    start.x = paramParcel.readFloat();
    start.y = paramParcel.readFloat();
    end.x = paramParcel.readFloat();
    end.y = paramParcel.readFloat();
  }
  
  public void reset()
  {
    start.set(0.0F, 0.0F);
    end.set(0.0F, 0.0F);
  }
  
  public void set(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    start.set(paramFloat1, paramFloat2);
    end.set(paramFloat3, paramFloat4);
  }
  
  public String toString()
  {
    return "LineF(" + start.x + ", " + start.x + " - " + end.x + ", " + end.y + ")";
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeFloat(getStartX());
    paramParcel.writeFloat(getStartY());
    paramParcel.writeFloat(getEndX());
    paramParcel.writeFloat(getEndY());
  }
}
