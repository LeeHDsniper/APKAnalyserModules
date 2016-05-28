package android.support.v4.widget;

import android.content.Context;
import android.database.Cursor;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

public abstract class ResourceCursorAdapter
  extends CursorAdapter
{
  private int mDropDownLayout;
  private LayoutInflater mInflater;
  private int mLayout;
  
  public ResourceCursorAdapter(Context paramContext, int paramInt, Cursor paramCursor, boolean paramBoolean)
  {
    super(paramContext, paramCursor, paramBoolean);
    mDropDownLayout = paramInt;
    mLayout = paramInt;
    mInflater = ((LayoutInflater)paramContext.getSystemService("layout_inflater"));
  }
  
  public View newDropDownView(Context paramContext, Cursor paramCursor, ViewGroup paramViewGroup)
  {
    return mInflater.inflate(mDropDownLayout, paramViewGroup, false);
  }
  
  public View newView(Context paramContext, Cursor paramCursor, ViewGroup paramViewGroup)
  {
    return mInflater.inflate(mLayout, paramViewGroup, false);
  }
}
