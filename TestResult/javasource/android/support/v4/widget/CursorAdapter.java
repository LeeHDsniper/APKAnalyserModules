package android.support.v4.widget;

import android.content.Context;
import android.database.ContentObserver;
import android.database.Cursor;
import android.database.DataSetObserver;
import android.os.Handler;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Filter;
import android.widget.FilterQueryProvider;
import android.widget.Filterable;

public abstract class CursorAdapter
  extends BaseAdapter
  implements CursorFilter.CursorFilterClient, Filterable
{
  protected boolean mAutoRequery;
  protected ChangeObserver mChangeObserver;
  protected Context mContext;
  protected Cursor mCursor;
  protected CursorFilter mCursorFilter;
  protected DataSetObserver mDataSetObserver;
  protected boolean mDataValid;
  protected FilterQueryProvider mFilterQueryProvider;
  protected int mRowIDColumn;
  
  public CursorAdapter(Context paramContext, Cursor paramCursor, boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (int i = 1;; i = 2)
    {
      init(paramContext, paramCursor, i);
      return;
    }
  }
  
  public abstract void bindView(View paramView, Context paramContext, Cursor paramCursor);
  
  public void changeCursor(Cursor paramCursor)
  {
    paramCursor = swapCursor(paramCursor);
    if (paramCursor != null) {
      paramCursor.close();
    }
  }
  
  public CharSequence convertToString(Cursor paramCursor)
  {
    if (paramCursor == null) {
      return "";
    }
    return paramCursor.toString();
  }
  
  public int getCount()
  {
    if ((mDataValid) && (mCursor != null)) {
      return mCursor.getCount();
    }
    return 0;
  }
  
  public Cursor getCursor()
  {
    return mCursor;
  }
  
  public View getDropDownView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    if (mDataValid)
    {
      mCursor.moveToPosition(paramInt);
      if (paramView == null) {
        paramView = newDropDownView(mContext, mCursor, paramViewGroup);
      }
      for (;;)
      {
        bindView(paramView, mContext, mCursor);
        return paramView;
      }
    }
    return null;
  }
  
  public Filter getFilter()
  {
    if (mCursorFilter == null) {
      mCursorFilter = new CursorFilter(this);
    }
    return mCursorFilter;
  }
  
  public Object getItem(int paramInt)
  {
    if ((mDataValid) && (mCursor != null))
    {
      mCursor.moveToPosition(paramInt);
      return mCursor;
    }
    return null;
  }
  
  public long getItemId(int paramInt)
  {
    long l2 = 0L;
    long l1 = l2;
    if (mDataValid)
    {
      l1 = l2;
      if (mCursor != null)
      {
        l1 = l2;
        if (mCursor.moveToPosition(paramInt)) {
          l1 = mCursor.getLong(mRowIDColumn);
        }
      }
    }
    return l1;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    if (!mDataValid) {
      throw new IllegalStateException("this should only be called when the cursor is valid");
    }
    if (!mCursor.moveToPosition(paramInt)) {
      throw new IllegalStateException("couldn't move cursor to position " + paramInt);
    }
    if (paramView == null) {
      paramView = newView(mContext, mCursor, paramViewGroup);
    }
    for (;;)
    {
      bindView(paramView, mContext, mCursor);
      return paramView;
    }
  }
  
  public boolean hasStableIds()
  {
    return true;
  }
  
  void init(Context paramContext, Cursor paramCursor, int paramInt)
  {
    boolean bool = true;
    label23:
    int i;
    if ((paramInt & 0x1) == 1)
    {
      paramInt |= 0x2;
      mAutoRequery = true;
      if (paramCursor == null) {
        break label140;
      }
      mCursor = paramCursor;
      mDataValid = bool;
      mContext = paramContext;
      if (!bool) {
        break label146;
      }
      i = paramCursor.getColumnIndexOrThrow("_id");
      label54:
      mRowIDColumn = i;
      if ((paramInt & 0x2) != 2) {
        break label152;
      }
      mChangeObserver = new ChangeObserver();
    }
    for (mDataSetObserver = new MyDataSetObserver(null);; mDataSetObserver = null)
    {
      if (bool)
      {
        if (mChangeObserver != null) {
          paramCursor.registerContentObserver(mChangeObserver);
        }
        if (mDataSetObserver != null) {
          paramCursor.registerDataSetObserver(mDataSetObserver);
        }
      }
      return;
      mAutoRequery = false;
      break;
      label140:
      bool = false;
      break label23;
      label146:
      i = -1;
      break label54;
      label152:
      mChangeObserver = null;
    }
  }
  
  public View newDropDownView(Context paramContext, Cursor paramCursor, ViewGroup paramViewGroup)
  {
    return newView(paramContext, paramCursor, paramViewGroup);
  }
  
  public abstract View newView(Context paramContext, Cursor paramCursor, ViewGroup paramViewGroup);
  
  protected void onContentChanged()
  {
    if ((mAutoRequery) && (mCursor != null) && (!mCursor.isClosed())) {
      mDataValid = mCursor.requery();
    }
  }
  
  public Cursor runQueryOnBackgroundThread(CharSequence paramCharSequence)
  {
    if (mFilterQueryProvider != null) {
      return mFilterQueryProvider.runQuery(paramCharSequence);
    }
    return mCursor;
  }
  
  public Cursor swapCursor(Cursor paramCursor)
  {
    if (paramCursor == mCursor) {
      return null;
    }
    Cursor localCursor = mCursor;
    if (localCursor != null)
    {
      if (mChangeObserver != null) {
        localCursor.unregisterContentObserver(mChangeObserver);
      }
      if (mDataSetObserver != null) {
        localCursor.unregisterDataSetObserver(mDataSetObserver);
      }
    }
    mCursor = paramCursor;
    if (paramCursor != null)
    {
      if (mChangeObserver != null) {
        paramCursor.registerContentObserver(mChangeObserver);
      }
      if (mDataSetObserver != null) {
        paramCursor.registerDataSetObserver(mDataSetObserver);
      }
      mRowIDColumn = paramCursor.getColumnIndexOrThrow("_id");
      mDataValid = true;
      notifyDataSetChanged();
      return localCursor;
    }
    mRowIDColumn = -1;
    mDataValid = false;
    notifyDataSetInvalidated();
    return localCursor;
  }
  
  private class ChangeObserver
    extends ContentObserver
  {
    public ChangeObserver()
    {
      super();
    }
    
    public boolean deliverSelfNotifications()
    {
      return true;
    }
    
    public void onChange(boolean paramBoolean)
    {
      onContentChanged();
    }
  }
  
  private class MyDataSetObserver
    extends DataSetObserver
  {
    private MyDataSetObserver() {}
    
    public void onChanged()
    {
      mDataValid = true;
      notifyDataSetChanged();
    }
    
    public void onInvalidated()
    {
      mDataValid = false;
      notifyDataSetInvalidated();
    }
  }
}
