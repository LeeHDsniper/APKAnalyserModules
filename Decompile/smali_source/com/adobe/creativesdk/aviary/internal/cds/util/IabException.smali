.class public Lcom/adobe/creativesdk/aviary/internal/cds/util/IabException;
.super Ljava/lang/Exception;
.source "IabException.java"


# instance fields
.field mResult:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .registers 4
    .param p1, "response"    # I
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 32
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    invoke-direct {v0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;-><init>(ILjava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabException;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;)V

    .line 33
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/Exception;)V
    .registers 5
    .param p1, "response"    # I
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "cause"    # Ljava/lang/Exception;

    .prologue
    .line 41
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    invoke-direct {v0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;-><init>(ILjava/lang/String;)V

    invoke-direct {p0, v0, p3}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabException;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;Ljava/lang/Exception;)V

    .line 42
    return-void
.end method

.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;)V
    .registers 3
    .param p1, "r"    # Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    .prologue
    .line 28
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabException;-><init>(Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;Ljava/lang/Exception;)V

    .line 29
    return-void
.end method

.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;Ljava/lang/Exception;)V
    .registers 4
    .param p1, "r"    # Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
    .param p2, "cause"    # Ljava/lang/Exception;

    .prologue
    .line 36
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 37
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabException;->mResult:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;

    .line 38
    return-void
.end method
