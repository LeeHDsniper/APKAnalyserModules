.class public final Lcom/adobe/creativesdk/aviary/internal/headless/moa/Moa;
.super Ljava/lang/Object;
.source "Moa.java"


# static fields
.field public static final M_LOCK:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 37
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/Moa;->M_LOCK:Ljava/lang/Object;

    .line 190
    const-string v0, "cutils"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 191
    const-string v0, "aviary_moalite"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 192
    const-string v0, "aviary_native"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 193
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static applyActions(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;)V
    .registers 3
    .param p0, "output"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    .prologue
    .line 139
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/headless/moa/Moa;->M_LOCK:Ljava/lang/Object;

    monitor-enter v1

    .line 140
    :try_start_3
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/Moa;->n_applyActions(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;)V

    .line 141
    monitor-exit v1

    .line 142
    return-void

    .line 141
    :catchall_8
    move-exception v0

    monitor-exit v1
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_8

    throw v0
.end method

.method public static init(Landroid/content/Context;Ljava/lang/String;I)V
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "androidVersion"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageInitializationException;
        }
    .end annotation

    .prologue
    .line 81
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/Moa;->M_LOCK:Ljava/lang/Object;

    monitor-enter v2

    .line 82
    :try_start_3
    invoke-static {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/Moa;->n_init(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    .line 83
    .local v0, "code":I
    if-lez v0, :cond_11

    .line 84
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageInitializationException;->fromInt(I)Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageInitializationException;

    move-result-object v1

    throw v1

    .line 86
    .end local v0    # "code":I
    :catchall_e
    move-exception v1

    monitor-exit v2
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_e

    throw v1

    .restart local v0    # "code":I
    :cond_11
    :try_start_11
    monitor-exit v2
    :try_end_12
    .catchall {:try_start_11 .. :try_end_12} :catchall_e

    .line 87
    return-void
.end method

.method static native n_applyActions(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;)V
.end method

.method static native n_cpuIsArmv7()Z
.end method

.method static native n_getActions()[Ljava/lang/String;
.end method

.method static native n_getCpuBuild()I
.end method

.method static native n_getCpuFamily()I
.end method

.method static native n_getEffects()[Ljava/lang/String;
.end method

.method static native n_getMoaLiteVersion()Ljava/lang/String;
.end method

.method static native n_getProclistVersion()Ljava/lang/String;
.end method

.method static native n_getVersion()I
.end method

.method static native n_hasHeadless()Z
.end method

.method static native n_init(Landroid/content/Context;Ljava/lang/String;I)I
.end method

.method static native n_notifyPixelsChanged(Landroid/graphics/Bitmap;)V
.end method

.method static native n_setid(Ljava/lang/String;)V
.end method

.method public static notifyPixelsChanged(Landroid/graphics/Bitmap;)V
    .registers 1
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 73
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/Moa;->n_notifyPixelsChanged(Landroid/graphics/Bitmap;)V

    .line 74
    return-void
.end method
