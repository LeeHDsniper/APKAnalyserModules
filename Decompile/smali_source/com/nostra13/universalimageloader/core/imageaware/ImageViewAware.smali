.class public Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;
.super Lcom/nostra13/universalimageloader/core/imageaware/ViewAware;
.source "ImageViewAware.java"


# direct methods
.method public constructor <init>(Landroid/widget/ImageView;)V
    .registers 2
    .param p1, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lcom/nostra13/universalimageloader/core/imageaware/ViewAware;-><init>(Landroid/view/View;)V

    .line 44
    return-void
.end method

.method private static getImageViewFieldValue(Ljava/lang/Object;Ljava/lang/String;)I
    .registers 7
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "fieldName"    # Ljava/lang/String;

    .prologue
    .line 126
    const/4 v3, 0x0

    .line 128
    .local v3, "value":I
    :try_start_1
    const-class v4, Landroid/widget/ImageView;

    invoke-virtual {v4, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 129
    .local v1, "field":Ljava/lang/reflect/Field;
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 130
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_14} :catch_1e

    move-result v2

    .line 131
    .local v2, "fieldValue":I
    if-lez v2, :cond_1d

    const v4, 0x7fffffff

    if-ge v2, v4, :cond_1d

    .line 132
    move v3, v2

    .line 137
    .end local v1    # "field":Ljava/lang/reflect/Field;
    .end local v2    # "fieldValue":I
    :cond_1d
    :goto_1d
    return v3

    .line 134
    :catch_1e
    move-exception v0

    .line 135
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {v0}, Lcom/nostra13/universalimageloader/utils/L;->e(Ljava/lang/Throwable;)V

    goto :goto_1d
.end method


# virtual methods
.method public getHeight()I
    .registers 4

    .prologue
    .line 91
    invoke-super {p0}, Lcom/nostra13/universalimageloader/core/imageaware/ViewAware;->getHeight()I

    move-result v0

    .line 92
    .local v0, "height":I
    if-gtz v0, :cond_16

    .line 93
    iget-object v2, p0, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;->viewRef:Ljava/lang/ref/Reference;

    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 94
    .local v1, "imageView":Landroid/widget/ImageView;
    if-eqz v1, :cond_16

    .line 95
    const-string v2, "mMaxHeight"

    invoke-static {v1, v2}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;->getImageViewFieldValue(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v0

    .line 98
    .end local v1    # "imageView":Landroid/widget/ImageView;
    :cond_16
    return v0
.end method

.method public getScaleType()Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;
    .registers 3

    .prologue
    .line 103
    iget-object v1, p0, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;->viewRef:Ljava/lang/ref/Reference;

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 104
    .local v0, "imageView":Landroid/widget/ImageView;
    if-eqz v0, :cond_f

    .line 105
    invoke-static {v0}, Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;->fromImageView(Landroid/widget/ImageView;)Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;

    move-result-object v1

    .line 107
    :goto_e
    return-object v1

    :cond_f
    invoke-super {p0}, Lcom/nostra13/universalimageloader/core/imageaware/ViewAware;->getScaleType()Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;

    move-result-object v1

    goto :goto_e
.end method

.method public getWidth()I
    .registers 4

    .prologue
    .line 74
    invoke-super {p0}, Lcom/nostra13/universalimageloader/core/imageaware/ViewAware;->getWidth()I

    move-result v1

    .line 75
    .local v1, "width":I
    if-gtz v1, :cond_16

    .line 76
    iget-object v2, p0, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;->viewRef:Ljava/lang/ref/Reference;

    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 77
    .local v0, "imageView":Landroid/widget/ImageView;
    if-eqz v0, :cond_16

    .line 78
    const-string v2, "mMaxWidth"

    invoke-static {v0, v2}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;->getImageViewFieldValue(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v1

    .line 81
    .end local v0    # "imageView":Landroid/widget/ImageView;
    :cond_16
    return v1
.end method

.method public bridge synthetic getWrappedView()Landroid/view/View;
    .registers 2

    .prologue
    .line 34
    invoke-virtual {p0}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;->getWrappedView()Landroid/widget/ImageView;

    move-result-object v0

    return-object v0
.end method

.method public getWrappedView()Landroid/widget/ImageView;
    .registers 2

    .prologue
    .line 112
    invoke-super {p0}, Lcom/nostra13/universalimageloader/core/imageaware/ViewAware;->getWrappedView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    return-object v0
.end method

.method protected setImageBitmapInto(Landroid/graphics/Bitmap;Landroid/view/View;)V
    .registers 3
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "view"    # Landroid/view/View;

    .prologue
    .line 122
    check-cast p2, Landroid/widget/ImageView;

    .end local p2    # "view":Landroid/view/View;
    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 123
    return-void
.end method

.method protected setImageDrawableInto(Landroid/graphics/drawable/Drawable;Landroid/view/View;)V
    .registers 3
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "view"    # Landroid/view/View;

    .prologue
    .line 117
    check-cast p2, Landroid/widget/ImageView;

    .end local p2    # "view":Landroid/view/View;
    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 118
    return-void
.end method
