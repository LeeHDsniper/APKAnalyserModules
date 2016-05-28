.class public abstract Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;
.super Ljava/lang/Object;
.source "BehanceSDKAbstractPublishOptions.java"


# instance fields
.field private facebookClientId:Ljava/lang/String;

.field private facebookShareEnabled:Z

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

.field private twitterConsumerKey:Ljava/lang/String;

.field private twitterConsumerSecretKey:Ljava/lang/String;

.field private twitterShareEnabled:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-boolean v0, p0, Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;->facebookShareEnabled:Z

    .line 32
    iput-boolean v0, p0, Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;->twitterShareEnabled:Z

    return-void
.end method


# virtual methods
.method public getFacebookClientId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 98
    iget-object v0, p0, Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;->facebookClientId:Ljava/lang/String;

    return-object v0
.end method

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
    .line 43
    iget-object v0, p0, Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;->notificationHandlerActivityClass:Ljava/lang/Class;

    return-object v0
.end method

.method public getTwitterConsumerKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 116
    iget-object v0, p0, Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;->twitterConsumerKey:Ljava/lang/String;

    return-object v0
.end method

.method public getTwitterConsumerSecretKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 134
    iget-object v0, p0, Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;->twitterConsumerSecretKey:Ljava/lang/String;

    return-object v0
.end method

.method public isFacebookShareEnabled()Z
    .registers 2

    .prologue
    .line 62
    iget-boolean v0, p0, Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;->facebookShareEnabled:Z

    return v0
.end method

.method public isTwitterShareEnabled()Z
    .registers 2

    .prologue
    .line 80
    iget-boolean v0, p0, Lcom/behance/sdk/BehanceSDKAbstractPublishOptions;->twitterShareEnabled:Z

    return v0
.end method
