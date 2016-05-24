.class public Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;
.super Ljava/lang/Object;
.source "MoaResult.java"


# instance fields
.field public volatile active:I

.field public inputBitmap:Landroid/graphics/Bitmap;

.field public inputString:Ljava/lang/String;

.field public outputBitmap:Landroid/graphics/Bitmap;

.field public outputString:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const/4 v0, 0x1

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;->active:I

    .line 16
    return-void
.end method


# virtual methods
.method public cancel()V
    .registers 2

    .prologue
    .line 56
    const/4 v0, 0x0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;->active:I

    .line 57
    return-void
.end method

.method public declared-synchronized execute()V
    .registers 2

    .prologue
    .line 49
    monitor-enter p0

    :try_start_1
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/Moa;->applyActions(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;)V
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_6

    .line 50
    monitor-exit p0

    return-void

    .line 49
    :catchall_6
    move-exception v0

    monitor-exit p0

    throw v0
.end method
