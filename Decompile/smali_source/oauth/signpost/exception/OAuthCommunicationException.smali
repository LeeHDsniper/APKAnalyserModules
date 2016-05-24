.class public Loauth/signpost/exception/OAuthCommunicationException;
.super Loauth/signpost/exception/OAuthException;
.source "OAuthCommunicationException.java"


# instance fields
.field private responseBody:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Exception;)V
    .registers 4
    .param p1, "cause"    # Ljava/lang/Exception;

    .prologue
    .line 23
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Communication with the service provider failed: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Loauth/signpost/exception/OAuthException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 25
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "responseBody"    # Ljava/lang/String;

    .prologue
    .line 28
    invoke-direct {p0, p1}, Loauth/signpost/exception/OAuthException;-><init>(Ljava/lang/String;)V

    .line 29
    iput-object p2, p0, Loauth/signpost/exception/OAuthCommunicationException;->responseBody:Ljava/lang/String;

    .line 30
    return-void
.end method
