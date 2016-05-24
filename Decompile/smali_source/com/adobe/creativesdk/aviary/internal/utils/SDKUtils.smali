.class public final Lcom/adobe/creativesdk/aviary/internal/utils/SDKUtils;
.super Ljava/lang/Object;
.source "SDKUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/utils/SDKUtils$ApiKeyReader;
    }
.end annotation


# static fields
.field public static final IAP_RELEASE_VERSION:I = 0xd4

.field static final LOG_TAG:Ljava/lang/String; = "SDKUtils"

.field private static sCdsDebug:I

.field private static final sCdsDebugLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 13
    const/4 v0, -0x1

    sput v0, Lcom/adobe/creativesdk/aviary/internal/utils/SDKUtils;->sCdsDebug:I

    .line 15
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/SDKUtils;->sCdsDebugLock:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCDSDebug(Landroid/content/Context;)Z
    .registers 7
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 34
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/utils/SDKUtils;->sCdsDebugLock:Ljava/lang/Object;

    monitor-enter v4

    .line 35
    :try_start_5
    sget v3, Lcom/adobe/creativesdk/aviary/internal/utils/SDKUtils;->sCdsDebug:I

    const/4 v5, -0x1

    if-ne v3, v5, :cond_1d

    .line 36
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->isDebugVersion(Landroid/content/Context;)Z

    move-result v3

    if-nez v3, :cond_23

    move v0, v1

    .line 37
    .local v0, "appIsRelease":Z
    :goto_11
    if-nez v0, :cond_27

    .line 39
    const/4 v3, 0x0

    invoke-static {p0, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/SDKUtils$ApiKeyReader;->isCdsReleaseFromMetadata(Landroid/content/Context;Z)Z

    move-result v3

    if-eqz v3, :cond_25

    move v3, v2

    :goto_1b
    sput v3, Lcom/adobe/creativesdk/aviary/internal/utils/SDKUtils;->sCdsDebug:I

    .line 45
    .end local v0    # "appIsRelease":Z
    :cond_1d
    :goto_1d
    monitor-exit v4
    :try_end_1e
    .catchall {:try_start_5 .. :try_end_1e} :catchall_2b

    .line 46
    sget v3, Lcom/adobe/creativesdk/aviary/internal/utils/SDKUtils;->sCdsDebug:I

    if-ne v3, v1, :cond_2e

    :goto_22
    return v1

    :cond_23
    move v0, v2

    .line 36
    goto :goto_11

    .restart local v0    # "appIsRelease":Z
    :cond_25
    move v3, v1

    .line 39
    goto :goto_1b

    .line 42
    :cond_27
    const/4 v3, 0x0

    :try_start_28
    sput v3, Lcom/adobe/creativesdk/aviary/internal/utils/SDKUtils;->sCdsDebug:I

    goto :goto_1d

    .line 45
    .end local v0    # "appIsRelease":Z
    :catchall_2b
    move-exception v1

    monitor-exit v4
    :try_end_2d
    .catchall {:try_start_28 .. :try_end_2d} :catchall_2b

    throw v1

    :cond_2e
    move v1, v2

    .line 46
    goto :goto_22
.end method

.method public static getMetadataValue(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-static {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/utils/SDKUtils$ApiKeyReader;->getMetadataValue(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
