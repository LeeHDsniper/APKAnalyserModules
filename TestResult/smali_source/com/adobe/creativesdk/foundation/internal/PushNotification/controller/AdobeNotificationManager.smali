.class public Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;
.super Ljava/lang/Object;
.source "AdobeNotificationManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$16;,
        Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$NotificationSwitchChangeListener;,
        Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$CloudChangeNotificationObserver;,
        Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$LoginNotificationObserver;
    }
.end annotation


# static fields
.field private static _adobeAppID:Ljava/lang/String;

.field private static _deviceID:Ljava/lang/String;

.field private static _googleRegistrationID:Ljava/lang/String;

.field private static _pacakageName:Ljava/lang/String;

.field private static _pushNotificationDataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;

.field private static _unReadCount:I

.field private static isCurrentCloudPublic:Z

.field private static isNotificationSwitchedOn:Z

.field private static lastTimeStampFetched:J

.field public static mNotificationInterface:Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationInterface;

.field private static mSharedManager:Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

.field static service:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;


# instance fields
.field private final MAX_READ_ACTIVITIES_ALLOWED:I

.field private _activitiesRequestQueue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationGetActivitiesCallback;",
            ">;"
        }
    .end annotation
.end field

.field private _cloud_switching_observer:Ljava/util/Observer;

.field private _invitationsRequestQueue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationGetInvitationCallback;",
            ">;"
        }
    .end annotation
.end field

.field private _login_notification_observer:Ljava/util/Observer;

.field private _network_reachability_observer:Ljava/util/Observer;

.field private _notification_switch_observer:Ljava/util/Observer;

.field private hasErrorOccuredWhileFetchingActivities:Z

.field private hasErrorOccuredWhileFetchingInvitations:Z

.field private isCurrentlyFetchingActivities:Z

.field private isCurrentlyFetchingInvitations:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x0

    .line 87
    sput-object v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->mSharedManager:Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    .line 90
    const/4 v0, -0x1

    sput v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_unReadCount:I

    .line 93
    const/4 v0, 0x1

    sput-boolean v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->isNotificationSwitchedOn:Z

    .line 112
    sput-object v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->service:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 105
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->isCurrentlyFetchingActivities:Z

    .line 106
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->isCurrentlyFetchingInvitations:Z

    .line 109
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->hasErrorOccuredWhileFetchingActivities:Z

    .line 110
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->hasErrorOccuredWhileFetchingInvitations:Z

    .line 111
    const/16 v0, 0x64

    iput v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->MAX_READ_ACTIVITIES_ALLOWED:I

    .line 116
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_activitiesRequestQueue:Ljava/util/ArrayList;

    .line 117
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_invitationsRequestQueue:Ljava/util/ArrayList;

    .line 118
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_pushNotificationDataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;

    .line 119
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->registerLocalNofications()V

    .line 120
    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->registerDevice()V

    return-void
.end method

.method static synthetic access$1000(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;Z)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;
    .param p1, "x1"    # Z

    .prologue
    .line 79
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->handleInvitationRequests(Z)V

    return-void
.end method

.method static synthetic access$1100()J
    .registers 2

    .prologue
    .line 79
    sget-wide v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->lastTimeStampFetched:J

    return-wide v0
.end method

.method static synthetic access$1102(J)J
    .registers 2
    .param p0, "x0"    # J

    .prologue
    .line 79
    sput-wide p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->lastTimeStampFetched:J

    return-wide p0
.end method

.method static synthetic access$1200(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;Z)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;
    .param p1, "x1"    # Z

    .prologue
    .line 79
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->handleActivitiesRequests(Z)V

    return-void
.end method

.method static synthetic access$1300(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;JJI)V
    .registers 7
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;
    .param p1, "x1"    # J
    .param p3, "x2"    # J
    .param p5, "x3"    # I

    .prologue
    .line 79
    invoke-direct/range {p0 .. p5}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->queryNotificationsByPage(JJI)V

    return-void
.end method

.method static synthetic access$1500(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->wentOnline()V

    return-void
.end method

.method static synthetic access$1600(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->wentOffline()V

    return-void
.end method

.method static synthetic access$200()Ljava/lang/String;
    .registers 1

    .prologue
    .line 79
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_deviceID:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2000()V
    .registers 0

    .prologue
    .line 79
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->logout()V

    return-void
.end method

.method static synthetic access$202(Ljava/lang/String;)Ljava/lang/String;
    .registers 1
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 79
    sput-object p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_deviceID:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$2100(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->handleSwitchToPrivateCloud()V

    return-void
.end method

.method static synthetic access$2200(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->handleSwitchToPublicCloud()V

    return-void
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->startFetchingData()V

    return-void
.end method

.method static synthetic access$402(I)I
    .registers 1
    .param p0, "x0"    # I

    .prologue
    .line 79
    sput p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_unReadCount:I

    return p0
.end method

.method static synthetic access$500(I)V
    .registers 1
    .param p0, "x0"    # I

    .prologue
    .line 79
    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->sendNewCountToAssetBrowser(I)V

    return-void
.end method

.method static synthetic access$600(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->queryInvitationFromCollaborator()V

    return-void
.end method

.method static synthetic access$700(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->queryActivitiesFromANS()V

    return-void
.end method

.method static synthetic access$900()Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;
    .registers 1

    .prologue
    .line 79
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_pushNotificationDataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;

    return-object v0
.end method

.method private getActivitiesList()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;",
            ">;"
        }
    .end annotation

    .prologue
    .line 866
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_pushNotificationDataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->getActivitiesList()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public static getAssetCommentCount(Ljava/lang/String;)I
    .registers 2
    .param p0, "asserGUID"    # Ljava/lang/String;

    .prologue
    .line 594
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_pushNotificationDataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;

    if-eqz v0, :cond_b

    .line 595
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_pushNotificationDataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->getAssetCommentCount(Ljava/lang/String;)I

    move-result v0

    .line 597
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method private getInvitationList()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;",
            ">;"
        }
    .end annotation

    .prologue
    .line 862
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_pushNotificationDataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->getInvitationList()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public static getNotificationManager()Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;
    .registers 1

    .prologue
    .line 123
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->mSharedManager:Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    if-nez v0, :cond_7

    .line 124
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->startNotificationManager()V

    .line 126
    :cond_7
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->mSharedManager:Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    return-object v0
.end method

.method public static getUnreadCount()I
    .registers 2

    .prologue
    .line 375
    sget v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_unReadCount:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_8

    .line 376
    sget v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_unReadCount:I

    .line 377
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private handleActivitiesRequests(Z)V
    .registers 7
    .param p1, "successFull"    # Z

    .prologue
    const/4 v4, 0x0

    .line 787
    iput-boolean v4, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->isCurrentlyFetchingActivities:Z

    .line 788
    if-eqz p1, :cond_2b

    .line 789
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->getActivitiesList()Ljava/util/ArrayList;

    move-result-object v0

    .line 791
    .local v0, "activities":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_a
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_activitiesRequestQueue:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_20

    .line 792
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_activitiesRequestQueue:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationGetActivitiesCallback;

    .line 793
    .local v1, "activitiesRequestCallBack":Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationGetActivitiesCallback;
    invoke-interface {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationGetActivitiesCallback;->onSuccess(Ljava/util/ArrayList;)V

    .line 791
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 795
    .end local v1    # "activitiesRequestCallBack":Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationGetActivitiesCallback;
    :cond_20
    iput-boolean v4, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->hasErrorOccuredWhileFetchingActivities:Z

    .line 803
    .end local v0    # "activities":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;>;"
    :goto_22
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_activitiesRequestQueue:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 804
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->handleSharedPreferences()V

    .line 805
    return-void

    .line 797
    .end local v2    # "i":I
    :cond_2b
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_2c
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_activitiesRequestQueue:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_42

    .line 798
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_activitiesRequestQueue:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationGetActivitiesCallback;

    .line 799
    .restart local v1    # "activitiesRequestCallBack":Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationGetActivitiesCallback;
    invoke-interface {v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationGetActivitiesCallback;->onError()V

    .line 797
    add-int/lit8 v2, v2, 0x1

    goto :goto_2c

    .line 801
    .end local v1    # "activitiesRequestCallBack":Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationGetActivitiesCallback;
    :cond_42
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->hasErrorOccuredWhileFetchingActivities:Z

    goto :goto_22
.end method

.method private handleInvitationRequests(Z)V
    .registers 7
    .param p1, "successFull"    # Z

    .prologue
    const/4 v4, 0x0

    .line 834
    iput-boolean v4, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->isCurrentlyFetchingInvitations:Z

    .line 835
    if-eqz p1, :cond_2b

    .line 836
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->getInvitationList()Ljava/util/ArrayList;

    move-result-object v1

    .line 837
    .local v1, "invitations":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_invitationsRequestQueue:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_20

    .line 838
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_invitationsRequestQueue:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationGetInvitationCallback;

    .line 839
    .local v2, "invitionRequestCallback":Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationGetInvitationCallback;
    invoke-interface {v2, v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationGetInvitationCallback;->onSuccess(Ljava/util/ArrayList;)V

    .line 837
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 841
    .end local v2    # "invitionRequestCallback":Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationGetInvitationCallback;
    :cond_20
    iput-boolean v4, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->hasErrorOccuredWhileFetchingInvitations:Z

    .line 850
    .end local v1    # "invitations":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeCollaborationInvite;>;"
    :goto_22
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_invitationsRequestQueue:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 851
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->handleSharedPreferences()V

    .line 852
    return-void

    .line 843
    .end local v0    # "i":I
    :cond_2b
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_2c
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_invitationsRequestQueue:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_42

    .line 844
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_invitationsRequestQueue:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationGetInvitationCallback;

    .line 845
    .restart local v2    # "invitionRequestCallback":Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationGetInvitationCallback;
    invoke-interface {v2}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationGetInvitationCallback;->onError()V

    .line 843
    add-int/lit8 v0, v0, 0x1

    goto :goto_2c

    .line 847
    .end local v2    # "invitionRequestCallback":Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationGetInvitationCallback;
    :cond_42
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->hasErrorOccuredWhileFetchingInvitations:Z

    goto :goto_22
.end method

.method private handleSharedPreferences()V
    .registers 3

    .prologue
    .line 855
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->isCurrentlyFetchingActivities:Z

    if-nez v0, :cond_f

    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->isCurrentlyFetchingInvitations:Z

    if-nez v0, :cond_f

    .line 856
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_pushNotificationDataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;

    sget v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_unReadCount:I

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->populateSharedPref(I)V

    .line 858
    :cond_f
    return-void
.end method

.method private handleSwitchToPrivateCloud()V
    .registers 2

    .prologue
    .line 827
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->isCurrentCloudPublic()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 828
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->setCurrentCloudStatus(Z)V

    .line 831
    :cond_a
    return-void
.end method

.method private handleSwitchToPublicCloud()V
    .registers 2

    .prologue
    .line 819
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->isCurrentCloudPublic()Z

    move-result v0

    if-nez v0, :cond_d

    .line 820
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->setCurrentCloudStatus(Z)V

    .line 821
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->startFetchingData()V

    .line 823
    :cond_d
    return-void
.end method

.method public static isCurrentCloudPublic()Z
    .registers 1

    .prologue
    .line 811
    sget-boolean v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->isCurrentCloudPublic:Z

    return v0
.end method

.method public static isNotificationSwitchedOn()Z
    .registers 1

    .prologue
    .line 226
    sget-boolean v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->isNotificationSwitchedOn:Z

    return v0
.end method

.method private loadAppData(Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationInterface;)V
    .registers 4
    .param p1, "provider"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationInterface;

    .prologue
    .line 231
    sput-object p1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->mNotificationInterface:Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationInterface;

    .line 232
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->mNotificationInterface:Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationInterface;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationInterface;->getFullPackageName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_pacakageName:Ljava/lang/String;

    .line 233
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->mNotificationInterface:Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationInterface;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationInterface;->getAdobeAppID()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_adobeAppID:Ljava/lang/String;

    .line 238
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->mNotificationInterface:Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationInterface;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$2;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;)V

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationInterface;->registerGCM(Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeGoogleRegistrationCallback;)V

    .line 251
    return-void
.end method

.method private static logout()V
    .registers 1

    .prologue
    const/4 v0, 0x0

    .line 1025
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->resetSharedSession()V

    .line 1026
    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->service:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .line 1027
    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_deviceID:Ljava/lang/String;

    .line 1028
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_pushNotificationDataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;

    if-eqz v0, :cond_16

    .line 1029
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_pushNotificationDataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->clearActivitiesList()V

    .line 1030
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_pushNotificationDataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->clearInvitationList()V

    .line 1032
    :cond_16
    return-void
.end method

.method private queryActivitiesFromANS()V
    .registers 8

    .prologue
    const-wide/16 v2, 0x0

    const/16 v6, 0x1e

    .line 674
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->isCurrentCloudPublic()Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 675
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->isCurrentlyFetchingActivities:Z

    .line 676
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_pushNotificationDataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->clearActivitiesList()V

    .line 677
    sget v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_unReadCount:I

    if-le v0, v6, :cond_18

    sget v6, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_unReadCount:I

    :cond_18
    move-object v1, p0

    move-wide v4, v2

    invoke-direct/range {v1 .. v6}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->queryNotifications(JJI)V

    .line 679
    :cond_1d
    return-void
.end method

.method private queryInvitationFromCollaborator()V
    .registers 3

    .prologue
    .line 654
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->isCurrentCloudPublic()Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 655
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->isCurrentlyFetchingInvitations:Z

    .line 656
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_pushNotificationDataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->clearInvitationList()V

    .line 657
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getSharedSession()Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    move-result-object v0

    .line 658
    .local v0, "collaborationSession":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$9;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$9;-><init>(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;)V

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getInvites(Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetInvitesCallBack;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    .line 671
    .end local v0    # "collaborationSession":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;
    :cond_1a
    return-void
.end method

.method private queryNotifications(JJI)V
    .registers 7
    .param p1, "fromTimeStamp"    # J
    .param p3, "toTimeStamp"    # J
    .param p5, "count"    # I

    .prologue
    .line 682
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_deviceID:Ljava/lang/String;

    if-eqz v0, :cond_10

    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_deviceID:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_10

    .line 683
    invoke-direct/range {p0 .. p5}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->queryNotificationsByPage(JJI)V

    .line 688
    :goto_f
    return-void

    .line 685
    :cond_10
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->handleActivitiesRequests(Z)V

    goto :goto_f
.end method

.method private queryNotificationsByPage(JJI)V
    .registers 19
    .param p1, "fromTimeStamp"    # J
    .param p3, "toTimeStamp"    # J
    .param p5, "notificationCount"    # I

    .prologue
    const/16 v10, 0xa

    .line 697
    move/from16 v0, p5

    if-le v0, v10, :cond_1e

    .line 698
    .local v10, "pageCount":I
    :goto_6
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->sharedSession()Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;

    move-result-object v3

    .line 699
    .local v3, "sharedSession":Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;
    if-eqz v3, :cond_1d

    .line 700
    new-instance v11, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$10;

    move/from16 v0, p5

    invoke-direct {v11, p0, v0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$10;-><init>(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;IJ)V

    .line 734
    .local v11, "callback":Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeNotificationQueryCallback;
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_adobeAppID:Ljava/lang/String;

    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_deviceID:Ljava/lang/String;

    move-wide v6, p1

    move-wide/from16 v8, p3

    invoke-virtual/range {v3 .. v11}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->queryNotifications(Ljava/lang/String;Ljava/lang/String;JJILcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeNotificationQueryCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    .line 736
    .end local v11    # "callback":Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeNotificationQueryCallback;
    :cond_1d
    return-void

    .end local v3    # "sharedSession":Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;
    .end local v10    # "pageCount":I
    :cond_1e
    move/from16 v10, p5

    .line 697
    goto :goto_6
.end method

.method private registerDevice()V
    .registers 6

    .prologue
    const/4 v3, 0x1

    .line 254
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_googleRegistrationID:Ljava/lang/String;

    if-eqz v2, :cond_31

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_googleRegistrationID:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_31

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_deviceID:Ljava/lang/String;

    if-eqz v2, :cond_19

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_deviceID:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_31

    .line 255
    :cond_19
    iput-boolean v3, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->isCurrentlyFetchingInvitations:Z

    .line 256
    iput-boolean v3, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->isCurrentlyFetchingActivities:Z

    .line 257
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->sharedSession()Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;

    move-result-object v1

    .line 258
    .local v1, "sharedSession":Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;
    if-eqz v1, :cond_31

    .line 259
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$3;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;)V

    .line 272
    .local v0, "callback":Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeDeviceRegistrationCallback;
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_adobeAppID:Ljava/lang/String;

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_googleRegistrationID:Ljava/lang/String;

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_pacakageName:Ljava/lang/String;

    invoke-virtual {v1, v2, v3, v4, v0}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->registerDevice(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeDeviceRegistrationCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    .line 275
    .end local v0    # "callback":Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeDeviceRegistrationCallback;
    .end local v1    # "sharedSession":Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;
    :cond_31
    return-void
.end method

.method private static sendNewCountToAssetBrowser(I)V
    .registers 5
    .param p0, "count"    # I

    .prologue
    .line 462
    sput p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_unReadCount:I

    .line 463
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 464
    .local v0, "newCount":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "unreadCount"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 465
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v1

    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeCCFilesRefreshNotificationCount:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    invoke-direct {v2, v3, v0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;-><init>(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Map;)V

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->postNotification(Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;)V

    .line 467
    return-void
.end method

.method public static setCurrentCloudStatus(Z)V
    .registers 1
    .param p0, "currentCloudStatus"    # Z

    .prologue
    .line 815
    sput-boolean p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->isCurrentCloudPublic:Z

    .line 816
    return-void
.end method

.method public static setNotificationSwitchStatus(Z)V
    .registers 1
    .param p0, "status"    # Z

    .prologue
    .line 222
    sput-boolean p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->isNotificationSwitchedOn:Z

    .line 223
    return-void
.end method

.method private startFetchingData()V
    .registers 2

    .prologue
    .line 278
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$4;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$4;-><init>(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;)V

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->queryUnreadNotificationsCount(Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeNotificationUnreadCountCallback;)V

    .line 295
    return-void
.end method

.method public static startNotificationManager()V
    .registers 2

    .prologue
    .line 130
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->mSharedManager:Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    if-nez v0, :cond_b

    .line 131
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->mSharedManager:Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    .line 134
    :cond_b
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->isNotificationSwitchedOn()Z

    move-result v0

    if-eqz v0, :cond_18

    .line 135
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->mSharedManager:Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->mNotificationInterface:Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationInterface;

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->loadAppData(Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationInterface;)V

    .line 136
    :cond_18
    return-void
.end method

.method public static unRegisterDevice()V
    .registers 2

    .prologue
    .line 309
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->mSharedManager:Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    if-eqz v0, :cond_e

    .line 310
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->mSharedManager:Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$5;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$5;-><init>()V

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->unRegisterDevice(Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeDeviceUnregisterCallback;)V

    .line 322
    :cond_e
    return-void
.end method

.method private updateNotification(Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;)V
    .registers 7
    .param p1, "newState"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    .prologue
    .line 326
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/utils/AdobePushNotificationQueue;->getPushNotificationQueue()Lcom/adobe/creativesdk/foundation/internal/PushNotification/utils/AdobePushNotificationQueue;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/utils/AdobePushNotificationQueue;->getReadNotificationsList()Ljava/util/ArrayList;

    move-result-object v0

    .line 327
    .local v0, "notificationIDs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;>;"
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->sharedSession()Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;

    move-result-object v1

    .line 328
    .local v1, "sharedSession":Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$6;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$6;-><init>(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;)V

    .line 339
    .local v2, "updateNotificationCallback":Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeUpdateNotificationCallback;
    if-eqz v1, :cond_1e

    .line 340
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;->ADOBE_PUSH_NOTIFICATION_STATE_NEW:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    if-ne p1, v3, :cond_1f

    .line 341
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_adobeAppID:Ljava/lang/String;

    const-string v4, "NEW"

    invoke-virtual {v1, v3, v0, v4, v2}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->updateNotifications(Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeUpdateNotificationCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    .line 345
    :cond_1e
    :goto_1e
    return-void

    .line 343
    :cond_1f
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_adobeAppID:Ljava/lang/String;

    const-string v4, "EXPIRED"

    invoke-virtual {v1, v3, v0, v4, v2}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->updateNotifications(Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeUpdateNotificationCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    goto :goto_1e
.end method

.method private wentOffline()V
    .registers 1

    .prologue
    .line 895
    return-void
.end method

.method private wentOnline()V
    .registers 3

    .prologue
    .line 870
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_deviceID:Ljava/lang/String;

    if-nez v0, :cond_2b

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->isNotificationSwitchedOn()Z

    move-result v0

    if-eqz v0, :cond_2b

    .line 871
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_googleRegistrationID:Ljava/lang/String;

    if-eqz v0, :cond_18

    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_googleRegistrationID:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27

    .line 873
    :cond_18
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->mNotificationInterface:Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationInterface;

    if-eqz v0, :cond_26

    .line 874
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->mNotificationInterface:Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationInterface;

    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$12;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$12;-><init>(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;)V

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeNotificationInterface;->registerGCM(Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeGoogleRegistrationCallback;)V

    .line 891
    :cond_26
    :goto_26
    return-void

    .line 887
    :cond_27
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->registerDevice()V

    goto :goto_26

    .line 888
    :cond_2b
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_deviceID:Ljava/lang/String;

    if-eqz v0, :cond_26

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->isNotificationSwitchedOn()Z

    move-result v0

    if-nez v0, :cond_26

    .line 889
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->unRegisterDevice()V

    goto :goto_26
.end method


# virtual methods
.method public markNotificationsForAssetsAsRead(Ljava/lang/String;Z)V
    .registers 6
    .param p1, "assetGuid"    # Ljava/lang/String;
    .param p2, "updateSharedPref"    # Z

    .prologue
    .line 603
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_pushNotificationDataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;

    invoke-virtual {v1, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->markNotificationsForAssetsAsRead(Ljava/lang/String;Z)I

    move-result v0

    .line 604
    .local v0, "count":I
    sget v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_unReadCount:I

    sub-int/2addr v1, v0

    sput v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_unReadCount:I

    .line 605
    sget v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_unReadCount:I

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_pushNotificationDataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->getInvitationListSize()I

    move-result v2

    if-ge v1, v2, :cond_28

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_pushNotificationDataModel:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationModel;->getInvitationListSize()I

    move-result v1

    :goto_1b
    sput v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_unReadCount:I

    .line 606
    sget v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_unReadCount:I

    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->sendNewCountToAssetBrowser(I)V

    .line 607
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;->ADOBE_PUSH_NOTIFICATION_STATE_EXPIRED:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->updateNotification(Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;)V

    .line 608
    return-void

    .line 605
    :cond_28
    sget v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_unReadCount:I

    goto :goto_1b
.end method

.method public queryUnreadNotificationsCount(Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeNotificationUnreadCountCallback;)V
    .registers 5
    .param p1, "callback"    # Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeNotificationUnreadCountCallback;

    .prologue
    .line 775
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_deviceID:Ljava/lang/String;

    if-eqz v1, :cond_1a

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_deviceID:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1a

    .line 776
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->sharedSession()Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;

    move-result-object v0

    .line 777
    .local v0, "sharedSession":Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;
    if-eqz v0, :cond_19

    .line 778
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_adobeAppID:Ljava/lang/String;

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_deviceID:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, p1}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->queryUnreadNotificationCount(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeNotificationUnreadCountCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    .line 783
    .end local v0    # "sharedSession":Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;
    :cond_19
    :goto_19
    return-void

    .line 781
    :cond_1a
    invoke-interface {p1}, Lcom/adobe/creativesdk/foundation/internal/ans/delegates/IAdobeNotificationUnreadCountCallback;->onError()V

    goto :goto_19
.end method

.method protected registerLocalNofications()V
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 955
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_network_reachability_observer:Ljava/util/Observer;

    if-nez v0, :cond_c

    .line 956
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$14;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$14;-><init>(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_network_reachability_observer:Ljava/util/Observer;

    .line 977
    :cond_c
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_login_notification_observer:Ljava/util/Observer;

    if-nez v0, :cond_17

    .line 978
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$LoginNotificationObserver;

    invoke-direct {v0, p0, v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$LoginNotificationObserver;-><init>(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$1;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_login_notification_observer:Ljava/util/Observer;

    .line 979
    :cond_17
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_cloud_switching_observer:Ljava/util/Observer;

    if-nez v0, :cond_22

    .line 980
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$CloudChangeNotificationObserver;

    invoke-direct {v0, p0, v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$CloudChangeNotificationObserver;-><init>(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$1;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_cloud_switching_observer:Ljava/util/Observer;

    .line 981
    :cond_22
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_notification_switch_observer:Ljava/util/Observer;

    if-nez v0, :cond_2d

    .line 982
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$NotificationSwitchChangeListener;

    invoke-direct {v0, p0, v1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$NotificationSwitchChangeListener;-><init>(Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager$1;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_notification_switch_observer:Ljava/util/Observer;

    .line 985
    :cond_2d
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLoginNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_login_notification_observer:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 986
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLogoutNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_login_notification_observer:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 987
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLoginExternalNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_login_notification_observer:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 989
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeNotificationManagerNotificationSwitchChange:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_notification_switch_observer:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 993
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeNotificationManagerSwitchedToPrivateCloudNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_cloud_switching_observer:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 994
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeNotificationManagerSwitchedToPublicCloudNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_cloud_switching_observer:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 995
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeNetworkStatusChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_network_reachability_observer:Ljava/util/Observer;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 998
    return-void
.end method

.method public unRegisterDevice(Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeDeviceUnregisterCallback;)V
    .registers 5
    .param p1, "callback"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeDeviceUnregisterCallback;

    .prologue
    .line 298
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_deviceID:Ljava/lang/String;

    if-eqz v1, :cond_1a

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_deviceID:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1a

    .line 299
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->sharedSession()Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;

    move-result-object v0

    .line 300
    .local v0, "sharedSession":Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;
    if-eqz v0, :cond_19

    .line 301
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_adobeAppID:Ljava/lang/String;

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->_deviceID:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, p1}, Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;->unregisterDevice(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeDeviceUnregisterCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    .line 306
    .end local v0    # "sharedSession":Lcom/adobe/creativesdk/foundation/internal/ans/service/AdobeANSSession;
    :cond_19
    :goto_19
    return-void

    .line 304
    :cond_1a
    invoke-interface {p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/delegates/IAdobeDeviceUnregisterCallback;->onError()V

    goto :goto_19
.end method
