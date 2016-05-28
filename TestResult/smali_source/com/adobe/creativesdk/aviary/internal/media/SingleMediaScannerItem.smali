.class public Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem;
.super Ljava/lang/Object;
.source "SingleMediaScannerItem.java"

# interfaces
.implements Landroid/media/MediaScannerConnection$MediaScannerConnectionClient;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem$OnScanErrorListener;
    }
.end annotation


# instance fields
.field private mConn:Landroid/media/MediaScannerConnection;

.field private mFile:Ljava/io/File;

.field private mScanCompletedListener:Landroid/media/MediaScannerConnection$OnScanCompletedListener;

.field private mScaneErrorListener:Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem$OnScanErrorListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/io/File;Landroid/media/MediaScannerConnection$OnScanCompletedListener;Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem$OnScanErrorListener;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "file"    # Ljava/io/File;
    .param p3, "completedListener"    # Landroid/media/MediaScannerConnection$OnScanCompletedListener;
    .param p4, "errorListener"    # Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem$OnScanErrorListener;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem;->mFile:Ljava/io/File;

    .line 34
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem;->mScanCompletedListener:Landroid/media/MediaScannerConnection$OnScanCompletedListener;

    .line 35
    iput-object p4, p0, Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem;->mScaneErrorListener:Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem$OnScanErrorListener;

    .line 36
    new-instance v0, Landroid/media/MediaScannerConnection;

    invoke-direct {v0, p1, p0}, Landroid/media/MediaScannerConnection;-><init>(Landroid/content/Context;Landroid/media/MediaScannerConnection$MediaScannerConnectionClient;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem;->mConn:Landroid/media/MediaScannerConnection;

    .line 37
    return-void
.end method


# virtual methods
.method public onMediaScannerConnected()V
    .registers 5

    .prologue
    .line 48
    const-string v1, "single-media-scanner"

    const-string v2, "onMediaScannerConnected"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    :try_start_7
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem;->mConn:Landroid/media/MediaScannerConnection;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem;->mFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/media/MediaScannerConnection;->scanFile(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_13
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_13} :catch_14

    .line 57
    :cond_13
    :goto_13
    return-void

    .line 52
    :catch_14
    move-exception v0

    .line 53
    .local v0, "t":Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem;->mScaneErrorListener:Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem$OnScanErrorListener;

    if-eqz v1, :cond_13

    .line 54
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem;->mScaneErrorListener:Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem$OnScanErrorListener;

    invoke-interface {v1}, Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem$OnScanErrorListener;->onScanError()V

    goto :goto_13
.end method

.method public onScanCompleted(Ljava/lang/String;Landroid/net/Uri;)V
    .registers 6
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "uri"    # Landroid/net/Uri;

    .prologue
    .line 61
    const-string v0, "single-media-scanner"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onMediaScannerCompleted: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem;->mConn:Landroid/media/MediaScannerConnection;

    invoke-virtual {v0}, Landroid/media/MediaScannerConnection;->disconnect()V

    .line 63
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem;->mScanCompletedListener:Landroid/media/MediaScannerConnection$OnScanCompletedListener;

    if-eqz v0, :cond_36

    .line 64
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem;->mScanCompletedListener:Landroid/media/MediaScannerConnection$OnScanCompletedListener;

    invoke-interface {v0, p1, p2}, Landroid/media/MediaScannerConnection$OnScanCompletedListener;->onScanCompleted(Ljava/lang/String;Landroid/net/Uri;)V

    .line 66
    :cond_36
    return-void
.end method

.method public run()V
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/media/SingleMediaScannerItem;->mConn:Landroid/media/MediaScannerConnection;

    invoke-virtual {v0}, Landroid/media/MediaScannerConnection;->connect()V

    .line 44
    return-void
.end method
