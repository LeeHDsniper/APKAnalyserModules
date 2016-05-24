.class public Lcom/adobe/creativesdk/aviary/panels/FocusPanel;
.super Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;
.source "FocusPanel.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$OnCheckedChangeListener;
.implements Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$OnTiltShiftDrawListener;
.implements Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$OnDrawableChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;,
        Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;,
        Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;
    }
.end annotation


# instance fields
.field private mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;

.field private mCircleButton:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

.field private mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

.field private mRectButton:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

.field mTiltShiftMode:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

.field final mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;
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
    .registers 4
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    .param p2, "entry"    # Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    .prologue
    .line 64
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 65
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    .line 66
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/panels/FocusPanel;)Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mCircleButton:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/panels/FocusPanel;)Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mRectButton:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    return-object v0
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/panels/FocusPanel;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    return-object v0
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/aviary/panels/FocusPanel;)Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;

    return-object v0
.end method


# virtual methods
.method protected createFilter()Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;
    .registers 2

    .prologue
    .line 257
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->FOCUS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

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
    .line 263
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_editor_content_focus:I

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
    .line 268
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_bottombar_panel_focus:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    return-object v0
.end method

.method public onActivate()V
    .registers 6

    .prologue
    .line 93
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onActivate()V

    .line 95
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mBitmap:Landroid/graphics/Bitmap;

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->copy(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mPreview:Landroid/graphics/Bitmap;

    .line 97
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->start()V

    .line 99
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->setOnDrawStartListener(Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$OnTiltShiftDrawListener;)V

    .line 100
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    sget-object v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->FIT_IF_BIGGER:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setDisplayType(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;)V

    .line 101
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mPreview:Landroid/graphics/Bitmap;

    const/4 v2, 0x0

    const/high16 v3, -0x40800000

    const/high16 v4, 0x41000000

    invoke-virtual {v0, v1, v2, v3, v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;FF)V

    .line 102
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->contentReady()V

    .line 103
    return-void
.end method

.method public onCancelled()V
    .registers 1

    .prologue
    .line 182
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onCancelled()V

    .line 183
    return-void
.end method

.method public onCheckedChanged(Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;ZZ)V
    .registers 10
    .param p1, "button"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;
    .param p2, "isChecked"    # Z
    .param p3, "fromUser"    # Z

    .prologue
    const/4 v4, 0x0

    .line 114
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->getId()I

    move-result v1

    .line 117
    .local v1, "id":I
    if-nez p2, :cond_8

    .line 147
    :goto_7
    return-void

    .line 121
    :cond_8
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mRectButton:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->getId()I

    move-result v2

    if-ne v1, v2, :cond_2a

    .line 122
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "rect"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 123
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;->Linear:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mTiltShiftMode:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    .line 124
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mCircleButton:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v2, v4}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setChecked(Z)V

    .line 131
    :cond_20
    :goto_20
    if-nez p3, :cond_43

    .line 132
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "return"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    goto :goto_7

    .line 125
    :cond_2a
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mCircleButton:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->getId()I

    move-result v2

    if-ne v1, v2, :cond_20

    .line 126
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "circle"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 127
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;->Radial:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mTiltShiftMode:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    .line 128
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mRectButton:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v2, v4}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setChecked(Z)V

    goto :goto_20

    .line 136
    :cond_43
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 138
    .local v0, "attrs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mTiltShiftMode:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;->Radial:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    if-ne v2, v3, :cond_8a

    .line 139
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v2, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;

    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;->Radial:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->setTiltShiftDrawMode(Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;)V

    .line 140
    const-string v2, "style"

    const-string v3, "circle"

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    :cond_5e
    :goto_5e
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->FOCUS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 146
    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": style_selected"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEventAttributes(Ljava/lang/String;Ljava/util/HashMap;)V

    goto/16 :goto_7

    .line 141
    :cond_8a
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mTiltShiftMode:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;->Linear:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    if-ne v2, v3, :cond_5e

    .line 142
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v2, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;

    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;->Linear:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->setTiltShiftDrawMode(Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;)V

    .line 143
    const-string v2, "style"

    const-string v3, "rectangle"

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5e
.end method

.method protected onComplete(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V
    .registers 6
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "actions"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    .prologue
    .line 240
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mTiltShiftMode:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;->Radial:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    if-ne v0, v1, :cond_1f

    .line 241
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mTrackingAttributes:Ljava/util/HashMap;

    const-string v1, "style"

    const-string v2, "circle"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 246
    :goto_f
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    invoke-virtual {v0, p2}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setActionList(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    .line 247
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setToolAction(Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;)V

    .line 248
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onComplete(Landroid/graphics/Bitmap;)V

    .line 249
    return-void

    .line 243
    :cond_1f
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mTrackingAttributes:Ljava/util/HashMap;

    const-string v1, "style"

    const-string v2, "rectangle"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_f
.end method

.method public onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V
    .registers 7
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "options"    # Landroid/os/Bundle;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongViewCast"
        }
    .end annotation

    .prologue
    .line 71
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V

    .line 73
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$id;->button2:I

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mRectButton:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    .line 74
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$id;->button1:I

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mCircleButton:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    .line 75
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->getContentView()Landroid/view/View;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$id;->image:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    .line 77
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;

    .line 78
    .local v0, "image":Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;
    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->setOnDrawableChangedListener(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$OnDrawableChangeListener;)V

    .line 79
    sget-object v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->FIT_IF_BIGGER:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->setDisplayType(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;)V

    .line 81
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mCircleButton:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v1, p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setOnCheckedChangeListener(Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$OnCheckedChangeListener;)V

    .line 82
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mRectButton:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v1, p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setOnCheckedChangeListener(Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$OnCheckedChangeListener;)V

    .line 85
    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;

    const-string v2, "filter-thread"

    const/4 v3, 0x5

    invoke-direct {v1, p0, v2, v3}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;-><init>(Lcom/adobe/creativesdk/aviary/panels/FocusPanel;Ljava/lang/String;I)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;

    .line 88
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->createFilter()Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    .line 89
    return-void
.end method

.method public onDeactivate()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 151
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setOnDrawableChangedListener(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$OnDrawableChangeListener;)V

    .line 152
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mCircleButton:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setOnCheckedChangeListener(Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$OnCheckedChangeListener;)V

    .line 153
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mRectButton:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setOnCheckedChangeListener(Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$OnCheckedChangeListener;)V

    .line 155
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->setOnDrawStartListener(Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$OnTiltShiftDrawListener;)V

    .line 157
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;

    if-eqz v0, :cond_3d

    .line 159
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->clear()V

    .line 161
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_3d

    .line 162
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->quit()V

    .line 163
    :goto_2d
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_3d

    .line 164
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "isAlive..."

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    goto :goto_2d

    .line 169
    :cond_3d
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->onProgressEnd()V

    .line 170
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onDeactivate()V

    .line 171
    return-void
.end method

.method public onDestroy()V
    .registers 2

    .prologue
    .line 175
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onDestroy()V

    .line 176
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;

    .line 177
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->clear()V

    .line 178
    return-void
.end method

.method protected onDispose()V
    .registers 2

    .prologue
    .line 108
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->dispose()V

    .line 109
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onDispose()V

    .line 110
    return-void
.end method

.method public onDrawEnd()V
    .registers 2

    .prologue
    .line 199
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->pathEnd()V

    .line 200
    return-void
.end method

.method public onDrawStart([FLcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;FFFFFF)V
    .registers 18
    .param p1, "points"    # [F
    .param p2, "mode"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;
    .param p3, "radius"    # F
    .param p4, "angle"    # F
    .param p5, "left"    # F
    .param p6, "top"    # F
    .param p7, "right"    # F
    .param p8, "bottom"    # F

    .prologue
    .line 188
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-virtual/range {v0 .. v8}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->drawStart([FLcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;FFFFFF)V

    .line 189
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->setIsChanged(Z)V

    .line 190
    return-void
.end method

.method public onDrawableChanged(Landroid/graphics/drawable/Drawable;)V
    .registers 6
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 204
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mCircleButton:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 205
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;->Radial:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mTiltShiftMode:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    .line 210
    :cond_c
    :goto_c
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->getHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$1;-><init>(Lcom/adobe/creativesdk/aviary/panels/FocusPanel;)V

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 225
    return-void

    .line 206
    :cond_1b
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mRectButton:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 207
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;->Linear:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mTiltShiftMode:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    goto :goto_c
.end method

.method public onDrawing([FFFFFFF)V
    .registers 16
    .param p1, "points"    # [F
    .param p2, "radius"    # F
    .param p3, "angle"    # F
    .param p4, "left"    # F
    .param p5, "top"    # F
    .param p6, "right"    # F
    .param p7, "bottom"    # F

    .prologue
    .line 194
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move v7, p7

    invoke-virtual/range {v0 .. v7}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->draw([FFFFFFF)V

    .line 195
    return-void
.end method

.method protected onGenerateResult()V
    .registers 4

    .prologue
    .line 229
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_21

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->isCompleted()Z

    move-result v1

    if-nez v1, :cond_21

    .line 230
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mBackgroundDrawThread:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->finish()V

    .line 231
    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;-><init>(Lcom/adobe/creativesdk/aviary/panels/FocusPanel;)V

    .line 232
    .local v0, "task":Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 236
    .end local v0    # "task":Lcom/adobe/creativesdk/aviary/panels/FocusPanel$GenerateResultTask;
    :goto_20
    return-void

    .line 234
    :cond_21
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mPreview:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->onComplete(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    goto :goto_20
.end method
