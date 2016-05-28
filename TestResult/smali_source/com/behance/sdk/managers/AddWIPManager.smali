.class public Lcom/behance/sdk/managers/AddWIPManager;
.super Ljava/lang/Object;
.source "AddWIPManager.java"


# static fields
.field private static final INSTANCE:Lcom/behance/sdk/managers/AddWIPManager;


# instance fields
.field private hideFacebookSharing:Z

.field private hideTwitterSharing:Z

.field private notificationHandlerActivityClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private userCredentials:Lcom/behance/sdk/IBehanceSDKUserCredentials;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 30
    new-instance v0, Lcom/behance/sdk/managers/AddWIPManager;

    invoke-direct {v0}, Lcom/behance/sdk/managers/AddWIPManager;-><init>()V

    sput-object v0, Lcom/behance/sdk/managers/AddWIPManager;->INSTANCE:Lcom/behance/sdk/managers/AddWIPManager;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    return-void
.end method

.method public static getInstance()Lcom/behance/sdk/managers/AddWIPManager;
    .registers 1

    .prologue
    .line 38
    sget-object v0, Lcom/behance/sdk/managers/AddWIPManager;->INSTANCE:Lcom/behance/sdk/managers/AddWIPManager;

    return-object v0
.end method


# virtual methods
.method public getNotificationHandlerActivityClass()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation

    .prologue
    .line 53
    iget-object v0, p0, Lcom/behance/sdk/managers/AddWIPManager;->notificationHandlerActivityClass:Ljava/lang/Class;

    return-object v0
.end method

.method public getUserCredentials()Lcom/behance/sdk/IBehanceSDKUserCredentials;
    .registers 2

    .prologue
    .line 45
    iget-object v0, p0, Lcom/behance/sdk/managers/AddWIPManager;->userCredentials:Lcom/behance/sdk/IBehanceSDKUserCredentials;

    return-object v0
.end method

.method public isHideFacebookSharing()Z
    .registers 2

    .prologue
    .line 69
    iget-boolean v0, p0, Lcom/behance/sdk/managers/AddWIPManager;->hideFacebookSharing:Z

    return v0
.end method

.method public isHideTwitterSharing()Z
    .registers 2

    .prologue
    .line 61
    iget-boolean v0, p0, Lcom/behance/sdk/managers/AddWIPManager;->hideTwitterSharing:Z

    return v0
.end method

.method public setHideFacebookSharing(Z)V
    .registers 2
    .param p1, "hideFacebookSharing"    # Z

    .prologue
    .line 73
    iput-boolean p1, p0, Lcom/behance/sdk/managers/AddWIPManager;->hideFacebookSharing:Z

    .line 74
    return-void
.end method

.method public setHideTwitterSharing(Z)V
    .registers 2
    .param p1, "hideTwitterSharing"    # Z

    .prologue
    .line 65
    iput-boolean p1, p0, Lcom/behance/sdk/managers/AddWIPManager;->hideTwitterSharing:Z

    .line 66
    return-void
.end method

.method public setNotificationHandlerActivityClass(Ljava/lang/Class;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 57
    .local p1, "notificationHandlerActivityClass":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Activity;>;"
    iput-object p1, p0, Lcom/behance/sdk/managers/AddWIPManager;->notificationHandlerActivityClass:Ljava/lang/Class;

    .line 58
    return-void
.end method

.method public setUserCredentials(Lcom/behance/sdk/IBehanceSDKUserCredentials;)V
    .registers 2
    .param p1, "userCredentials"    # Lcom/behance/sdk/IBehanceSDKUserCredentials;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/behance/sdk/managers/AddWIPManager;->userCredentials:Lcom/behance/sdk/IBehanceSDKUserCredentials;

    .line 50
    return-void
.end method
