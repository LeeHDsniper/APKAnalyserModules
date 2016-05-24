package com.adobe.creativesdk.aviary.panels;

import android.annotation.SuppressLint;
import android.app.ProgressDialog;
import android.content.ContentResolver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.database.ContentObserver;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory.Options;
import android.graphics.Point;
import android.graphics.PointF;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.content.CursorLoader;
import android.support.v4.content.Loader;
import android.support.v4.content.Loader.OnLoadCompleteListener;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.widget.ProgressBar;
import com.adobe.android.ui.utils.UIUtils;
import com.adobe.creativesdk.aviary.AdobeImageEditorActivity;
import com.adobe.creativesdk.aviary.fragments.StoreContainerFragment;
import com.adobe.creativesdk.aviary.fragments.StoreContainerFragment.Builder;
import com.adobe.creativesdk.aviary.internal.AdobeImageEditorController;
import com.adobe.creativesdk.aviary.internal.cds.Cds.PackType;
import com.adobe.creativesdk.aviary.internal.cds.TrayColumns.TrayCursorWrapper;
import com.adobe.creativesdk.aviary.internal.content.ToolEntry;
import com.adobe.creativesdk.aviary.internal.filters.BorderFilter;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory.Tools;
import com.adobe.creativesdk.aviary.internal.headless.filters.IntensityNativeFilter;
import com.adobe.creativesdk.aviary.internal.headless.filters.NativeFilter;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaResult;
import com.adobe.creativesdk.aviary.internal.os.AdobeImageAsyncTask;
import com.adobe.creativesdk.aviary.internal.services.ConfigService;
import com.adobe.creativesdk.aviary.internal.tracking.AdobeImageAnalyticsTracker;
import com.adobe.creativesdk.aviary.internal.utils.ApiHelper;
import com.adobe.creativesdk.aviary.internal.utils.BitmapUtils;
import com.adobe.creativesdk.aviary.internal.utils.IOUtils;
import com.adobe.creativesdk.aviary.internal.utils.PackageManagerUtils;
import com.adobe.creativesdk.aviary.internal.utils.SystemUtils.MemoryInfo;
import com.adobe.creativesdk.aviary.internal.vo.EditToolResultVO;
import com.adobe.creativesdk.aviary.internal.vo.ToolActionVO;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.overlays.AbstractBaseOverlay;
import com.adobe.creativesdk.aviary.overlays.StickersOverlay;
import com.adobe.creativesdk.aviary.utils.SharedPreferencesUtils;
import com.adobe.creativesdk.aviary.widget.ImageViewWithIntensity;
import com.adobe.creativesdk.aviary.widget.ImageViewWithIntensity.OnIntensityChange;
import com.aviary.android.feather.sdk.R.attr;
import com.aviary.android.feather.sdk.R.dimen;
import com.aviary.android.feather.sdk.R.id;
import com.aviary.android.feather.sdk.R.layout;
import com.aviary.android.feather.sdk.R.string;
import com.aviary.android.feather.sdk.R.style;
import com.timehop.stickyheadersrecyclerview.StickyRecyclerHeadersDecoration;
import it.sephiroth.android.library.imagezoom.ImageViewTouch;
import it.sephiroth.android.library.imagezoom.ImageViewTouchBase.DisplayType;
import it.sephiroth.android.library.picasso.LruCache;
import it.sephiroth.android.library.picasso.Picasso;
import it.sephiroth.android.library.tooltip.TooltipManager;
import it.sephiroth.android.library.tooltip.TooltipManager.Builder;
import it.sephiroth.android.library.tooltip.TooltipManager.ClosePolicy;
import it.sephiroth.android.library.tooltip.TooltipManager.Gravity;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import org.json.JSONException;
import org.json.JSONObject;

public class BordersPanel
  extends AbstractContentPanel
  implements Loader.OnLoadCompleteListener<Cursor>, PacksListAdapter.OnItemClickListener, ImageViewWithIntensity.OnIntensityChange
{
  protected View loaderView;
  protected int mAccentColor;
  protected PacksListAdapter mAdapter;
  protected LruCache mCache;
  protected int mCellWidth = 80;
  protected ConfigService mConfigService;
  protected ContentObserver mContentObserver;
  private RenderTask mCurrentTask;
  protected CursorLoader mCursorLoader;
  protected int mDefaultPackTextBackgroundColor;
  protected boolean mEnableFastPreview = false;
  protected IntensityNativeFilter mFilter;
  protected boolean mFirstTime = true;
  protected final float mInitialIntensityValue = 255.0F;
  private final List<Long> mInstalledPacks = new ArrayList();
  protected volatile boolean mIsAnimating;
  protected volatile Boolean mIsRendering = Boolean.valueOf(false);
  protected final Cds.PackType mPackType;
  protected Picasso mPicasso;
  protected SharedPreferencesUtils mPreferences;
  protected TrayColumns.TrayCursorWrapper mRenderedEffect;
  protected int mSliderIntensityTooltip = 0;
  protected int mThumbWidth = 80;
  protected TooltipManager mTooltipManager;
  protected StickersOverlay mTutorialOverlay;
  protected RecyclerView recyclerView;
  
  public BordersPanel(AdobeImageEditorController paramAdobeImageEditorController, ToolEntry paramToolEntry)
  {
    this(paramAdobeImageEditorController, paramToolEntry, Cds.PackType.FRAME);
  }
  
  protected BordersPanel(AdobeImageEditorController paramAdobeImageEditorController, ToolEntry paramToolEntry, Cds.PackType paramPackType)
  {
    super(paramAdobeImageEditorController, paramToolEntry);
    mPackType = paramPackType;
  }
  
  private void createTutorialOverlayIfNecessary()
  {
    logger.info("createTutorialOverlayIfNecessary");
    if (!isActive()) {}
    while (getHandler() == null) {
      return;
    }
    getHandler().postDelayed(new Runnable()
    {
      public void run()
      {
        BordersPanel.this.createTutorialOverlayIfNecessaryDelayed();
      }
    }, 200L);
  }
  
  private boolean createTutorialOverlayIfNecessaryDelayed()
  {
    logger.info("createTutorialOverlayIfNecessaryDelayed");
    if (!isActive()) {
      return false;
    }
    int i2 = 1;
    int i3 = recyclerView.getChildCount();
    int k = -1;
    Object localObject1 = null;
    int m = 0;
    int i = 0;
    int j = i2;
    Object localObject3;
    if (i < i3)
    {
      localObject3 = recyclerView.getChildAt(i);
      n = m;
      i1 = k;
      localObject2 = localObject1;
      if (localObject3 == null) {
        break label208;
      }
      localObject3 = (PacksListAdapter.BaseViewHolder)recyclerView.getChildViewHolder((View)localObject3);
      n = m;
      i1 = k;
      localObject2 = localObject1;
      if (localObject3 == null) {
        break label208;
      }
      if (((PacksListAdapter.BaseViewHolder)localObject3).getItemViewType() == 0) {
        j = 0;
      }
    }
    else
    {
      if ((m == 0) || (k <= -1) || (localObject1 == null)) {
        j = 0;
      }
      if (j != 0) {
        break label231;
      }
      hideOverlay();
      return false;
    }
    int n = m;
    int i1 = k;
    Object localObject2 = localObject1;
    if (((PacksListAdapter.BaseViewHolder)localObject3).getItemViewType() == 1) {
      if (free != 1) {
        break label226;
      }
    }
    label208:
    label226:
    for (j = 1;; j = 0)
    {
      n = j;
      i1 = k;
      localObject2 = localObject1;
      if (j != 0)
      {
        i1 = i;
        localObject2 = itemView;
        n = j;
      }
      i += 1;
      m = n;
      k = i1;
      localObject1 = localObject2;
      break;
    }
    label231:
    if (mTutorialOverlay == null)
    {
      if (AbstractBaseOverlay.shouldShow(getContext().getBaseContext(), getTutorialOverlayId()))
      {
        mTutorialOverlay = createTutorialOverlay(localObject1);
        return mTutorialOverlay.show();
      }
    }
    else {
      mTutorialOverlay.update(localObject1);
    }
    return false;
  }
  
  private void displayIAPDialog(Bundle paramBundle)
  {
    getContext().openOrUpdateStoreDialog(paramBundle);
  }
  
  private int getCacheSize()
  {
    double[] arrayOfDouble = new double[3];
    SystemUtils.MemoryInfo.getRuntimeMemory(arrayOfDouble);
    return Math.min((int)(1048576.0D * Math.max(arrayOfDouble[0], 2.0D)), 6291456);
  }
  
  private void onEffectListUpdated(int paramInt, boolean paramBoolean1, boolean paramBoolean2)
  {
    Object localObject;
    if (paramInt > 0)
    {
      loaderView.setVisibility(4);
      recyclerView.setVisibility(0);
      if (((mFirstTime) || (paramBoolean1)) && (paramInt > 0))
      {
        localObject = (LinearLayoutManager)recyclerView.getLayoutManager();
        if (!paramBoolean2) {
          break label125;
        }
        recyclerView.smoothScrollToPosition(paramInt);
      }
    }
    for (;;)
    {
      if (mFirstTime)
      {
        localObject = new AlphaAnimation(0.0F, 1.0F);
        ((Animation)localObject).setFillAfter(true);
        ((Animation)localObject).setDuration(getContext().getBaseContext().getResources().getInteger(17694721));
        recyclerView.startAnimation((Animation)localObject);
      }
      mFirstTime = false;
      return;
      paramInt = 0;
      break;
      label125:
      ((LinearLayoutManager)localObject).scrollToPositionWithOffset(paramInt - 1, mCellWidth / 2);
    }
  }
  
  private boolean openStorePanelIfRequired(long paramLong)
  {
    boolean bool2 = false;
    logger.info("openStorePanelIfRequired: %d", new Object[] { Long.valueOf(paramLong) });
    long l = -1L;
    boolean bool1;
    if (!hasOption("quick-packId"))
    {
      bool1 = bool2;
      if (paramLong <= -1L) {}
    }
    else
    {
      if (paramLong <= -1L) {
        break label157;
      }
      l = paramLong;
    }
    for (;;)
    {
      logger.log("iapPackageId: %d", new Object[] { Long.valueOf(paramLong) });
      bool1 = bool2;
      if (l > -1L)
      {
        displayIAPDialog(new StoreContainerFragment.Builder().setPackId(l).setFeaturedPackId(l).setEvent("shop_details: opened").setPackType(mPackType).addEventAttributes("pack", String.valueOf(l)).addEventAttributes("from", "message").build());
        bool1 = true;
      }
      return bool1;
      label157:
      if (hasOption("quick-packId"))
      {
        Bundle localBundle = getOptions();
        l = localBundle.getLong("quick-packId");
        localBundle.remove("quick-packId");
      }
    }
  }
  
  private boolean removeIapDialog()
  {
    return getContext().closeStoreDialog();
  }
  
  boolean backHandled()
  {
    if (mIsAnimating) {}
    while ((mTutorialOverlay != null) && (mTutorialOverlay.onBackPressed())) {
      return true;
    }
    killCurrentTask();
    return false;
  }
  
  protected PacksListAdapter createListAdapter(Context paramContext, Cursor paramCursor, int paramInt)
  {
    return new PacksListAdapter.Builder(paramContext, this, paramCursor).setCellWidth(mCellWidth).setContentResId(R.layout.com_adobe_image_content_frames_item_content_item).setSupplyResId(R.layout.com_adobe_image_content_frames_item_supplies).setExternalResId(R.layout.com_adobe_image_content_frames_item_external_pack).setDividerResId(R.layout.com_adobe_image_content_frames_item_header_pack).setDefaultPackTextBackgroundColor(mDefaultPackTextBackgroundColor).setPackType(mPackType).setPicasso(mPicasso, mCache).setTintColor(paramInt).build();
  }
  
  protected RenderTask createRenderTask(int paramInt, float paramFloat)
  {
    return new RenderTask(paramInt, paramFloat);
  }
  
  protected StickersOverlay createTutorialOverlay(View paramView)
  {
    paramView = new StickersOverlay(getContext().getBaseActivity(), R.attr.com_adobe_image_editor_frames_overlay_style, paramView, getName(), getTutorialOverlayId());
    paramView.setTitle(AbstractPanelLoaderService.getToolDisplayName(getName()));
    return paramView;
  }
  
  @SuppressLint({"InflateParams"})
  protected View generateContentView(LayoutInflater paramLayoutInflater)
  {
    return paramLayoutInflater.inflate(R.layout.com_adobe_image_editor_content_frames, null);
  }
  
  protected ViewGroup generateOptionView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup)
  {
    return (ViewGroup)paramLayoutInflater.inflate(R.layout.com_adobe_image_bottombar_panel_content_frames, paramViewGroup, false);
  }
  
  protected boolean getIntensityIsManaged()
  {
    return true;
  }
  
  protected boolean getIntensitySliderEnabled()
  {
    return false;
  }
  
  public boolean getIsChanged()
  {
    return (super.getIsChanged()) || (mIsRendering.booleanValue());
  }
  
  protected int getTutorialOverlayId()
  {
    return 3;
  }
  
  protected void hideOverlay()
  {
    if (mTutorialOverlay != null) {
      mTutorialOverlay.hide();
    }
  }
  
  protected boolean isContentTutorialNeeded()
  {
    return true;
  }
  
  boolean killCurrentTask()
  {
    if (mCurrentTask != null)
    {
      if (mPackType != Cds.PackType.FRAME) {
        onProgressEnd();
      }
      return mCurrentTask.cancel(true);
    }
    return false;
  }
  
  protected NativeFilter loadNativeFilter(TrayColumns.TrayCursorWrapper paramTrayCursorWrapper, int paramInt, boolean paramBoolean, float paramFloat)
    throws JSONException
  {
    if ((paramTrayCursorWrapper != null) && (paramInt > -1))
    {
      BorderFilter localBorderFilter = (BorderFilter)ToolLoaderFactory.get(ToolLoaderFactory.Tools.FRAMES);
      Cursor localCursor = getContext().getBaseContext().getContentResolver().query(PackageManagerUtils.getCDSProviderContentUri(getContext().getBaseContext(), "pack/content/item/" + paramTrayCursorWrapper.getId()), null, null, null, null);
      double d2 = 0.0D;
      double d1 = d2;
      if (localCursor != null) {
        d1 = d2;
      }
      try
      {
        if (localCursor.moveToFirst()) {
          d1 = new JSONObject(new String(localCursor.getBlob(localCursor.getColumnIndex("item_options")))).getDouble("width");
        }
        IOUtils.closeSilently(localCursor);
        localBorderFilter.setHiRes(paramBoolean);
        localBorderFilter.setSize(d1);
        localBorderFilter.setIdentifier(paramTrayCursorWrapper.getIdentifier());
        localBorderFilter.setSourceDir(paramTrayCursorWrapper.getPath());
        localBorderFilter.setIntensity(paramFloat / 255.0F);
        return localBorderFilter;
      }
      finally
      {
        IOUtils.closeSilently(localCursor);
      }
    }
    return null;
  }
  
  public void onActivate()
  {
    super.onActivate();
    onSetupImageView();
    onAddCustomRequestHandlers();
    onPostActivate();
    contentReady();
  }
  
  protected void onAddCustomRequestHandlers() {}
  
  public boolean onBackPressed()
  {
    return (backHandled()) || (super.onBackPressed());
  }
  
  public void onCancelled()
  {
    killCurrentTask();
    mIsRendering = Boolean.valueOf(false);
    super.onCancelled();
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration1, Configuration paramConfiguration2)
  {
    if (getIntensitySliderEnabled()) {
      ((ImageViewWithIntensity)mImageView).finishIntensityChanging();
    }
    super.onConfigurationChanged(paramConfiguration1, paramConfiguration2);
  }
  
  @SuppressLint({"WrongViewCast"})
  public void onCreate(Bitmap paramBitmap, Bundle paramBundle)
  {
    super.onCreate(paramBitmap, paramBundle);
    mPicasso = Picasso.with(getContext().getBaseContext());
    mInstalledPacks.clear();
    mCache = new LruCache(getCacheSize());
    BitmapFactory.OptionsinPreferredConfig = Bitmap.Config.RGB_565;
    mConfigService = ((ConfigService)getContext().getService(ConfigService.class));
    mPreferences = SharedPreferencesUtils.getInstance(getContext().getBaseContext());
    mTooltipManager = TooltipManager.getInstance(getContext().getBaseActivity());
    mEnableFastPreview = ApiHelper.fastPreviewEnabled();
    recyclerView = ((RecyclerView)getOptionView().findViewById(R.id.recyclerView));
    recyclerView.setLayoutManager(new LinearLayoutManager(getContext().getBaseContext(), 0, false));
    recyclerView.setHasFixedSize(true);
    loaderView = getOptionView().findViewById(R.id.loader);
    mCellWidth = mConfigService.getDimensionPixelSize(R.dimen.com_adobe_image_editor_content_item_width);
    mThumbWidth = mConfigService.getDimensionPixelSize(R.dimen.com_adobe_image_editor_content_item_image_width);
    mDefaultPackTextBackgroundColor = UIUtils.getThemeColor(getContext().getBaseContext(), R.attr.colorPrimaryDark);
    mPreview = BitmapUtils.copy(mBitmap, Bitmap.Config.ARGB_8888);
    mImageView = ((ImageViewTouch)getContentView().findViewById(R.id.image));
    mImageView.setDisplayType(ImageViewTouchBase.DisplayType.FIT_IF_BIGGER);
    if (getIntensitySliderEnabled())
    {
      ((ImageViewWithIntensity)mImageView).setVaryTipStroke(false);
      ((ImageViewWithIntensity)mImageView).setVaryTipHue(true);
    }
    if (!mPreferences.containsSingleTimeKey(getClass() + "." + "intensity.slider.tooltip", false)) {}
    for (mSliderIntensityTooltip = 0; getContext().hasAccentColor(); mSliderIntensityTooltip = 1)
    {
      mAccentColor = getContext().getAccentColor(0);
      onSetupUiTint(mAccentColor);
      return;
    }
    mAccentColor = 0;
  }
  
  public void onDeactivate()
  {
    if (mPackType != Cds.PackType.FRAME) {
      onProgressEnd();
    }
    recyclerView.setOnScrollListener(null);
    removeIapDialog();
    if (mTutorialOverlay != null)
    {
      mTutorialOverlay.dismiss();
      mTutorialOverlay = null;
    }
    if (getIntensitySliderEnabled()) {
      ((ImageViewWithIntensity)mImageView).setOnIntensityChangeListener(null);
    }
    Context localContext = getContext().getBaseContext();
    if (mContentObserver != null) {
      localContext.getContentResolver().unregisterContentObserver(mContentObserver);
    }
    if (mCursorLoader != null)
    {
      mCursorLoader.unregisterListener(this);
      mCursorLoader.stopLoading();
      mCursorLoader.abandon();
    }
    super.onDeactivate();
  }
  
  public void onDestroy()
  {
    mConfigService = null;
    recyclerView.setAdapter(null);
    if (mAdapter != null) {
      IOUtils.closeSilently(mAdapter.swapCursor(null));
    }
    mAdapter = null;
    mCursorLoader = null;
    if (getIntensitySliderEnabled()) {
      ((ImageViewWithIntensity)mImageView).setPreviewBitmap(null, 255.0F);
    }
    try
    {
      mCache.clear();
      super.onDestroy();
      return;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  protected void onDispose()
  {
    recyclerView.setAdapter(null);
    onRemoveCustomRequestHandlers();
    super.onDispose();
  }
  
  protected void onGenerateFinalBitmap()
  {
    if ((getIntensitySliderEnabled()) && (!getIntensityIsManaged()))
    {
      float f = ((ImageViewWithIntensity)mImageView).getIntensity();
      Object localObject;
      if (mFilter != null)
      {
        if (f < 255.0F) {
          mFilter.setIntensity(f / 255.0F);
        }
      }
      else
      {
        if (f != 255.0F) {
          break label80;
        }
        localObject = mPreview;
      }
      for (;;)
      {
        onComplete((Bitmap)localObject);
        return;
        mFilter.setIntensity(1.0D);
        break;
        label80:
        if (f == 0.0F)
        {
          localObject = mBitmap;
        }
        else
        {
          Bitmap localBitmap = mBitmap;
          localObject = localBitmap;
          if (!localBitmap.isMutable()) {
            localObject = mBitmap.copy(mBitmap.getConfig(), true);
          }
          ((ImageViewWithIntensity)mImageView).generateBitmap((Bitmap)localObject, f);
        }
      }
    }
    onComplete(mPreview);
  }
  
  protected void onGenerateResult()
  {
    logger.info("onGenerateResult. isRendering: " + mIsRendering);
    if (mIsRendering.booleanValue())
    {
      new GenerateResultTask().execute(new Void[0]);
      return;
    }
    onGenerateFinalBitmap();
  }
  
  public void onIntensityInit()
  {
    if (mRenderedEffect != null) {
      AdobeImageAnalyticsTracker.getInstance(getContext().getBaseContext()).tagEvent(getName().name().toLowerCase(Locale.US) + ": intensity_initiated", new String[] { "pack", mRenderedEffect.getPackageName(), "item", mRenderedEffect.getIdentifier() });
    }
  }
  
  public void onIntensitySwipeChanged(float paramFloat) {}
  
  public void onIntensitySwipeChanging(float paramFloat)
  {
    if (getIntensityIsManaged()) {
      onIntensitySwipeChanged(paramFloat);
    }
  }
  
  public void onIntensitySwipeStarted(float paramFloat) {}
  
  public void onItemClick(RecyclerView.Adapter paramAdapter, View paramView)
  {
    boolean bool = true;
    paramAdapter = (PacksListAdapter.BaseViewHolder)recyclerView.getChildViewHolder(paramView);
    int j = paramAdapter.getItemViewType();
    int i = paramAdapter.getAdapterPosition();
    hideOverlay();
    if (j == 0)
    {
      removeIapDialog();
      j = mAdapter.getItemCheckedPosition();
      if (j == i)
      {
        renderEffect(null, -1, 255.0F);
        paramAdapter = mAdapter;
        if (j == i) {
          break label92;
        }
        label74:
        paramAdapter.setItemCheckedPosition(i, bool);
      }
    }
    label92:
    do
    {
      return;
      renderEffect(i, 255.0F);
      break;
      bool = false;
      break label74;
      if (j == 1)
      {
        long l = paramAdapter.getItemId();
        paramView = new Bundle();
        paramView.putInt("extra-click-from-position", i);
        displayIAPDialog(new StoreContainerFragment.Builder().setPackType(mPackType).setPackId(l).setFeaturedPackId(l).setEvent("shop_details: opened").addEventAttributes("pack", identifier).addEventAttributes("from", "featured").setExtras(paramView).build());
        return;
      }
    } while ((j != 5) && (j != 6));
    if (j == 6) {}
    for (paramAdapter = "right";; paramAdapter = "left")
    {
      displayIAPDialog(new StoreContainerFragment.Builder().setPackType(mPackType).setEvent("shop_list: opened").addEventAttributes("from", getName().name().toLowerCase(Locale.US)).addEventAttributes("side", paramAdapter).build());
      return;
    }
  }
  
  public void onLoadComplete(Loader<Cursor> paramLoader, Cursor paramCursor)
  {
    logger.info("onLoadComplete");
    long l2 = -1L;
    int m = -1;
    int n = -1;
    long l3 = -1L;
    boolean bool1 = false;
    boolean bool3 = false;
    boolean bool2 = false;
    if (getContext() == null) {
      return;
    }
    paramLoader = getContext().getStoreFragment();
    int j;
    label67:
    int i;
    label159:
    int k;
    int i1;
    if ((!mFirstTime) && (paramLoader != null))
    {
      j = 1;
      i = j;
      long l1 = l2;
      if (j != 0)
      {
        i = j;
        l1 = l2;
        if (paramLoader.getArguments() != null)
        {
          long l4 = paramLoader.getArguments().getLong("featured_pack_id");
          i = j;
          l1 = l2;
          if (l4 == paramLoader.getArguments().getLong("extra-pack-id"))
          {
            i = j;
            l1 = l2;
            if (l4 > -1L)
            {
              l1 = l4;
              if (l1 <= -1L) {
                break label569;
              }
              i = 1;
            }
          }
        }
      }
      l2 = l3;
      if (hasOptions())
      {
        l2 = l3;
        if (mFirstTime)
        {
          l2 = l3;
          if (i == 0)
          {
            paramLoader = getOptions();
            l2 = paramLoader.getLong("quick-packId", -1L);
            paramLoader.remove("quick-packId");
            paramLoader.remove("quick-contentId");
          }
        }
      }
      paramLoader = new ArrayList();
      j = n;
      k = m;
      if (paramCursor != null)
      {
        i1 = paramCursor.getPosition();
        do
        {
          String str;
          do
          {
            do
            {
              j = n;
              k = m;
              bool1 = bool3;
              if (!paramCursor.moveToNext()) {
                break;
              }
            } while (paramCursor.getInt(4) != 0);
            l3 = paramCursor.getLong(9);
            str = paramCursor.getString(2);
            paramLoader.add(Long.valueOf(l3));
            if (mFirstTime) {
              break label574;
            }
          } while (mInstalledPacks.contains(Long.valueOf(l3)));
          logger.log("adding %d (%s) to new packs", new Object[] { Long.valueOf(l3), str });
          logger.log("iapDialogFeaturedId: %d, pack_id: %d", new Object[] { Long.valueOf(l1), Long.valueOf(l3) });
        } while ((i == 0) || (l1 != l3));
        logger.log("setting new position based on featured: %d", new Object[] { Long.valueOf(l3) });
        k = paramCursor.getPosition() + 1;
        bool1 = true;
        j = n;
      }
    }
    for (;;)
    {
      paramCursor.moveToPosition(i1);
      mInstalledPacks.clear();
      mInstalledPacks.addAll(paramLoader);
      mAdapter.changeCursor(paramCursor);
      logger.log("lastInstalledPackIndex: %d", new Object[] { Integer.valueOf(k) });
      if (k >= 0)
      {
        bool2 = true;
        j = k;
        removeIapDialog();
      }
      onEffectListUpdated(j, bool2, bool1);
      if ((openStorePanelIfRequired(l2)) || (!isContentTutorialNeeded()) || (j != -1)) {
        break;
      }
      createTutorialOverlayIfNecessary();
      return;
      j = 0;
      break label67;
      label569:
      i = 0;
      break label159;
      label574:
      j = paramCursor.getPosition();
      k = m;
      bool1 = bool3;
    }
  }
  
  protected void onPostActivate()
  {
    updateInstalledPacks();
  }
  
  protected void onRemoveCustomRequestHandlers() {}
  
  protected void onSetupImageView()
  {
    if (getIntensitySliderEnabled())
    {
      ((ImageViewWithIntensity)mImageView).setOnIntensityChangeListener(this);
      if (getIntensityIsManaged())
      {
        mImageView.setImageBitmap(mPreview, null, 1.0F, 1.0F);
        ((ImageViewWithIntensity)mImageView).setIntensity(255.0F);
        return;
      }
      mImageView.setImageBitmap(mBitmap, null, 1.0F, 1.0F);
      ((ImageViewWithIntensity)mImageView).setPreviewBitmap(mPreview, 255.0F);
      return;
    }
    ((ImageViewWithIntensity)mImageView).setSwipeGestureEnabled(false);
    mImageView.setImageBitmap(mPreview, null, 1.0F, 1.0F);
  }
  
  protected void onSetupUiTint(int paramInt)
  {
    if (paramInt != 0) {
      UIUtils.setIndeterminateProgressBarTint((ProgressBar)loaderView.findViewById(R.id.progress), paramInt);
    }
  }
  
  protected void renderEffect(int paramInt, float paramFloat)
  {
    if (mAdapter == null) {}
    Object localObject;
    do
    {
      do
      {
        do
        {
          return;
        } while ((paramInt < 0) || (paramInt >= mAdapter.getItemCount()));
        localObject = (Cursor)mAdapter.getItem(paramInt);
      } while (localObject == null);
      localObject = TrayColumns.TrayCursorWrapper.create((Cursor)localObject);
    } while (localObject == null);
    renderEffect((TrayColumns.TrayCursorWrapper)localObject, paramInt, paramFloat);
  }
  
  protected void renderEffect(TrayColumns.TrayCursorWrapper paramTrayCursorWrapper, int paramInt, float paramFloat)
  {
    killCurrentTask();
    mCurrentTask = createRenderTask(paramInt, paramFloat);
    mCurrentTask.execute(new TrayColumns.TrayCursorWrapper[] { paramTrayCursorWrapper });
  }
  
  protected void updateInstalledPacks()
  {
    loaderView.setVisibility(0);
    recyclerView.setVisibility(4);
    mAdapter = createListAdapter(getContext().getBaseContext(), null, mAccentColor);
    mAdapter.setHasStableIds(true);
    recyclerView.setAdapter(mAdapter);
    Object localObject = new StickyRecyclerHeadersDecoration(mAdapter);
    recyclerView.addItemDecoration((RecyclerView.ItemDecoration)localObject);
    localObject = getContext().getBaseContext();
    Uri localUri = PackageManagerUtils.getCDSProviderContentUri((Context)localObject, String.format(Locale.US, "packTray/%d/%d/%d/%d/%d/%s", new Object[] { Integer.valueOf(3), Integer.valueOf(0), Integer.valueOf(1), Integer.valueOf(0), Integer.valueOf(0), mPackType.toCdsString() }));
    if (mCursorLoader == null)
    {
      mCursorLoader = new CursorLoader((Context)localObject, localUri, null, null, null, null);
      mCursorLoader.registerListener(1, this);
      if (mContentObserver == null)
      {
        mContentObserver = new ContentObserver(new Handler())
        {
          public void onChange(boolean paramAnonymousBoolean)
          {
            logger.info("mContentObserver::onChange");
            super.onChange(paramAnonymousBoolean);
            if ((isActive()) && (mCursorLoader != null) && (mCursorLoader.isStarted())) {
              mCursorLoader.onContentChanged();
            }
          }
        };
        ((Context)localObject).getContentResolver().registerContentObserver(PackageManagerUtils.getCDSProviderContentUri((Context)localObject, "packTray/" + mPackType.toCdsString()), false, mContentObserver);
      }
      mCursorLoader.startLoading();
      return;
    }
    mCursorLoader.setUri(localUri);
    mCursorLoader.forceLoad();
  }
  
  class GenerateResultTask
    extends AdobeImageAsyncTask<Void, Void, Void>
  {
    ProgressDialog mProgress = new ProgressDialog(getContext().getBaseContext());
    
    GenerateResultTask() {}
    
    protected Void doInBackground(Void... paramVarArgs)
    {
      logger.info("GenerateResultTask::doInBackground", new Object[] { mIsRendering });
      while (mIsRendering.booleanValue()) {
        logger.log("waiting....");
      }
      return null;
    }
    
    protected void doPostExecute(Void paramVoid)
    {
      if (getContext().getBaseActivity().isFinishing()) {
        return;
      }
      if (mProgress.isShowing()) {
        mProgress.dismiss();
      }
      onGenerateFinalBitmap();
    }
    
    protected void doPreExecute()
    {
      mProgress.setTitle(getContext().getBaseContext().getString(R.string.feather_loading_title));
      mProgress.setMessage(getContext().getBaseContext().getString(R.string.feather_effect_loading_message));
      mProgress.setIndeterminate(true);
      mProgress.setCancelable(false);
      mProgress.show();
    }
  }
  
  protected class RenderTask
    extends AdobeImageAsyncTask<TrayColumns.TrayCursorWrapper, Bitmap, Bitmap>
    implements DialogInterface.OnCancelListener
  {
    TrayColumns.TrayCursorWrapper currentEffect;
    IntensityNativeFilter filter;
    float intensity;
    String mError;
    MoaResult mMoaMainExecutor;
    int mPosition;
    
    public RenderTask(int paramInt, float paramFloat)
    {
      mPosition = paramInt;
      intensity = paramFloat;
    }
    
    private IntensityNativeFilter initFilter(TrayColumns.TrayCursorWrapper paramTrayCursorWrapper, int paramInt, float paramFloat)
    {
      try
      {
        paramTrayCursorWrapper = (IntensityNativeFilter)loadNativeFilter(paramTrayCursorWrapper, paramInt, true, paramFloat);
        if (paramTrayCursorWrapper == null) {
          return null;
        }
      }
      catch (Throwable paramTrayCursorWrapper)
      {
        paramTrayCursorWrapper.printStackTrace();
        return null;
      }
      if ((paramTrayCursorWrapper instanceof BorderFilter)) {
        ((BorderFilter)paramTrayCursorWrapper).setHiRes(false);
      }
      try
      {
        mMoaMainExecutor = paramTrayCursorWrapper.prepare(mBitmap, mPreview, 1, 1);
        return paramTrayCursorWrapper;
      }
      catch (JSONException paramTrayCursorWrapper)
      {
        paramTrayCursorWrapper.printStackTrace();
        mMoaMainExecutor = null;
      }
      return null;
    }
    
    public Bitmap doInBackground(TrayColumns.TrayCursorWrapper... paramVarArgs)
    {
      if (isCancelled()) {}
      for (;;)
      {
        return null;
        paramVarArgs = paramVarArgs[0];
        currentEffect = paramVarArgs;
        filter = initFilter(paramVarArgs, mPosition, intensity);
        if (filter == null)
        {
          currentEffect = null;
          return null;
        }
        mIsRendering = Boolean.valueOf(true);
        if (!isCancelled()) {
          try
          {
            mMoaMainExecutor.execute();
            if (!isCancelled()) {
              return mMoaMainExecutor.outputBitmap;
            }
          }
          catch (Exception paramVarArgs)
          {
            mError = paramVarArgs.getMessage();
            paramVarArgs.printStackTrace();
          }
        }
      }
      return null;
    }
    
    public void doPostExecute(Bitmap paramBitmap)
    {
      mFilter = filter;
      mIsAnimating = false;
      if (!isActive()) {
        return;
      }
      mPreview = paramBitmap;
      mRenderedEffect = currentEffect;
      if ((paramBitmap == null) || (mMoaMainExecutor == null) || (mMoaMainExecutor.active == 0))
      {
        onRestoreOriginalBitmap();
        if (mError != null) {
          onGenericError(mError, 17039370, null);
        }
        setIsChanged(false);
      }
      for (;;)
      {
        if (mPackType != Cds.PackType.FRAME) {
          onProgressEnd();
        }
        mIsRendering = Boolean.valueOf(false);
        BordersPanel.access$102(BordersPanel.this, null);
        return;
        onApplyNewBitmap(paramBitmap);
        if (mRenderedEffect != null)
        {
          paramBitmap = new HashMap();
          paramBitmap.put("pack", mRenderedEffect.getPackageName());
          paramBitmap.put("item", mRenderedEffect.getIdentifier());
          paramBitmap.put("intensity_adjusted", String.valueOf(mFilter.getIntensity()));
          getContext().getTracker().tagEventAttributes(getName().name().toLowerCase(Locale.US) + ": item_previewed", paramBitmap);
          paramBitmap = new ToolActionVO();
          paramBitmap.setPackIdentifier(mRenderedEffect.getPackageName());
          paramBitmap.setContentIdentifier(mRenderedEffect.getIdentifier());
          mEditResult.setActionList(mFilter.getActions());
          mEditResult.setToolAction(paramBitmap);
          mTrackingAttributes.put("item", mRenderedEffect.getIdentifier());
          mTrackingAttributes.put("pack", mRenderedEffect.getPackageName());
        }
        else
        {
          mEditResult.setToolAction(null);
          mEditResult.setActionList(null);
          mTrackingAttributes.remove("item");
          mTrackingAttributes.remove("pack");
        }
      }
    }
    
    protected void doPreExecute()
    {
      boolean bool = true;
      if (mPackType != Cds.PackType.FRAME) {
        onProgressStart();
      }
      mIsAnimating = true;
      ImageViewWithIntensity localImageViewWithIntensity = (ImageViewWithIntensity)mImageView;
      if ((getIntensityIsManaged()) && (getIntensitySliderEnabled())) {}
      for (;;)
      {
        localImageViewWithIntensity.setSwipeGestureEnabled(bool);
        return;
        bool = false;
      }
    }
    
    protected void onApplyNewBitmap(Bitmap paramBitmap)
    {
      if ((getIntensityIsManaged()) || (!getIntensitySliderEnabled()))
      {
        mImageView.postInvalidate();
        ((ImageViewWithIntensity)mImageView).setSwipeGestureEnabled(getIntensitySliderEnabled());
        paramBitmap = BordersPanel.this;
        if (mRenderedEffect == null) {
          break label323;
        }
      }
      label323:
      for (boolean bool = true;; bool = false)
      {
        paramBitmap.setIsChanged(bool);
        paramBitmap = BordersPanel.this;
        int i = mSliderIntensityTooltip;
        mSliderIntensityTooltip = (i + 1);
        if ((i == 0) && (getIntensitySliderEnabled()))
        {
          paramBitmap = (ImageViewWithIntensity)mImageView;
          PointF localPointF = paramBitmap.playDemo();
          mTooltipManager.create(0).actionBarSize(getContext().getBaseActivity().getActionBarSize()).anchor(new Point((int)(x - paramBitmap.getTooltipSize() * 1.85D), (int)y + paramBitmap.getTooltipSize() / 2), TooltipManager.Gravity.LEFT).text(getContext().getBaseContext().getResources(), R.string.feather_effect_intensity_tooltip).closePolicy(TooltipManager.ClosePolicy.None, 2500L).maxWidth((int)(paramBitmap.getWidth() / 2.5D)).showDelay(100L).withStyleId(R.style.AdobeImageWidget_ContentPanelsTooltip).toggleArrow(false).withCustomView(R.layout.com_adobe_image_editor_content_tooltip, false).show();
          mPreferences.containsSingleTimeKey(getClass() + "." + "intensity.slider.tooltip", true);
        }
        return;
        ((ImageViewWithIntensity)mImageView).setPreviewBitmap(paramBitmap, 255.0F);
        break;
      }
    }
    
    public void onCancel(DialogInterface paramDialogInterface)
    {
      cancel(true);
    }
    
    public void onCancelled()
    {
      super.onCancelled();
      if (mMoaMainExecutor != null) {
        mMoaMainExecutor.cancel();
      }
      mIsRendering = Boolean.valueOf(false);
    }
    
    protected void onRestoreOriginalBitmap()
    {
      mPreview = BitmapUtils.copy(mBitmap, Bitmap.Config.ARGB_8888);
      if (getIntensitySliderEnabled()) {
        if (getIntensityIsManaged())
        {
          mImageView.setImageBitmap(mPreview, null, 1.0F, 1.0F);
          ((ImageViewWithIntensity)mImageView).setIntensity(255.0F);
          ((ImageViewWithIntensity)mImageView).setSwipeGestureEnabled(false);
        }
      }
      for (;;)
      {
        setIsChanged(false);
        return;
        ((ImageViewWithIntensity)mImageView).setPreviewBitmap(mPreview, 255.0F);
        break;
        mImageView.setImageBitmap(mPreview, null, 1.0F, 1.0F);
      }
    }
  }
}
