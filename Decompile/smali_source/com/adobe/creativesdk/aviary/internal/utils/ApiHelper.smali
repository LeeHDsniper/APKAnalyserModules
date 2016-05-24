.class public final Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;
.super Ljava/lang/Object;
.source "ApiHelper.java"


# static fields
.field public static final AT_LEAST_11:Z

.field public static final AT_LEAST_12:Z

.field public static final AT_LEAST_13:Z

.field public static final AT_LEAST_14:Z

.field public static final AT_LEAST_16:Z

.field public static final AT_LEAST_17:Z

.field public static final AT_LEAST_19:Z

.field public static final AT_LEAST_20:Z

.field public static final AT_LEAST_21:Z

.field public static final AT_LEAST_22:Z

.field public static final EFFECT_INTENSITY_AVAILABLE:Z

.field public static final HAS_POST_ON_ANIMATION:Z


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/16 v4, 0x10

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 48
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-lt v0, v3, :cond_67

    move v0, v1

    :goto_b
    sput-boolean v0, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_11:Z

    .line 49
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xc

    if-lt v0, v3, :cond_69

    move v0, v1

    :goto_14
    sput-boolean v0, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_12:Z

    .line 50
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xd

    if-lt v0, v3, :cond_6b

    move v0, v1

    :goto_1d
    sput-boolean v0, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_13:Z

    .line 51
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xe

    if-lt v0, v3, :cond_6d

    move v0, v1

    :goto_26
    sput-boolean v0, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_14:Z

    .line 52
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v4, :cond_6f

    move v0, v1

    :goto_2d
    sput-boolean v0, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_16:Z

    .line 53
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x11

    if-lt v0, v3, :cond_71

    move v0, v1

    :goto_36
    sput-boolean v0, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_17:Z

    .line 54
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x13

    if-lt v0, v3, :cond_73

    move v0, v1

    :goto_3f
    sput-boolean v0, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_19:Z

    .line 55
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x14

    if-lt v0, v3, :cond_75

    move v0, v1

    :goto_48
    sput-boolean v0, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_20:Z

    .line 56
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v0, v3, :cond_77

    move v0, v1

    :goto_51
    sput-boolean v0, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_21:Z

    .line 57
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x16

    if-lt v0, v3, :cond_79

    move v0, v1

    :goto_5a
    sput-boolean v0, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_22:Z

    .line 58
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v4, :cond_7b

    :goto_60
    sput-boolean v1, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->HAS_POST_ON_ANIMATION:Z

    .line 106
    sget-boolean v0, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_14:Z

    sput-boolean v0, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->EFFECT_INTENSITY_AVAILABLE:Z

    return-void

    :cond_67
    move v0, v2

    .line 48
    goto :goto_b

    :cond_69
    move v0, v2

    .line 49
    goto :goto_14

    :cond_6b
    move v0, v2

    .line 50
    goto :goto_1d

    :cond_6d
    move v0, v2

    .line 51
    goto :goto_26

    :cond_6f
    move v0, v2

    .line 52
    goto :goto_2d

    :cond_71
    move v0, v2

    .line 53
    goto :goto_36

    :cond_73
    move v0, v2

    .line 54
    goto :goto_3f

    :cond_75
    move v0, v2

    .line 55
    goto :goto_48

    :cond_77
    move v0, v2

    .line 56
    goto :goto_51

    :cond_79
    move v0, v2

    .line 57
    goto :goto_5a

    :cond_7b
    move v1, v2

    .line 58
    goto :goto_60
.end method

.method public static fastPreviewEnabled()Z
    .registers 1

    .prologue
    .line 94
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$CpuInfo;->getCpuMhz()I

    move-result v0

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->fastPreviewEnabled(I)Z

    move-result v0

    return v0
.end method

.method public static fastPreviewEnabled(I)Z
    .registers 2
    .param p0, "cpuMhz"    # I

    .prologue
    .line 90
    const/16 v0, 0x3e8

    if-lt p0, v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static isHiResOriginalAvailable()Z
    .registers 4

    .prologue
    .line 78
    sget-boolean v0, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_14:Z

    if-eqz v0, :cond_13

    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$MemoryInfo;->getSystemTotalMemory()D

    move-result-wide v0

    const-wide v2, 0x408f400000000000L

    cmpl-double v0, v0, v2

    if-lez v0, :cond_13

    const/4 v0, 0x1

    :goto_12
    return v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method

.method public static isIceCreamSandwich()Z
    .registers 2

    .prologue
    .line 20
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_e

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-ge v0, v1, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public static isUndoRedoAvailable()Z
    .registers 4

    .prologue
    .line 73
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$MemoryInfo;->getSystemTotalMemory()D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->isUndoRedoAvailable(D)Z

    move-result v0

    if-eqz v0, :cond_19

    .line 74
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$MemoryInfo;->getRuntimeTotalMemory()D

    move-result-wide v0

    const-wide v2, 0x405fc00000000000L

    cmpl-double v0, v0, v2

    if-ltz v0, :cond_19

    const/4 v0, 0x1

    :goto_18
    return v0

    :cond_19
    const/4 v0, 0x0

    goto :goto_18
.end method

.method public static isUndoRedoAvailable(D)Z
    .registers 4
    .param p0, "memory"    # D

    .prologue
    .line 69
    sget-boolean v0, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_14:Z

    if-eqz v0, :cond_f

    const-wide v0, 0x407f400000000000L

    cmpl-double v0, p0, v0

    if-ltz v0, :cond_f

    const/4 v0, 0x1

    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method
