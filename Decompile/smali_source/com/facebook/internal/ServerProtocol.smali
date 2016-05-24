.class public final Lcom/facebook/internal/ServerProtocol;
.super Ljava/lang/Object;
.source "ServerProtocol.java"


# static fields
.field public static final errorsProxyAuthDisabled:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final errorsUserCanceled:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 54
    new-array v0, v4, [Ljava/lang/String;

    .line 55
    const-string v1, "service_disabled"

    aput-object v1, v0, v2

    const-string v1, "AndroidAuthKillSwitchException"

    aput-object v1, v0, v3

    invoke-static {v0}, Lcom/facebook/internal/Utility;->unmodifiableCollection([Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v0

    sput-object v0, Lcom/facebook/internal/ServerProtocol;->errorsProxyAuthDisabled:Ljava/util/Collection;

    .line 56
    new-array v0, v4, [Ljava/lang/String;

    .line 57
    const-string v1, "access_denied"

    aput-object v1, v0, v2

    const-string v1, "OAuthAccessDeniedException"

    aput-object v1, v0, v3

    invoke-static {v0}, Lcom/facebook/internal/Utility;->unmodifiableCollection([Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v0

    sput-object v0, Lcom/facebook/internal/ServerProtocol;->errorsUserCanceled:Ljava/util/Collection;

    return-void
.end method

.method public static final getAPIVersion()Ljava/lang/String;
    .registers 1

    .prologue
    .line 72
    invoke-static {}, Lcom/facebook/Settings;->getPlatformCompatibilityEnabled()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 73
    const-string v0, "v1.0"

    .line 75
    :goto_8
    return-object v0

    :cond_9
    const-string v0, "v2.1"

    goto :goto_8
.end method

.method public static final getDialogAuthority()Ljava/lang/String;
    .registers 4

    .prologue
    .line 60
    const-string v0, "m.%s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {}, Lcom/facebook/Settings;->getFacebookDomain()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static final getGraphUrlBase()Ljava/lang/String;
    .registers 4

    .prologue
    .line 64
    const-string v0, "https://graph.%s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {}, Lcom/facebook/Settings;->getFacebookDomain()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static final getGraphVideoUrlBase()Ljava/lang/String;
    .registers 4

    .prologue
    .line 68
    const-string v0, "https://graph-video.%s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {}, Lcom/facebook/Settings;->getFacebookDomain()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
