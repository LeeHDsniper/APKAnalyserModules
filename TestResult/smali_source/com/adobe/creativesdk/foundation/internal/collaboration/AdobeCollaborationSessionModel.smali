.class public Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;
.super Ljava/lang/Object;
.source "AdobeCollaborationSessionModel.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpServiceDelegate;


# static fields
.field private static _sharedModel:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;


# instance fields
.field private _session:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 22
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;->_sharedModel:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;->_session:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    .line 28
    return-void
.end method

.method public static getSharedModel()Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;
    .registers 1

    .prologue
    .line 39
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;->_sharedModel:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;

    if-nez v0, :cond_b

    .line 41
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;->_sharedModel:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;

    .line 43
    :cond_b
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;->_sharedModel:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;

    return-object v0
.end method


# virtual methods
.method public HTTPServiceAuthenticationDidFail(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;)Z
    .registers 6
    .param p1, "service"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .prologue
    .line 50
    const/4 v0, 0x0

    .line 52
    .local v0, "tryAgain":Z
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->hasEncounteredTooManyAuthFailures()Z

    move-result v1

    if-nez v1, :cond_21

    .line 54
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->getSharedAuthManagerRestricted()Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->reAuthenticate()Z

    move-result v0

    .line 55
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessToken()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->setAccessToken(Ljava/lang/String;)V

    .line 65
    :goto_1a
    if-eqz v0, :cond_20

    .line 67
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->setSuspended(Z)V

    .line 70
    :cond_20
    return v0

    .line 60
    :cond_21
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-string v2, "AdobeStorageModel"

    const-string v3, "Too many authentication failures have occurred within the last 5 minutes."

    invoke-static {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->setAccessToken(Ljava/lang/String;)V

    goto :goto_1a
.end method

.method public HTTPServiceDidDisconnect(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;)V
    .registers 8
    .param p1, "service"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .prologue
    const-wide/16 v2, 0x3a98

    .line 77
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    .line 78
    .local v0, "timer":Ljava/util/Timer;
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel$1;

    invoke-direct {v1, p0, p1, v0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;Ljava/util/Timer;)V

    .local v1, "timertask":Ljava/util/TimerTask;
    move-wide v4, v2

    .line 108
    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 110
    return-void
.end method

.method public HTTPServiceIsActive(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;)V
    .registers 2
    .param p1, "service"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .prologue
    .line 115
    return-void
.end method

.method public login()V
    .registers 1

    .prologue
    .line 120
    return-void
.end method

.method public logout()V
    .registers 2

    .prologue
    .line 124
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;->_session:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    .line 125
    return-void
.end method

.method public setCollaborationSession(Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;)V
    .registers 2
    .param p1, "session"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSessionModel;->_session:Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    .line 36
    return-void
.end method
