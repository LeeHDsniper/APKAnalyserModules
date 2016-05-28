.class public Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;
.super Ljava/lang/Object;
.source "BehanceSDKGetUserWIPsTaskResult.java"


# instance fields
.field private exception:Ljava/lang/Exception;

.field private exceptionOccurred:Z

.field private wipsList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKWIPDTO;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getException()Ljava/lang/Exception;
    .registers 2

    .prologue
    .line 45
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;->exception:Ljava/lang/Exception;

    return-object v0
.end method

.method public getWipsList()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKWIPDTO;",
            ">;"
        }
    .end annotation

    .prologue
    .line 37
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;->wipsList:Ljava/util/List;

    return-object v0
.end method

.method public isExceptionOccurred()Z
    .registers 2

    .prologue
    .line 53
    iget-boolean v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;->exceptionOccurred:Z

    return v0
.end method

.method public setException(Ljava/lang/Exception;)V
    .registers 2
    .param p1, "exception"    # Ljava/lang/Exception;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;->exception:Ljava/lang/Exception;

    .line 50
    return-void
.end method

.method public setExceptionOccurred(Z)V
    .registers 2
    .param p1, "exceptionOccurred"    # Z

    .prologue
    .line 57
    iput-boolean p1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;->exceptionOccurred:Z

    .line 58
    return-void
.end method

.method public setWipsList(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKWIPDTO;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p1, "wipsList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKWIPDTO;>;"
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;->wipsList:Ljava/util/List;

    .line 42
    return-void
.end method
