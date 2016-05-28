.class public Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;
.super Ljava/lang/Object;
.source "BehanceSDKGetUserProfileTaskResult.java"


# instance fields
.field private exception:Ljava/lang/Exception;

.field private exceptionOccurred:Z

.field private userProfile:Lcom/behance/sdk/BehanceSDKUserProfile;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getBehanceUserProfile()Lcom/behance/sdk/BehanceSDKUserProfile;
    .registers 2

    .prologue
    .line 18
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;->userProfile:Lcom/behance/sdk/BehanceSDKUserProfile;

    return-object v0
.end method

.method public getException()Ljava/lang/Exception;
    .registers 2

    .prologue
    .line 34
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;->exception:Ljava/lang/Exception;

    return-object v0
.end method

.method public isExceptionOccurred()Z
    .registers 2

    .prologue
    .line 26
    iget-boolean v0, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;->exceptionOccurred:Z

    return v0
.end method

.method public setBehanceUserProfile(Lcom/behance/sdk/BehanceSDKUserProfile;)V
    .registers 2
    .param p1, "profile"    # Lcom/behance/sdk/BehanceSDKUserProfile;

    .prologue
    .line 22
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;->userProfile:Lcom/behance/sdk/BehanceSDKUserProfile;

    .line 23
    return-void
.end method

.method public setException(Ljava/lang/Exception;)V
    .registers 2
    .param p1, "exception"    # Ljava/lang/Exception;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;->exception:Ljava/lang/Exception;

    .line 39
    return-void
.end method

.method public setExceptionOccurred(Z)V
    .registers 2
    .param p1, "exceptionOccurred"    # Z

    .prologue
    .line 30
    iput-boolean p1, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;->exceptionOccurred:Z

    .line 31
    return-void
.end method
