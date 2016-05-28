.class public Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;
.super Ljava/lang/Object;
.source "BehanceSDKPublishProjectStatusDTO.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x74ab8e4d2ddba2adL


# instance fields
.field private exception:Ljava/lang/Throwable;

.field private progressPercentage:I

.field private progressState:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

.field private projectCoverImageUrl:Ljava/lang/String;

.field private projectId:Ljava/lang/String;

.field private projectTitle:Ljava/lang/String;

.field private projectUrl:Ljava/lang/String;

.field private publishRequestId:Ljava/lang/String;

.field private reasonPhrase:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getProgressState()Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;
    .registers 2

    .prologue
    .line 76
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->progressState:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    return-object v0
.end method

.method public getProjectUrl()Ljava/lang/String;
    .registers 2

    .prologue
    .line 68
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->projectUrl:Ljava/lang/String;

    return-object v0
.end method

.method public setException(Ljava/lang/Throwable;)V
    .registers 2
    .param p1, "exception"    # Ljava/lang/Throwable;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->exception:Ljava/lang/Throwable;

    .line 97
    return-void
.end method

.method public setProgressPercentage(I)V
    .registers 2
    .param p1, "progressPercentage"    # I

    .prologue
    .line 112
    iput p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->progressPercentage:I

    .line 113
    return-void
.end method

.method public setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;)V
    .registers 2
    .param p1, "progressState"    # Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    .prologue
    .line 80
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->progressState:Lcom/behance/sdk/enums/BehanceSDKPublishProjectProgressState;

    .line 81
    return-void
.end method

.method public setProjectCoverImageUrl(Ljava/lang/String;)V
    .registers 2
    .param p1, "projectCoverImageUrl"    # Ljava/lang/String;

    .prologue
    .line 120
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->projectCoverImageUrl:Ljava/lang/String;

    .line 121
    return-void
.end method

.method public setProjectId(Ljava/lang/String;)V
    .registers 2
    .param p1, "projectId"    # Ljava/lang/String;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->projectId:Ljava/lang/String;

    .line 57
    return-void
.end method

.method public setProjectTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "projectTitle"    # Ljava/lang/String;

    .prologue
    .line 64
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->projectTitle:Ljava/lang/String;

    .line 65
    return-void
.end method

.method public setProjectUrl(Ljava/lang/String;)V
    .registers 2
    .param p1, "projectUrl"    # Ljava/lang/String;

    .prologue
    .line 72
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->projectUrl:Ljava/lang/String;

    .line 73
    return-void
.end method

.method public setPublishRequestId(Ljava/lang/String;)V
    .registers 2
    .param p1, "publishRequestId"    # Ljava/lang/String;

    .prologue
    .line 104
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->publishRequestId:Ljava/lang/String;

    .line 105
    return-void
.end method

.method public setReasonPhrase(Ljava/lang/String;)V
    .registers 2
    .param p1, "reasonPhrase"    # Ljava/lang/String;

    .prologue
    .line 84
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishProjectStatusDTO;->reasonPhrase:Ljava/lang/String;

    .line 85
    return-void
.end method
