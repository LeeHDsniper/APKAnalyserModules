package com.adobe.creativesdk.aviary.panels;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;
import com.adobe.android.ui.widget.AdobeAdapterView;
import com.adobe.android.ui.widget.AdobeAdapterView.OnItemClickListener;
import com.adobe.android.ui.widget.AdobeGalleryView;
import com.adobe.android.ui.widget.AdobeGalleryView.OnItemsScrollListener;
import com.adobe.android.ui.widget.VibrationWidget;
import com.adobe.creativesdk.aviary.graphics.CropDrawable;
import com.adobe.creativesdk.aviary.internal.AdobeImageEditorController;
import com.adobe.creativesdk.aviary.internal.content.ToolEntry;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory.Tools;
import com.adobe.creativesdk.aviary.internal.graphics.RectD;
import com.adobe.creativesdk.aviary.internal.headless.filters.impl.CropFilter;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaPointParameter;
import com.adobe.creativesdk.aviary.internal.os.AdobeImageAsyncTask;
import com.adobe.creativesdk.aviary.internal.services.ConfigService;
import com.adobe.creativesdk.aviary.internal.vo.EditToolResultVO;
import com.adobe.creativesdk.aviary.internal.vo.ToolActionVO;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.widget.AdobeImageHighlightImageButton;
import com.adobe.creativesdk.aviary.widget.CropImageView;
import com.adobe.creativesdk.aviary.widget.HighlightView;
import com.aviary.android.feather.sdk.R.array;
import com.aviary.android.feather.sdk.R.bool;
import com.aviary.android.feather.sdk.R.id;
import com.aviary.android.feather.sdk.R.integer;
import com.aviary.android.feather.sdk.R.layout;
import it.sephiroth.android.library.imagezoom.ImageViewTouch;
import it.sephiroth.android.library.imagezoom.ImageViewTouchBase.DisplayType;
import java.util.HashMap;
import org.json.JSONException;

public class CropPanel
  extends AbstractContentPanel
  implements AdobeAdapterView.OnItemClickListener, AdobeGalleryView.OnItemsScrollListener
{
  boolean isChecked = false;
  boolean mCanInvertRatio = false;
  String[] mCropNames;
  int[][] mCropValues;
  AdobeGalleryView mGallery;
  boolean mIsPortrait = true;
  int mSelectedPosition = 0;
  
  public CropPanel(AdobeImageEditorController paramAdobeImageEditorController, ToolEntry paramToolEntry)
  {
    super(paramAdobeImageEditorController, paramToolEntry);
  }
  
  private double calculateAspectRatio(int paramInt, boolean paramBoolean)
  {
    int[] arrayOfInt = mCropValues[paramInt];
    if (arrayOfInt.length == 2)
    {
      label34:
      int i;
      if (paramBoolean)
      {
        j = arrayOfInt[1];
        if (!paramBoolean) {
          break label116;
        }
        paramInt = arrayOfInt[0];
        i = j;
        if (j == -1)
        {
          if (!paramBoolean) {
            break label124;
          }
          i = mBitmap.getHeight();
        }
        label57:
        j = paramInt;
        if (paramInt == -1) {
          if (!paramBoolean) {
            break label136;
          }
        }
      }
      label116:
      label124:
      label136:
      for (int j = mBitmap.getWidth();; j = mBitmap.getHeight())
      {
        double d2 = 0.0D;
        double d1 = d2;
        if (i != 0)
        {
          d1 = d2;
          if (j != 0) {
            d1 = i / j;
          }
        }
        return d1;
        j = arrayOfInt[0];
        break;
        paramInt = arrayOfInt[1];
        break label34;
        i = mBitmap.getWidth();
        break label57;
      }
    }
    return 0.0D;
  }
  
  private void convertStringArrayToIntegerArray(String[] paramArrayOfString, int[][] paramArrayOfInt)
  {
    int i = 0;
    while (i < paramArrayOfString.length)
    {
      String[] arrayOfString = paramArrayOfString[i].split(":");
      paramArrayOfInt[i] = { Integer.parseInt(arrayOfString[0]), Integer.parseInt(arrayOfString[1]) };
      i += 1;
    }
  }
  
  private void createCropView(double paramDouble, boolean paramBoolean)
  {
    ((CropImageView)mImageView).setImageBitmap(mBitmap, paramDouble, paramBoolean);
  }
  
  private void invertRatios(String[] paramArrayOfString, int[][] paramArrayOfInt)
  {
    int i = 0;
    while (i < paramArrayOfString.length)
    {
      if (paramArrayOfString[i].contains(":"))
      {
        localObject = paramArrayOfString[i].split("[:]");
        paramArrayOfString[i] = (localObject[1] + ":" + localObject[0]);
      }
      Object localObject = paramArrayOfInt[i];
      int j = localObject[0];
      paramArrayOfInt[i] = { localObject[1], j };
      i += 1;
    }
  }
  
  private void setCustomRatio(double paramDouble, boolean paramBoolean)
  {
    mTrackingAttributes.put("aspect", String.valueOf(paramDouble));
    ((CropImageView)mImageView).setAspectRatio(paramDouble, paramBoolean);
  }
  
  protected View generateContentView(LayoutInflater paramLayoutInflater)
  {
    return paramLayoutInflater.inflate(R.layout.com_adobe_image_editor_content_crop, null);
  }
  
  protected ViewGroup generateOptionView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup)
  {
    return (ViewGroup)paramLayoutInflater.inflate(R.layout.com_adobe_image_bottombar_panel_spot, paramViewGroup, false);
  }
  
  public void onActivate()
  {
    boolean bool = false;
    super.onActivate();
    disableHapticIsNecessary(new VibrationWidget[] { mGallery });
    mGallery.setOnItemsScrollListener(this);
    mGallery.setOnItemClickListener(this);
    double d = calculateAspectRatio(mGallery.getSelectedItemPosition(), false);
    if (d != 0.0D) {
      bool = true;
    }
    createCropView(d, bool);
    contentReady();
    setIsChanged(true);
  }
  
  public void onCreate(Bitmap paramBitmap, Bundle paramBundle)
  {
    super.onCreate(paramBitmap, paramBundle);
    paramBundle = (ConfigService)getContext().getService(ConfigService.class);
    mFilter = ToolLoaderFactory.get(ToolLoaderFactory.Tools.CROP);
    mCropNames = paramBundle.getStringArray(R.array.com_adobe_image_editor_crop_labels);
    String[] arrayOfString = paramBundle.getStringArray(R.array.com_adobe_image_editor_crop_values);
    mCropValues = new int[arrayOfString.length][];
    convertStringArrayToIntegerArray(arrayOfString, mCropValues);
    mCanInvertRatio = paramBundle.getBoolean(R.bool.com_adobe_image_editor_crop_invert_policy);
    if (mCanInvertRatio)
    {
      if (paramBitmap.getHeight() <= paramBitmap.getWidth()) {
        break label292;
      }
      mIsPortrait = true;
      if (mIsPortrait) {
        invertRatios(mCropNames, mCropValues);
      }
    }
    mSelectedPosition = paramBundle.getInteger(R.integer.com_adobe_image_editor_crop_selected);
    mImageView = ((CropImageView)getContentView().findViewById(R.id.image));
    mImageView.setDoubleTapEnabled(false);
    mImageView.setScaleEnabled(true);
    mImageView.setScrollEnabled(true);
    mImageView.setDisplayType(ImageViewTouchBase.DisplayType.FIT_IF_BIGGER);
    mGallery = ((AdobeGalleryView)getOptionView().findViewById(R.id.gallery));
    mGallery.setDefaultPosition(mSelectedPosition);
    mGallery.setCallbackDuringFling(false);
    mGallery.setAutoSelectChild(false);
    if (getContext().hasAccentColor()) {}
    for (int i = getContext().getAccentColor(0);; i = 0)
    {
      mGallery.setAdapter(new GalleryAdapter(getContext().getBaseContext(), mCropNames, mCropValues, i));
      mGallery.setSelection(mSelectedPosition, false, true);
      return;
      label292:
      mIsPortrait = false;
      break;
    }
  }
  
  public void onDeactivate()
  {
    super.onDeactivate();
    mGallery.setOnItemsScrollListener(null);
    mGallery.setOnItemClickListener(null);
  }
  
  public void onDestroy()
  {
    mImageView.clear();
    ((CropImageView)mImageView).setOnHighlightSingleTapUpConfirmedListener(null);
    super.onDestroy();
  }
  
  protected void onGenerateResult()
  {
    new GenerateResultTask(new RectD(((CropImageView)mImageView).getHighlightView().getCropRectD())).execute(new Bitmap[] { mBitmap });
  }
  
  public void onItemClick(AdobeAdapterView<?> paramAdobeAdapterView, View paramView, int paramInt, long paramLong)
  {
    if (mCanInvertRatio)
    {
      paramAdobeAdapterView = mCropValues[paramInt];
      if ((paramAdobeAdapterView[0] != paramAdobeAdapterView[1]) && (paramAdobeAdapterView[0] != -1)) {}
    }
    else
    {
      return;
    }
    if (!isChecked) {}
    for (boolean bool = true;; bool = false)
    {
      isChecked = bool;
      paramAdobeAdapterView = (CropImageView)mImageView;
      double d2 = paramAdobeAdapterView.getAspectRatio();
      paramView = paramAdobeAdapterView.getHighlightView();
      double d1 = d2;
      if (!paramAdobeAdapterView.getAspectRatioIsFixed())
      {
        d1 = d2;
        if (paramView != null) {
          d1 = paramView.getDrawRect().width() / paramView.getDrawRect().height();
        }
      }
      paramAdobeAdapterView.setAspectRatio(1.0D / d1, paramAdobeAdapterView.getAspectRatioIsFixed());
      invertRatios(mCropNames, mCropValues);
      mGallery.invalidateViews();
      mTrackingAttributes.put("aspect", String.valueOf(d1));
      return;
    }
  }
  
  public void onScroll(AdobeAdapterView<?> paramAdobeAdapterView, View paramView, int paramInt, long paramLong) {}
  
  public void onScrollFinished(AdobeAdapterView<?> paramAdobeAdapterView, View paramView, int paramInt, long paramLong)
  {
    boolean bool = false;
    if (paramInt == mSelectedPosition) {
      return;
    }
    mSelectedPosition = paramInt;
    double d = calculateAspectRatio(paramInt, false);
    if (d != 0.0D) {
      bool = true;
    }
    setCustomRatio(d, bool);
  }
  
  public void onScrollStarted(AdobeAdapterView<?> paramAdobeAdapterView, View paramView, int paramInt, long paramLong) {}
  
  private class GalleryAdapter
    extends BaseAdapter
  {
    private String[] mLabels;
    LayoutInflater mLayoutInflater;
    Resources mRes;
    private final int mSwatch;
    private final int[][] mValues;
    
    public GalleryAdapter(Context paramContext, String[] paramArrayOfString, int[][] paramArrayOfInt, int paramInt)
    {
      mLayoutInflater = LayoutInflater.from(paramContext);
      mLabels = paramArrayOfString;
      mValues = paramArrayOfInt;
      mSwatch = paramInt;
      mRes = paramContext.getResources();
    }
    
    public int getCount()
    {
      return mLabels.length;
    }
    
    public Object getItem(int paramInt)
    {
      return mLabels[paramInt];
    }
    
    public long getItemId(int paramInt)
    {
      return 0L;
    }
    
    public int getItemViewType(int paramInt)
    {
      if ((paramInt >= 0) && (paramInt < getCount())) {}
      for (paramInt = 1; paramInt != 0; paramInt = 0) {
        return 1;
      }
      return 0;
    }
    
    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      int i = getItemViewType(paramInt);
      CropPanel.ViewHolder localViewHolder = null;
      paramViewGroup = null;
      View localView;
      if (paramView == null) {
        if (i != 0)
        {
          localView = mLayoutInflater.inflate(R.layout.com_adobe_image_bottombar_crop_item_layout, mGallery, false);
          paramViewGroup = new CropDrawable(getContext().getBaseContext());
          if (mSwatch != 0) {
            paramViewGroup.setSelectedTint(mSwatch);
          }
          localViewHolder = new CropPanel.ViewHolder(null);
          textView = ((TextView)localView.findViewById(16908308));
          imageView = ((AdobeImageHighlightImageButton)localView.findViewById(16908294));
          imageView.setImageDrawable(paramViewGroup);
          localView.setTag(localViewHolder);
        }
      }
      for (;;)
      {
        if (i != 0)
        {
          paramView = (String)getItem(paramInt);
          int[] arrayOfInt = mValues[paramInt];
          logger.verbose("ischecked: %b", new Object[] { Boolean.valueOf(isChecked) });
          textView.setText(paramView);
          paramViewGroup.setRatio(arrayOfInt);
          imageView.setChecked(isChecked);
        }
        localView.setId(paramInt);
        return localView;
        localView = mLayoutInflater.inflate(R.layout.com_adobe_image_gallery_item_view, mGallery, false);
        localView.setVisibility(4);
        continue;
        localView = paramView;
        if (i != 0)
        {
          localViewHolder = (CropPanel.ViewHolder)paramView.getTag();
          paramViewGroup = (CropDrawable)imageView.getDrawable();
          localView = paramView;
        }
      }
    }
    
    public int getViewTypeCount()
    {
      return 2;
    }
  }
  
  class GenerateResultTask
    extends AdobeImageAsyncTask<Bitmap, Void, Bitmap>
  {
    MoaActionList mActionList;
    RectD mCropRect;
    
    public GenerateResultTask(RectD paramRectD)
    {
      mCropRect = paramRectD;
    }
    
    protected Bitmap doInBackground(Bitmap... paramVarArgs)
    {
      Object localObject = paramVarArgs[0];
      double d1 = ((Bitmap)localObject).getWidth();
      double d2 = ((Bitmap)localObject).getHeight();
      localObject = new MoaPointParameter();
      ((MoaPointParameter)localObject).setValue((int)mCropRect.left, (int)mCropRect.top);
      MoaPointParameter localMoaPointParameter1 = new MoaPointParameter();
      localMoaPointParameter1.setValue((int)mCropRect.width(), (int)mCropRect.height());
      MoaPointParameter localMoaPointParameter2 = new MoaPointParameter(d1, d2);
      ((CropFilter)mFilter).setTopLeft((MoaPointParameter)localObject);
      ((CropFilter)mFilter).setSize(localMoaPointParameter1);
      ((CropFilter)mFilter).setPreviewSize(localMoaPointParameter2);
      mActionList = ((MoaActionList)((CropFilter)mFilter).getActions().clone());
      try
      {
        localObject = ((CropFilter)mFilter).execute(paramVarArgs[0], null, 1, 1);
        return localObject;
      }
      catch (JSONException localJSONException)
      {
        localJSONException.printStackTrace();
      }
      return paramVarArgs[0];
    }
    
    protected void doPostExecute(Bitmap paramBitmap)
    {
      onProgressEnd();
      ((CropImageView)mImageView).setImageBitmap(paramBitmap, ((CropImageView)mImageView).getAspectRatio(), ((CropImageView)mImageView).getAspectRatioIsFixed());
      ((CropImageView)mImageView).setHighlightView(null);
      mEditResult.setActionList(mActionList);
      mEditResult.setToolAction(new ToolActionVO());
      onComplete(paramBitmap);
    }
    
    protected void doPreExecute()
    {
      onProgressStart();
    }
  }
  
  private static final class ViewHolder
  {
    AdobeImageHighlightImageButton imageView;
    TextView textView;
    
    private ViewHolder() {}
  }
}
