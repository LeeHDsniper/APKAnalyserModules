.class public Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;
.super Ljava/lang/Object;
.source "BehanceSDKAsyncTaskResultWrapper.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private exception:Ljava/lang/Exception;

.field private exceptionOccurred:Z

.field private result:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 3
    .local p0, "this":Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;, "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getException()Ljava/lang/Exception;
    .registers 2

    .prologue
    .line 16
    .local p0, "this":Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;, "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper<TT;>;"
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->exception:Ljava/lang/Exception;

    return-object v0
.end method

.method public getResult()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 22
    .local p0, "this":Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;, "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper<TT;>;"
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->result:Ljava/lang/Object;

    return-object v0
.end method

.method public isExceptionOccurred()Z
    .registers 2

    .prologue
    .line 10
    .local p0, "this":Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;, "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper<TT;>;"
    iget-boolean v0, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->exceptionOccurred:Z

    return v0
.end method

.method public setException(Ljava/lang/Exception;)V
    .registers 2
    .param p1, "exception"    # Ljava/lang/Exception;

    .prologue
    .line 19
    .local p0, "this":Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;, "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper<TT;>;"
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->exception:Ljava/lang/Exception;

    .line 20
    return-void
.end method

.method public setExceptionOccurred(Z)V
    .registers 2
    .param p1, "exceptionOccurred"    # Z

    .prologue
    .line 13
    .local p0, "this":Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;, "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper<TT;>;"
    iput-boolean p1, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->exceptionOccurred:Z

    .line 14
    return-void
.end method

.method public setResult(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 25
    .local p0, "this":Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;, "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper<TT;>;"
    .local p1, "result":Ljava/lang/Object;, "TT;"
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->result:Ljava/lang/Object;

    .line 26
    return-void
.end method
