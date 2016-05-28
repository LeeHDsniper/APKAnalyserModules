.class public Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;
.super Ljava/lang/Object;
.source "BehanceSDKRetrieveAccessTokenFromTwitterTaskResult.java"


# instance fields
.field private exception:Ljava/lang/Exception;

.field private exceptionOccurred:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getException()Ljava/lang/Exception;
    .registers 2

    .prologue
    .line 19
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;->exception:Ljava/lang/Exception;

    return-object v0
.end method

.method public isExceptionOccurred()Z
    .registers 2

    .prologue
    .line 11
    iget-boolean v0, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;->exceptionOccurred:Z

    return v0
.end method

.method public setException(Ljava/lang/Exception;)V
    .registers 2
    .param p1, "exception"    # Ljava/lang/Exception;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;->exception:Ljava/lang/Exception;

    .line 24
    return-void
.end method

.method public setExceptionOccurred(Z)V
    .registers 2
    .param p1, "exceptionOccurred"    # Z

    .prologue
    .line 15
    iput-boolean p1, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKRetrieveAccessTokenFromTwitterTaskResult;->exceptionOccurred:Z

    .line 16
    return-void
.end method
