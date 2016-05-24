.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$2;
.super Ljava/lang/Object;
.source "AdobeAssetsViewBaseRecyclerViewController.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$IThumbnailLoadCompletionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController;->loadAndDisplayThumbnail(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController;

.field final synthetic val$assetViewCell:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;

.field final synthetic val$cellposition:I

.field final synthetic val$shouldFilterOutAsset:Z


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;IZ)V
    .registers 5
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController;

    .prologue
    .line 161
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$2;->val$assetViewCell:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;

    iput p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$2;->val$cellposition:I

    iput-boolean p4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$2;->val$shouldFilterOutAsset:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;Landroid/graphics/Bitmap;Z)V
    .registers 20
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;
    .param p2, "thumbnail"    # Landroid/graphics/Bitmap;
    .param p3, "wasCached"    # Z

    .prologue
    .line 164
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$2;->val$assetViewCell:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;

    invoke-virtual {v7}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->getPosition()I

    move-result v7

    move-object/from16 v0, p0

    iget v8, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$2;->val$cellposition:I

    if-ne v7, v8, :cond_ae

    .line 165
    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$2;->val$shouldFilterOutAsset:Z

    if-eqz v7, :cond_af

    const v2, 0x3e99999a

    .line 166
    .local v2, "alpha":F
    :goto_17
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$2;->val$assetViewCell:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;

    const/4 v8, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v7, v0, v2, v8}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->displayThumnail(Landroid/graphics/Bitmap;FZ)V

    .line 168
    move-object/from16 v0, p1

    iget-object v7, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->originalAsset:Ljava/lang/Object;

    instance-of v7, v7, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    if-eqz v7, :cond_ae

    .line 169
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$2;->val$assetViewCell:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;

    iget-object v7, v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_videoDuration:Landroid/widget/TextView;

    if-eqz v7, :cond_ae

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$2;->val$assetViewCell:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;

    iget-object v7, v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_videoIndicator:Landroid/widget/ImageView;

    if-eqz v7, :cond_ae

    .line 170
    move-object/from16 v0, p1

    iget-object v7, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->originalAsset:Ljava/lang/Object;

    check-cast v7, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    move-object v6, v7

    check-cast v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .line 171
    .local v6, "pAsset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    instance-of v7, v6, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;

    if-eqz v7, :cond_ae

    move-object v5, v6

    .line 172
    check-cast v5, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;

    .line 173
    .local v5, "fileInt":Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;
    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;->canStreamVideo()Z

    move-result v7

    if-eqz v7, :cond_ae

    .line 174
    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;->getVideoDuration()I

    move-result v3

    .line 175
    .local v3, "duration":I
    const-string v7, "%02d:%02d"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    sget-object v10, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    int-to-long v12, v3

    .line 176
    invoke-virtual {v10, v12, v13}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    sget-object v10, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    int-to-long v12, v3

    .line 177
    invoke-virtual {v10, v12, v13}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v10

    sget-object v12, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    sget-object v13, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    int-to-long v14, v3

    invoke-virtual {v13, v14, v15}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v14

    invoke-virtual {v12, v14, v15}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v12

    sub-long/2addr v10, v12

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v8, v9

    .line 175
    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 178
    .local v4, "durationStr":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$2;->val$assetViewCell:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;

    iget-object v7, v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_videoDuration:Landroid/widget/TextView;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 179
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$2;->val$assetViewCell:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;

    iget-object v7, v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_videoIndicator:Landroid/widget/ImageView;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 180
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$2;->val$assetViewCell:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;

    iget-object v7, v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_videoDuration:Landroid/widget/TextView;

    invoke-virtual {v7, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 181
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewBaseRecyclerViewController$2;->val$assetViewCell:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;

    iget-object v7, v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewListBaseCellView;->_videoIndicator:Landroid/widget/ImageView;

    sget v8, Lcom/adobe/creativesdk/foundation/assets/R$drawable;->video_indicator:I

    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 187
    .end local v2    # "alpha":F
    .end local v3    # "duration":I
    .end local v4    # "durationStr":Ljava/lang/String;
    .end local v5    # "fileInt":Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetFileInternal;
    .end local v6    # "pAsset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    :cond_ae
    return-void

    .line 165
    :cond_af
    const/high16 v2, 0x3f800000

    goto/16 :goto_17
.end method
