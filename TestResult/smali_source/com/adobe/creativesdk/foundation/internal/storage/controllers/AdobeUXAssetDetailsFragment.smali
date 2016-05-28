.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetDetailsFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "AdobeUXAssetDetailsFragment.java"


# instance fields
.field private mNum:I

.field private mOnDismissed:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 44
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    return-void
.end method

.method private getFormattedDateString(Ljava/util/Date;)Ljava/lang/String;
    .registers 8
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 77
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/TimeZone;->getRawOffset()I

    move-result v4

    int-to-long v4, v4

    add-long v0, v2, v4

    .line 79
    .local v0, "time":J
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const v3, 0x20015

    invoke-static {v2, v0, v1, v3}, Landroid/text/format/DateUtils;->formatDateTime(Landroid/content/Context;JI)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method static newInstance(I)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetDetailsFragment;
    .registers 4
    .param p0, "num"    # I

    .prologue
    .line 51
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetDetailsFragment;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetDetailsFragment;-><init>()V

    .line 53
    .local v1, "f":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetDetailsFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 54
    .local v0, "args":Landroid/os/Bundle;
    const-string v2, "num"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 55
    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetDetailsFragment;->setArguments(Landroid/os/Bundle;)V

    .line 56
    return-object v1
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .registers 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 61
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 62
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetDetailsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "num"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetDetailsFragment;->mNum:I

    .line 64
    const/4 v0, 0x1

    .local v0, "style":I
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$style;->AdobeCSDKTheme_TransparentDialog:I

    .line 65
    .local v1, "theme":I
    invoke-virtual {p0, v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetDetailsFragment;->setStyle(II)V

    .line 66
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetDetailsFragment;->mOnDismissed:Z

    .line 67
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 21
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 101
    sget v12, Lcom/adobe/creativesdk/foundation/assets/R$layout;->fragment_asset_details:I

    const/4 v13, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v0, v12, v1, v13}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v11

    .line 102
    .local v11, "v":Landroid/view/View;
    move-object/from16 v0, p0

    iget v12, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetDetailsFragment;->mNum:I

    invoke-static {v12}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getAssetAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    move-result-object v2

    .line 103
    .local v2, "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    sget v12, Lcom/adobe/creativesdk/foundation/assets/R$id;->ASSET_DETAILS_UPLOADED:I

    invoke-virtual {v11, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 104
    .local v6, "tv":Landroid/widget/TextView;
    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getCreationDate()Ljava/util/Date;

    move-result-object v12

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetDetailsFragment;->getFormattedDateString(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v6, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 106
    sget v12, Lcom/adobe/creativesdk/foundation/assets/R$id;->ASSET_DETAILS_MODIFIED:I

    invoke-virtual {v11, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .end local v6    # "tv":Landroid/widget/TextView;
    check-cast v6, Landroid/widget/TextView;

    .line 107
    .restart local v6    # "tv":Landroid/widget/TextView;
    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getModificationDate()Ljava/util/Date;

    move-result-object v12

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetDetailsFragment;->getFormattedDateString(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v6, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 109
    sget v12, Lcom/adobe/creativesdk/foundation/assets/R$id;->ASSET_DETAILS_SIZE:I

    invoke-virtual {v11, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .end local v6    # "tv":Landroid/widget/TextView;
    check-cast v6, Landroid/widget/TextView;

    .restart local v6    # "tv":Landroid/widget/TextView;
    move-object v3, v2

    .line 110
    check-cast v3, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .line 111
    .local v3, "assetFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getFileSize()J

    move-result-wide v12

    long-to-float v5, v12

    .line 112
    .local v5, "size":F
    const/high16 v12, 0x44800000

    div-float/2addr v5, v12

    .line 113
    const/high16 v12, 0x44800000

    cmpg-float v12, v5, v12

    if-gez v12, :cond_fb

    .line 114
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "%.2f"

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    sget v13, Lcom/adobe/creativesdk/foundation/assets/R$string;->IDS_ASSET_DETAILS_KB:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetDetailsFragment;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v6, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 120
    :goto_82
    sget v12, Lcom/adobe/creativesdk/foundation/assets/R$id;->ASSET_DETAILS_WIDTH_NEW:I

    invoke-virtual {v11, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    .line 121
    .local v9, "tvWidth":Landroid/widget/TextView;
    sget v12, Lcom/adobe/creativesdk/foundation/assets/R$id;->ASSET_DETAILS_HEIGHT:I

    invoke-virtual {v11, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 123
    .local v7, "tvHeight":Landroid/widget/TextView;
    sget v12, Lcom/adobe/creativesdk/foundation/assets/R$id;->ASSET_DETAILS_WIDTH_NEW_HEADER:I

    invoke-virtual {v11, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    .line 124
    .local v10, "tvWidthHeader":Landroid/widget/TextView;
    sget v12, Lcom/adobe/creativesdk/foundation/assets/R$id;->ASSET_DETAILS_HEIGHT_NEW_HEADER:I

    invoke-virtual {v11, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 126
    .local v8, "tvHeightHeader":Landroid/widget/TextView;
    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileUtils;->getAssetFileImageDimensions(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    move-result-object v4

    .line 128
    .local v4, "dimensions":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    iget v12, v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;->height:F

    const/4 v13, 0x0

    cmpl-float v12, v12, v13

    if-eqz v12, :cond_12c

    .line 131
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    iget v13, v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;->height:F

    float-to-int v13, v13

    invoke-static {v13}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    sget v13, Lcom/adobe/creativesdk/foundation/assets/R$string;->IDS_ASSET_DETAILS_PX:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetDetailsFragment;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v7, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 139
    :goto_d0
    iget v12, v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;->width:F

    const/4 v13, 0x0

    cmpl-float v12, v12, v13

    if-eqz v12, :cond_137

    .line 142
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    iget v13, v4, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;->width:F

    float-to-int v13, v13

    invoke-static {v13}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    sget v13, Lcom/adobe/creativesdk/foundation/assets/R$string;->IDS_ASSET_DETAILS_PX:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetDetailsFragment;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 151
    :goto_fa
    return-object v11

    .line 116
    .end local v4    # "dimensions":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    .end local v7    # "tvHeight":Landroid/widget/TextView;
    .end local v8    # "tvHeightHeader":Landroid/widget/TextView;
    .end local v9    # "tvWidth":Landroid/widget/TextView;
    .end local v10    # "tvWidthHeader":Landroid/widget/TextView;
    :cond_fb
    const/high16 v12, 0x44800000

    div-float/2addr v5, v12

    .line 117
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "%.2f"

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    sget v13, Lcom/adobe/creativesdk/foundation/assets/R$string;->IDS_ASSET_DETAILS_MB:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetDetailsFragment;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v6, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_82

    .line 135
    .restart local v4    # "dimensions":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    .restart local v7    # "tvHeight":Landroid/widget/TextView;
    .restart local v8    # "tvHeightHeader":Landroid/widget/TextView;
    .restart local v9    # "tvWidth":Landroid/widget/TextView;
    .restart local v10    # "tvWidthHeader":Landroid/widget/TextView;
    :cond_12c
    const/16 v12, 0x8

    invoke-virtual {v8, v12}, Landroid/widget/TextView;->setVisibility(I)V

    .line 136
    const/16 v12, 0x8

    invoke-virtual {v7, v12}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_d0

    .line 146
    :cond_137
    const/16 v12, 0x8

    invoke-virtual {v10, v12}, Landroid/widget/TextView;->setVisibility(I)V

    .line 147
    const/16 v12, 0x8

    invoke-virtual {v9, v12}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_fa
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 71
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetDetailsFragment;->mOnDismissed:Z

    .line 72
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    .line 73
    return-void
.end method
