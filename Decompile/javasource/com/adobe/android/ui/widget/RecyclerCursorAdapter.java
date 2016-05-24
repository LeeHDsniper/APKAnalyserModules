package com.adobe.android.ui.widget;

import android.content.Context;
import android.database.ContentObserver;
import android.database.Cursor;
import android.database.DataSetObservable;
import android.database.DataSetObserver;
import android.os.Handler;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.util.Log;
import java.util.HashMap;

public abstract class RecyclerCursorAdapter<T extends RecyclerView.ViewHolder>
  extends RecyclerView.Adapter
{
  protected boolean mAutoRequery;
  protected RecyclerCursorAdapter<T>.ChangeObserver mChangeObserver;
  protected Context mContext;
  protected Cursor mCursor;
  private final DataSetObservable mDataSetObservable = new DataSetObservable();
  protected DataSetObserver mDataSetObserver;
  protected boolean mDataValid;
  protected final HashMap<Integer, Long> mItemIdCache = new HashMap();
  protected int mRowIDColumn;
  protected final HashMap<Integer, Integer> mViewTypeCache = new HashMap();
  
  public RecyclerCursorAdapter(Context paramContext, Cursor paramCursor, int paramInt)
  {
    init(paramContext, paramCursor, paramInt);
  }
  
  public RecyclerCursorAdapter(Context paramContext, Cursor paramCursor, boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (int i = 1;; i = 2)
    {
      init(paramContext, paramCursor, i);
      return;
    }
  }
  
  public void changeCursor(Cursor paramCursor)
  {
    paramCursor = swapCursor(paramCursor);
    if (paramCursor != null) {
      paramCursor.close();
    }
  }
  
  protected void clearCaches()
  {
    mViewTypeCache.clear();
    mItemIdCache.clear();
  }
  
  public Context getContext()
  {
    return mContext;
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
  
  public int getItemCount()
  {
    if ((mDataValid) && (mCursor != null)) {
      return mCursor.getCount();
    }
    return 0;
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
        if (!mItemIdCache.containsKey(Integer.valueOf(paramInt))) {
          break label57;
        }
        l1 = ((Long)mItemIdCache.get(Integer.valueOf(paramInt))).longValue();
      }
    }
    label57:
    do
    {
      return l1;
      l1 = l2;
    } while (!mCursor.moveToPosition(paramInt));
    l1 = mCursor.getLong(mRowIDColumn);
    mItemIdCache.put(Integer.valueOf(paramInt), Long.valueOf(l1));
    return l1;
  }
  
  public final int getItemViewType(int paramInt)
  {
    if ((mDataValid) && (mCursor != null))
    {
      if (mViewTypeCache.containsKey(Integer.valueOf(paramInt))) {
        return ((Integer)mViewTypeCache.get(Integer.valueOf(paramInt))).intValue();
      }
      int i = getItemViewTypeUnCached(paramInt);
      mViewTypeCache.put(Integer.valueOf(paramInt), Integer.valueOf(i));
      return i;
    }
    return -1;
  }
  
  public int getItemViewTypeUnCached(int paramInt)
  {
    return super.getItemViewType(paramInt);
  }
  
  void init(Context paramContext, Cursor paramCursor, int paramInt)
  {
    boolean bool = true;
    setHasStableIds(true);
    label28:
    int i;
    if ((paramInt & 0x1) == 1)
    {
      paramInt |= 0x2;
      mAutoRequery = true;
      if (paramCursor == null) {
        break label145;
      }
      mCursor = paramCursor;
      mDataValid = bool;
      mContext = paramContext;
      if (!bool) {
        break label151;
      }
      i = paramCursor.getColumnIndexOrThrow("_id");
      label59:
      mRowIDColumn = i;
      if ((paramInt & 0x2) != 2) {
        break label157;
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
      label145:
      bool = false;
      break label28;
      label151:
      i = -1;
      break label59;
      label157:
      mChangeObserver = null;
    }
  }
  
  protected void onContentChanged()
  {
    if ((mAutoRequery) && (mCursor != null) && (!mCursor.isClosed()))
    {
      Log.v("Cursor", "Auto requerying " + mCursor + " due to update");
      mDataValid = mCursor.requery();
    }
  }
  
  public Cursor swapCursor(Cursor paramCursor)
  {
    if (paramCursor == mCursor) {
      return null;
    }
    int i = getItemCount();
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
      clearCaches();
      notifyDataSetChanged();
      return localCursor;
    }
    mRowIDColumn = -1;
    mDataValid = false;
    clearCaches();
    notifyItemRangeRemoved(0, i);
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
      clearCaches();
      notifyDataSetChanged();
    }
    
    public void onInvalidated()
    {
      mDataValid = false;
      clearCaches();
      notifyItemRangeRemoved(0, getItemCount());
    }
  }
}
