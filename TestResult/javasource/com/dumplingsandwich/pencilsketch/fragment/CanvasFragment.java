package com.dumplingsandwich.pencilsketch.fragment;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import com.dumplingsandwich.pencilsketch.activities.CanvasActivity;

public class CanvasFragment
  extends Fragment
{
  private int mImageNum;
  private ImageView mImageView;
  
  public CanvasFragment() {}
  
  public static CanvasFragment newInstance(int paramInt)
  {
    CanvasFragment localCanvasFragment = new CanvasFragment();
    Bundle localBundle = new Bundle();
    localBundle.putInt("resId", paramInt);
    localCanvasFragment.setArguments(localBundle);
    return localCanvasFragment;
  }
  
  public void onActivityCreated(Bundle paramBundle)
  {
    super.onActivityCreated(paramBundle);
    if (CanvasActivity.class.isInstance(getActivity()))
    {
      int i = CanvasActivity.imageResIds[mImageNum].intValue();
      ((CanvasActivity)getActivity()).loadBitmap(i, mImageView);
    }
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    if (getArguments() != null) {}
    for (int i = getArguments().getInt("resId");; i = -1)
    {
      mImageNum = i;
      return;
    }
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    paramLayoutInflater = paramLayoutInflater.inflate(2130903274, paramViewGroup, false);
    mImageView = ((ImageView)paramLayoutInflater.findViewById(2131689674));
    return paramLayoutInflater;
  }
}
