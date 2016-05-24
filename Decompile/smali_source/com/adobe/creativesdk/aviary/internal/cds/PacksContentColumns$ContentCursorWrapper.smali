.class public final Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;
.super Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$BaseCursorWrapper;
.source "PacksContentColumns.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ContentCursorWrapper"
.end annotation


# instance fields
.field author:Ljava/lang/String;

.field authorHyperLink:Ljava/lang/String;

.field contentDownloadStarted:I

.field contentPath:Ljava/lang/String;

.field contentURL:Ljava/lang/String;

.field contentVersion:Ljava/lang/String;

.field detailImageLocalPath:Ljava/lang/String;

.field detailImageURL:Ljava/lang/String;

.field detailImageVersion:Ljava/lang/String;

.field displayDescription:Ljava/lang/String;

.field displayName:Ljava/lang/String;

.field downloadRequestStatus:I

.field featureImageLocalPath:Ljava/lang/String;

.field featureImageURL:Ljava/lang/String;

.field featureImageVersion:Ljava/lang/String;

.field free:I

.field iconNeedDownload:I

.field iconPath:Ljava/lang/String;

.field iconURL:Ljava/lang/String;

.field iconVersion:Ljava/lang/String;

.field isFreeWithLogin:I

.field numItems:I

.field final packId:J

.field previewPath:Ljava/lang/String;

.field previewURL:Ljava/lang/String;

.field previewVersion:Ljava/lang/String;

.field purchased:I

.field shopBackgroundColor:Ljava/lang/String;

.field socialMediaString:Ljava/lang/String;


# direct methods
.method constructor <init>(JJ)V
    .registers 6
    .param p1, "id"    # J
    .param p3, "packId"    # J

    .prologue
    .line 86
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$BaseCursorWrapper;-><init>(J)V

    .line 87
    iput-wide p3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->packId:J

    .line 88
    return-void
.end method

.method public static create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;
    .registers 9
    .param p0, "cursor"    # Landroid/database/Cursor;

    .prologue
    const/4 v7, -0x1

    .line 268
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/VersionColumns$CursorWrapper;->isValid(Landroid/database/Cursor;)Z

    move-result v6

    if-eqz v6, :cond_19b

    .line 269
    const-string v6, "content_id"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    .line 270
    .local v0, "id":J
    const-string v6, "content_packId"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    .line 273
    .local v4, "packId":J
    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    invoke-direct {v3, v0, v1, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;-><init>(JJ)V

    .line 275
    .local v3, "result":Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;
    const-string v6, "content_previewURL"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 276
    .local v2, "index":I
    if-le v2, v7, :cond_2e

    .line 277
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->previewURL:Ljava/lang/String;

    .line 280
    :cond_2e
    const-string v6, "content_contentURL"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 281
    if-le v2, v7, :cond_3c

    .line 282
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->contentURL:Ljava/lang/String;

    .line 285
    :cond_3c
    const-string v6, "content_iconUrl"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 286
    if-le v2, v7, :cond_4a

    .line 287
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->iconURL:Ljava/lang/String;

    .line 290
    :cond_4a
    const-string v6, "content_displayName"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 291
    if-le v2, v7, :cond_58

    .line 292
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->displayName:Ljava/lang/String;

    .line 295
    :cond_58
    const-string v6, "content_displayDescription"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 296
    if-le v2, v7, :cond_66

    .line 297
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->displayDescription:Ljava/lang/String;

    .line 300
    :cond_66
    const-string v6, "content_iconPath"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 301
    if-le v2, v7, :cond_74

    .line 302
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->iconPath:Ljava/lang/String;

    .line 305
    :cond_74
    const-string v6, "content_previewPath"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 306
    if-le v2, v7, :cond_82

    .line 307
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->previewPath:Ljava/lang/String;

    .line 310
    :cond_82
    const-string v6, "content_contentPath"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 311
    if-le v2, v7, :cond_90

    .line 312
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->contentPath:Ljava/lang/String;

    .line 315
    :cond_90
    const-string v6, "content_contentVersion"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 316
    if-le v2, v7, :cond_9e

    .line 317
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->contentVersion:Ljava/lang/String;

    .line 320
    :cond_9e
    const-string v6, "content_previewVersion"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 321
    if-le v2, v7, :cond_ac

    .line 322
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->previewVersion:Ljava/lang/String;

    .line 325
    :cond_ac
    const-string v6, "content_iconVersion"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 326
    if-le v2, v7, :cond_ba

    .line 327
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->iconVersion:Ljava/lang/String;

    .line 330
    :cond_ba
    const-string v6, "content_isFree"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 331
    if-le v2, v7, :cond_c8

    .line 332
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    iput v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->free:I

    .line 335
    :cond_c8
    const-string v6, "content_isFreeWithLogin"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 336
    if-le v2, v7, :cond_d6

    .line 337
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    iput v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->isFreeWithLogin:I

    .line 340
    :cond_d6
    const-string v6, "content_purchased"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 341
    if-le v2, v7, :cond_e4

    .line 342
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    iput v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->purchased:I

    .line 345
    :cond_e4
    const-string v6, "content_iconNeedDownload"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 346
    if-le v2, v7, :cond_f2

    .line 347
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    iput v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->iconNeedDownload:I

    .line 350
    :cond_f2
    const-string v6, "content_downloadRequested"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 351
    if-le v2, v7, :cond_100

    .line 352
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    iput v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->downloadRequestStatus:I

    .line 355
    :cond_100
    const-string v6, "content_numItems"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 356
    if-le v2, v7, :cond_10e

    .line 357
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    iput v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->numItems:I

    .line 360
    :cond_10e
    const-string v6, "content_author"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 361
    if-le v2, v7, :cond_11c

    .line 362
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->author:Ljava/lang/String;

    .line 365
    :cond_11c
    const-string v6, "content_authorHyperlink"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 366
    if-le v2, v7, :cond_12a

    .line 367
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->authorHyperLink:Ljava/lang/String;

    .line 370
    :cond_12a
    const-string v6, "content_socialMediaString"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 371
    if-le v2, v7, :cond_138

    .line 372
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->socialMediaString:Ljava/lang/String;

    .line 375
    :cond_138
    const-string v6, "content_featureImageURL"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 376
    if-le v2, v7, :cond_146

    .line 377
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->featureImageURL:Ljava/lang/String;

    .line 380
    :cond_146
    const-string v6, "content_featureImageVersion"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 381
    if-le v2, v7, :cond_154

    .line 382
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->featureImageVersion:Ljava/lang/String;

    .line 385
    :cond_154
    const-string v6, "content_detailImageURL"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 386
    if-le v2, v7, :cond_162

    .line 387
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->detailImageURL:Ljava/lang/String;

    .line 390
    :cond_162
    const-string v6, "content_detailImageVersion"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 391
    if-le v2, v7, :cond_170

    .line 392
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->detailImageVersion:Ljava/lang/String;

    .line 395
    :cond_170
    const-string v6, "content_shopBackgroundColor"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 396
    if-le v2, v7, :cond_17e

    .line 397
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->shopBackgroundColor:Ljava/lang/String;

    .line 400
    :cond_17e
    const-string v6, "content_detailImageLocalPath"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 401
    if-le v2, v7, :cond_18c

    .line 402
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->detailImageLocalPath:Ljava/lang/String;

    .line 405
    :cond_18c
    const-string v6, "content_featureImageLocalPath"

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 406
    if-le v2, v7, :cond_19a

    .line 407
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->featureImageLocalPath:Ljava/lang/String;

    .line 412
    .end local v0    # "id":J
    .end local v2    # "index":I
    .end local v3    # "result":Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;
    .end local v4    # "packId":J
    :cond_19a
    :goto_19a
    return-object v3

    :cond_19b
    const/4 v3, 0x0

    goto :goto_19a
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 7

    .prologue
    .line 92
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->id:J

    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->packId:J

    invoke-direct {v0, v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;-><init>(JJ)V

    .line 93
    .local v0, "result":Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->iconURL:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->iconURL:Ljava/lang/String;

    .line 94
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->previewURL:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->previewURL:Ljava/lang/String;

    .line 95
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->contentURL:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->contentURL:Ljava/lang/String;

    .line 96
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->displayName:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->displayName:Ljava/lang/String;

    .line 97
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->displayDescription:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->displayDescription:Ljava/lang/String;

    .line 98
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->previewPath:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->previewPath:Ljava/lang/String;

    .line 99
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->contentPath:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->contentPath:Ljava/lang/String;

    .line 100
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->iconPath:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->iconPath:Ljava/lang/String;

    .line 101
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->contentVersion:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->contentVersion:Ljava/lang/String;

    .line 102
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->previewVersion:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->previewVersion:Ljava/lang/String;

    .line 103
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->iconVersion:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->iconVersion:Ljava/lang/String;

    .line 104
    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->iconNeedDownload:I

    iput v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->iconNeedDownload:I

    .line 105
    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->contentDownloadStarted:I

    iput v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->contentDownloadStarted:I

    .line 106
    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->downloadRequestStatus:I

    iput v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->downloadRequestStatus:I

    .line 107
    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->free:I

    iput v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->free:I

    .line 108
    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->purchased:I

    iput v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->purchased:I

    .line 109
    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->numItems:I

    iput v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->numItems:I

    .line 110
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->author:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->author:Ljava/lang/String;

    .line 111
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->authorHyperLink:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->authorHyperLink:Ljava/lang/String;

    .line 112
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->socialMediaString:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->socialMediaString:Ljava/lang/String;

    .line 113
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->featureImageURL:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->featureImageURL:Ljava/lang/String;

    .line 114
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->featureImageVersion:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->featureImageVersion:Ljava/lang/String;

    .line 115
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->detailImageURL:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->detailImageURL:Ljava/lang/String;

    .line 116
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->detailImageVersion:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->detailImageVersion:Ljava/lang/String;

    .line 117
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->detailImageLocalPath:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->detailImageLocalPath:Ljava/lang/String;

    .line 118
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->featureImageLocalPath:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->featureImageLocalPath:Ljava/lang/String;

    .line 119
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->shopBackgroundColor:Ljava/lang/String;

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->shopBackgroundColor:Ljava/lang/String;

    .line 120
    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->isFreeWithLogin:I

    iput v1, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->isFreeWithLogin:I

    .line 121
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 8
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 129
    if-nez p1, :cond_4

    .line 136
    :cond_3
    :goto_3
    return v1

    .line 132
    :cond_4
    instance-of v2, p1, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    if-eqz v2, :cond_3

    move-object v0, p1

    .line 135
    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    .line 136
    .local v0, "other":Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->id:J

    iget-wide v4, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->id:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_3

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->packId:J

    iget-wide v4, v0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->packId:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_3

    const/4 v1, 0x1

    goto :goto_3
.end method

.method public getAuthor()Ljava/lang/String;
    .registers 2

    .prologue
    .line 221
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->author:Ljava/lang/String;

    return-object v0
.end method

.method public getAuthorHyperLink()Ljava/lang/String;
    .registers 2

    .prologue
    .line 225
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->authorHyperLink:Ljava/lang/String;

    return-object v0
.end method

.method public getContentURL()Ljava/lang/String;
    .registers 2

    .prologue
    .line 165
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->contentURL:Ljava/lang/String;

    return-object v0
.end method

.method public getDetailImageLocalPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 253
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->detailImageLocalPath:Ljava/lang/String;

    return-object v0
.end method

.method public getDetailImageURL()Ljava/lang/String;
    .registers 2

    .prologue
    .line 241
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->detailImageURL:Ljava/lang/String;

    return-object v0
.end method

.method public getDisplayDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 173
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->displayDescription:Ljava/lang/String;

    return-object v0
.end method

.method public getDisplayName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 169
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public getFeatureImageLocalPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 257
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->featureImageLocalPath:Ljava/lang/String;

    return-object v0
.end method

.method public getFeatureImageURL()Ljava/lang/String;
    .registers 2

    .prologue
    .line 233
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->featureImageURL:Ljava/lang/String;

    return-object v0
.end method

.method public getIconNeedDownload()I
    .registers 2

    .prologue
    .line 149
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->iconNeedDownload:I

    return v0
.end method

.method public getIconPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 185
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->iconPath:Ljava/lang/String;

    return-object v0
.end method

.method public getIconURL()Ljava/lang/String;
    .registers 2

    .prologue
    .line 157
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->iconURL:Ljava/lang/String;

    return-object v0
.end method

.method public getPackId()J
    .registers 3

    .prologue
    .line 153
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->packId:J

    return-wide v0
.end method

.method public getPreviewPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 177
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->previewPath:Ljava/lang/String;

    return-object v0
.end method

.method public getPreviewURL()Ljava/lang/String;
    .registers 2

    .prologue
    .line 161
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->previewURL:Ljava/lang/String;

    return-object v0
.end method

.method public getShopBackgroundColor()Ljava/lang/String;
    .registers 2

    .prologue
    .line 249
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->shopBackgroundColor:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 5

    .prologue
    .line 141
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->id:J

    const-wide/32 v2, 0x1869f

    add-long/2addr v0, v2

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->packId:J

    add-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->hashCode()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 262
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ContentColumns.Content{id: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->id:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", packId: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->packId:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", displayName: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->displayName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", purchased: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->purchased:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", contentPath: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->contentPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
