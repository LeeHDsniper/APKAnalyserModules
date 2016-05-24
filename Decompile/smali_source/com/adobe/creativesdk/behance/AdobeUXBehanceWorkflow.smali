.class public Lcom/adobe/creativesdk/behance/AdobeUXBehanceWorkflow;
.super Ljava/lang/Object;
.source "AdobeUXBehanceWorkflow.java"


# static fields
.field private static sharedInstance:Lcom/adobe/creativesdk/behance/AdobeUXBehanceWorkflow;


# instance fields
.field protected mAdobeCSDKUserDetails:Lcom/behance/sdk/IBehanceSDKUserCredentials;

.field protected mBehanceSDK:Lcom/behance/sdk/BehanceSDK;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 45
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/behance/AdobeUXBehanceWorkflow;->sharedInstance:Lcom/adobe/creativesdk/behance/AdobeUXBehanceWorkflow;

    return-void
.end method

.method private constructor <init>()V
    .registers 3

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/behance/AdobeUXBehanceWorkflow;->mBehanceSDK:Lcom/behance/sdk/BehanceSDK;

    .line 54
    new-instance v0, Lcom/adobe/creativesdk/behance/AdobeBehanceUserDetails;

    invoke-direct {v0}, Lcom/adobe/creativesdk/behance/AdobeBehanceUserDetails;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/behance/AdobeUXBehanceWorkflow;->mAdobeCSDKUserDetails:Lcom/behance/sdk/IBehanceSDKUserCredentials;

    .line 55
    invoke-static {}, Lcom/behance/sdk/BehanceSDK;->getInstance()Lcom/behance/sdk/BehanceSDK;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/behance/AdobeUXBehanceWorkflow;->mBehanceSDK:Lcom/behance/sdk/BehanceSDK;

    .line 56
    iget-object v0, p0, Lcom/adobe/creativesdk/behance/AdobeUXBehanceWorkflow;->mBehanceSDK:Lcom/behance/sdk/BehanceSDK;

    iget-object v1, p0, Lcom/adobe/creativesdk/behance/AdobeUXBehanceWorkflow;->mAdobeCSDKUserDetails:Lcom/behance/sdk/IBehanceSDKUserCredentials;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/BehanceSDK;->initialize(Lcom/behance/sdk/IBehanceSDKUserCredentials;)V

    .line 57
    return-void
.end method

.method static getInstance()Lcom/adobe/creativesdk/behance/AdobeUXBehanceWorkflow;
    .registers 1

    .prologue
    .line 61
    sget-object v0, Lcom/adobe/creativesdk/behance/AdobeUXBehanceWorkflow;->sharedInstance:Lcom/adobe/creativesdk/behance/AdobeUXBehanceWorkflow;

    if-nez v0, :cond_b

    .line 63
    new-instance v0, Lcom/adobe/creativesdk/behance/AdobeUXBehanceWorkflow;

    invoke-direct {v0}, Lcom/adobe/creativesdk/behance/AdobeUXBehanceWorkflow;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/behance/AdobeUXBehanceWorkflow;->sharedInstance:Lcom/adobe/creativesdk/behance/AdobeUXBehanceWorkflow;

    .line 65
    :cond_b
    sget-object v0, Lcom/adobe/creativesdk/behance/AdobeUXBehanceWorkflow;->sharedInstance:Lcom/adobe/creativesdk/behance/AdobeUXBehanceWorkflow;

    return-object v0
.end method

.method public static launchPublishWIP(Lcom/adobe/creativesdk/behance/AdobeBehanceSDKPublishWIPOptions;Landroid/content/Context;)V
    .registers 4
    .param p0, "options"    # Lcom/adobe/creativesdk/behance/AdobeBehanceSDKPublishWIPOptions;
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/behance/sdk/exception/BehanceSDKInvalidArgumentException;,
            Lcom/behance/sdk/exception/BehanceSDKInvalidImageException;,
            Lcom/behance/sdk/exception/BehanceSDKUserNotEntitledException;,
            Lcom/behance/sdk/exception/BehanceSDKUserNotAuthenticatedException;
        }
    .end annotation

    .prologue
    .line 288
    if-nez p1, :cond_a

    .line 290
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Context cannot be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 292
    :cond_a
    if-nez p0, :cond_14

    .line 294
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "AdobeBehanceSDKPublishWIPOptions cannot be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 297
    :cond_14
    invoke-static {}, Lcom/adobe/creativesdk/behance/AdobeUXBehanceWorkflow;->getInstance()Lcom/adobe/creativesdk/behance/AdobeUXBehanceWorkflow;

    move-result-object v0

    iget-object v0, v0, Lcom/adobe/creativesdk/behance/AdobeUXBehanceWorkflow;->mBehanceSDK:Lcom/behance/sdk/BehanceSDK;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/behance/AdobeBehanceSDKPublishWIPOptions;->getPublishWIPWorkflowOptions()Lcom/behance/sdk/BehanceSDKPublishWIPOptions;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/behance/sdk/BehanceSDK;->launchPublishWIPView(Landroid/content/Context;Lcom/behance/sdk/BehanceSDKPublishWIPOptions;)V

    .line 298
    return-void
.end method
