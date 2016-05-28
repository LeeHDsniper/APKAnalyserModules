.class public Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;
.super Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;
.source "ColorSplashPanel.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$OnCheckedChangeListener;
.implements Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$OnDrawListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel$GenerateResultTask;
    }
.end annotation


# instance fields
.field private mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

.field private mBrushType:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

.field private mCurrent:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

.field private mDisabledStatusView:Landroid/view/View;

.field private mErase:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

.field private mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

.field private mFree:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

.field private mLensButton:Landroid/widget/ImageView;

.field private mSmart:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

.field mThreadHandler:Landroid/os/Handler;

.field private final mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V
    .registers 5
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    .param p2, "entry"    # Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    .prologue
    .line 87
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 50
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;->Free:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mBrushType:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    .line 53
    new-instance v0, Landroid/os/Handler;

    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel$1;-><init>(Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;)V

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mThreadHandler:Landroid/os/Handler;

    .line 88
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;->None:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;->name()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    .line 89
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;)Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;
    .param p1, "x1"    # Landroid/graphics/Bitmap;
    .param p2, "x2"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    .prologue
    .line 43
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->onComplete(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    return-void
.end method

.method private onComplete(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V
    .registers 5
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "actions"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    .prologue
    .line 279
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    invoke-virtual {v0, p2}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setActionList(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    .line 280
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setToolAction(Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;)V

    .line 281
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->onComplete(Landroid/graphics/Bitmap;)V

    .line 282
    return-void
.end method

.method private setSelectedTool(Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;)V
    .registers 7
    .param p1, "which"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 205
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->setDrawMode(Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;)V

    .line 207
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;->IMAGE:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    if-ne p1, v0, :cond_27

    .line 208
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mLensButton:Landroid/widget/ImageView;

    new-array v3, v1, [I

    const v4, 0x10100a0

    aput v4, v3, v2

    invoke-virtual {v0, v3, v1}, Landroid/widget/ImageView;->setImageState([IZ)V

    .line 212
    :goto_19
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mLensButton:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->invalidate()V

    .line 215
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;->IMAGE:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    if-eq p1, v0, :cond_34

    move v0, v1

    :goto_23
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->setPanelEnabled(Z)V

    .line 216
    return-void

    .line 210
    :cond_27
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mLensButton:Landroid/widget/ImageView;

    new-array v3, v1, [I

    const v4, -0x10100a0

    aput v4, v3, v2

    invoke-virtual {v0, v3, v2}, Landroid/widget/ImageView;->setImageState([IZ)V

    goto :goto_19

    :cond_34
    move v0, v2

    .line 215
    goto :goto_23
.end method


# virtual methods
.method protected createFilter()Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;
    .registers 2

    .prologue
    .line 307
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->SPLASH:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;->get(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    return-object v0
.end method

.method protected generateContentView(Landroid/view/LayoutInflater;)Landroid/view/View;
    .registers 4
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InflateParams"
        }
    .end annotation

    .prologue
    .line 313
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_editor_content_spot_draw:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected generateOptionView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/ViewGroup;
    .registers 5
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 318
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_panel_colorsplash:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    return-object v0
.end method

.method public onActivate()V
    .registers 6

    .prologue
    .line 124
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onActivate()V

    .line 126
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mFree:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 127
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mFree:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mCurrent:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    .line 130
    :cond_f
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mSmart:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 131
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mSmart:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mCurrent:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    .line 134
    :cond_1b
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mErase:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_27

    .line 135
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mErase:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mCurrent:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    .line 139
    :cond_27
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mBitmap:Landroid/graphics/Bitmap;

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->copy(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mPreview:Landroid/graphics/Bitmap;

    .line 142
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->setOnDrawStartListener(Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$OnDrawListener;)V

    .line 143
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    sget-object v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->FIT_IF_BIGGER:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setDisplayType(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;)V

    .line 144
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mPreview:Landroid/graphics/Bitmap;

    const/4 v2, 0x0

    const/high16 v3, -0x40800000

    const/high16 v4, 0x41000000

    invoke-virtual {v0, v1, v2, v3, v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;FF)V

    .line 147
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->start(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 149
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mLensButton:Landroid/widget/ImageView;

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 151
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->getContentView()Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 152
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->contentReady()V

    .line 153
    return-void
.end method

.method public onCheckedChanged(Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;ZZ)V
    .registers 9
    .param p1, "buttonView"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;
    .param p2, "isChecked"    # Z
    .param p3, "fromUser"    # Z

    .prologue
    .line 176
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mCurrent:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    if-eqz v1, :cond_12

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mCurrent:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    .line 177
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mCurrent:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setChecked(Z)V

    .line 179
    :cond_12
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mCurrent:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    .line 181
    if-eqz p3, :cond_63

    if-eqz p2, :cond_63

    .line 182
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->getId()I

    move-result v0

    .line 184
    .local v0, "id":I
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mFree:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->getId()I

    move-result v1

    if-ne v0, v1, :cond_64

    .line 185
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;->Free:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mBrushType:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    .line 186
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->SPLASH:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 187
    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": free_color_selected"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;)V

    .line 198
    :cond_52
    :goto_52
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->getDrawMode()Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    if-eq v1, v2, :cond_63

    .line 199
    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->setSelectedTool(Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;)V

    .line 202
    .end local v0    # "id":I
    :cond_63
    return-void

    .line 188
    .restart local v0    # "id":I
    :cond_64
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mSmart:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->getId()I

    move-result v1

    if-ne v0, v1, :cond_9b

    .line 189
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;->Smart:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mBrushType:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    .line 190
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->SPLASH:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 191
    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": smart_color_selected"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;)V

    goto :goto_52

    .line 192
    :cond_9b
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mErase:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->getId()I

    move-result v1

    if-ne v0, v1, :cond_52

    .line 193
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;->Erase:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mBrushType:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    .line 194
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->SPLASH:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 195
    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": eraser_selected"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;)V

    goto :goto_52
.end method

.method public onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 167
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 169
    .local v0, "id":I
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mLensButton:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getId()I

    move-result v1

    if-ne v0, v1, :cond_1d

    .line 170
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->getDrawMode()Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    move-result-object v1

    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    if-ne v1, v2, :cond_1e

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;->IMAGE:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    :goto_1a
    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->setSelectedTool(Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;)V

    .line 172
    :cond_1d
    return-void

    .line 170
    :cond_1e
    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    goto :goto_1a
.end method

.method public onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V
    .registers 12
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    .line 93
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V

    .line 94
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    const-class v2, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    .line 96
    .local v8, "config":Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;
    sget v1, Lcom/aviary/android/feather/sdk/R$dimen;->com_adobe_image_editor_color_splash_brush_size:I

    invoke-virtual {v8, v1}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getDimensionPixelSize(I)I

    move-result v0

    .line 98
    .local v0, "brushSize":I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->getContentView()Landroid/view/View;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$id;->lens:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mLensButton:Landroid/widget/ImageView;

    .line 99
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$id;->button1:I

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mFree:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    .line 100
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$id;->button2:I

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mSmart:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    .line 101
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$id;->button3:I

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mErase:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    .line 103
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mFree:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v1, p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setOnCheckedChangeListener(Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$OnCheckedChangeListener;)V

    .line 104
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mSmart:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v1, p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setOnCheckedChangeListener(Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$OnCheckedChangeListener;)V

    .line 105
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mErase:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v1, p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setOnCheckedChangeListener(Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$OnCheckedChangeListener;)V

    .line 107
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->getContentView()Landroid/view/View;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$id;->image:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    .line 108
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;

    int-to-float v2, v0

    const/high16 v3, 0x3fc00000

    mul-float/2addr v2, v3

    float-to-int v2, v2

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->setBrushSize(F)V

    .line 109
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;

    const-wide/16 v2, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->setDrawLimit(D)V

    .line 110
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->setPaintEnabled(Z)V

    .line 111
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    sget-object v2, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->FIT_IF_BIGGER:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    invoke-virtual {v1, v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setDisplayType(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;)V

    .line 113
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$id;->disabled_status:I

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mDisabledStatusView:Landroid/view/View;

    .line 116
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->createFilter()Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    .line 118
    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    const-string v2, "draw-thread"

    const/4 v3, 0x5

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mThreadHandler:Landroid/os/Handler;

    const-wide/high16 v6, 0x3ff8000000000000L

    invoke-direct/range {v1 .. v7}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;-><init>(Ljava/lang/String;ILcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;Landroid/os/Handler;D)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    .line 120
    return-void
.end method

.method public onDeactivate()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 220
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mFree:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setOnCheckedChangeListener(Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$OnCheckedChangeListener;)V

    .line 221
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mSmart:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setOnCheckedChangeListener(Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$OnCheckedChangeListener;)V

    .line 222
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mErase:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setOnCheckedChangeListener(Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$OnCheckedChangeListener;)V

    .line 223
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mLensButton:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 225
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->setOnDrawStartListener(Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$OnDrawListener;)V

    .line 227
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    if-eqz v0, :cond_42

    .line 229
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->clear()V

    .line 231
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_42

    .line 232
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->quit()V

    .line 233
    :goto_32
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_42

    .line 234
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "isAlive..."

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    goto :goto_32

    .line 239
    :cond_42
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->onProgressEnd()V

    .line 240
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onDeactivate()V

    .line 241
    return-void
.end method

.method public onDestroy()V
    .registers 2

    .prologue
    .line 245
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->clear()V

    .line 246
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onDestroy()V

    .line 247
    return-void
.end method

.method protected onDispose()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 157
    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    .line 158
    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mThreadHandler:Landroid/os/Handler;

    .line 161
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->dispose()V

    .line 162
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onDispose()V

    .line 163
    return-void
.end method

.method public onDrawEnd()V
    .registers 2

    .prologue
    .line 264
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->pathEnd()V

    .line 265
    return-void
.end method

.method public onDrawStart([FF)V
    .registers 6
    .param p1, "points"    # [F
    .param p2, "radius"    # F

    .prologue
    .line 251
    const/high16 v0, 0x3f800000

    invoke-static {v0, p2}, Ljava/lang/Math;->max(FF)F

    move-result p2

    .line 252
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    const/high16 v1, 0x3fc00000

    div-float v1, p2, v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mBrushType:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    invoke-virtual {v0, v1, p1, v2}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->pathStart(F[FLcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;)V

    .line 253
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mBrushType:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;->setValue(Ljava/lang/Object;)V

    .line 254
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->setIsChanged(Z)V

    .line 255
    return-void
.end method

.method public onDrawing([FF)V
    .registers 4
    .param p1, "points"    # [F
    .param p2, "radius"    # F

    .prologue
    .line 259
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->lineTo([F)V

    .line 260
    return-void
.end method

.method protected onGenerateResult()V
    .registers 4

    .prologue
    .line 269
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_21

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->isCompleted()Z

    move-result v1

    if-nez v1, :cond_21

    .line 270
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->finish()V

    .line 271
    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel$GenerateResultTask;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel$GenerateResultTask;-><init>(Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;)V

    .line 272
    .local v0, "task":Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel$GenerateResultTask;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel$GenerateResultTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 276
    .end local v0    # "task":Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel$GenerateResultTask;
    :goto_20
    return-void

    .line 274
    :cond_21
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mPreview:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->onComplete(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    goto :goto_20
.end method

.method public setPanelEnabled(Z)V
    .registers 4
    .param p1, "value"    # Z

    .prologue
    .line 285
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mOptionView:Landroid/view/ViewGroup;

    if-eqz v0, :cond_1e

    .line 286
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mOptionView:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->isEnabled()Z

    move-result v0

    if-eq p1, v0, :cond_1e

    .line 287
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mOptionView:Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->setEnabled(Z)V

    .line 289
    if-eqz p1, :cond_1f

    .line 290
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->restoreToolbarTitle()V

    .line 294
    :goto_16
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->mDisabledStatusView:Landroid/view/View;

    if-eqz p1, :cond_31

    const/4 v0, 0x4

    :goto_1b
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 297
    :cond_1e
    return-void

    .line 292
    :cond_1f
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_zoom_mode:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;->setToolbarTitle(Ljava/lang/CharSequence;)V

    goto :goto_16

    .line 294
    :cond_31
    const/4 v0, 0x0

    goto :goto_1b
.end method
