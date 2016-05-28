.class public Lcom/adobe/creativesdk/aviary/panels/CropPanel;
.super Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;
.source "CropPanel.java"

# interfaces
.implements Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemClickListener;
.implements Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/panels/CropPanel$GalleryAdapter;,
        Lcom/adobe/creativesdk/aviary/panels/CropPanel$ViewHolder;,
        Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;
    }
.end annotation


# instance fields
.field isChecked:Z

.field mCanInvertRatio:Z

.field mCropNames:[Ljava/lang/String;

.field mCropValues:[[I

.field mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

.field mIsPortrait:Z

.field mSelectedPosition:I


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V
    .registers 5
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    .param p2, "entry"    # Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    .prologue
    const/4 v1, 0x0

    .line 48
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 42
    iput v1, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mSelectedPosition:I

    .line 43
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mIsPortrait:Z

    .line 44
    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mCanInvertRatio:Z

    .line 45
    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->isChecked:Z

    .line 49
    return-void
.end method

.method private calculateAspectRatio(IZ)D
    .registers 13
    .param p1, "position"    # I
    .param p2, "inverted"    # Z

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    const/4 v7, -0x1

    .line 142
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mCropValues:[[I

    aget-object v4, v5, p1

    .line 144
    .local v4, "values":[I
    array-length v5, v4

    const/4 v6, 0x2

    if-ne v5, v6, :cond_46

    .line 145
    if-eqz p2, :cond_32

    aget v0, v4, v9

    .line 146
    .local v0, "aspectx":I
    :goto_f
    if-eqz p2, :cond_35

    aget v1, v4, v8

    .line 148
    .local v1, "aspecty":I
    :goto_13
    if-ne v0, v7, :cond_1d

    .line 149
    if-eqz p2, :cond_38

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    .line 152
    :cond_1d
    :goto_1d
    if-ne v1, v7, :cond_27

    .line 153
    if-eqz p2, :cond_3f

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    .line 156
    :cond_27
    :goto_27
    const-wide/16 v2, 0x0

    .line 158
    .local v2, "ratio":D
    if-eqz v0, :cond_31

    if-eqz v1, :cond_31

    .line 159
    int-to-double v6, v0

    int-to-double v8, v1

    div-double v2, v6, v8

    .line 163
    .end local v0    # "aspectx":I
    .end local v1    # "aspecty":I
    .end local v2    # "ratio":D
    :cond_31
    :goto_31
    return-wide v2

    .line 145
    :cond_32
    aget v0, v4, v8

    goto :goto_f

    .line 146
    .restart local v0    # "aspectx":I
    :cond_35
    aget v1, v4, v9

    goto :goto_13

    .line 149
    .restart local v1    # "aspecty":I
    :cond_38
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    goto :goto_1d

    .line 153
    :cond_3f
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    goto :goto_27

    .line 163
    .end local v0    # "aspectx":I
    .end local v1    # "aspecty":I
    :cond_46
    const-wide/16 v2, 0x0

    goto :goto_31
.end method

.method private convertStringArrayToIntegerArray([Ljava/lang/String;[[I)V
    .registers 11
    .param p1, "values"    # [Ljava/lang/String;
    .param p2, "output"    # [[I

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 132
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    array-length v4, p1

    if-ge v0, v4, :cond_26

    .line 133
    aget-object v4, p1, v0

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 134
    .local v1, "value":[Ljava/lang/String;
    aget-object v4, v1, v6

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 135
    .local v2, "x":I
    aget-object v4, v1, v7

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 136
    .local v3, "y":I
    const/4 v4, 0x2

    new-array v4, v4, [I

    aput v2, v4, v6

    aput v3, v4, v7

    aput-object v4, p2, v0

    .line 132
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 138
    .end local v1    # "value":[Ljava/lang/String;
    .end local v2    # "x":I
    .end local v3    # "y":I
    :cond_26
    return-void
.end method

.method private createCropView(DZ)V
    .registers 7
    .param p1, "aspectRatio"    # D
    .param p3, "isFixed"    # Z

    .prologue
    .line 181
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->setImageBitmap(Landroid/graphics/Bitmap;DZ)V

    .line 182
    return-void
.end method

.method private invertRatios([Ljava/lang/String;[[I)V
    .registers 13
    .param p1, "names"    # [Ljava/lang/String;
    .param p2, "values"    # [[I

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 52
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    array-length v6, p1

    if-ge v0, v6, :cond_47

    .line 53
    aget-object v6, p1, v0

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_35

    .line 54
    aget-object v3, p1, v0

    .line 55
    .local v3, "temp":Ljava/lang/String;
    const-string v6, "[:]"

    invoke-virtual {v3, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 56
    .local v2, "splitted":[Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v7, v2, v9

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-object v7, v2, v8

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 57
    .local v1, "mNewOptionName":Ljava/lang/String;
    aput-object v1, p1, v0

    .line 60
    .end local v1    # "mNewOptionName":Ljava/lang/String;
    .end local v2    # "splitted":[Ljava/lang/String;
    .end local v3    # "temp":Ljava/lang/String;
    :cond_35
    aget-object v3, p2, v0

    .line 61
    .local v3, "temp":[I
    aget v4, v3, v8

    .line 62
    .local v4, "x":I
    aget v5, v3, v9

    .line 63
    .local v5, "y":I
    const/4 v6, 0x2

    new-array v6, v6, [I

    aput v5, v6, v8

    aput v4, v6, v9

    aput-object v6, p2, v0

    .line 52
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 65
    .end local v3    # "temp":[I
    .end local v4    # "x":I
    .end local v5    # "y":I
    :cond_47
    return-void
.end method

.method private setCustomRatio(DZ)V
    .registers 7
    .param p1, "aspectRatio"    # D
    .param p3, "isFixed"    # Z

    .prologue
    .line 185
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mTrackingAttributes:Ljava/util/HashMap;

    const-string v1, "aspect"

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    invoke-virtual {v0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->setAspectRatio(DZ)V

    .line 187
    return-void
.end method


# virtual methods
.method protected generateContentView(Landroid/view/LayoutInflater;)Landroid/view/View;
    .registers 5
    .param p1, "inflater"    # Landroid/view/LayoutInflater;

    .prologue
    .line 257
    sget v1, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_editor_content_crop:I

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 258
    .local v0, "view":Landroid/view/View;
    return-object v0
.end method

.method protected generateOptionView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/ViewGroup;
    .registers 5
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 263
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_bottombar_panel_spot:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    return-object v0
.end method

.method public onActivate()V
    .registers 9

    .prologue
    const/4 v4, 0x1

    const/4 v1, 0x0

    .line 116
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onActivate()V

    .line 118
    new-array v5, v4, [Lcom/adobe/android/ui/widget/VibrationWidget;

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    aput-object v6, v5, v1

    invoke-virtual {p0, v5}, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->disableHapticIsNecessary([Lcom/adobe/android/ui/widget/VibrationWidget;)V

    .line 120
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v5, p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setOnItemsScrollListener(Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;)V

    .line 121
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v5, p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setOnItemClickListener(Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemClickListener;)V

    .line 123
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v5}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->getSelectedItemPosition()I

    move-result v0

    .line 124
    .local v0, "position":I
    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->calculateAspectRatio(IZ)D

    move-result-wide v2

    .line 126
    .local v2, "ratio":D
    const-wide/16 v6, 0x0

    cmpl-double v5, v2, v6

    if-eqz v5, :cond_29

    move v1, v4

    :cond_29
    invoke-direct {p0, v2, v3, v1}, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->createCropView(DZ)V

    .line 127
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->contentReady()V

    .line 128
    invoke-virtual {p0, v4}, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->setIsChanged(Z)V

    .line 129
    return-void
.end method

.method public onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V
    .registers 14
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    const/4 v10, 0x1

    const/4 v8, 0x0

    .line 69
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V

    .line 71
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    const-class v1, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    .line 72
    .local v6, "config":Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->CROP:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;->get(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    .line 74
    sget v0, Lcom/aviary/android/feather/sdk/R$array;->com_adobe_image_editor_crop_labels:I

    invoke-virtual {v6, v0}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mCropNames:[Ljava/lang/String;

    .line 75
    sget v0, Lcom/aviary/android/feather/sdk/R$array;->com_adobe_image_editor_crop_values:I

    invoke-virtual {v6, v0}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getStringArray(I)[Ljava/lang/String;

    move-result-object v7

    .line 76
    .local v7, "values":[Ljava/lang/String;
    array-length v0, v7

    new-array v0, v0, [[I

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mCropValues:[[I

    .line 78
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mCropValues:[[I

    invoke-direct {p0, v7, v0}, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->convertStringArrayToIntegerArray([Ljava/lang/String;[[I)V

    .line 80
    sget v0, Lcom/aviary/android/feather/sdk/R$bool;->com_adobe_image_editor_crop_invert_policy:I

    invoke-virtual {v6, v0}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getBoolean(I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mCanInvertRatio:Z

    .line 82
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mCanInvertRatio:Z

    if-eqz v0, :cond_54

    .line 83
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    if-le v0, v1, :cond_d0

    .line 84
    iput-boolean v10, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mIsPortrait:Z

    .line 89
    :goto_49
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mIsPortrait:Z

    if-eqz v0, :cond_54

    .line 90
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mCropNames:[Ljava/lang/String;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mCropValues:[[I

    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->invertRatios([Ljava/lang/String;[[I)V

    .line 94
    :cond_54
    sget v0, Lcom/aviary/android/feather/sdk/R$integer;->com_adobe_image_editor_crop_selected:I

    invoke-virtual {v6, v0}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getInteger(I)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mSelectedPosition:I

    .line 96
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->getContentView()Landroid/view/View;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$id;->image:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    .line 97
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0, v8}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setDoubleTapEnabled(Z)V

    .line 98
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0, v10}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setScaleEnabled(Z)V

    .line 99
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0, v10}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setScrollEnabled(Z)V

    .line 100
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    sget-object v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->FIT_IF_BIGGER:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setDisplayType(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;)V

    .line 102
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$id;->gallery:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/adobe/android/ui/widget/AdobeGalleryView;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    .line 104
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mSelectedPosition:I

    invoke-virtual {v0, v1}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setDefaultPosition(I)V

    .line 105
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v0, v8}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setCallbackDuringFling(Z)V

    .line 106
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v0, v8}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setAutoSelectChild(Z)V

    .line 108
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->hasAccentColor()Z

    move-result v0

    if-eqz v0, :cond_d4

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    invoke-virtual {v0, v8}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getAccentColor(I)I

    move-result v5

    .line 110
    .local v5, "accentColor":I
    :goto_b1
    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GalleryAdapter;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mCropNames:[Ljava/lang/String;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mCropValues:[[I

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GalleryAdapter;-><init>(Lcom/adobe/creativesdk/aviary/panels/CropPanel;Landroid/content/Context;[Ljava/lang/String;[[II)V

    invoke-virtual {v9, v0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setAdapter(Landroid/widget/Adapter;)V

    .line 111
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mSelectedPosition:I

    invoke-virtual {v0, v1, v8, v10}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setSelection(IZZ)V

    .line 112
    return-void

    .line 86
    .end local v5    # "accentColor":I
    :cond_d0
    iput-boolean v8, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mIsPortrait:Z

    goto/16 :goto_49

    :cond_d4
    move v5, v8

    .line 108
    goto :goto_b1
.end method

.method public onDeactivate()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 175
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onDeactivate()V

    .line 176
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v0, v1}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setOnItemsScrollListener(Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;)V

    .line 177
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v0, v1}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setOnItemClickListener(Lcom/adobe/android/ui/widget/AdobeAdapterView$OnItemClickListener;)V

    .line 178
    return-void
.end method

.method public onDestroy()V
    .registers 3

    .prologue
    .line 168
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->clear()V

    .line 169
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->setOnHighlightSingleTapUpConfirmedListener(Lcom/adobe/creativesdk/aviary/widget/CropImageView$OnHighlightSingleTapUpConfirmedListener;)V

    .line 170
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onDestroy()V

    .line 171
    return-void
.end method

.method protected onGenerateResult()V
    .registers 6

    .prologue
    .line 191
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v2, Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getHighlightView()Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->getCropRectD()Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;-><init>(Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;)V

    .line 192
    .local v0, "cropRect":Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;
    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;

    invoke-direct {v1, p0, v0}, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;-><init>(Lcom/adobe/creativesdk/aviary/panels/CropPanel;Lcom/adobe/creativesdk/aviary/internal/graphics/RectD;)V

    .line 193
    .local v1, "task":Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;
    const/4 v2, 0x1

    new-array v2, v2, [Landroid/graphics/Bitmap;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mBitmap:Landroid/graphics/Bitmap;

    aput-object v4, v2, v3

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/panels/CropPanel$GenerateResultTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 194
    return-void
.end method

.method public onItemClick(Lcom/adobe/android/ui/widget/AdobeAdapterView;Landroid/view/View;IJ)V
    .registers 18
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/android/ui/widget/AdobeAdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 372
    .local p1, "parent":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<*>;"
    iget-boolean v7, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mCanInvertRatio:Z

    if-eqz v7, :cond_16

    .line 374
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mCropValues:[[I

    aget-object v6, v7, p3

    .line 375
    .local v6, "value":[I
    const/4 v7, 0x0

    aget v7, v6, v7

    const/4 v8, 0x1

    aget v8, v6, v8

    if-eq v7, v8, :cond_16

    const/4 v7, 0x0

    aget v7, v6, v7

    const/4 v8, -0x1

    if-ne v7, v8, :cond_17

    .line 397
    .end local v6    # "value":[I
    :cond_16
    :goto_16
    return-void

    .line 379
    .restart local v6    # "value":[I
    :cond_17
    iget-boolean v7, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->isChecked:Z

    if-nez v7, :cond_69

    const/4 v7, 0x1

    :goto_1c
    iput-boolean v7, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->isChecked:Z

    .line 381
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v2, Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    .line 382
    .local v2, "cview":Lcom/adobe/creativesdk/aviary/widget/CropImageView;
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getAspectRatio()D

    move-result-wide v0

    .line 384
    .local v0, "currentAspectRatio":D
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getHighlightView()Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    move-result-object v3

    .line 385
    .local v3, "hv":Lcom/adobe/creativesdk/aviary/widget/HighlightView;
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getAspectRatioIsFixed()Z

    move-result v7

    if-nez v7, :cond_46

    if-eqz v3, :cond_46

    .line 386
    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->getDrawRect()Landroid/graphics/Rect;

    move-result-object v7

    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    move-result v7

    int-to-double v8, v7

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->getDrawRect()Landroid/graphics/Rect;

    move-result-object v7

    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    move-result v7

    int-to-double v10, v7

    div-double v0, v8, v10

    .line 389
    :cond_46
    const-wide/high16 v8, 0x3ff0000000000000L

    div-double v4, v8, v0

    .line 391
    .local v4, "invertedAspectRatio":D
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getAspectRatioIsFixed()Z

    move-result v7

    invoke-virtual {v2, v4, v5, v7}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->setAspectRatio(DZ)V

    .line 392
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mCropNames:[Ljava/lang/String;

    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mCropValues:[[I

    invoke-direct {p0, v7, v8}, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->invertRatios([Ljava/lang/String;[[I)V

    .line 393
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v7}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->invalidateViews()V

    .line 395
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mTrackingAttributes:Ljava/util/HashMap;

    const-string v8, "aspect"

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_16

    .line 379
    .end local v0    # "currentAspectRatio":D
    .end local v2    # "cview":Lcom/adobe/creativesdk/aviary/widget/CropImageView;
    .end local v3    # "hv":Lcom/adobe/creativesdk/aviary/widget/HighlightView;
    .end local v4    # "invertedAspectRatio":D
    :cond_69
    const/4 v7, 0x0

    goto :goto_1c
.end method

.method public onScroll(Lcom/adobe/android/ui/widget/AdobeAdapterView;Landroid/view/View;IJ)V
    .registers 6
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/android/ui/widget/AdobeAdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 407
    .local p1, "parent":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<*>;"
    return-void
.end method

.method public onScrollFinished(Lcom/adobe/android/ui/widget/AdobeAdapterView;Landroid/view/View;IJ)V
    .registers 12
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/android/ui/widget/AdobeAdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .local p1, "parent":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<*>;"
    const/4 v2, 0x0

    .line 411
    iget v3, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mSelectedPosition:I

    if-ne p3, v3, :cond_6

    .line 417
    :goto_5
    return-void

    .line 414
    :cond_6
    iput p3, p0, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->mSelectedPosition:I

    .line 415
    invoke-direct {p0, p3, v2}, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->calculateAspectRatio(IZ)D

    move-result-wide v0

    .line 416
    .local v0, "ratio":D
    const-wide/16 v4, 0x0

    cmpl-double v3, v0, v4

    if-eqz v3, :cond_13

    const/4 v2, 0x1

    :cond_13
    invoke-direct {p0, v0, v1, v2}, Lcom/adobe/creativesdk/aviary/panels/CropPanel;->setCustomRatio(DZ)V

    goto :goto_5
.end method

.method public onScrollStarted(Lcom/adobe/android/ui/widget/AdobeAdapterView;Landroid/view/View;IJ)V
    .registers 6
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/android/ui/widget/AdobeAdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 402
    .local p1, "parent":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<*>;"
    return-void
.end method
