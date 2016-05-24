.class public Lcom/facebook/FacebookServiceException;
.super Lcom/facebook/FacebookException;
.source "FacebookServiceException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final error:Lcom/facebook/FacebookRequestError;


# direct methods
.method public constructor <init>(Lcom/facebook/FacebookRequestError;Ljava/lang/String;)V
    .registers 3
    .param p1, "error"    # Lcom/facebook/FacebookRequestError;
    .param p2, "errorMessage"    # Ljava/lang/String;

    .prologue
    .line 34
    invoke-direct {p0, p2}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/String;)V

    .line 35
    iput-object p1, p0, Lcom/facebook/FacebookServiceException;->error:Lcom/facebook/FacebookRequestError;

    .line 36
    return-void
.end method


# virtual methods
.method public final getRequestError()Lcom/facebook/FacebookRequestError;
    .registers 2

    .prologue
    .line 44
    iget-object v0, p0, Lcom/facebook/FacebookServiceException;->error:Lcom/facebook/FacebookRequestError;

    return-object v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    const-string v1, "{FacebookServiceException: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 51
    const-string v1, "httpResponseCode: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 52
    iget-object v1, p0, Lcom/facebook/FacebookServiceException;->error:Lcom/facebook/FacebookRequestError;

    invoke-virtual {v1}, Lcom/facebook/FacebookRequestError;->getRequestStatusCode()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 53
    const-string v1, ", facebookErrorCode: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 54
    iget-object v1, p0, Lcom/facebook/FacebookServiceException;->error:Lcom/facebook/FacebookRequestError;

    invoke-virtual {v1}, Lcom/facebook/FacebookRequestError;->getErrorCode()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 55
    const-string v1, ", facebookErrorType: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 56
    iget-object v1, p0, Lcom/facebook/FacebookServiceException;->error:Lcom/facebook/FacebookRequestError;

    invoke-virtual {v1}, Lcom/facebook/FacebookRequestError;->getErrorType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 57
    const-string v1, ", message: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 58
    iget-object v1, p0, Lcom/facebook/FacebookServiceException;->error:Lcom/facebook/FacebookRequestError;

    invoke-virtual {v1}, Lcom/facebook/FacebookRequestError;->getErrorMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 59
    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 49
    return-object v0
.end method
