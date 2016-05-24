package com.behance.sdk.mobeta.android.dslv;

import android.graphics.Bitmap;
import android.graphics.Point;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.widget.ImageView;
import android.widget.ListView;

public class SimpleFloatViewManager
  implements DragSortListView.FloatViewManager
{
  private int mFloatBGColor = -16777216;
  private Bitmap mFloatBitmap;
  private ImageView mImageView;
  private ListView mListView;
  
  public SimpleFloatViewManager(ListView paramListView)
  {
    mListView = paramListView;
  }
  
  public View onCreateFloatView(int paramInt)
  {
    View localView = mListView.getChildAt(mListView.getHeaderViewsCount() + paramInt - mListView.getFirstVisiblePosition());
    if (localView == null) {
      return null;
    }
    localView.setPressed(false);
    localView.setDrawingCacheEnabled(true);
    mFloatBitmap = Bitmap.createBitmap(localView.getDrawingCache());
    localView.setDrawingCacheEnabled(false);
    if (mImageView == null) {
      mImageView = new ImageView(mListView.getContext());
    }
    mImageView.setBackgroundColor(mFloatBGColor);
    mImageView.setPadding(0, 0, 0, 0);
    mImageView.setImageBitmap(mFloatBitmap);
    mImageView.setLayoutParams(new ViewGroup.LayoutParams(localView.getWidth(), localView.getHeight()));
    return mImageView;
  }
  
  public void onDestroyFloatView(View paramView)
  {
    ((ImageView)paramView).setImageDrawable(null);
    mFloatBitmap.recycle();
    mFloatBitmap = null;
  }
  
  public void onDragFloatView(View paramView, Point paramPoint1, Point paramPoint2) {}
  
  public void setBackgroundColor(int paramInt)
  {
    mFloatBGColor = paramInt;
  }
}
