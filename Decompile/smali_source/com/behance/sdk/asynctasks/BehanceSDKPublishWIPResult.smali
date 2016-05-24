.class public Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;
.super Ljava/lang/Object;
.source "BehanceSDKPublishWIPResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;
    }
.end annotation


# instance fields
.field private exception:Ljava/lang/Exception;

.field private publishedWIP:Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;

.field private reasonPhrase:Ljava/lang/String;

.field private status:Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    return-void
.end method


# virtual methods
.method public getException()Ljava/lang/Exception;
    .registers 2

    .prologue
    .line 46
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;->exception:Ljava/lang/Exception;

    return-object v0
.end method

.method public getPublishedWIP()Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;
    .registers 2

    .prologue
    .line 62
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;->publishedWIP:Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;

    return-object v0
.end method

.method public getReasonPhrase()Ljava/lang/String;
    .registers 2

    .prologue
    .line 58
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;->reasonPhrase:Ljava/lang/String;

    return-object v0
.end method

.method public getStatus()Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;
    .registers 2

    .prologue
    .line 38
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;->status:Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;

    return-object v0
.end method

.method public setException(Ljava/lang/Exception;)V
    .registers 2
    .param p1, "exception"    # Ljava/lang/Exception;

    .prologue
    .line 50
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;->exception:Ljava/lang/Exception;

    .line 51
    return-void
.end method

.method public setPublishedWIP(Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;)V
    .registers 2
    .param p1, "addedWIP"    # Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;

    .prologue
    .line 66
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;->publishedWIP:Lcom/behance/sdk/dto/BehanceSDKPublishedWIPRevisionDTO;

    .line 67
    return-void
.end method

.method public setReasonPhrase(Ljava/lang/String;)V
    .registers 2
    .param p1, "reasonPhrase"    # Ljava/lang/String;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;->reasonPhrase:Ljava/lang/String;

    .line 55
    return-void
.end method

.method public setStatus(Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;)V
    .registers 2
    .param p1, "status"    # Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult;->status:Lcom/behance/sdk/asynctasks/BehanceSDKPublishWIPResult$PublishStatus;

    .line 43
    return-void
.end method
