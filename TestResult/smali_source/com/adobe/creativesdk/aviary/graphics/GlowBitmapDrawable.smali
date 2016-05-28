.class public Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;
.super Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;
.source "GlowBitmapDrawable.java"


# instance fields
.field private mBlurValue:I

.field private mChecked:Z

.field private mCheckedBitmap:Landroid/graphics/Bitmap;

.field private mCurrent:Landroid/graphics/Bitmap;

.field private mDstRect:Landroid/graphics/Rect;

.field private mGlowMode:I

.field private mHighlightColorChecked:I

.field private mHighlightColorPressed:I

.field private mHighlightColorSelected:I

.field private mHighlightMode:I

.field private mPressed:Z

.field private mPressedBitmap:Landroid/graphics/Bitmap;

.field private mSelected:Z

.field private mSelectedBitmap:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;IIIIII)V
    .registers 15
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "colorPressed"    # I
    .param p3, "colorChecked"    # I
    .param p4, "colorSelected"    # I
    .param p5, "blurSize"    # I
    .param p6, "highlightMode"    # I
    .param p7, "glowMode"    # I

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 19
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mDstRect:Landroid/graphics/Rect;

    move-object v0, p0

    move v1, p2

    move v2, p3

    move v3, p4

    move v4, p5

    move v5, p6

    move v6, p7

    .line 36
    invoke-direct/range {v0 .. v6}, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->init(IIIIII)V

    .line 37
    return-void
.end method

.method public static generateBlurBitmap(Landroid/graphics/Bitmap;IILandroid/graphics/PorterDuff$Mode;ZLandroid/graphics/Paint;)Landroid/graphics/Bitmap;
    .registers 16
    .param p0, "src"    # Landroid/graphics/Bitmap;
    .param p1, "blurValue"    # I
    .param p2, "color"    # I
    .param p3, "mode"    # Landroid/graphics/PorterDuff$Mode;
    .param p4, "glow"    # Z
    .param p5, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 81
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    .line 82
    .local v7, "width":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    .line 84
    .local v4, "height":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v2

    .line 85
    .local v2, "config":Landroid/graphics/Bitmap$Config;
    if-nez v2, :cond_10

    .line 86
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 89
    :cond_10
    invoke-static {v7, v4, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 91
    .local v3, "dest":Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 92
    .local v1, "canvas":Landroid/graphics/Canvas;
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->extractAlpha()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 93
    .local v0, "alpha":Landroid/graphics/Bitmap;
    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual {v1, p0, v8, v9, p5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 95
    new-instance v6, Landroid/graphics/Paint;

    invoke-direct {v6}, Landroid/graphics/Paint;-><init>()V

    .line 96
    .local v6, "paintBlur":Landroid/graphics/Paint;
    new-instance v8, Landroid/graphics/PorterDuffXfermode;

    invoke-direct {v8, p3}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v6, v8}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 97
    invoke-virtual {v6, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 98
    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual {v1, v0, v8, v9, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 100
    if-eqz p4, :cond_4e

    .line 101
    new-instance v5, Landroid/graphics/BlurMaskFilter;

    int-to-float v8, p1

    sget-object v9, Landroid/graphics/BlurMaskFilter$Blur;->NORMAL:Landroid/graphics/BlurMaskFilter$Blur;

    invoke-direct {v5, v8, v9}, Landroid/graphics/BlurMaskFilter;-><init>(FLandroid/graphics/BlurMaskFilter$Blur;)V

    .line 102
    .local v5, "maskFilter":Landroid/graphics/BlurMaskFilter;
    invoke-virtual {v6, v5}, Landroid/graphics/Paint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    .line 103
    const/16 v8, 0x64

    invoke-virtual {v6, v8}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 104
    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual {v1, v0, v8, v9, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 107
    .end local v5    # "maskFilter":Landroid/graphics/BlurMaskFilter;
    :cond_4e
    return-object v3
.end method

.method private init(IIIIII)V
    .registers 8
    .param p1, "colorPressed"    # I
    .param p2, "colorChecked"    # I
    .param p3, "colorSelected"    # I
    .param p4, "blurSize"    # I
    .param p5, "highlightMode"    # I
    .param p6, "glowMode"    # I

    .prologue
    .line 40
    iput p2, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mHighlightColorChecked:I

    .line 41
    iput p1, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mHighlightColorPressed:I

    .line 42
    iput p3, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mHighlightColorSelected:I

    .line 43
    iput p4, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mBlurValue:I

    .line 44
    iput p6, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mGlowMode:I

    .line 45
    iput p5, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mHighlightMode:I

    .line 47
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mCurrent:Landroid/graphics/Bitmap;

    .line 48
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->recycleBitmaps()V

    .line 49
    return-void
.end method

.method private recycleBitmaps()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 58
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mCheckedBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_c

    .line 59
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mCheckedBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 60
    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mCheckedBitmap:Landroid/graphics/Bitmap;

    .line 63
    :cond_c
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mPressedBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_17

    .line 64
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mPressedBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 65
    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mPressedBitmap:Landroid/graphics/Bitmap;

    .line 68
    :cond_17
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mSelectedBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_22

    .line 69
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mSelectedBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 70
    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mSelectedBitmap:Landroid/graphics/Bitmap;

    .line 72
    :cond_22
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 117
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mDstRect:Landroid/graphics/Rect;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->copyBounds(Landroid/graphics/Rect;)V

    .line 118
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mCurrent:Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mDstRect:Landroid/graphics/Rect;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v3

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 119
    return-void
.end method

.method public isStateful()Z
    .registers 2

    .prologue
    .line 112
    const/4 v0, 0x1

    return v0
.end method

.method protected onStateChange([I)Z
    .registers 16
    .param p1, "state"    # [I

    .prologue
    const/16 v13, 0x8

    const/4 v12, 0x4

    const/4 v5, 0x2

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 125
    iget-boolean v6, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mChecked:Z

    .line 126
    .local v6, "checked":Z
    iget-boolean v8, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mPressed:Z

    .line 127
    .local v8, "pressed":Z
    iget-boolean v9, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mSelected:Z

    .line 129
    .local v9, "selected":Z
    iput-boolean v10, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mChecked:Z

    .line 130
    iput-boolean v10, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mPressed:Z

    .line 131
    iput-boolean v10, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mSelected:Z

    .line 133
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_13
    array-length v0, p1

    if-ge v7, v0, :cond_27

    .line 134
    aget v0, p1, v7

    sparse-switch v0, :sswitch_data_ca

    .line 133
    :goto_1b
    add-int/lit8 v7, v7, 0x1

    goto :goto_13

    .line 136
    :sswitch_1e
    iput-boolean v11, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mPressed:Z

    goto :goto_1b

    .line 140
    :sswitch_21
    iput-boolean v11, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mChecked:Z

    goto :goto_1b

    .line 144
    :sswitch_24
    iput-boolean v11, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mSelected:Z

    goto :goto_1b

    .line 152
    :cond_27
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mPressed:Z

    if-eqz v0, :cond_63

    iget v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mHighlightMode:I

    invoke-static {v0, v5}, Lcom/adobe/android/ui/utils/UIUtils;->checkBits(II)Z

    move-result v0

    if-eqz v0, :cond_63

    .line 153
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mPressedBitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_51

    .line 154
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    iget v1, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mBlurValue:I

    iget v2, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mHighlightColorPressed:I

    sget-object v3, Landroid/graphics/PorterDuff$Mode;->DARKEN:Landroid/graphics/PorterDuff$Mode;

    iget v4, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mGlowMode:I

    .line 158
    invoke-static {v4, v5}, Lcom/adobe/android/ui/utils/UIUtils;->checkBits(II)Z

    move-result v4

    .line 159
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v5

    .line 154
    invoke-static/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->generateBlurBitmap(Landroid/graphics/Bitmap;IILandroid/graphics/PorterDuff$Mode;ZLandroid/graphics/Paint;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mPressedBitmap:Landroid/graphics/Bitmap;

    .line 161
    :cond_51
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mPressedBitmap:Landroid/graphics/Bitmap;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mCurrent:Landroid/graphics/Bitmap;

    .line 189
    :goto_55
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mChecked:Z

    if-ne v6, v0, :cond_61

    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mPressed:Z

    if-ne v8, v0, :cond_61

    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mSelected:Z

    if-eq v9, v0, :cond_c8

    :cond_61
    move v0, v11

    :goto_62
    return v0

    .line 163
    :cond_63
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mChecked:Z

    if-eqz v0, :cond_92

    iget v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mHighlightMode:I

    invoke-static {v0, v12}, Lcom/adobe/android/ui/utils/UIUtils;->checkBits(II)Z

    move-result v0

    if-eqz v0, :cond_92

    .line 164
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mCheckedBitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_8d

    .line 165
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    iget v1, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mBlurValue:I

    iget v2, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mHighlightColorChecked:I

    sget-object v3, Landroid/graphics/PorterDuff$Mode;->DARKEN:Landroid/graphics/PorterDuff$Mode;

    iget v4, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mGlowMode:I

    .line 169
    invoke-static {v4, v12}, Lcom/adobe/android/ui/utils/UIUtils;->checkBits(II)Z

    move-result v4

    .line 170
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v5

    .line 165
    invoke-static/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->generateBlurBitmap(Landroid/graphics/Bitmap;IILandroid/graphics/PorterDuff$Mode;ZLandroid/graphics/Paint;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mCheckedBitmap:Landroid/graphics/Bitmap;

    .line 172
    :cond_8d
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mCheckedBitmap:Landroid/graphics/Bitmap;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mCurrent:Landroid/graphics/Bitmap;

    goto :goto_55

    .line 174
    :cond_92
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mSelected:Z

    if-eqz v0, :cond_c1

    iget v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mHighlightMode:I

    invoke-static {v0, v13}, Lcom/adobe/android/ui/utils/UIUtils;->checkBits(II)Z

    move-result v0

    if-eqz v0, :cond_c1

    .line 175
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mSelectedBitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_bc

    .line 176
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    iget v1, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mBlurValue:I

    iget v2, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mHighlightColorSelected:I

    sget-object v3, Landroid/graphics/PorterDuff$Mode;->DARKEN:Landroid/graphics/PorterDuff$Mode;

    iget v4, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mGlowMode:I

    .line 180
    invoke-static {v4, v13}, Lcom/adobe/android/ui/utils/UIUtils;->checkBits(II)Z

    move-result v4

    .line 181
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v5

    .line 176
    invoke-static/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->generateBlurBitmap(Landroid/graphics/Bitmap;IILandroid/graphics/PorterDuff$Mode;ZLandroid/graphics/Paint;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mSelectedBitmap:Landroid/graphics/Bitmap;

    .line 183
    :cond_bc
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mSelectedBitmap:Landroid/graphics/Bitmap;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mCurrent:Landroid/graphics/Bitmap;

    goto :goto_55

    .line 186
    :cond_c1
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mCurrent:Landroid/graphics/Bitmap;

    goto :goto_55

    :cond_c8
    move v0, v10

    .line 189
    goto :goto_62

    .line 134
    :sswitch_data_ca
    .sparse-switch
        0x10100a0 -> :sswitch_21
        0x10100a1 -> :sswitch_24
        0x10100a7 -> :sswitch_1e
    .end sparse-switch
.end method

.method public setBitmap(Landroid/graphics/Bitmap;)V
    .registers 2
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 52
    invoke-super {p0, p1}, Lit/sephiroth/android/library/imagezoom/graphics/FastBitmapDrawable;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 53
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->mCurrent:Landroid/graphics/Bitmap;

    .line 54
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->recycleBitmaps()V

    .line 55
    return-void
.end method

.method public updateConfig(IIIIII)V
    .registers 8
    .param p1, "colorPressed"    # I
    .param p2, "colorChecked"    # I
    .param p3, "colorSelected"    # I
    .param p4, "blurSize"    # I
    .param p5, "highlightMode"    # I
    .param p6, "glowMode"    # I

    .prologue
    .line 76
    invoke-direct/range {p0 .. p6}, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->init(IIIIII)V

    .line 77
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->getState()[I

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/graphics/GlowBitmapDrawable;->setState([I)Z

    .line 78
    return-void
.end method
