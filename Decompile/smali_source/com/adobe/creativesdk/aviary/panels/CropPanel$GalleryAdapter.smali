.class Lcom/adobe/creativesdk/aviary/panels/CropPanel$GalleryAdapter;
.super Landroid/widget/BaseAdapter;
.source "CropPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/CropPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GalleryAdapter"
.end annotation


# instance fields
.field private mLabels:[Ljava/lang/String;

.field mLayoutInflater:Landroid/view/LayoutInflater;

.field mRes:Landroid/content/res/Resources;

.field private final mSwatch:I

.field private final mValues:[[I

.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/CropPanel;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/panels/CropPanel;Landroid/content/Context;[Ljava/lang/String;[[II)V
    .registers 7
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "labels"    # [Ljava/lang/String;
    .param p4, "values"    # [[I
    .param p5, "swatch"    # I

    .prologue
    .line 281
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GalleryAdapter;->this$0:Lcom/adobe/creativesdk/aviary/panels/CropPanel;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 282
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GalleryAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    .line 283
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GalleryAdapter;->mLabels:[Ljava/lang/String;

    .line 284
    iput-object p4, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GalleryAdapter;->mValues:[[I

    .line 285
    iput p5, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GalleryAdapter;->mSwatch:I

    .line 286
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GalleryAdapter;->mRes:Landroid/content/res/Resources;

    .line 287
    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 2

    .prologue
    .line 291
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GalleryAdapter;->mLabels:[Ljava/lang/String;

    array-length v0, v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 296
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GalleryAdapter;->mLabels:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 301
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getItemViewType(I)I
    .registers 6
    .param p1, "position"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 311
    if-ltz p1, :cond_e

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GalleryAdapter;->getCount()I

    move-result v3

    if-ge p1, v3, :cond_e

    move v0, v1

    .line 312
    .local v0, "valid":Z
    :goto_b
    if-eqz v0, :cond_10

    :goto_d
    return v1

    .end local v0    # "valid":Z
    :cond_e
    move v0, v2

    .line 311
    goto :goto_b

    .restart local v0    # "valid":Z
    :cond_10
    move v1, v2

    .line 312
    goto :goto_d
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 14
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v9, 0x0

    .line 318
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GalleryAdapter;->getItemViewType(I)I

    move-result v2

    .line 320
    .local v2, "type":I
    const/4 v4, 0x0

    .line 322
    .local v4, "viewHolder":Lcom/adobe/creativesdk/aviary/panels/CropPanel$ViewHolder;
    const/4 v0, 0x0

    .line 324
    .local v0, "drawable":Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;
    if-nez p2, :cond_9b

    .line 325
    if-eqz v2, :cond_8a

    .line 326
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GalleryAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    sget v6, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_bottombar_crop_item_layout:I

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GalleryAdapter;->this$0:Lcom/adobe/creativesdk/aviary/panels/CropPanel;

    iget-object v7, v7, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v5, v6, v7, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 328
    new-instance v0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;

    .end local v0    # "drawable":Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GalleryAdapter;->this$0:Lcom/adobe/creativesdk/aviary/panels/CropPanel;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v0, v5}, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;-><init>(Landroid/content/Context;)V

    .line 329
    .restart local v0    # "drawable":Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;
    iget v5, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GalleryAdapter;->mSwatch:I

    if-eqz v5, :cond_2f

    .line 330
    iget v5, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GalleryAdapter;->mSwatch:I

    invoke-virtual {v0, v5}, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->setSelectedTint(I)V

    .line 333
    :cond_2f
    new-instance v4, Lcom/adobe/creativesdk/aviary/panels/CropPanel$ViewHolder;

    .end local v4    # "viewHolder":Lcom/adobe/creativesdk/aviary/panels/CropPanel$ViewHolder;
    const/4 v5, 0x0

    invoke-direct {v4, v5}, Lcom/adobe/creativesdk/aviary/panels/CropPanel$ViewHolder;-><init>(Lcom/adobe/creativesdk/aviary/panels/CropPanel$1;)V

    .line 334
    .restart local v4    # "viewHolder":Lcom/adobe/creativesdk/aviary/panels/CropPanel$ViewHolder;
    const v5, 0x1020014

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v4, Lcom/adobe/creativesdk/aviary/panels/CropPanel$ViewHolder;->textView:Landroid/widget/TextView;

    .line 335
    const v5, 0x1020006

    invoke-virtual {p2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    iput-object v5, v4, Lcom/adobe/creativesdk/aviary/panels/CropPanel$ViewHolder;->imageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    .line 336
    iget-object v5, v4, Lcom/adobe/creativesdk/aviary/panels/CropPanel$ViewHolder;->imageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v5, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 338
    invoke-virtual {p2, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 351
    :cond_53
    :goto_53
    if-eqz v2, :cond_86

    .line 352
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GalleryAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 353
    .local v1, "label":Ljava/lang/String;
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GalleryAdapter;->mValues:[[I

    aget-object v3, v5, p1

    .line 355
    .local v3, "value":[I
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GalleryAdapter;->this$0:Lcom/adobe/creativesdk/aviary/panels/CropPanel;

    iget-object v5, v5, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "ischecked: %b"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GalleryAdapter;->this$0:Lcom/adobe/creativesdk/aviary/panels/CropPanel;

    iget-boolean v8, v8, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->isChecked:Z

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-interface {v5, v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 357
    iget-object v5, v4, Lcom/adobe/creativesdk/aviary/panels/CropPanel$ViewHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 358
    invoke-virtual {v0, v3}, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;->setRatio([I)V

    .line 360
    iget-object v5, v4, Lcom/adobe/creativesdk/aviary/panels/CropPanel$ViewHolder;->imageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GalleryAdapter;->this$0:Lcom/adobe/creativesdk/aviary/panels/CropPanel;

    iget-boolean v6, v6, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->isChecked:Z

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setChecked(Z)V

    .line 364
    .end local v1    # "label":Ljava/lang/String;
    .end local v3    # "value":[I
    :cond_86
    invoke-virtual {p2, p1}, Landroid/view/View;->setId(I)V

    .line 365
    return-object p2

    .line 341
    :cond_8a
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GalleryAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    sget v6, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_gallery_item_view:I

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GalleryAdapter;->this$0:Lcom/adobe/creativesdk/aviary/panels/CropPanel;

    iget-object v7, v7, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v5, v6, v7, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 342
    const/4 v5, 0x4

    invoke-virtual {p2, v5}, Landroid/view/View;->setVisibility(I)V

    goto :goto_53

    .line 345
    :cond_9b
    if-eqz v2, :cond_53

    .line 346
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "viewHolder":Lcom/adobe/creativesdk/aviary/panels/CropPanel$ViewHolder;
    check-cast v4, Lcom/adobe/creativesdk/aviary/panels/CropPanel$ViewHolder;

    .line 347
    .restart local v4    # "viewHolder":Lcom/adobe/creativesdk/aviary/panels/CropPanel$ViewHolder;
    iget-object v5, v4, Lcom/adobe/creativesdk/aviary/panels/CropPanel$ViewHolder;->imageView:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .end local v0    # "drawable":Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;
    check-cast v0, Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;

    .restart local v0    # "drawable":Lcom/adobe/creativesdk/aviary/graphics/CropDrawable;
    goto :goto_53
.end method

.method public getViewTypeCount()I
    .registers 2

    .prologue
    .line 306
    const/4 v0, 0x2

    return v0
.end method
