.class Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;
.super Landroid/view/View;
.source "AmpDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/localytics/android/AmpDialogFragment$AmpDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CloseButton"
.end annotation


# instance fields
.field private mBitmap:Landroid/graphics/Bitmap;

.field private mCenterX:F

.field private mCenterY:F

.field private mInnerRadius:F

.field private mOffset:F

.field private mPaint:Landroid/graphics/Paint;

.field private mRadius:F

.field private mShadowInnerPaint:Landroid/graphics/Paint;

.field private mShadowOuterPaint:Landroid/graphics/Paint;

.field private mStrokeWidth:F

.field final synthetic this$1:Lcom/localytics/android/AmpDialogFragment$AmpDialog;


# direct methods
.method public constructor <init>(Lcom/localytics/android/AmpDialogFragment$AmpDialog;Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 14
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "attrs"    # Landroid/util/AttributeSet;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    const/high16 v9, 0x41f00000

    const/high16 v8, 0x41d00000

    const/high16 v3, 0x41500000

    const/4 v7, 0x1

    const/high16 v5, 0x3f000000

    .line 938
    iput-object p1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->this$1:Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    .line 939
    invoke-direct {p0, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 941
    invoke-virtual {p0, v7}, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->setId(I)V

    .line 944
    invoke-static {}, Lcom/localytics/android/DatapointHelper;->getApiLevel()I

    move-result v1

    const/16 v2, 0xe

    if-lt v1, v2, :cond_1d

    .line 946
    const/4 v1, 0x0

    invoke-virtual {p0, v7, v1}, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->setLayerType(ILandroid/graphics/Paint;)V

    .line 949
    :cond_1d
    invoke-virtual {p0}, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v6, v1, Landroid/util/DisplayMetrics;->density:F

    .line 951
    .local v6, "dip":F
    mul-float v1, v3, v6

    iput v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mCenterX:F

    .line 952
    mul-float v1, v3, v6

    iput v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mCenterY:F

    .line 953
    mul-float v1, v3, v6

    iput v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mRadius:F

    .line 954
    const/high16 v1, 0x40a00000

    mul-float/2addr v1, v6

    iput v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mOffset:F

    .line 955
    const/high16 v1, 0x40200000

    mul-float/2addr v1, v6

    iput v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mStrokeWidth:F

    .line 956
    iget v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mRadius:F

    iget v2, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mStrokeWidth:F

    mul-float/2addr v2, v5

    sub-float/2addr v1, v2

    iput v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mInnerRadius:F

    .line 958
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v7}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mPaint:Landroid/graphics/Paint;

    .line 960
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v7}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mShadowInnerPaint:Landroid/graphics/Paint;

    .line 961
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mShadowInnerPaint:Landroid/graphics/Paint;

    new-instance v2, Landroid/graphics/BlurMaskFilter;

    iget v3, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mRadius:F

    sub-float/2addr v3, v6

    sget-object v4, Landroid/graphics/BlurMaskFilter$Blur;->INNER:Landroid/graphics/BlurMaskFilter$Blur;

    invoke-direct {v2, v3, v4}, Landroid/graphics/BlurMaskFilter;-><init>(FLandroid/graphics/BlurMaskFilter$Blur;)V

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    .line 962
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v7}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mShadowOuterPaint:Landroid/graphics/Paint;

    .line 963
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mShadowOuterPaint:Landroid/graphics/Paint;

    new-instance v2, Landroid/graphics/BlurMaskFilter;

    const/high16 v3, 0x40000000

    mul-float/2addr v3, v6

    sget-object v4, Landroid/graphics/BlurMaskFilter$Blur;->OUTER:Landroid/graphics/BlurMaskFilter$Blur;

    invoke-direct {v2, v3, v4}, Landroid/graphics/BlurMaskFilter;-><init>(FLandroid/graphics/BlurMaskFilter$Blur;)V

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    .line 965
    # getter for: Lcom/localytics/android/AmpDialogFragment;->sDismissButtonImage:Landroid/graphics/Bitmap;
    invoke-static {}, Lcom/localytics/android/AmpDialogFragment;->access$900()Landroid/graphics/Bitmap;

    move-result-object v1

    if-nez v1, :cond_118

    .line 967
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    mul-float v2, v9, v6

    add-float/2addr v2, v5

    float-to-int v2, v2

    mul-float v3, v9, v6

    add-float/2addr v3, v5

    float-to-int v3, v3

    invoke-direct {v1, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v1}, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 975
    :goto_8e
    mul-float v1, v8, v6

    add-float/2addr v1, v5

    float-to-int v1, v1

    mul-float v2, v8, v6

    add-float/2addr v2, v5

    float-to-int v2, v2

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mBitmap:Landroid/graphics/Bitmap;

    .line 976
    new-instance v0, Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 979
    .local v0, "canvas":Landroid/graphics/Canvas;
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mPaint:Landroid/graphics/Paint;

    const/high16 v2, -0x1000000

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 980
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 981
    iget v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mCenterX:F

    iget v2, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mCenterY:F

    iget v3, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mRadius:F

    iget-object v4, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 984
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mPaint:Landroid/graphics/Paint;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 985
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 986
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mStrokeWidth:F

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 987
    iget v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mCenterX:F

    iget v2, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mCenterY:F

    iget v3, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mInnerRadius:F

    iget-object v4, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 990
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mPaint:Landroid/graphics/Paint;

    const/high16 v2, 0x40900000

    mul-float/2addr v2, v6

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 991
    iget v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mCenterX:F

    iget v2, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mOffset:F

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mCenterY:F

    iget v3, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mOffset:F

    sub-float/2addr v2, v3

    iget v3, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mCenterX:F

    iget v4, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mOffset:F

    add-float/2addr v3, v4

    iget v4, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mCenterY:F

    iget v5, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mOffset:F

    add-float/2addr v4, v5

    iget-object v5, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mPaint:Landroid/graphics/Paint;

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 992
    iget v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mCenterX:F

    iget v2, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mOffset:F

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mCenterY:F

    iget v3, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mOffset:F

    add-float/2addr v2, v3

    iget v3, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mCenterX:F

    iget v4, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mOffset:F

    add-float/2addr v3, v4

    iget v4, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mCenterY:F

    iget v5, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mOffset:F

    sub-float/2addr v4, v5

    iget-object v5, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mPaint:Landroid/graphics/Paint;

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 993
    return-void

    .line 971
    .end local v0    # "canvas":Landroid/graphics/Canvas;
    :cond_118
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v2, 0x42200000

    mul-float/2addr v2, v6

    add-float/2addr v2, v5

    float-to-int v2, v2

    const/high16 v3, 0x42200000

    mul-float/2addr v3, v6

    add-float/2addr v3, v5

    float-to-int v3, v3

    invoke-direct {v1, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v1}, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_8e
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v5, 0x0

    .line 998
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 1000
    # getter for: Lcom/localytics/android/AmpDialogFragment;->sDismissButtonImage:Landroid/graphics/Bitmap;
    invoke-static {}, Lcom/localytics/android/AmpDialogFragment;->access$900()Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_14

    .line 1002
    # getter for: Lcom/localytics/android/AmpDialogFragment;->sDismissButtonImage:Landroid/graphics/Bitmap;
    invoke-static {}, Lcom/localytics/android/AmpDialogFragment;->access$900()Landroid/graphics/Bitmap;

    move-result-object v1

    iget-object v2, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v5, v5, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 1014
    :cond_13
    :goto_13
    return-void

    .line 1006
    :cond_14
    invoke-virtual {p0}, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v0, v1, Landroid/util/DisplayMetrics;->density:F

    .line 1008
    .local v0, "dip":F
    iget v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mCenterX:F

    add-float/2addr v1, v0

    iget v2, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mCenterY:F

    add-float/2addr v2, v0

    iget v3, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mRadius:F

    sub-float/2addr v3, v0

    iget-object v4, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mShadowInnerPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 1009
    iget v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mCenterX:F

    add-float/2addr v1, v0

    iget v2, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mCenterY:F

    add-float/2addr v2, v0

    iget v3, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mRadius:F

    sub-float/2addr v3, v0

    iget-object v4, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mShadowOuterPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 1010
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_13

    .line 1012
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v5, v5, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    goto :goto_13
.end method

.method public release()V
    .registers 2

    .prologue
    .line 1018
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_c

    .line 1020
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 1021
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/localytics/android/AmpDialogFragment$AmpDialog$CloseButton;->mBitmap:Landroid/graphics/Bitmap;

    .line 1023
    :cond_c
    return-void
.end method
