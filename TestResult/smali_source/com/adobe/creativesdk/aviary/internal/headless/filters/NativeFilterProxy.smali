.class public final Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilterProxy;
.super Ljava/lang/Object;
.source "NativeFilterProxy.java"


# static fields
.field private static mInitialized:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 26
    const/4 v0, 0x0

    sput-boolean v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilterProxy;->mInitialized:Z

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static encodeActions(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)Ljava/lang/String;
    .registers 4
    .param p0, "actionlist"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 117
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionFactory;->metadata()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;

    move-result-object v1

    .line 118
    .local v1, "metadata":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;
    invoke-virtual {v1, v2, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;->setImageSize(II)V

    .line 119
    const/4 v0, 0x0

    .line 120
    .local v0, "json":Ljava/lang/String;
    invoke-static {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/JSONWriter;->encode(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;)Ljava/lang/String;

    move-result-object v0

    .line 121
    return-object v0
.end method

.method public static declared-synchronized init(Landroid/content/Context;)V
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageInitializationException;
        }
    .end annotation

    .prologue
    .line 37
    const-class v1, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilterProxy;

    monitor-enter v1

    :try_start_3
    sget-boolean v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilterProxy;->mInitialized:Z

    if-nez v0, :cond_13

    .line 38
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {p0, v0, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/Moa;->init(Landroid/content/Context;Ljava/lang/String;I)V

    .line 39
    const/4 v0, 0x1

    sput-boolean v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilterProxy;->mInitialized:Z
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_15

    .line 41
    :cond_13
    monitor-exit v1

    return-void

    .line 37
    :catchall_15
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static prepareActions(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;II)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;
    .registers 10
    .param p0, "actionList"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    .param p1, "input"    # Landroid/graphics/Bitmap;
    .param p2, "output"    # Landroid/graphics/Bitmap;
    .param p3, "width"    # I
    .param p4, "height"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 95
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionFactory;->metadata()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;

    move-result-object v2

    .line 96
    .local v2, "metadata":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;
    invoke-virtual {v2, p3, p4}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;->setImageSize(II)V

    .line 98
    const/4 v1, 0x0

    .line 101
    .local v1, "json":Ljava/lang/String;
    :try_start_8
    invoke-static {p0, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/JSONWriter;->encode(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaMetadata;)Ljava/lang/String;
    :try_end_b
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_b} :catch_1e

    move-result-object v1

    .line 107
    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    invoke-direct {v3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;-><init>()V

    .line 108
    .local v3, "result":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;
    if-eqz p2, :cond_15

    iput-object p2, v3, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;->outputBitmap:Landroid/graphics/Bitmap;

    .line 110
    :cond_15
    iput-object v1, v3, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;->inputString:Ljava/lang/String;

    .line 111
    const-string v4, ""

    iput-object v4, v3, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;->outputString:Ljava/lang/String;

    .line 112
    iput-object p1, v3, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;->inputBitmap:Landroid/graphics/Bitmap;

    .line 113
    return-object v3

    .line 102
    .end local v3    # "result":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;
    :catch_1e
    move-exception v0

    .line 103
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 104
    throw v0
.end method
