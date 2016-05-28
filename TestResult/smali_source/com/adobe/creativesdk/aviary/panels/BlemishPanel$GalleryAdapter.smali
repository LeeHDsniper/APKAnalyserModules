.class Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;
.super Landroid/widget/BaseAdapter;
.source "BlemishPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "GalleryAdapter"
.end annotation


# instance fields
.field private accentColor:I

.field private context:Landroid/content/Context;

.field final layoutInflater:Landroid/view/LayoutInflater;

.field private maxBrushSize:I

.field private maxRadiusSize:F

.field private minBrushSize:I

.field private minRadiusSize:F

.field final resources:Landroid/content/res/Resources;

.field private selectedPosition:I

.field private final sizes:[I


# direct methods
.method public constructor <init>(Landroid/content/Context;[I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "values"    # [I

    .prologue
    .line 353
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 354
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->context:Landroid/content/Context;

    .line 355
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->layoutInflater:Landroid/view/LayoutInflater;

    .line 356
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->sizes:[I

    .line 357
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->resources:Landroid/content/res/Resources;

    .line 358
    return-void
.end method


# virtual methods
.method public getContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 365
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->context:Landroid/content/Context;

    return-object v0
.end method

.method public getCount()I
    .registers 2

    .prologue
    .line 390
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->sizes:[I

    array-length v0, v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 395
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->sizes:[I

    aget v0, v0, p1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 400
    int-to-long v0, p1

    return-wide v0
.end method

.method public getItemViewType(I)I
    .registers 6
    .param p1, "position"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 410
    if-ltz p1, :cond_e

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->getCount()I

    move-result v3

    if-ge p1, v3, :cond_e

    move v0, v2

    .line 411
    .local v0, "valid":Z
    :goto_b
    if-eqz v0, :cond_10

    :goto_d
    return v1

    .end local v0    # "valid":Z
    :cond_e
    move v0, v1

    .line 410
    goto :goto_b

    .restart local v0    # "valid":Z
    :cond_10
    move v1, v2

    .line 411
    goto :goto_d
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 14
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v5, 0x0

    .line 417
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->getItemViewType(I)I

    move-result v3

    .line 420
    .local v3, "type":I
    if-nez p2, :cond_5e

    .line 421
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->layoutInflater:Landroid/view/LayoutInflater;

    sget v7, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_gallery_item_view:I

    invoke-virtual {v6, v7, p3, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 422
    .local v1, "imageView":Landroid/widget/ImageView;
    move-object p2, v1

    .line 427
    :goto_12
    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;

    .line 429
    .local v0, "drawable":Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;
    if-nez v3, :cond_31

    .line 430
    if-nez v0, :cond_62

    .line 431
    new-instance v0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;

    .end local v0    # "drawable":Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v0, v6}, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;-><init>(Landroid/content/Context;)V

    .line 432
    .restart local v0    # "drawable":Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;
    iget v6, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->accentColor:I

    if-eqz v6, :cond_2e

    .line 433
    iget v6, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->accentColor:I

    invoke-virtual {v0, v6}, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->setSelectedTint(I)V

    .line 435
    :cond_2e
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 441
    :cond_31
    :goto_31
    if-eqz v0, :cond_52

    if-nez v3, :cond_52

    .line 442
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->sizes:[I

    aget v2, v6, p1

    .line 443
    .local v2, "size":I
    iget v6, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->minRadiusSize:F

    int-to-float v7, v2

    iget v8, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->minBrushSize:I

    int-to-float v8, v8

    sub-float/2addr v7, v8

    iget v8, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->maxBrushSize:I

    iget v9, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->minBrushSize:I

    sub-int/2addr v8, v9

    int-to-float v8, v8

    div-float/2addr v7, v8

    iget v8, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->maxRadiusSize:F

    iget v9, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->minRadiusSize:F

    sub-float/2addr v8, v9

    mul-float/2addr v7, v8

    add-float v4, v6, v7

    .line 447
    .local v4, "value":F
    invoke-virtual {v0, v4}, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->setRadius(F)V

    .line 450
    .end local v2    # "size":I
    .end local v4    # "value":F
    :cond_52
    iget v6, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->selectedPosition:I

    if-ne v6, p1, :cond_57

    const/4 v5, 0x1

    :cond_57
    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setSelected(Z)V

    .line 451
    invoke-virtual {v1}, Landroid/widget/ImageView;->invalidate()V

    .line 452
    return-object p2

    .end local v0    # "drawable":Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;
    .end local v1    # "imageView":Landroid/widget/ImageView;
    :cond_5e
    move-object v1, p2

    .line 424
    check-cast v1, Landroid/widget/ImageView;

    .restart local v1    # "imageView":Landroid/widget/ImageView;
    goto :goto_12

    .line 437
    .restart local v0    # "drawable":Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;
    :cond_62
    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .end local v0    # "drawable":Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;
    check-cast v0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;

    .restart local v0    # "drawable":Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;
    goto :goto_31
.end method

.method public getViewTypeCount()I
    .registers 2

    .prologue
    .line 405
    const/4 v0, 0x2

    return v0
.end method

.method public setAccentColor(I)V
    .registers 2
    .param p1, "accentColor"    # I

    .prologue
    .line 385
    iput p1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->accentColor:I

    .line 386
    return-void
.end method

.method public setMaxBrushSize(I)V
    .registers 2
    .param p1, "maxBrushSize"    # I

    .prologue
    .line 373
    iput p1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->maxBrushSize:I

    .line 374
    return-void
.end method

.method public setMaxRadiusSize(F)V
    .registers 2
    .param p1, "maxRadiusSize"    # F

    .prologue
    .line 381
    iput p1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->maxRadiusSize:F

    .line 382
    return-void
.end method

.method public setMinBrushSize(I)V
    .registers 2
    .param p1, "minBrushSize"    # I

    .prologue
    .line 369
    iput p1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->minBrushSize:I

    .line 370
    return-void
.end method

.method public setMinRadiusSize(F)V
    .registers 2
    .param p1, "minRadiusSize"    # F

    .prologue
    .line 377
    iput p1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->minRadiusSize:F

    .line 378
    return-void
.end method

.method public setSelectedPosition(I)V
    .registers 2
    .param p1, "selectedPosition"    # I

    .prologue
    .line 361
    iput p1, p0, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel$GalleryAdapter;->selectedPosition:I

    .line 362
    return-void
.end method
