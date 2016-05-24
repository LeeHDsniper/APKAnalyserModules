package com.adobe.creativesdk.aviary.widget;

import android.content.Context;
import android.content.res.Resources;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.database.MergeCursor;
import android.graphics.Color;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.GridLayoutManager.LayoutParams;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.OnScrollListener;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.GestureDetector;
import android.view.GestureDetector.OnGestureListener;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.adobe.android.ui.widget.RecyclerCursorAdapter;
import com.adobe.creativesdk.aviary.graphics.CdsPreviewTransformer;
import com.adobe.creativesdk.aviary.internal.cds.Cds;
import com.adobe.creativesdk.aviary.internal.cds.Cds.ContentType;
import com.adobe.creativesdk.aviary.internal.cds.Cds.PackType;
import com.adobe.creativesdk.aviary.internal.cds.CdsDownloaderFactory;
import com.adobe.creativesdk.aviary.internal.cds.CdsDownloaderFactory.Downloader;
import com.adobe.creativesdk.aviary.internal.cds.CdsUtils;
import com.adobe.creativesdk.aviary.internal.cds.CdsValidatorFactory;
import com.adobe.creativesdk.aviary.internal.cds.CdsValidatorFactory.Validator;
import com.adobe.creativesdk.aviary.internal.cds.PacksColumns.PackCursorWrapper;
import com.adobe.creativesdk.aviary.internal.cds.PacksContentColumns.ContentCursorWrapper;
import com.adobe.creativesdk.aviary.internal.os.AdobeImageAsyncTask;
import com.adobe.creativesdk.aviary.internal.utils.ApiHelper;
import com.adobe.creativesdk.aviary.internal.utils.IOUtils;
import com.adobe.creativesdk.aviary.internal.utils.Objects;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.utils.CdsUIUtils;
import com.aviary.android.feather.sdk.R.anim;
import com.aviary.android.feather.sdk.R.color;
import com.aviary.android.feather.sdk.R.dimen;
import com.aviary.android.feather.sdk.R.id;
import com.aviary.android.feather.sdk.R.integer;
import com.aviary.android.feather.sdk.R.layout;
import it.sephiroth.android.library.picasso.Callback;
import it.sephiroth.android.library.picasso.Picasso;
import it.sephiroth.android.library.picasso.RequestCreator;
import java.io.File;
import java.io.IOException;

public class PackDetailPreviews
  extends RelativeLayout
  implements View.OnClickListener
{
  private static LoggerFactory.Logger logger = LoggerFactory.getLogger("PackDetailPreviews");
  GestureDetector detector;
  GestureDetector.OnGestureListener listener = new GestureDetector.OnGestureListener()
  {
    public boolean onDown(MotionEvent paramAnonymousMotionEvent)
    {
      PackDetailPreviews.logger.log("onDown");
      return true;
    }
    
    public boolean onFling(MotionEvent paramAnonymousMotionEvent1, MotionEvent paramAnonymousMotionEvent2, float paramAnonymousFloat1, float paramAnonymousFloat2)
    {
      return false;
    }
    
    public void onLongPress(MotionEvent paramAnonymousMotionEvent) {}
    
    public boolean onScroll(MotionEvent paramAnonymousMotionEvent1, MotionEvent paramAnonymousMotionEvent2, float paramAnonymousFloat1, float paramAnonymousFloat2)
    {
      return false;
    }
    
    public void onShowPress(MotionEvent paramAnonymousMotionEvent) {}
    
    public boolean onSingleTapUp(MotionEvent paramAnonymousMotionEvent)
    {
      PackDetailPreviews.logger.log("onSingleTapUp");
      return true;
    }
  };
  private PreviewAdapter mAdapter;
  private boolean mAttached;
  private int mDividerWidth;
  private View mErrorView;
  private int mGridColumns;
  private int mGridHiddenHeight;
  private int mHeadBottom;
  private int mHeadPaddingBottom;
  private boolean mInterceptTouchEvents;
  private GridLayoutManager mLayoutManager;
  private LoadPreviewsTask mLoadTask;
  private long mPackId;
  private String mPackIdentifier;
  private Cds.PackType mPackType;
  private AdobeImageContentLoadingProgressBar mProgressBar;
  private boolean mRecyclerScrolled;
  private RecyclerView mRecyclerView;
  private String mShopBackgroundColor;
  private RecyclerView.OnScrollListener scrollListener;
  
  public PackDetailPreviews(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public PackDetailPreviews(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public PackDetailPreviews(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    init(paramContext);
    detector = new GestureDetector(paramContext, listener);
    detector.setIsLongpressEnabled(false);
  }
  
  private void hideError()
  {
    logger.verbose("hideError", new Object[0]);
    mErrorView.setVisibility(4);
    mErrorView.setOnClickListener(null);
  }
  
  private void hideProgress()
  {
    mProgressBar.hide();
  }
  
  private void init(Context paramContext)
  {
    mAdapter = new PreviewAdapter(paramContext, null, false);
    mLayoutManager = new GridLayoutManager(paramContext, 3, 1, false);
  }
  
  private boolean isValidContext()
  {
    return (mAttached) && (getContext() != null);
  }
  
  private void loadPreviewsInternal()
  {
    if ((isValidContext()) && (mPackId > 0L))
    {
      if ((mRecyclerView.getTag() != null) && (Objects.equal(mPackIdentifier, mRecyclerView.getTag())))
      {
        logger.warn("RecyclerView tag is the same. skipping load");
        return;
      }
      if (Cds.PackType.EFFECT == mPackType)
      {
        mGridColumns = getResources().getInteger(R.integer.com_adobe_image_store_preview_columns_effects);
        mDividerWidth = getResources().getDimensionPixelSize(R.dimen.com_adobe_image_store_preview_padding);
      }
      for (;;)
      {
        mLayoutManager.setSpanCount(mGridColumns);
        if (mLoadTask != null) {
          mLoadTask.cancel(true);
        }
        mLoadTask = new LoadPreviewsTask();
        mLoadTask.executeInParallel(new Long[] { Long.valueOf(mPackId) });
        return;
        if (Cds.PackType.FRAME == mPackType)
        {
          mGridColumns = getResources().getInteger(R.integer.com_adobe_image_store_preview_columns_frames);
          mDividerWidth = 0;
        }
        else
        {
          mGridColumns = getResources().getInteger(R.integer.com_adobe_image_store_preview_columns_stickers);
          mDividerWidth = 0;
        }
      }
    }
    logger.warn("invalid context");
  }
  
  private void reload()
  {
    logger.info("reload");
    mRecyclerView.setTag(null);
    loadPreviewsInternal();
  }
  
  private void showError()
  {
    logger.warn("showError");
    mErrorView.setVisibility(0);
    mErrorView.setOnClickListener(this);
  }
  
  private void showPreviews(final Cursor paramCursor, final double paramDouble, String paramString)
  {
    if (paramCursor == null)
    {
      logger.warn("cursor is null");
      showError();
      hideProgress();
      return;
    }
    logger.verbose("cursor size: " + paramCursor.getCount(), new Object[0]);
    int i = 0;
    int j = 0;
    hideProgress();
    mRecyclerScrolled = false;
    int m;
    int k;
    if (paramCursor.getCount() > 0)
    {
      j = mRecyclerView.getWidth();
      if (j > 0)
      {
        i = j;
        if (mDividerWidth > 0) {
          i = j - (mGridColumns + 1) * mDividerWidth;
        }
        m = i / mGridColumns;
        k = (int)(m / paramDouble);
        logger.verbose("width: %d", new Object[] { Integer.valueOf(j) });
        logger.verbose("dividerWidth: %d", new Object[] { Integer.valueOf(mDividerWidth) });
        logger.verbose("totalWidth: %d", new Object[] { Integer.valueOf(i) });
        logger.verbose("previewSize:%dx%d ", new Object[] { Integer.valueOf(m), Integer.valueOf(k) });
        j = m;
        i = k;
      }
    }
    else
    {
      mAdapter.setDividerSize(mDividerWidth);
      mAdapter.setPreviewSize(j, i);
      mAdapter.setPreviewPath(paramString);
      mAdapter.setFileExt(Cds.getPreviewItemExt(mPackType));
      mAdapter.setPackType(mPackType);
      if (TextUtils.isEmpty(mShopBackgroundColor)) {
        break label465;
      }
      mAdapter.setBackgroundColor(Color.parseColor(mShopBackgroundColor));
    }
    for (;;)
    {
      mGridHiddenHeight = (mHeadBottom - mHeadPaddingBottom);
      paramString = new MatrixCursor(paramCursor.getColumnNames(), mGridColumns);
      j = 0;
      while (j < mGridColumns)
      {
        paramString.addRow(new Object[] { Integer.valueOf(-(j + 1)), "", Integer.valueOf(-1), "", "" });
        j += 1;
      }
      logger.warn("need to wait for recycler view measurements...");
      mRecyclerView.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener()
      {
        public void onGlobalLayout()
        {
          if (ApiHelper.AT_LEAST_16) {
            mRecyclerView.getViewTreeObserver().removeOnGlobalLayoutListener(this);
          }
          for (;;)
          {
            PackDetailPreviews.this.showPreviews(paramCursor, paramDouble, val$previewPath);
            return;
            mRecyclerView.getViewTreeObserver().removeGlobalOnLayoutListener(this);
          }
        }
      });
      return;
      label465:
      mAdapter.setBackgroundColor(getResources().getColor(R.color.com_adobe_image_store_preview_default_background));
    }
    MatrixCursor localMatrixCursor;
    if (mPackType != Cds.PackType.EFFECT)
    {
      localMatrixCursor = new MatrixCursor(paramCursor.getColumnNames(), mGridColumns);
      long l1 = paramCursor.getCount() + paramString.getCount() + 1;
      if (paramCursor.moveToLast())
      {
        l1 = paramCursor.getLong(0) + 100L;
        paramCursor.moveToPosition(-1);
      }
      long l2 = l1;
      int n;
      if (paramCursor.getCount() % mGridColumns != 0)
      {
        k = mGridColumns;
        m = paramCursor.getCount();
        n = mGridColumns;
        j = 0;
        for (;;)
        {
          l2 = l1;
          if (j >= k - m % n) {
            break;
          }
          l1 += 1L;
          localMatrixCursor.addRow(new Object[] { Long.valueOf(l1), "", Integer.valueOf(-1), "", "" });
          j += 1;
        }
      }
      j = (paramCursor.getCount() + localMatrixCursor.getCount()) / mGridColumns;
      j = mGridHiddenHeight + j * i;
      k = getResourcesgetDisplayMetricsheightPixels;
      if (j < k) {
        while (j < k)
        {
          j = 0;
          while (j < mGridColumns)
          {
            l2 += 1L;
            localMatrixCursor.addRow(new Object[] { Long.valueOf(l2), "", Integer.valueOf(-1), "", "" });
            j += 1;
          }
          m = (paramCursor.getCount() + localMatrixCursor.getCount()) / mGridColumns;
          n = m * i;
          j = mGridHiddenHeight + n;
          logger.verbose("rows: %d", new Object[] { Integer.valueOf(m) });
          logger.verbose("rowsHeigth: %d", new Object[] { Integer.valueOf(n) });
          logger.verbose("totalGridHeight: %d", new Object[] { Integer.valueOf(j) });
          logger.verbose("screenHeight: %d", new Object[] { Integer.valueOf(k) });
        }
      }
    }
    for (paramCursor = new MergeCursor(new Cursor[] { paramString, paramCursor, localMatrixCursor });; paramCursor = new MergeCursor(new Cursor[] { paramString, paramCursor }))
    {
      mAdapter.changeCursor(paramCursor);
      if (mPackType != Cds.PackType.EFFECT)
      {
        paramCursor = AnimationUtils.loadAnimation(getContext(), R.anim.com_adobe_image_slide_in_bottom_preview_stickers);
        mRecyclerView.startAnimation(paramCursor);
      }
      mRecyclerView.setTag(mPackIdentifier);
      return;
    }
  }
  
  private void showProgress()
  {
    mProgressBar.show();
  }
  
  public void clearAll()
  {
    if (mLoadTask != null) {
      mLoadTask.cancel(true);
    }
    mRecyclerView.setTag(null);
    mAdapter.changeCursor(null);
    mLayoutManager = new GridLayoutManager(getContext(), 3, 1, false);
    mRecyclerView.setLayoutManager(mLayoutManager);
    hideError();
  }
  
  public boolean getInterceptTouchEventEnabled()
  {
    return mInterceptTouchEvents;
  }
  
  public void loadPreviews(PacksColumns.PackCursorWrapper paramPackCursorWrapper, boolean paramBoolean, View paramView)
  {
    logger.info("loadPreviews");
    mPackId = paramPackCursorWrapper.getId();
    mPackType = Cds.PackType.fromString(paramPackCursorWrapper.getPackType());
    mPackIdentifier = paramPackCursorWrapper.getIdentifier();
    mHeadBottom = paramView.getBottom();
    mHeadPaddingBottom = paramView.getPaddingBottom();
    mShopBackgroundColor = paramPackCursorWrapper.getContent().getShopBackgroundColor();
    mProgressBar.setTranslationY(mHeadBottom);
    mErrorView.setTranslationY(mHeadBottom);
    if (paramBoolean) {
      mRecyclerView.setTag(null);
    }
    loadPreviewsInternal();
  }
  
  protected void onAttachedToWindow()
  {
    logger.info("onAttachedToWindow");
    mAttached = true;
    super.onAttachedToWindow();
    loadPreviewsInternal();
  }
  
  public void onClick(View paramView)
  {
    if (mErrorView.equals(paramView)) {
      reload();
    }
  }
  
  protected void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    mAdapter.changeCursor(null);
    mPackId = -1L;
    mAttached = false;
  }
  
  protected void onFinishInflate()
  {
    super.onFinishInflate();
    mRecyclerView = ((RecyclerView)findViewById(16908298));
    mProgressBar = ((AdobeImageContentLoadingProgressBar)findViewById(R.id.progress));
    mErrorView = findViewById(R.id.error);
    mRecyclerView.setHasFixedSize(true);
    mRecyclerView.setLayoutManager(mLayoutManager);
    mRecyclerView.setAdapter(mAdapter);
    mRecyclerView.setOnScrollListener(new RecyclerView.OnScrollListener()
    {
      public void onScrollStateChanged(RecyclerView paramAnonymousRecyclerView, int paramAnonymousInt)
      {
        if (scrollListener != null) {
          scrollListener.onScrollStateChanged(paramAnonymousRecyclerView, paramAnonymousInt);
        }
      }
      
      public void onScrolled(RecyclerView paramAnonymousRecyclerView, int paramAnonymousInt1, int paramAnonymousInt2)
      {
        PackDetailPreviews.access$102(PackDetailPreviews.this, true);
        if (scrollListener != null) {
          scrollListener.onScrolled(paramAnonymousRecyclerView, paramAnonymousInt1, paramAnonymousInt2);
        }
      }
    });
  }
  
  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    if ((mRecyclerView != null) && (mInterceptTouchEvents))
    {
      View localView = mRecyclerView.findChildViewUnder(paramMotionEvent.getX(), paramMotionEvent.getY());
      int i = mRecyclerView.getChildAdapterPosition(localView);
      if ((i >= 0) && (i < mGridColumns)) {
        return true;
      }
    }
    return super.onInterceptTouchEvent(paramMotionEvent);
  }
  
  public void resetPositions()
  {
    mRecyclerView.scrollToPosition(0);
  }
  
  public void setInterceptTouchEventEnabled(boolean paramBoolean)
  {
    mInterceptTouchEvents = paramBoolean;
  }
  
  public void setOnScrollListener(RecyclerView.OnScrollListener paramOnScrollListener)
  {
    scrollListener = paramOnScrollListener;
  }
  
  class LoadPreviewsTask
    extends AdobeImageAsyncTask<Long, Void, Cursor>
  {
    private double aspectRatio;
    private long packId;
    private String previewPath;
    
    LoadPreviewsTask() {}
    
    protected Cursor doInBackground(Long... paramVarArgs)
    {
      if (!PackDetailPreviews.this.isValidContext())
      {
        PackDetailPreviews.logger.warn("not a valid context");
        return null;
      }
      packId = paramVarArgs[0].longValue();
      paramVarArgs = getContext();
      if (packId != mPackId)
      {
        PackDetailPreviews.logger.warn("packid != View.packId");
        return null;
      }
      PacksColumns.PackCursorWrapper localPackCursorWrapper = CdsUtils.getPackFullInfoById(paramVarArgs, packId);
      if ((localPackCursorWrapper == null) || (localPackCursorWrapper.getContent() == null))
      {
        PackDetailPreviews.logger.warn("pack or its content is null");
        return null;
      }
      previewPath = localPackCursorWrapper.getContent().getPreviewPath();
      boolean bool;
      if (TextUtils.isEmpty(previewPath))
      {
        PackDetailPreviews.logger.warn("previewPath is empty");
        bool = true;
      }
      for (;;)
      {
        PackDetailPreviews.logger.verbose("previewPath: " + previewPath, new Object[0]);
        PackDetailPreviews.logger.verbose("download previews: %b", new Object[] { Boolean.valueOf(bool) });
        if (bool) {
          localObject = CdsDownloaderFactory.create(Cds.ContentType.PREVIEW);
        }
        try
        {
          previewPath = ((CdsDownloaderFactory.Downloader)localObject).download(paramVarArgs, packId);
          if (!TextUtils.isEmpty(previewPath)) {
            break;
          }
          PackDetailPreviews.logger.error("previewPath is still empty!!");
          return null;
        }
        catch (Exception paramVarArgs)
        {
          CdsValidatorFactory.Validator localValidator;
          PackDetailPreviews.logger.error("failed to download previews: %s", new Object[] { paramVarArgs });
          paramVarArgs.printStackTrace();
          return null;
        }
        Object localObject = new File(previewPath);
        if ((!((File)localObject).exists()) || (!((File)localObject).isDirectory()))
        {
          PackDetailPreviews.logger.warn("previewPath doesn't exists");
          bool = true;
        }
        else
        {
          localValidator = CdsValidatorFactory.create(Cds.ContentType.PREVIEW, Cds.PackType.fromString(localPackCursorWrapper.getPackType()));
          try
          {
            localValidator.validate(paramVarArgs, localPackCursorWrapper.getContent().getId(), (File)localObject, false);
            PackDetailPreviews.logger.warn("previewPath is valid");
            bool = false;
          }
          catch (Throwable localThrowable)
          {
            localThrowable.printStackTrace();
            PackDetailPreviews.logger.warn("previewPath is not valid");
            bool = true;
            try
            {
              IOUtils.deleteDirectory((File)localObject);
            }
            catch (IOException localIOException)
            {
              localIOException.printStackTrace();
            }
          }
        }
      }
      double[] arrayOfDouble = new double[1];
      arrayOfDouble[0] = 0.0D;
      paramVarArgs = CdsUIUtils.computePreviewAspectRatio(paramVarArgs, packId, localPackCursorWrapper.getPackType(), previewPath, arrayOfDouble);
      aspectRatio = arrayOfDouble[0];
      return paramVarArgs;
    }
    
    protected void doPostExecute(Cursor paramCursor)
    {
      if (mPackId == packId)
      {
        PackDetailPreviews.this.showPreviews(paramCursor, aspectRatio, previewPath);
        return;
      }
      PackDetailPreviews.logger.warn("packId != mPackId");
    }
    
    protected void doPreExecute()
    {
      PackDetailPreviews.this.hideError();
      PackDetailPreviews.this.showProgress();
    }
  }
  
  class PreviewAdapter
    extends RecyclerCursorAdapter<RecyclerView.ViewHolder>
  {
    private int backgroundColor;
    private String baseDir;
    private int columnIndexDisplayName;
    private int columnIndexIdentifier;
    private int dividerSize;
    private String fileExt;
    private LayoutInflater inflater;
    private int lastPosition;
    private Cds.PackType packType;
    Picasso picasso;
    private int previewHeight;
    private int previewWidth;
    
    public PreviewAdapter(Context paramContext, Cursor paramCursor, boolean paramBoolean)
    {
      super(paramCursor, paramBoolean);
      inflater = LayoutInflater.from(paramContext);
      picasso = Picasso.with(paramContext);
      lastPosition = -1;
    }
    
    private void animateView(View paramView, int paramInt)
    {
      if ((paramInt > lastPosition) && (!mRecyclerScrolled))
      {
        Animation localAnimation = AnimationUtils.loadAnimation(getContext(), R.anim.com_adobe_image_slide_in_bottom_preview_effects);
        localAnimation.setStartOffset(paramInt * 50);
        paramView.startAnimation(localAnimation);
        lastPosition = paramInt;
      }
    }
    
    private void initCursor(Cursor paramCursor)
    {
      lastPosition = -1;
      if (paramCursor != null)
      {
        columnIndexDisplayName = paramCursor.getColumnIndex("item_displayName");
        columnIndexIdentifier = paramCursor.getColumnIndex("item_identifier");
      }
    }
    
    public int getItemCount()
    {
      return super.getItemCount();
    }
    
    public int getItemViewTypeUnCached(int paramInt)
    {
      if (getItemId(paramInt) < 0L) {
        return -1;
      }
      return packType.ordinal();
    }
    
    public void loadImage(String paramString1, String paramString2, final ImageView paramImageView)
    {
      paramString1 = new File(baseDir, paramString1 + fileExt).getAbsolutePath();
      final int j = paramString1.hashCode();
      Object localObject = (Integer)paramImageView.getTag();
      int i;
      if ((localObject != null) && (((Integer)localObject).equals(Integer.valueOf(j))))
      {
        i = 1;
        if (i == 0)
        {
          if (paramImageView.getDrawable() != null) {
            paramImageView.setImageBitmap(null);
          }
          picasso.cancelRequest(paramImageView);
          localObject = picasso.load(paramString1).fit();
          if (!mRecyclerScrolled) {
            break label173;
          }
        }
      }
      label173:
      for (long l = 200L;; l = 0L)
      {
        ((RequestCreator)localObject).fade(l).transform(new CdsPreviewTransformer(paramString1, paramString2, packType.toCdsString())).into(paramImageView, new Callback()
        {
          public void onError() {}
          
          public void onSuccess()
          {
            paramImageView.setTag(Integer.valueOf(j));
          }
        });
        return;
        i = 0;
        break;
      }
    }
    
    public void onBindViewHolder(RecyclerView.ViewHolder paramViewHolder, int paramInt)
    {
      int j = paramViewHolder.getItemViewType();
      Object localObject2;
      Object localObject1;
      int i;
      if (j != -1)
      {
        localObject2 = (GridLayoutManager.LayoutParams)itemView.getLayoutParams();
        localObject1 = (Cursor)getItem(paramInt);
        if (j == Cds.PackType.EFFECT.ordinal())
        {
          if ((paramInt != 0) && (paramInt % mGridColumns != 0)) {
            break label236;
          }
          i = 1;
          if (i == 0) {
            break label241;
          }
          leftMargin = dividerSize;
          label76:
          rightMargin = dividerSize;
          topMargin = dividerSize;
          bottomMargin = dividerSize;
        }
        if ((localObject1 == null) || (((Cursor)localObject1).isAfterLast()) || (columnIndexDisplayName <= -1) || (columnIndexIdentifier <= -1) || (baseDir == null)) {
          break label264;
        }
        localObject2 = ((Cursor)localObject1).getString(columnIndexIdentifier);
        localObject1 = ((Cursor)localObject1).getString(columnIndexDisplayName);
        if (j != Cds.PackType.EFFECT.ordinal()) {
          break label250;
        }
        textView.setText((CharSequence)localObject1);
      }
      for (;;)
      {
        loadImage((String)localObject2, (String)localObject1, ((PackDetailPreviews.PreviewViewHolder)paramViewHolder).getImageView());
        if ((j == Cds.PackType.EFFECT.ordinal()) && (!mRecyclerScrolled)) {
          animateView(itemView, paramInt);
        }
        return;
        label236:
        i = 0;
        break;
        label241:
        leftMargin = 0;
        break label76;
        label250:
        itemView.setBackgroundColor(backgroundColor);
      }
      label264:
      PackDetailPreviews.logger.warn("cursor: %s", new Object[] { localObject1 });
      PackDetailPreviews.logger.warn("columnIndexDisplayName: %d", new Object[] { Integer.valueOf(columnIndexDisplayName) });
      PackDetailPreviews.logger.warn("columnIndexIdentifier: %d", new Object[] { Integer.valueOf(columnIndexIdentifier) });
      PackDetailPreviews.logger.warn("baseDir: %s", new Object[] { baseDir });
    }
    
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup paramViewGroup, int paramInt)
    {
      if (paramInt == -1)
      {
        paramViewGroup = new View(getContext());
        localObject = new GridLayoutManager.LayoutParams(previewWidth, mGridHiddenHeight);
        paramViewGroup.setVisibility(4);
        paramViewGroup.setLayoutParams((ViewGroup.LayoutParams)localObject);
        return new PackDetailPreviews.PreviewEffectViewHolder(paramViewGroup);
      }
      if (paramInt == Cds.PackType.EFFECT.ordinal())
      {
        paramViewGroup = inflater.inflate(R.layout.com_adobe_image_store_detail_preview_effect, paramViewGroup, false);
        localObject = ((ImageView)paramViewGroup.findViewById(R.id.image)).getLayoutParams();
        width = -1;
        height = previewHeight;
        return new PackDetailPreviews.PreviewEffectViewHolder(paramViewGroup);
      }
      paramViewGroup = inflater.inflate(R.layout.com_adobe_image_store_detail_preview_sticker, paramViewGroup, false);
      Object localObject = paramViewGroup.getLayoutParams();
      width = previewWidth;
      height = previewHeight;
      return new PackDetailPreviews.PreviewStickerViewHolder(paramViewGroup);
    }
    
    public void setBackgroundColor(int paramInt)
    {
      backgroundColor = paramInt;
    }
    
    public void setDividerSize(int paramInt)
    {
      dividerSize = paramInt;
    }
    
    public void setFileExt(String paramString)
    {
      fileExt = paramString;
    }
    
    public void setPackType(Cds.PackType paramPackType)
    {
      packType = paramPackType;
    }
    
    public void setPreviewPath(String paramString)
    {
      baseDir = paramString;
    }
    
    public void setPreviewSize(int paramInt1, int paramInt2)
    {
      previewWidth = paramInt1;
      previewHeight = paramInt2;
    }
    
    public Cursor swapCursor(Cursor paramCursor)
    {
      initCursor(paramCursor);
      return super.swapCursor(paramCursor);
    }
  }
  
  static class PreviewEffectViewHolder
    extends PackDetailPreviews.PreviewViewHolder
  {
    TextView textView;
    
    public PreviewEffectViewHolder(View paramView)
    {
      super();
    }
    
    protected void initialize(View paramView)
    {
      textView = ((TextView)paramView.findViewById(R.id.title));
      imageView = ((ImageView)paramView.findViewById(R.id.image));
    }
  }
  
  static class PreviewStickerViewHolder
    extends PackDetailPreviews.PreviewViewHolder
  {
    public PreviewStickerViewHolder(View paramView)
    {
      super();
    }
    
    protected void initialize(View paramView)
    {
      imageView = ((ImageView)paramView);
    }
  }
  
  static abstract class PreviewViewHolder
    extends RecyclerView.ViewHolder
  {
    protected ImageView imageView;
    
    public PreviewViewHolder(View paramView)
    {
      super();
      initialize(paramView);
    }
    
    public ImageView getImageView()
    {
      return imageView;
    }
    
    protected abstract void initialize(View paramView);
  }
}
