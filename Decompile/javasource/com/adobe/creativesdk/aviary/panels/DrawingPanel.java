package com.adobe.creativesdk.aviary.panels;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BlurMaskFilter;
import android.graphics.BlurMaskFilter.Blur;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Cap;
import android.graphics.Paint.Join;
import android.graphics.Paint.Style;
import android.graphics.PointF;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.os.Bundle;
import android.support.v7.graphics.Palette;
import android.support.v7.graphics.Palette.Swatch;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Adapter;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import com.adobe.android.ui.widget.AdobeAdapterView;
import com.adobe.android.ui.widget.AdobeGalleryView;
import com.adobe.android.ui.widget.AdobeGalleryView.OnItemsScrollListener;
import com.adobe.android.ui.widget.VibrationWidget;
import com.adobe.creativesdk.aviary.graphics.PreviewSpotDrawable;
import com.adobe.creativesdk.aviary.internal.AdobeImageEditorController;
import com.adobe.creativesdk.aviary.internal.content.ToolEntry;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory.Tools;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaAction;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionFactory;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaGraphicsCommandParameter;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaGraphicsOperationParameter;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaPointParameter;
import com.adobe.creativesdk.aviary.internal.services.ConfigService;
import com.adobe.creativesdk.aviary.internal.services.LocalDataService;
import com.adobe.creativesdk.aviary.internal.tracking.AdobeImageAnalyticsTracker;
import com.adobe.creativesdk.aviary.internal.utils.BitmapUtils;
import com.adobe.creativesdk.aviary.internal.utils.ImageInfo;
import com.adobe.creativesdk.aviary.internal.vo.EditToolResultVO;
import com.adobe.creativesdk.aviary.internal.vo.ToolActionVO;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.widget.ImageViewTouchAndDraw;
import com.adobe.creativesdk.aviary.widget.ImageViewTouchAndDraw.OnDrawPathListener;
import com.adobe.creativesdk.aviary.widget.ImageViewTouchAndDraw.OnDrawStartListener;
import com.adobe.creativesdk.aviary.widget.ImageViewTouchAndDraw.TouchMode;
import com.aviary.android.feather.sdk.R.array;
import com.aviary.android.feather.sdk.R.bool;
import com.aviary.android.feather.sdk.R.drawable;
import com.aviary.android.feather.sdk.R.id;
import com.aviary.android.feather.sdk.R.integer;
import com.aviary.android.feather.sdk.R.layout;
import com.aviary.android.feather.sdk.R.string;
import it.sephiroth.android.library.imagezoom.ImageViewTouch;
import it.sephiroth.android.library.imagezoom.ImageViewTouchBase.DisplayType;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Locale;
import org.apache.commons.lang3.ArrayUtils;

public class DrawingPanel
  extends AbstractContentPanel
  implements View.OnClickListener, ImageViewTouchAndDraw.OnDrawPathListener, ImageViewTouchAndDraw.OnDrawStartListener
{
  private int mAccentColor;
  MoaAction mAction;
  MoaActionList mActionList;
  private int mBlur = 1;
  private int mBrushColorIndex;
  int[] mBrushColors;
  private int mBrushSizeIndex;
  int[] mBrushSizes;
  private int mColor = 0;
  private ConfigService mConfig;
  MoaGraphicsOperationParameter mCurrentOperation;
  protected AdobeGalleryView mGalleryColor;
  protected AdobeGalleryView mGallerySize;
  int mHeight;
  protected ImageView mLensButton;
  Collection<MoaGraphicsOperationParameter> mOperations;
  private Paint mPaint;
  private DrawinTool mSelectedTool;
  private int mSize = 10;
  ToolActionVO<Integer> mToolAction;
  int mWidth;
  private int maxBrushSize;
  private float maxRadiusSize;
  private int minBrushSize;
  private float minRadiusSize;
  
  public DrawingPanel(AdobeImageEditorController paramAdobeImageEditorController, ToolEntry paramToolEntry)
  {
    super(paramAdobeImageEditorController, paramToolEntry);
  }
  
  private DrawinTool getSelectedTool()
  {
    return mSelectedTool;
  }
  
  private Paint initPaint(Paint paramPaint)
  {
    paramPaint.setDither(true);
    paramPaint.setAntiAlias(true);
    paramPaint.setFilterBitmap(false);
    paramPaint.setColor(mColor);
    paramPaint.setStrokeWidth(mSize * 2);
    paramPaint.setStyle(Paint.Style.STROKE);
    paramPaint.setStrokeJoin(Paint.Join.ROUND);
    paramPaint.setStrokeCap(Paint.Cap.ROUND);
    paramPaint.setMaskFilter(new BlurMaskFilter(mBlur, BlurMaskFilter.Blur.NORMAL));
    return paramPaint;
  }
  
  private void resetBitmap()
  {
    getContext().getCurrentImageViewMatrix();
    mImageView.setImageBitmap(mBitmap, null, -1.0F, 8.0F);
    ((ImageViewTouchAndDraw)mImageView).setDrawMode(ImageViewTouchAndDraw.TouchMode.DRAW);
  }
  
  private void setSelectedTool(DrawinTool paramDrawinTool)
  {
    switch (3.$SwitchMap$com$adobe$creativesdk$aviary$panels$DrawingPanel$DrawinTool[paramDrawinTool.ordinal()])
    {
    default: 
      if (paramDrawinTool == DrawinTool.Zoom)
      {
        mLensButton.setImageState(new int[] { 16842912 }, true);
        label59:
        if (paramDrawinTool == DrawinTool.Zoom) {
          break label233;
        }
      }
      break;
    }
    label233:
    for (boolean bool = true;; bool = false)
    {
      setPanelEnabled(bool);
      mSelectedTool = paramDrawinTool;
      return;
      ((ImageViewTouchAndDraw)mImageView).setDrawMode(ImageViewTouchAndDraw.TouchMode.DRAW);
      mPaint.setAlpha(255);
      mPaint.setXfermode(null);
      break;
      ((ImageViewTouchAndDraw)mImageView).setDrawMode(ImageViewTouchAndDraw.TouchMode.DRAW);
      mPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.CLEAR));
      mPaint.setAlpha(0);
      getContext().getTracker().tagEvent(ToolLoaderFactory.Tools.DRAW.name().toLowerCase(Locale.US) + ": eraser_selected");
      break;
      ((ImageViewTouchAndDraw)mImageView).setDrawMode(ImageViewTouchAndDraw.TouchMode.IMAGE);
      break;
      mLensButton.setImageState(new int[] { -16842912 }, false);
      break label59;
    }
  }
  
  private void setupFill()
  {
    mGalleryColor.setDefaultPosition(mBrushColorIndex);
    mGalleryColor.setCallbackDuringFling(true);
    mGalleryColor.setAutoSelectChild(true);
    mGalleryColor.setAdapter(new GalleryColorAdapter(getContext().getBaseContext(), mBrushColors));
  }
  
  private void setupSize()
  {
    mGallerySize.setDefaultPosition(mBrushSizeIndex);
    mGallerySize.setCallbackDuringFling(true);
    mGallerySize.setAutoSelectChild(true);
    BlemishPanel.GalleryAdapter localGalleryAdapter = new BlemishPanel.GalleryAdapter(getContext().getBaseContext(), mBrushSizes);
    localGalleryAdapter.setSelectedPosition(mBrushSizeIndex);
    localGalleryAdapter.setMinBrushSize(minBrushSize);
    localGalleryAdapter.setMaxBrushSize(maxBrushSize);
    localGalleryAdapter.setMinRadiusSize(minRadiusSize);
    localGalleryAdapter.setMaxRadiusSize(maxRadiusSize);
    localGalleryAdapter.setAccentColor(mAccentColor);
    mGallerySize.setAdapter(localGalleryAdapter);
  }
  
  @SuppressLint({"InflateParams"})
  protected View generateContentView(LayoutInflater paramLayoutInflater)
  {
    return paramLayoutInflater.inflate(R.layout.com_adobe_image_editor_content_draw, null);
  }
  
  protected ViewGroup generateOptionView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup)
  {
    return (ViewGroup)paramLayoutInflater.inflate(R.layout.com_adobe_image_bottombar_panel_draw, paramViewGroup, false);
  }
  
  public void onActivate()
  {
    super.onActivate();
    disableHapticIsNecessary(new VibrationWidget[] { mGalleryColor, mGallerySize });
    mGallerySize.setOnItemsScrollListener(new AdobeGalleryView.OnItemsScrollListener()
    {
      public void onScroll(AdobeAdapterView<?> paramAnonymousAdobeAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong) {}
      
      public void onScrollFinished(AdobeAdapterView<?> paramAnonymousAdobeAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
      {
        DrawingPanel.access$002(DrawingPanel.this, Math.max(4, mBrushSizes[paramAnonymousInt]));
        mPaint.setStrokeWidth(mSize * 2);
        if (mGalleryColor.getAdapter().getItemViewType(mGalleryColor.getSelectedItemPosition()) == 2) {
          DrawingPanel.this.setSelectedTool(DrawingPanel.DrawinTool.Erase);
        }
        for (;;)
        {
          if (mCurrentOperation != null)
          {
            paramAnonymousAdobeAdapterView = mCurrentOperation.getLastCommand();
            if (paramAnonymousAdobeAdapterView != null)
            {
              paramAnonymousAdobeAdapterView = paramAnonymousAdobeAdapterView.getPoint();
              onEnd();
              onStart();
              onMoveTo(x, y);
              onLineTo(x, y);
            }
          }
          return;
          DrawingPanel.this.setSelectedTool(DrawingPanel.DrawinTool.Draw);
        }
      }
      
      public void onScrollStarted(AdobeAdapterView<?> paramAnonymousAdobeAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
      {
        if (DrawingPanel.this.getSelectedTool() == DrawingPanel.DrawinTool.Zoom) {
          DrawingPanel.this.setSelectedTool(DrawingPanel.DrawinTool.Draw);
        }
      }
    });
    mGalleryColor.setOnItemsScrollListener(new AdobeGalleryView.OnItemsScrollListener()
    {
      public void onScroll(AdobeAdapterView<?> paramAnonymousAdobeAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong) {}
      
      public void onScrollFinished(AdobeAdapterView<?> paramAnonymousAdobeAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
      {
        DrawingPanel.access$402(DrawingPanel.this, mBrushColors[paramAnonymousInt]);
        mPaint.setColor(mColor);
        if (mColor == 0)
        {
          paramAnonymousInt = 1;
          if (DrawingPanel.this.getSelectedTool() != DrawingPanel.DrawinTool.Zoom) {
            break label166;
          }
          if (paramAnonymousInt == 0) {
            break label153;
          }
          DrawingPanel.this.setSelectedTool(DrawingPanel.DrawinTool.Erase);
        }
        for (;;)
        {
          if (mCurrentOperation != null)
          {
            paramAnonymousAdobeAdapterView = mCurrentOperation.getLastCommand();
            if (paramAnonymousAdobeAdapterView != null)
            {
              paramAnonymousAdobeAdapterView = paramAnonymousAdobeAdapterView.getPoint();
              onEnd();
              onStart();
              onMoveTo(x, y);
              onLineTo(x, y);
            }
          }
          return;
          paramAnonymousInt = 0;
          break;
          label153:
          DrawingPanel.this.setSelectedTool(DrawingPanel.DrawinTool.Draw);
          continue;
          label166:
          if ((paramAnonymousInt != 0) && (DrawingPanel.this.getSelectedTool() != DrawingPanel.DrawinTool.Erase)) {
            DrawingPanel.this.setSelectedTool(DrawingPanel.DrawinTool.Erase);
          } else if ((paramAnonymousInt == 0) && (DrawingPanel.this.getSelectedTool() != DrawingPanel.DrawinTool.Draw)) {
            DrawingPanel.this.setSelectedTool(DrawingPanel.DrawinTool.Draw);
          }
        }
      }
      
      public void onScrollStarted(AdobeAdapterView<?> paramAnonymousAdobeAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
      {
        if (DrawingPanel.this.getSelectedTool() == DrawingPanel.DrawinTool.Zoom) {
          DrawingPanel.this.setSelectedTool(DrawingPanel.DrawinTool.Draw);
        }
      }
    });
    mLensButton.setOnClickListener(this);
    setSelectedTool(DrawinTool.Draw);
    ((ImageViewTouchAndDraw)mImageView).setOnDrawStartListener(this);
    ((ImageViewTouchAndDraw)mImageView).setOnDrawPathListener(this);
    getContentView().setVisibility(0);
    contentReady();
  }
  
  public void onClick(View paramView)
  {
    if (paramView.getId() == mLensButton.getId()) {
      if (paramView.isSelected()) {
        break label110;
      }
    }
    label110:
    for (boolean bool = true;; bool = false)
    {
      paramView.setSelected(bool);
      logger.info("isSelected: " + paramView.isSelected());
      logger.info("selectedToolPos: " + mGalleryColor.getSelectedItemPosition());
      if (!paramView.isSelected()) {
        break;
      }
      setSelectedTool(DrawinTool.Zoom);
      return;
    }
    if (mGalleryColor.getSelectedItemPosition() == 0)
    {
      setSelectedTool(DrawinTool.Erase);
      return;
    }
    setSelectedTool(DrawinTool.Draw);
  }
  
  public void onCreate(Bitmap paramBitmap, Bundle paramBundle)
  {
    super.onCreate(paramBitmap, paramBundle);
    mConfig = ((ConfigService)getContext().getService(ConfigService.class));
    minRadiusSize = (mConfig.getInteger(R.integer.com_adobe_image_editor_gallery_drawable_min_size) / 100.0F);
    maxRadiusSize = (mConfig.getInteger(R.integer.com_adobe_image_editor_gallery_drawable_max_size) / 100.0F);
    mBrushSizes = mConfig.getIntArray(R.array.com_adobe_image_editor_draw_brush_sizes);
    mBrushSizeIndex = mConfig.getInteger(R.integer.com_adobe_image_editor_draw_brush_size_selected);
    mBrushColors = mConfig.getIntArray(R.array.com_adobe_image_editor_draw_fill_colors);
    mBrushColorIndex = mConfig.getInteger(R.integer.com_adobe_image_editor_draw_fill_color_selected);
    minBrushSize = mBrushSizes[0];
    maxBrushSize = mBrushSizes[(mBrushSizes.length - 1)];
    mBlur = mConfig.getInteger(R.integer.com_adobe_image_editor_draw_brush_softValue);
    mColor = mBrushColors[mBrushColorIndex];
    mSize = mBrushSizes[mBrushSizeIndex];
    mLensButton = ((ImageView)getContentView().findViewById(R.id.lens));
    mGallerySize = ((AdobeGalleryView)getOptionView().findViewById(R.id.gallery));
    mGalleryColor = ((AdobeGalleryView)getOptionView().findViewById(R.id.gallery2));
    mImageView = ((ImageViewTouchAndDraw)getContentView().findViewById(R.id.image));
    mImageView.setDisplayType(ImageViewTouchBase.DisplayType.FIT_IF_BIGGER);
    mWidth = mBitmap.getWidth();
    mHeight = mBitmap.getHeight();
    resetBitmap();
    mOperations = new ArrayList();
    mCurrentOperation = null;
    mActionList = MoaActionFactory.actionList(new String[] { "draw" });
    mToolAction = new ToolActionVO(Integer.valueOf(0));
    mAction = mActionList.get(0);
    mAction.setValue("previewSize", new MoaPointParameter(mWidth, mHeight));
    mAction.setValue("commands", mOperations);
    if (mConfig.getBoolean(R.bool.com_adobe_image_editor_draw_panels_use_palette))
    {
      paramBitmap = (LocalDataService)getContext().getService(LocalDataService.class);
      if (paramBitmap != null)
      {
        paramBitmap = paramBitmap.getImageInfo();
        if ((paramBitmap != null) && (paramBitmap.getPalette() != null))
        {
          paramBitmap = paramBitmap.getPalette().getSwatches();
          paramBundle = new int[paramBitmap.size()];
          int i = 0;
          while (i < paramBitmap.size())
          {
            paramBundle[i] = ((Palette.Swatch)paramBitmap.get(i)).getRgb();
            i += 1;
          }
          mBrushColors = ArrayUtils.addAll(paramBundle, mBrushColors);
          mBrushColorIndex += paramBundle.length;
        }
      }
    }
    if (mConfig.getBoolean(R.bool.com_adobe_image_editor_draw_has_eraser))
    {
      mBrushColors = ArrayUtils.add(mBrushColors, 0);
      mBrushColors = ArrayUtils.add(mBrushColors, 0, 0);
      mBrushColorIndex += 1;
    }
    if (getContext().hasAccentColor()) {}
    for (mAccentColor = getContext().getAccentColor(0);; mAccentColor = 0)
    {
      setupFill();
      setupSize();
      mPaint = initPaint(((ImageViewTouchAndDraw)mImageView).getPaint());
      ((ImageViewTouchAndDraw)mImageView).setPaint(mPaint);
      return;
    }
  }
  
  public void onDeactivate()
  {
    ((ImageViewTouchAndDraw)mImageView).setOnDrawStartListener(null);
    ((ImageViewTouchAndDraw)mImageView).setOnDrawPathListener(null);
    mLensButton.setOnClickListener(null);
    mGalleryColor.setOnItemsScrollListener(null);
    mGallerySize.setOnItemsScrollListener(null);
    super.onDeactivate();
  }
  
  public void onDestroy()
  {
    super.onDestroy();
    mImageView.clear();
  }
  
  public void onDrawStart()
  {
    setIsChanged(true);
  }
  
  public void onEnd()
  {
    logger.info("onEnd");
    if (mCurrentOperation != null)
    {
      mOperations.add(mCurrentOperation);
      mCurrentOperation = null;
    }
  }
  
  protected void onGenerateResult()
  {
    if (!mBitmap.isMutable()) {}
    for (Bitmap localBitmap = BitmapUtils.copy(mBitmap, mBitmap.getConfig());; localBitmap = mBitmap)
    {
      Canvas localCanvas = new Canvas(localBitmap);
      ((ImageViewTouchAndDraw)mImageView).commit(localCanvas);
      mImageView.setImageBitmap(localBitmap, mImageView.getDisplayMatrix(), -1.0F, -1.0F);
      mEditResult.setToolAction(mToolAction);
      mEditResult.setActionList(mActionList);
      onComplete(localBitmap);
      return;
    }
  }
  
  public void onLineTo(float paramFloat1, float paramFloat2)
  {
    if (mCurrentOperation != null) {
      mCurrentOperation.addCommand(new MoaGraphicsCommandParameter(1, paramFloat1, paramFloat2));
    }
  }
  
  public void onMoveTo(float paramFloat1, float paramFloat2)
  {
    if (mCurrentOperation != null) {
      mCurrentOperation.addCommand(new MoaGraphicsCommandParameter(0, paramFloat1, paramFloat2));
    }
  }
  
  public void onQuadTo(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    if (mCurrentOperation != null) {
      mCurrentOperation.addCommand(new MoaGraphicsCommandParameter(2, paramFloat1, paramFloat2, paramFloat3, paramFloat4));
    }
  }
  
  public void onStart()
  {
    logger.info("onStart");
    float f1 = ((ImageViewTouchAndDraw)mImageView).getDrawingScale();
    int j = mBlur;
    float f2 = mSize * 2;
    int k = mColor;
    if (getSelectedTool() == DrawinTool.Erase) {}
    for (int i = 1;; i = 0)
    {
      mCurrentOperation = new MoaGraphicsOperationParameter(j, f2 * f1, k, i);
      return;
    }
  }
  
  public void setPanelEnabled(boolean paramBoolean)
  {
    if (!isActive()) {
      return;
    }
    View localView;
    if (paramBoolean)
    {
      restoreToolbarTitle();
      localView = mOptionView.findViewById(R.id.disabled_status);
      if (!paramBoolean) {
        break label49;
      }
    }
    label49:
    for (int i = 4;; i = 0)
    {
      localView.setVisibility(i);
      return;
      setToolbarTitle(R.string.feather_zoom_mode);
      break;
    }
  }
  
  private static enum DrawinTool
  {
    Draw,  Erase,  Zoom;
    
    private DrawinTool() {}
  }
  
  static class GalleryColorAdapter
    extends BaseAdapter
  {
    Context context;
    LayoutInflater layoutInflater;
    Resources resources;
    private int[] sizes;
    
    public GalleryColorAdapter(Context paramContext, int[] paramArrayOfInt)
    {
      layoutInflater = LayoutInflater.from(paramContext);
      context = paramContext;
      sizes = paramArrayOfInt;
      resources = paramContext.getResources();
    }
    
    public Context getContext()
    {
      return context;
    }
    
    public int getCount()
    {
      return sizes.length;
    }
    
    public Object getItem(int paramInt)
    {
      return Integer.valueOf(sizes[paramInt]);
    }
    
    public long getItemId(int paramInt)
    {
      return paramInt;
    }
    
    public int getItemViewType(int paramInt)
    {
      if ((paramInt >= 0) && (paramInt < getCount())) {}
      for (int i = 1; i == 0; i = 0) {
        return 1;
      }
      if (((Integer)getItem(paramInt)).intValue() == 0) {
        return 2;
      }
      return 0;
    }
    
    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      int i = getItemViewType(paramInt);
      Object localObject = null;
      ImageView localImageView;
      View localView;
      if (paramView == null)
      {
        paramView = layoutInflater.inflate(R.layout.com_adobe_image_gallery_item_view, paramViewGroup, false);
        localImageView = (ImageView)paramView;
        if (i == 0)
        {
          paramViewGroup = new PreviewSpotDrawable(getContext());
          paramViewGroup.setStyle(Paint.Style.FILL);
          localImageView.setImageDrawable(paramViewGroup);
          localView = paramView;
        }
      }
      for (;;)
      {
        if ((paramViewGroup != null) && (i == 0)) {
          paramViewGroup.setColor(sizes[paramInt]);
        }
        return localView;
        paramViewGroup = localObject;
        localView = paramView;
        if (i == 2)
        {
          localImageView.setImageResource(R.drawable.com_adobe_image_gallery_eraser_selector);
          paramViewGroup = localObject;
          localView = paramView;
          continue;
          paramViewGroup = localObject;
          localView = paramView;
          if (i == 0)
          {
            paramViewGroup = (PreviewSpotDrawable)((ImageView)paramView).getDrawable();
            localView = paramView;
          }
        }
      }
    }
    
    public int getViewTypeCount()
    {
      return 3;
    }
  }
}
