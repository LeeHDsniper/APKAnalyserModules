package com.adobe.creativesdk.foundation.internal.utils;

import android.app.Dialog;
import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.assets.R.dimen;
import com.adobe.creativesdk.foundation.assets.R.drawable;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.assets.R.style;
import java.util.ArrayList;
import java.util.Collections;

public abstract class AdobeLongClickBaseDialogFragment
  extends DialogFragment
{
  private Dialog _currentDialog;
  private String assetName;
  private Context context;
  private ArrayList<AdobeLongClickMenuItem> longClickMenuItems;
  private ViewGroup menuContainer;
  private int startPriority;
  private String tag;
  
  public AdobeLongClickBaseDialogFragment(Context paramContext, String paramString)
  {
    context = paramContext;
    assetName = paramString;
    longClickMenuItems = new ArrayList();
  }
  
  private void addCommonMenuItems()
  {
    longClickMenuItems.add(getSaveToDevice());
  }
  
  private void addItemsToMenuView()
  {
    Collections.sort(longClickMenuItems);
    final int i = 0;
    while (i < longClickMenuItems.size())
    {
      LinearLayout localLinearLayout = new LinearLayout(getActivity());
      Object localObject = new LinearLayout.LayoutParams(-1, 120);
      gravity = 16;
      localLinearLayout.setOrientation(0);
      localLinearLayout.setLayoutParams((ViewGroup.LayoutParams)localObject);
      localObject = new CreativeSDKTextView(getActivity());
      ((CreativeSDKTextView)localObject).setLayoutParams(new LinearLayout.LayoutParams(-2, -2));
      ((CreativeSDKTextView)localObject).setTextSize(20.0F);
      ((CreativeSDKTextView)localObject).setText(((AdobeLongClickMenuItem)longClickMenuItems.get(i)).getItemName());
      ImageView localImageView = new ImageView(getActivity());
      LinearLayout.LayoutParams localLayoutParams = new LinearLayout.LayoutParams(getSizeFromResource(R.dimen.adobe_asset_edit_dialog_fragment_image_height), getSizeFromResource(R.dimen.adobe_asset_edit_dialog_fragment_image_height));
      localLayoutParams.setMargins(0, 0, getSizeFromResource(R.dimen.adobe_asset_edit_dialog_fragment_margin_left), 0);
      localImageView.setLayoutParams(localLayoutParams);
      localImageView.setImageDrawable(((AdobeLongClickMenuItem)longClickMenuItems.get(i)).getItemIcon());
      localLinearLayout.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          longClickMenuItems.get(i)).listener.handleClick();
        }
      });
      localLinearLayout.addView(localImageView);
      localLinearLayout.addView((View)localObject);
      menuContainer.addView(localLinearLayout);
      i += 1;
    }
  }
  
  private AdobeLongClickMenuItem getSaveToDevice()
  {
    new AdobeLongClickMenuItem("Save To Device", getContext().getResources().getDrawable(R.drawable.ic_forum_black_24dp), startPriority, new IAdobeLongMenuItemClickListener()
    {
      public void handleClick()
      {
        handleExportClick();
      }
    });
  }
  
  private int getSizeFromResource(int paramInt)
  {
    return (int)getContext().getResources().getDimension(paramInt);
  }
  
  public void addCustomMenuItems(ArrayList<AdobeLongClickMenuItem> paramArrayList)
  {
    int i = 0;
    while (i < paramArrayList.size())
    {
      longClickMenuItems.add(paramArrayList.get(i));
      i += 1;
    }
  }
  
  public void endDialogFragment()
  {
    if (_currentDialog != null) {
      _currentDialog.dismiss();
    }
  }
  
  public Context getContext()
  {
    return context;
  }
  
  protected abstract void handleExportClick();
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setStyle(0, R.style.TransparentDialog);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    paramLayoutInflater = paramLayoutInflater.inflate(R.layout.adobe_asset_long_click_banner_dialogview, paramViewGroup);
    tag = paramLayoutInflater.findViewById(R.id.adobe_asset_view_long_click_main_container).getTag().toString();
    menuContainer = ((ViewGroup)paramLayoutInflater.findViewById(R.id.long_click_menu_container));
    ((TextView)paramLayoutInflater.findViewById(R.id.asset_long_click_name)).setText(assetName);
    addCommonMenuItems();
    addItemsToMenuView();
    _currentDialog = getDialog();
    getDialog().getWindow().requestFeature(1);
    getDialog().getWindow().setFlags(268435456, 268435456);
    return paramLayoutInflater;
  }
  
  public void onResume()
  {
    super.onResume();
    Window localWindow = getDialog().getWindow();
    if (tag.equals("NORMAL"))
    {
      localWindow.setLayout(-1, -2);
      localWindow.setGravity(80);
    }
  }
  
  public void setStartPriority(int paramInt)
  {
    startPriority = paramInt;
  }
}
