.class public Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;
.super Ljava/lang/Object;
.source "BehanceSDKGetAuthUrlFromTwitterTaskResult.java"


# instance fields
.field private authURL:Ljava/lang/String;

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
.method public getAuthURL()Ljava/lang/String;
    .registers 2

    .prologue
    .line 26
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;->authURL:Ljava/lang/String;

    return-object v0
.end method

.method public getException()Ljava/lang/Exception;
    .registers 2

    .prologue
    .line 18
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;->exception:Ljava/lang/Exception;

    return-object v0
.end method

.method public isExceptionOccurred()Z
    .registers 2

    .prologue
    .line 10
    iget-boolean v0, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;->exceptionOccurred:Z

    return v0
.end method

.method public setAuthURL(Ljava/lang/String;)V
    .registers 2
    .param p1, "authURL"    # Ljava/lang/String;

    .prologue
    .line 30
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;->authURL:Ljava/lang/String;

    .line 31
    return-void
.end method

.method public setException(Ljava/lang/Exception;)V
    .registers 2
    .param p1, "exception"    # Ljava/lang/Exception;

    .prologue
    .line 22
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;->exception:Ljava/lang/Exception;

    .line 23
    return-void
.end method

.method public setExceptionOccurred(Z)V
    .registers 2
    .param p1, "exceptionOccurred"    # Z

    .prologue
    .line 14
    iput-boolean p1, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetAuthUrlFromTwitterTaskResult;->exceptionOccurred:Z

    .line 15
    return-void
.end method
