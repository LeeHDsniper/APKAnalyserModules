.class public final Lcom/adobe/creativesdk/aviary/internal/headless/utils/CameraUtils;
.super Ljava/lang/Object;
.source "CameraUtils.java"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 11
    const-string v0, "cutils"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 12
    const-string v0, "aviary_moalite"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 13
    const-string v0, "aviary_native"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 14
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromInt(I)Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;
    .registers 3
    .param p0, "value"    # I

    .prologue
    .line 36
    const-class v1, Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    invoke-virtual {v1}, Ljava/lang/Class;->getEnumConstants()[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    .line 37
    .local v0, "values":[Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;
    if-ltz p0, :cond_10

    array-length v1, v0

    if-ge p0, v1, :cond_10

    .line 38
    aget-object v1, v0, p0

    .line 40
    :goto_f
    return-object v1

    :cond_10
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;->Mp1:Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    goto :goto_f
.end method

.method public static getNormalMegaPixels()Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;
    .registers 1

    .prologue
    .line 81
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/headless/utils/CameraUtils;->n_getSmallMp()I

    move-result v0

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/utils/CameraUtils;->fromInt(I)Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    move-result-object v0

    return-object v0
.end method

.method private static native n_getLargeMp()I
.end method

.method private static native n_getMaximumMp()I
.end method

.method private static native n_getMediumMp()I
.end method

.method private static native n_getSmallMp()I
.end method
