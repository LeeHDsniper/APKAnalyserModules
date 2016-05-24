.class public Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;
.super Ljava/lang/Object;
.source "BehanceSDKPublishProjectTaskResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;
    }
.end annotation


# instance fields
.field private exception:Ljava/lang/Throwable;

.field private failedProjectModule:Lcom/behance/sdk/project/modules/ProjectModule;

.field private publishedProject:Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;

.field private reasonPhrase:Ljava/lang/String;

.field private status:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    return-void
.end method


# virtual methods
.method public getPublishedProject()Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;
    .registers 2

    .prologue
    .line 72
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;->publishedProject:Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;

    return-object v0
.end method

.method public getReasonPhrase()Ljava/lang/String;
    .registers 2

    .prologue
    .line 68
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;->reasonPhrase:Ljava/lang/String;

    return-object v0
.end method

.method public getStatus()Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;
    .registers 2

    .prologue
    .line 40
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;->status:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    return-object v0
.end method

.method public setException(Ljava/lang/Throwable;)V
    .registers 2
    .param p1, "exception"    # Ljava/lang/Throwable;

    .prologue
    .line 52
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;->exception:Ljava/lang/Throwable;

    .line 53
    return-void
.end method

.method public setFailedMoudle(Lcom/behance/sdk/project/modules/ProjectModule;)V
    .registers 2
    .param p1, "projectModule"    # Lcom/behance/sdk/project/modules/ProjectModule;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;->failedProjectModule:Lcom/behance/sdk/project/modules/ProjectModule;

    .line 57
    return-void
.end method

.method public setPublishedProject(Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;)V
    .registers 2
    .param p1, "publishedProject"    # Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;

    .prologue
    .line 76
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;->publishedProject:Lcom/behance/sdk/dto/BehanceSDKPublishedProjectDTO;

    .line 77
    return-void
.end method

.method public setReasonPhrase(Ljava/lang/String;)V
    .registers 2
    .param p1, "reasonPhrase"    # Ljava/lang/String;

    .prologue
    .line 64
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;->reasonPhrase:Ljava/lang/String;

    .line 65
    return-void
.end method

.method public setStatus(Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;)V
    .registers 2
    .param p1, "status"    # Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult;->status:Lcom/behance/sdk/asynctasks/result/BehanceSDKPublishProjectTaskResult$PublishStatus;

    .line 45
    return-void
.end method
