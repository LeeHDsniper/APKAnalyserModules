.class public final Lcom/adobe/creativesdk/aviary/internal/utils/ConnectionUtils;
.super Ljava/lang/Object;
.source "ConnectionUtils.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 8
    const-class v0, Lcom/adobe/creativesdk/aviary/internal/utils/ConnectionUtils;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/ConnectionUtils;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getNetworkInfo(Landroid/content/Context;)Landroid/net/NetworkInfo;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    .line 105
    :try_start_1
    const-string v3, "connectivity"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 106
    .local v0, "cm":Landroid/net/ConnectivityManager;
    if-eqz v0, :cond_f

    .line 107
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;
    :try_end_e
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_e} :catch_10

    move-result-object v2

    .line 111
    .end local v0    # "cm":Landroid/net/ConnectivityManager;
    :cond_f
    :goto_f
    return-object v2

    .line 110
    :catch_10
    move-exception v1

    .line 111
    .local v1, "e":Ljava/lang/SecurityException;
    goto :goto_f
.end method

.method private static getNetworkInfo(Landroid/content/Context;I)Landroid/net/NetworkInfo;
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "type"    # I

    .prologue
    const/4 v2, 0x0

    .line 87
    :try_start_1
    const-string v3, "connectivity"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 88
    .local v0, "cm":Landroid/net/ConnectivityManager;
    if-eqz v0, :cond_f

    .line 89
    invoke-virtual {v0, p1}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;
    :try_end_e
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_e} :catch_10

    move-result-object v2

    .line 94
    .end local v0    # "cm":Landroid/net/ConnectivityManager;
    :cond_f
    :goto_f
    return-object v2

    .line 93
    :catch_10
    move-exception v1

    .line 94
    .local v1, "e":Ljava/lang/SecurityException;
    goto :goto_f
.end method

.method public static isConnected(Landroid/content/Context;ZI)Z
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "allowRoaming"    # Z
    .param p2, "type"    # I

    .prologue
    const/4 v1, 0x0

    .line 47
    invoke-static {p0, p2}, Lcom/adobe/creativesdk/aviary/internal/utils/ConnectionUtils;->getNetworkInfo(Landroid/content/Context;I)Landroid/net/NetworkInfo;

    move-result-object v0

    .line 49
    .local v0, "info":Landroid/net/NetworkInfo;
    if-eqz v0, :cond_16

    .line 50
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_16

    if-nez p1, :cond_15

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isRoaming()Z

    move-result v2

    if-nez v2, :cond_16

    :cond_15
    const/4 v1, 0x1

    .line 52
    :cond_16
    return v1
.end method

.method public static isConnectedOrConnecting(Landroid/content/Context;Z)Z
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "allowRoaming"    # Z

    .prologue
    const/4 v1, 0x0

    .line 78
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/utils/ConnectionUtils;->getNetworkInfo(Landroid/content/Context;)Landroid/net/NetworkInfo;

    move-result-object v0

    .line 79
    .local v0, "info":Landroid/net/NetworkInfo;
    if-eqz v0, :cond_16

    .line 80
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnectedOrConnecting()Z

    move-result v2

    if-eqz v2, :cond_16

    if-nez p1, :cond_15

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isRoaming()Z

    move-result v2

    if-nez v2, :cond_16

    :cond_15
    const/4 v1, 0x1

    .line 82
    :cond_16
    return v1
.end method

.method public static isWifiConnected(Landroid/content/Context;)Z
    .registers 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 35
    if-eqz p0, :cond_b

    invoke-static {p0, v1, v0}, Lcom/adobe/creativesdk/aviary/internal/utils/ConnectionUtils;->isConnected(Landroid/content/Context;ZI)Z

    move-result v2

    if-eqz v2, :cond_b

    :goto_a
    return v0

    :cond_b
    move v0, v1

    goto :goto_a
.end method
