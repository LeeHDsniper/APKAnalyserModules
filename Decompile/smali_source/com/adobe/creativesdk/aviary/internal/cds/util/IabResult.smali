.class public Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;
.super Ljava/lang/Object;
.source "IabResult.java"


# instance fields
.field mMessage:Ljava/lang/String;

.field mResponse:I


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .registers 5
    .param p1, "response"    # I
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;->mResponse:I

    .line 31
    if-eqz p2, :cond_11

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_18

    .line 32
    :cond_11
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->getResponseDesc(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;->mMessage:Ljava/lang/String;

    .line 36
    :goto_17
    return-void

    .line 34
    :cond_18
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " (response: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->getResponseDesc(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;->mMessage:Ljava/lang/String;

    goto :goto_17
.end method


# virtual methods
.method public getMessage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;->mMessage:Ljava/lang/String;

    return-object v0
.end method

.method public getResponse()I
    .registers 2

    .prologue
    .line 39
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;->mResponse:I

    return v0
.end method

.method public isFailure()Z
    .registers 2

    .prologue
    .line 51
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;->isSuccess()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isSuccess()Z
    .registers 2

    .prologue
    .line 47
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;->mResponse:I

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "IabResult: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
