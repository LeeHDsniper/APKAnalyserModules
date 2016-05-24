.class Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$GalleryColorAdapter;
.super Landroid/widget/BaseAdapter;
.source "DrawingPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "GalleryColorAdapter"
.end annotation


# instance fields
.field context:Landroid/content/Context;

.field layoutInflater:Landroid/view/LayoutInflater;

.field resources:Landroid/content/res/Resources;

.field private sizes:[I


# direct methods
.method public constructor <init>(Landroid/content/Context;[I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "values"    # [I

    .prologue
    .line 502
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 503
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$GalleryColorAdapter;->layoutInflater:Landroid/view/LayoutInflater;

    .line 504
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$GalleryColorAdapter;->context:Landroid/content/Context;

    .line 505
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$GalleryColorAdapter;->sizes:[I

    .line 506
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$GalleryColorAdapter;->resources:Landroid/content/res/Resources;

    .line 507
    return-void
.end method


# virtual methods
.method public getContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 510
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$GalleryColorAdapter;->context:Landroid/content/Context;

    return-object v0
.end method

.method public getCount()I
    .registers 2

    .prologue
    .line 515
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$GalleryColorAdapter;->sizes:[I

    array-length v0, v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 520
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$GalleryColorAdapter;->sizes:[I

    aget v0, v0, p1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 525
    int-to-long v0, p1

    return-wide v0
.end method

.method public getItemViewType(I)I
    .registers 7
    .param p1, "position"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 535
    if-ltz p1, :cond_e

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$GalleryColorAdapter;->getCount()I

    move-result v4

    if-ge p1, v4, :cond_e

    move v1, v2

    .line 537
    .local v1, "valid":Z
    :goto_b
    if-nez v1, :cond_10

    .line 544
    :goto_d
    return v2

    .end local v1    # "valid":Z
    :cond_e
    move v1, v3

    .line 535
    goto :goto_b

    .line 540
    .restart local v1    # "valid":Z
    :cond_10
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$GalleryColorAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 541
    .local v0, "color":Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-nez v2, :cond_1e

    .line 542
    const/4 v2, 0x2

    goto :goto_d

    :cond_1e
    move v2, v3

    .line 544
    goto :goto_d
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 10
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 552
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$GalleryColorAdapter;->getItemViewType(I)I

    move-result v2

    .line 555
    .local v2, "type":I
    const/4 v0, 0x0

    .line 557
    .local v0, "drawable":Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;
    if-nez p2, :cond_3b

    .line 559
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$GalleryColorAdapter;->layoutInflater:Landroid/view/LayoutInflater;

    sget v4, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_gallery_item_view:I

    const/4 v5, 0x0

    invoke-virtual {v3, v4, p3, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    move-object v1, p2

    .line 560
    check-cast v1, Landroid/widget/ImageView;

    .line 562
    .local v1, "imageView":Landroid/widget/ImageView;
    if-nez v2, :cond_32

    .line 563
    new-instance v0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;

    .end local v0    # "drawable":Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$GalleryColorAdapter;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;-><init>(Landroid/content/Context;)V

    .line 564
    .restart local v0    # "drawable":Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;
    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v3}, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 565
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 576
    .end local v1    # "imageView":Landroid/widget/ImageView;
    :cond_26
    :goto_26
    if-eqz v0, :cond_31

    if-nez v2, :cond_31

    .line 577
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$GalleryColorAdapter;->sizes:[I

    aget v3, v3, p1

    invoke-virtual {v0, v3}, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;->setColor(I)V

    .line 579
    :cond_31
    return-object p2

    .line 566
    .restart local v1    # "imageView":Landroid/widget/ImageView;
    :cond_32
    const/4 v3, 0x2

    if-ne v2, v3, :cond_26

    .line 567
    sget v3, Lcom/aviary/android/feather/sdk/R$drawable;->com_adobe_image_gallery_eraser_selector:I

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_26

    .line 571
    .end local v1    # "imageView":Landroid/widget/ImageView;
    :cond_3b
    if-nez v2, :cond_26

    move-object v3, p2

    .line 572
    check-cast v3, Landroid/widget/ImageView;

    invoke-virtual {v3}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .end local v0    # "drawable":Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;
    check-cast v0, Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;

    .restart local v0    # "drawable":Lcom/adobe/creativesdk/aviary/graphics/PreviewSpotDrawable;
    goto :goto_26
.end method

.method public getViewTypeCount()I
    .registers 2

    .prologue
    .line 530
    const/4 v0, 0x3

    return v0
.end method
