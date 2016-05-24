.class Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;
.super Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;
.source "AdobeImageEditorActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;
.implements Landroid/media/MediaScannerConnection$OnScanCompletedListener;
.implements Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem$OnScanErrorListener;
.implements Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SaveHiResImageTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask",
        "<",
        "Landroid/graphics/Bitmap;",
        "Ljava/lang/Integer;",
        "Landroid/util/Pair",
        "<",
        "Ljava/lang/String;",
        "Landroid/net/Uri;",
        ">;>;",
        "Landroid/content/DialogInterface$OnDismissListener;",
        "Landroid/media/MediaScannerConnection$OnScanCompletedListener;",
        "Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem$OnScanErrorListener;",
        "Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;"
    }
.end annotation


# instance fields
.field logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

.field mBitmap:Landroid/graphics/Bitmap;

.field mCompressFormat:Landroid/graphics/Bitmap$CompressFormat;

.field private mCompressQuality:I

.field mDestFile:Ljava/io/File;

.field mErrorString:Ljava/lang/String;

.field mFinalAction:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;

.field private final mFinishedLock:Ljava/lang/Object;

.field mHiresException:Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;

.field mIsHiRes:Z

.field private mOutputContentUri:Landroid/net/Uri;

.field mProgress:Landroid/app/ProgressDialog;

.field private final mScanCompletedLock:Ljava/lang/Object;

.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;Ljava/io/File;Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;Landroid/graphics/Bitmap$CompressFormat;IZ)V
    .registers 12
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;
    .param p2, "file"    # Ljava/io/File;
    .param p3, "action"    # Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;
    .param p4, "format"    # Landroid/graphics/Bitmap$CompressFormat;
    .param p5, "compressQuality"    # I
    .param p6, "hires"    # Z

    .prologue
    .line 1721
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;-><init>()V

    .line 1714
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mFinishedLock:Ljava/lang/Object;

    .line 1715
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mScanCompletedLock:Ljava/lang/Object;

    .line 1716
    const-string v0, "SaveHiResImageTask"

    sget-object v1, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;->ConsoleLoggerType:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    .line 1722
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "ctor, file: %s, action: %s, hires: %b"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object p3, v2, v3

    const/4 v3, 0x2

    invoke-static {p6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1723
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mFinalAction:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;

    .line 1724
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mDestFile:Ljava/io/File;

    .line 1725
    iput-boolean p6, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mIsHiRes:Z

    .line 1726
    iput-object p4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mCompressFormat:Landroid/graphics/Bitmap$CompressFormat;

    .line 1727
    iput p5, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mCompressQuality:I

    .line 1728
    return-void
.end method

.method private saveInBackgroundHiRes()Z
    .registers 7

    .prologue
    const/4 v2, 0x0

    .line 1844
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "saveInBackgroundHiRes"

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 1847
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    const-class v4, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    .line 1849
    .local v1, "sessionService":Lcom/adobe/creativesdk/aviary/internal/services/SessionService;
    if-nez v1, :cond_17

    .line 1873
    :goto_16
    return v2

    .line 1854
    :cond_17
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-virtual {v3, p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->addOnHiresListener(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;)V

    .line 1858
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mDestFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mCompressFormat:Landroid/graphics/Bitmap$CompressFormat;

    iget v5, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mCompressQuality:I

    invoke-virtual {v1, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->save(Ljava/lang/String;Landroid/graphics/Bitmap$CompressFormat;I)V

    .line 1860
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "waiting for notification from mFinishedLock.."

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 1861
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mFinishedLock:Ljava/lang/Object;

    monitor-enter v3

    .line 1862
    :try_start_35
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "waiting for mFinishedLock..."

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V
    :try_end_3c
    .catchall {:try_start_35 .. :try_end_3c} :catchall_58

    .line 1864
    :try_start_3c
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mFinishedLock:Ljava/lang/Object;

    invoke-virtual {v4}, Ljava/lang/Object;->wait()V
    :try_end_41
    .catch Ljava/lang/InterruptedException; {:try_start_3c .. :try_end_41} :catch_4b
    .catchall {:try_start_3c .. :try_end_41} :catchall_58

    .line 1870
    :try_start_41
    monitor-exit v3
    :try_end_42
    .catchall {:try_start_41 .. :try_end_42} :catchall_58

    .line 1872
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-virtual {v2, p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->removeOnHiresListener(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;)Z

    .line 1873
    const/4 v2, 0x1

    goto :goto_16

    .line 1865
    :catch_4b
    move-exception v0

    .line 1866
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_4c
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 1867
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    iget-object v4, v4, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mMainController:Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    invoke-virtual {v4, p0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->removeOnHiresListener(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;)Z

    .line 1868
    monitor-exit v3

    goto :goto_16

    .line 1870
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_58
    move-exception v2

    monitor-exit v3
    :try_end_5a
    .catchall {:try_start_4c .. :try_end_5a} :catchall_58

    throw v2
.end method

.method private saveInBackgroundLowRes()Z
    .registers 6

    .prologue
    .line 1880
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "saveInBackgroundLowRes"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 1882
    :try_start_7
    new-instance v1, Ljava/io/FileOutputStream;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mDestFile:Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 1883
    .local v1, "outputStream":Ljava/io/OutputStream;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mCompressFormat:Landroid/graphics/Bitmap$CompressFormat;

    iget v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mCompressQuality:I

    invoke-virtual {v2, v3, v4, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 1884
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V
    :try_end_1a
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_1a} :catch_1c

    .line 1885
    const/4 v2, 0x1

    .line 1890
    .end local v1    # "outputStream":Ljava/io/OutputStream;
    :goto_1b
    return v2

    .line 1886
    :catch_1c
    move-exception v0

    .line 1887
    .local v0, "e":Ljava/io/IOException;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 1888
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mErrorString:Ljava/lang/String;

    .line 1889
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 1890
    const/4 v2, 0x0

    goto :goto_1b
.end method


# virtual methods
.method protected varargs doInBackground([Landroid/graphics/Bitmap;)Landroid/util/Pair;
    .registers 9
    .param p1, "params"    # [Landroid/graphics/Bitmap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Landroid/graphics/Bitmap;",
            ")",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/4 v3, 0x0

    .line 1792
    aget-object v4, p1, v6

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mBitmap:Landroid/graphics/Bitmap;

    .line 1795
    iget-boolean v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mIsHiRes:Z

    if-eqz v4, :cond_15

    .line 1796
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->saveInBackgroundHiRes()Z

    move-result v2

    .line 1801
    .local v2, "result":Z
    :goto_e
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->isCancelled()Z

    move-result v4

    if-eqz v4, :cond_1a

    .line 1837
    :goto_14
    return-object v3

    .line 1798
    .end local v2    # "result":Z
    :cond_15
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->saveInBackgroundLowRes()Z

    move-result v2

    .restart local v2    # "result":Z
    goto :goto_e

    .line 1805
    :cond_1a
    if-eqz v2, :cond_7f

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mDestFile:Ljava/io/File;

    if-eqz v4, :cond_7f

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mErrorString:Ljava/lang/String;

    if-nez v4, :cond_7f

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mHiresException:Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;

    if-nez v4, :cond_7f

    .line 1806
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "insert image into database gallery.."

    new-array v6, v6, [Ljava/lang/Object;

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1810
    :try_start_31
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mDestFile:Ljava/io/File;

    invoke-static {v4, v5}, Lcom/adobe/creativesdk/aviary/internal/media/MediaUtils;->insertImage(Landroid/content/Context;Ljava/io/File;)Landroid/net/Uri;
    :try_end_38
    .catch Ljava/lang/IllegalStateException; {:try_start_31 .. :try_end_38} :catch_65

    .line 1818
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mDestFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->saveExif(Ljava/lang/String;)V

    .line 1821
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mDestFile:Ljava/io/File;

    invoke-direct {v1, v4, v5, p0, p0}, Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem;-><init>(Landroid/content/Context;Ljava/io/File;Landroid/media/MediaScannerConnection$OnScanCompletedListener;Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem$OnScanErrorListener;)V

    .line 1822
    .local v1, "mScanner":Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem;->run()V

    .line 1824
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mScanCompletedLock:Ljava/lang/Object;

    monitor-enter v4

    .line 1826
    :try_start_52
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mScanCompletedLock:Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/lang/Object;->wait()V
    :try_end_57
    .catch Ljava/lang/InterruptedException; {:try_start_52 .. :try_end_57} :catch_70
    .catchall {:try_start_52 .. :try_end_57} :catchall_7c

    .line 1832
    :try_start_57
    monitor-exit v4
    :try_end_58
    .catchall {:try_start_57 .. :try_end_58} :catchall_7c

    .line 1833
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mDestFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mOutputContentUri:Landroid/net/Uri;

    invoke-static {v3, v4}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v3

    goto :goto_14

    .line 1811
    .end local v1    # "mScanner":Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem;
    :catch_65
    move-exception v0

    .line 1812
    .local v0, "e":Ljava/lang/IllegalStateException;
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    .line 1813
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mErrorString:Ljava/lang/String;

    goto :goto_14

    .line 1827
    .end local v0    # "e":Ljava/lang/IllegalStateException;
    .restart local v1    # "mScanner":Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem;
    :catch_70
    move-exception v0

    .line 1828
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_71
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 1829
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mErrorString:Ljava/lang/String;

    .line 1830
    monitor-exit v4

    goto :goto_14

    .line 1832
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_7c
    move-exception v3

    monitor-exit v4
    :try_end_7e
    .catchall {:try_start_71 .. :try_end_7e} :catchall_7c

    throw v3

    .line 1835
    .end local v1    # "mScanner":Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem;
    :cond_7f
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "something went while saving..."

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_14
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 1702
    check-cast p1, [Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->doInBackground([Landroid/graphics/Bitmap;)Landroid/util/Pair;

    move-result-object v0

    return-object v0
.end method

.method protected doPostExecute(Landroid/util/Pair;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "result":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Landroid/net/Uri;>;"
    const/4 v2, 0x0

    const/4 v5, 0x0

    .line 1896
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "doPostExecute, mErrorString:%s, mHiResException: %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mErrorString:Ljava/lang/String;

    aput-object v4, v3, v5

    const/4 v4, 0x1

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mHiresException:Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;

    aput-object v6, v3, v4

    invoke-interface {v0, v1, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1900
    :try_start_15
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_22

    .line 1901
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V
    :try_end_22
    .catch Ljava/lang/Throwable; {:try_start_15 .. :try_end_22} :catch_3a

    .line 1910
    :cond_22
    :goto_22
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_48

    .line 1911
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "was cancelled.."

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 1912
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v0, v5, v2}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onSetResult(ILandroid/content/Intent;)V

    .line 1913
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->supportFinishAfterTransition()V

    .line 1929
    :goto_39
    return-void

    .line 1903
    :catch_3a
    move-exception v7

    .line 1905
    .local v7, "t":Ljava/lang/Throwable;
    invoke-virtual {v7}, Ljava/lang/Throwable;->printStackTrace()V

    .line 1906
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    invoke-virtual {v7}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    goto :goto_22

    .line 1917
    .end local v7    # "t":Ljava/lang/Throwable;
    :cond_48
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mHiresException:Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;

    if-nez v0, :cond_52

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mErrorString:Ljava/lang/String;

    if-nez v0, :cond_52

    if-nez p1, :cond_79

    .line 1920
    :cond_52
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mHiresException:Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;

    if-eqz v0, :cond_64

    .line 1921
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mCompressFormat:Landroid/graphics/Bitmap$CompressFormat;

    iget v4, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mCompressQuality:I

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mFinalAction:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;

    invoke-virtual/range {v0 .. v6}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->performSave(Landroid/graphics/Bitmap;Landroid/net/Uri;Landroid/graphics/Bitmap$CompressFormat;IZLcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;)V

    goto :goto_39

    .line 1924
    :cond_64
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mErrorString:Ljava/lang/String;

    if-eqz v0, :cond_70

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mErrorString:Ljava/lang/String;

    :goto_6c
    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onSaveError(Ljava/lang/String;)V

    goto :goto_39

    :cond_70
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    sget v2, Lcom/aviary/android/feather/sdk/R$string;->feather_error_saving_image:I

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_6c

    .line 1927
    :cond_79
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mFinalAction:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;

    invoke-virtual {v0, p1, v1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onSaveCompleted(Landroid/util/Pair;Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$FinalAction;)V

    goto :goto_39
.end method

.method protected bridge synthetic doPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 1702
    check-cast p1, Landroid/util/Pair;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->doPostExecute(Landroid/util/Pair;)V

    return-void
.end method

.method protected doPreExecute()V
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 1732
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "doPreExecute"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 1733
    new-instance v0, Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mProgress:Landroid/app/ProgressDialog;

    .line 1734
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 1735
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 1736
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 1737
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mProgress:Landroid/app/ProgressDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    .line 1738
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0, p0}, Landroid/app/ProgressDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 1739
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mProgress:Landroid/app/ProgressDialog;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    sget v2, Lcom/aviary/android/feather/sdk/R$string;->feather_save_progress:I

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 1740
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 1741
    return-void
.end method

.method protected varargs doProgressUpdate([Ljava/lang/Integer;)V
    .registers 13
    .param p1, "values"    # [Ljava/lang/Integer;

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 1758
    aget-object v5, p1, v10

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 1759
    .local v1, "index":I
    aget-object v5, p1, v9

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 1760
    .local v4, "total":I
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "doProgressUpdate. %d/%d"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v10

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-interface {v5, v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1764
    if-nez v1, :cond_3e

    .line 1765
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    sget v6, Lcom/aviary/android/feather/sdk/R$string;->feather_loading_image:I

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1766
    .local v2, "message":Ljava/lang/String;
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v5, v10}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 1767
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v5, v9}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 1787
    :goto_38
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v5, v2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 1788
    return-void

    .line 1768
    .end local v2    # "message":Ljava/lang/String;
    :cond_3e
    if-ne v1, v4, :cond_55

    .line 1769
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    sget v6, Lcom/aviary/android/feather/sdk/R$string;->feather_save_progress:I

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1770
    .restart local v2    # "message":Ljava/lang/String;
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mProgress:Landroid/app/ProgressDialog;

    const/16 v6, 0x64

    invoke-virtual {v5, v6}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 1771
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v5, v9}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    goto :goto_38

    .line 1773
    .end local v2    # "message":Ljava/lang/String;
    :cond_55
    if-ltz v1, :cond_76

    if-gt v1, v4, :cond_76

    .line 1775
    int-to-float v5, v1

    int-to-float v6, v4

    div-float/2addr v5, v6

    const/high16 v6, 0x42c80000

    mul-float v3, v5, v6

    .line 1776
    .local v3, "perc":F
    :try_start_60
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mProgress:Landroid/app/ProgressDialog;

    float-to-int v6, v3

    invoke-virtual {v5, v6}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 1777
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mProgress:Landroid/app/ProgressDialog;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V
    :try_end_6c
    .catch Ljava/lang/Exception; {:try_start_60 .. :try_end_6c} :catch_6f

    .line 1784
    .end local v3    # "perc":F
    :goto_6c
    const-string v2, "Applying actions..."

    .restart local v2    # "message":Ljava/lang/String;
    goto :goto_38

    .line 1778
    .end local v2    # "message":Ljava/lang/String;
    .restart local v3    # "perc":F
    :catch_6f
    move-exception v0

    .line 1779
    .local v0, "e":Ljava/lang/Exception;
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v5, v9}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    goto :goto_6c

    .line 1782
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v3    # "perc":F
    :cond_76
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mProgress:Landroid/app/ProgressDialog;

    invoke-virtual {v5, v9}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    goto :goto_6c
.end method

.method protected bridge synthetic doProgressUpdate([Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 1702
    check-cast p1, [Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->doProgressUpdate([Ljava/lang/Integer;)V

    return-void
.end method

.method protected onCancelled()V
    .registers 4

    .prologue
    .line 1745
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "save task cancelled"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 1746
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onSetResult(ILandroid/content/Intent;)V

    .line 1747
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-static {v0}, Landroid/support/v4/app/ActivityCompat;->finishAfterTransition(Landroid/app/Activity;)V

    .line 1748
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 1752
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onDismiss"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 1753
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->cancel(Z)Z

    .line 1754
    return-void
.end method

.method public onHiresComplete()V
    .registers 3

    .prologue
    .line 1948
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onHiresComplete"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 1950
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mFinishedLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1951
    :try_start_a
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mFinishedLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 1952
    monitor-exit v1

    .line 1953
    return-void

    .line 1952
    :catchall_11
    move-exception v0

    monitor-exit v1
    :try_end_13
    .catchall {:try_start_a .. :try_end_13} :catchall_11

    throw v0
.end method

.method public onHiresError(Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;)V
    .registers 6
    .param p1, "ex"    # Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;

    .prologue
    .line 1933
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onHiresError: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1935
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mHiresException:Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;

    .line 1936
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mFinishedLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1937
    :try_start_12
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mFinishedLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 1938
    monitor-exit v1

    .line 1939
    return-void

    .line 1938
    :catchall_19
    move-exception v0

    monitor-exit v1
    :try_end_1b
    .catchall {:try_start_12 .. :try_end_1b} :catchall_19

    throw v0
.end method

.method public onHiresProgress(II)V
    .registers 6
    .param p1, "index"    # I
    .param p2, "total"    # I

    .prologue
    .line 1943
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Integer;

    const/4 v1, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->publishProgress([Ljava/lang/Object;)V

    .line 1944
    return-void
.end method

.method public onScanCompleted(Ljava/lang/String;Landroid/net/Uri;)V
    .registers 6
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "uri"    # Landroid/net/Uri;

    .prologue
    .line 1957
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onScanCompleted: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", uri: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 1958
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mOutputContentUri:Landroid/net/Uri;

    .line 1959
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mScanCompletedLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1960
    :try_start_27
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mScanCompletedLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 1961
    monitor-exit v1

    .line 1962
    return-void

    .line 1961
    :catchall_2e
    move-exception v0

    monitor-exit v1
    :try_end_30
    .catchall {:try_start_27 .. :try_end_30} :catchall_2e

    throw v0
.end method

.method public onScanError()V
    .registers 3

    .prologue
    .line 1966
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onScanError"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 1967
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mScanCompletedLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1968
    :try_start_a
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$SaveHiResImageTask;->mScanCompletedLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 1969
    monitor-exit v1

    .line 1970
    return-void

    .line 1969
    :catchall_11
    move-exception v0

    monitor-exit v1
    :try_end_13
    .catchall {:try_start_a .. :try_end_13} :catchall_11

    throw v0
.end method
