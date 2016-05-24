package org.lucasr.twowayview;

import android.support.v7.widget.RecyclerView;
import android.view.View;
import com.adobe.creativesdk.foundation.assets.R.id;

public class ItemClickSupport
{
  private OnItemClickListener mItemClickListener;
  private OnItemLongClickListener mItemLongClickListener;
  private final RecyclerView mRecyclerView;
  private final TouchListener mTouchListener;
  
  private ItemClickSupport(RecyclerView paramRecyclerView)
  {
    mRecyclerView = paramRecyclerView;
    mTouchListener = new TouchListener(paramRecyclerView);
    paramRecyclerView.addOnItemTouchListener(mTouchListener);
  }
  
  public static ItemClickSupport addTo(RecyclerView paramRecyclerView)
  {
    ItemClickSupport localItemClickSupport2 = from(paramRecyclerView);
    ItemClickSupport localItemClickSupport1 = localItemClickSupport2;
    if (localItemClickSupport2 == null)
    {
      localItemClickSupport1 = new ItemClickSupport(paramRecyclerView);
      paramRecyclerView.setTag(R.id.twowayview_item_click_support, localItemClickSupport1);
    }
    return localItemClickSupport1;
  }
  
  public static ItemClickSupport from(RecyclerView paramRecyclerView)
  {
    if (paramRecyclerView == null) {
      return null;
    }
    return (ItemClickSupport)paramRecyclerView.getTag(R.id.twowayview_item_click_support);
  }
  
  public void setOnItemClickListener(OnItemClickListener paramOnItemClickListener)
  {
    mItemClickListener = paramOnItemClickListener;
  }
  
  public void setOnItemLongClickListener(OnItemLongClickListener paramOnItemLongClickListener)
  {
    if (!mRecyclerView.isLongClickable()) {
      mRecyclerView.setLongClickable(true);
    }
    mItemLongClickListener = paramOnItemLongClickListener;
  }
  
  public static abstract interface OnItemClickListener
  {
    public abstract void onItemClick(RecyclerView paramRecyclerView, View paramView, int paramInt, long paramLong);
  }
  
  public static abstract interface OnItemLongClickListener
  {
    public abstract boolean onItemLongClick(RecyclerView paramRecyclerView, View paramView, int paramInt, long paramLong);
  }
  
  private class TouchListener
    extends ClickItemTouchListener
  {
    TouchListener(RecyclerView paramRecyclerView)
    {
      super();
    }
    
    boolean performItemClick(RecyclerView paramRecyclerView, View paramView, int paramInt, long paramLong)
    {
      boolean bool = false;
      if (mItemClickListener != null)
      {
        paramView.playSoundEffect(0);
        mItemClickListener.onItemClick(paramRecyclerView, paramView, paramInt, paramLong);
        bool = true;
      }
      return bool;
    }
    
    boolean performItemLongClick(RecyclerView paramRecyclerView, View paramView, int paramInt, long paramLong)
    {
      boolean bool = false;
      if (mItemLongClickListener != null)
      {
        paramView.performHapticFeedback(0);
        bool = mItemLongClickListener.onItemLongClick(paramRecyclerView, paramView, paramInt, paramLong);
      }
      return bool;
    }
  }
}
