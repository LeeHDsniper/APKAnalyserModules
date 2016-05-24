.class Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;
.super Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;
.source "PackDetailPreviews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LoadPreviewsTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask",
        "<",
        "Ljava/lang/Long;",
        "Ljava/lang/Void;",
        "Landroid/database/Cursor;",
        ">;"
    }
.end annotation


# instance fields
.field private aspectRatio:D

.field private packId:J

.field private previewPath:Ljava/lang/String;

.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    .prologue
    .line 676
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Long;)Landroid/database/Cursor;
    .registers 21
    .param p1, "params"    # [Ljava/lang/Long;

    .prologue
    .line 699
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    # invokes: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->isValidContext()Z
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$1000(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)Z

    move-result v4

    if-nez v4, :cond_15

    .line 700
    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$000()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v4

    const-string v5, "not a valid context"

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 701
    const/4 v13, 0x0

    .line 776
    :goto_14
    return-object v13

    .line 704
    :cond_15
    const/4 v4, 0x0

    aget-object v4, p1, v4

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->packId:J

    .line 705
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->getContext()Landroid/content/Context;

    move-result-object v3

    .line 707
    .local v3, "context":Landroid/content/Context;
    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->packId:J

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mPackId:J
    invoke-static {v7}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$700(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)J

    move-result-wide v8

    cmp-long v4, v4, v8

    if-eqz v4, :cond_43

    .line 708
    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$000()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v4

    const-string v5, "packid != View.packId"

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 709
    const/4 v13, 0x0

    goto :goto_14

    .line 712
    :cond_43
    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->packId:J

    invoke-static {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getPackFullInfoById(Landroid/content/Context;J)Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    move-result-object v18

    .line 714
    .local v18, "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    if-eqz v18, :cond_53

    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getContent()Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    move-result-object v4

    if-nez v4, :cond_5e

    .line 715
    :cond_53
    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$000()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v4

    const-string v5, "pack or its content is null"

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 716
    const/4 v13, 0x0

    goto :goto_14

    .line 719
    :cond_5e
    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getContent()Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getPreviewPath()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->previewPath:Ljava/lang/String;

    .line 722
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->previewPath:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_dc

    .line 723
    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$000()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v4

    const-string v5, "previewPath is empty"

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 724
    const/4 v14, 0x1

    .line 754
    .local v14, "download":Z
    :goto_7e
    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$000()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "previewPath: "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->previewPath:Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Object;

    invoke-interface {v4, v5, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 755
    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$000()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v4

    const-string v5, "download previews: %b"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-static {v14}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-interface {v4, v5, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 757
    if-eqz v14, :cond_c6

    .line 758
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;->PREVIEW:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory;->create(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;

    move-result-object v15

    .line 760
    .local v15, "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;
    :try_start_ba
    move-object/from16 v0, p0

    iget-wide v4, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->packId:J

    invoke-virtual {v15, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;->download(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->previewPath:Ljava/lang/String;
    :try_end_c6
    .catch Ljava/lang/Exception; {:try_start_ba .. :try_end_c6} :catch_13b

    .line 768
    .end local v15    # "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;
    :cond_c6
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->previewPath:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_151

    .line 769
    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$000()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v4

    const-string v5, "previewPath is still empty!!"

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 770
    const/4 v13, 0x0

    goto/16 :goto_14

    .line 727
    .end local v14    # "download":Z
    :cond_dc
    new-instance v6, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->previewPath:Ljava/lang/String;

    invoke-direct {v6, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 729
    .local v6, "file":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_f1

    invoke-virtual {v6}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-nez v4, :cond_fc

    .line 730
    :cond_f1
    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$000()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v4

    const-string v5, "previewPath doesn\'t exists"

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 731
    const/4 v14, 0x1

    .restart local v14    # "download":Z
    goto :goto_7e

    .line 734
    .end local v14    # "download":Z
    :cond_fc
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;->PREVIEW:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;

    .line 735
    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getPackType()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->fromString(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory;->create(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$ContentType;Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory$Validator;

    move-result-object v2

    .line 738
    .local v2, "validator":Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory$Validator;
    :try_start_10a
    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getContent()Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksContentColumns$ContentCursorWrapper;->getId()J

    move-result-wide v4

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory$Validator;->validate(Landroid/content/Context;JLjava/io/File;Z)Z

    .line 739
    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$000()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v4

    const-string v5, "previewPath is valid"

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V
    :try_end_11f
    .catch Ljava/lang/Throwable; {:try_start_10a .. :try_end_11f} :catch_122

    .line 740
    const/4 v14, 0x0

    .restart local v14    # "download":Z
    goto/16 :goto_7e

    .line 741
    .end local v14    # "download":Z
    :catch_122
    move-exception v16

    .line 742
    .local v16, "e":Ljava/lang/Throwable;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Throwable;->printStackTrace()V

    .line 743
    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$000()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v4

    const-string v5, "previewPath is not valid"

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 744
    const/4 v14, 0x1

    .line 746
    .restart local v14    # "download":Z
    :try_start_130
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->deleteDirectory(Ljava/io/File;)V
    :try_end_133
    .catch Ljava/io/IOException; {:try_start_130 .. :try_end_133} :catch_135

    goto/16 :goto_7e

    .line 747
    :catch_135
    move-exception v17

    .line 748
    .local v17, "e1":Ljava/io/IOException;
    invoke-virtual/range {v17 .. v17}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_7e

    .line 761
    .end local v2    # "validator":Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory$Validator;
    .end local v6    # "file":Ljava/io/File;
    .end local v16    # "e":Ljava/lang/Throwable;
    .end local v17    # "e1":Ljava/io/IOException;
    .restart local v15    # "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;
    :catch_13b
    move-exception v16

    .line 762
    .local v16, "e":Ljava/lang/Exception;
    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$000()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v4

    const-string v5, "failed to download previews: %s"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v16, v7, v8

    invoke-interface {v4, v5, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 763
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Exception;->printStackTrace()V

    .line 764
    const/4 v13, 0x0

    goto/16 :goto_14

    .line 773
    .end local v15    # "downloader":Lcom/adobe/creativesdk/aviary/internal/cds/CdsDownloaderFactory$Downloader;
    .end local v16    # "e":Ljava/lang/Exception;
    :cond_151
    const/4 v4, 0x1

    new-array v12, v4, [D

    const/4 v4, 0x0

    const-wide/16 v8, 0x0

    aput-wide v8, v12, v4

    .line 774
    .local v12, "out":[D
    move-object/from16 v0, p0

    iget-wide v8, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->packId:J

    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getPackType()Ljava/lang/String;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->previewPath:Ljava/lang/String;

    move-object v7, v3

    invoke-static/range {v7 .. v12}, Lcom/adobe/creativesdk/aviary/utils/CdsUIUtils;->computePreviewAspectRatio(Landroid/content/Context;JLjava/lang/String;Ljava/lang/String;[D)Landroid/database/Cursor;

    move-result-object v13

    .line 775
    .local v13, "cursor":Landroid/database/Cursor;
    const/4 v4, 0x0

    aget-wide v4, v12, v4

    move-object/from16 v0, p0

    iput-wide v4, v0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->aspectRatio:D

    goto/16 :goto_14
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 676
    check-cast p1, [Ljava/lang/Long;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->doInBackground([Ljava/lang/Long;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method protected doPostExecute(Landroid/database/Cursor;)V
    .registers 6
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 683
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->mPackId:J
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$700(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)J

    move-result-wide v0

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->packId:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_16

    .line 684
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->aspectRatio:D

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->previewPath:Ljava/lang/String;

    # invokes: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->showPreviews(Landroid/database/Cursor;DLjava/lang/String;)V
    invoke-static {v0, p1, v2, v3, v1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$400(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;Landroid/database/Cursor;DLjava/lang/String;)V

    .line 689
    :goto_15
    return-void

    .line 687
    :cond_16
    # getter for: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$000()Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    const-string v1, "packId != mPackId"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_15
.end method

.method protected bridge synthetic doPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 676
    check-cast p1, Landroid/database/Cursor;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->doPostExecute(Landroid/database/Cursor;)V

    return-void
.end method

.method protected doPreExecute()V
    .registers 2

    .prologue
    .line 693
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    # invokes: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->hideError()V
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$800(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)V

    .line 694
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$LoadPreviewsTask;->this$0:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    # invokes: Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->showProgress()V
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->access$900(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;)V

    .line 695
    return-void
.end method
