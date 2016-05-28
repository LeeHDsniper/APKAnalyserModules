.class public Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;
.super Ljava/lang/Object;
.source "BehanceSDKPublishWIPStatusDTO.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x4b2a13d611a11603L


# instance fields
.field private errorMessage:Ljava/lang/String;

.field private exception:Ljava/lang/Throwable;

.field private progressPercentage:I

.field private progressState:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

.field private publishRequestId:Ljava/lang/String;

.field private wipId:I

.field private wipRevisionDescription:Ljava/lang/String;

.field private wipRevisionId:I

.field private wipRevisionImageUrl:Ljava/lang/String;

.field private wipRevisionUrl:Ljava/lang/String;

.field private wipTitle:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    return-void
.end method


# virtual methods
.method public getProgressState()Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;
    .registers 2

    .prologue
    .line 58
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->progressState:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    return-object v0
.end method

.method public setErrorMessage(Ljava/lang/String;)V
    .registers 2
    .param p1, "errorMessage"    # Ljava/lang/String;

    .prologue
    .line 110
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->errorMessage:Ljava/lang/String;

    .line 111
    return-void
.end method

.method public setException(Ljava/lang/Throwable;)V
    .registers 2
    .param p1, "exception"    # Ljava/lang/Throwable;

    .prologue
    .line 118
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->exception:Ljava/lang/Throwable;

    .line 119
    return-void
.end method

.method public setProgressPercentage(I)V
    .registers 2
    .param p1, "progressPercentage"    # I

    .prologue
    .line 126
    iput p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->progressPercentage:I

    .line 127
    return-void
.end method

.method public setProgressState(Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;)V
    .registers 2
    .param p1, "progressState"    # Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    .prologue
    .line 62
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->progressState:Lcom/behance/sdk/enums/BehanceSDKPublishWIPProgressState;

    .line 63
    return-void
.end method

.method public setPublishRequestId(Ljava/lang/String;)V
    .registers 2
    .param p1, "publishRequestId"    # Ljava/lang/String;

    .prologue
    .line 134
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->publishRequestId:Ljava/lang/String;

    .line 135
    return-void
.end method

.method public setWipId(I)V
    .registers 2
    .param p1, "wipId"    # I

    .prologue
    .line 70
    iput p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->wipId:I

    .line 71
    return-void
.end method

.method public setWipRevisionDescription(Ljava/lang/String;)V
    .registers 2
    .param p1, "wipRevisionDescription"    # Ljava/lang/String;

    .prologue
    .line 94
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->wipRevisionDescription:Ljava/lang/String;

    .line 95
    return-void
.end method

.method public setWipRevisionId(I)V
    .registers 2
    .param p1, "wipRevisionId"    # I

    .prologue
    .line 86
    iput p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->wipRevisionId:I

    .line 87
    return-void
.end method

.method public setWipRevisionImageUrl(Ljava/lang/String;)V
    .registers 2
    .param p1, "wipRevisionImageUrl"    # Ljava/lang/String;

    .prologue
    .line 142
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->wipRevisionImageUrl:Ljava/lang/String;

    .line 143
    return-void
.end method

.method public setWipRevisionUrl(Ljava/lang/String;)V
    .registers 2
    .param p1, "wipRevisionUrl"    # Ljava/lang/String;

    .prologue
    .line 102
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->wipRevisionUrl:Ljava/lang/String;

    .line 103
    return-void
.end method

.method public setWipTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "wipTitle"    # Ljava/lang/String;

    .prologue
    .line 78
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKPublishWIPStatusDTO;->wipTitle:Ljava/lang/String;

    .line 79
    return-void
.end method
