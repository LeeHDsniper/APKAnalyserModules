.class public abstract Lorg/apache/http/impl/auth/AuthSchemeBase;
.super Ljava/lang/Object;
.source "AuthSchemeBase.java"

# interfaces
.implements Lorg/apache/http/auth/ContextAwareAuthScheme;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private challengeState:Lorg/apache/http/auth/ChallengeState;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/auth/ChallengeState;)V
    .registers 2
    .param p1, "challengeState"    # Lorg/apache/http/auth/ChallengeState;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    iput-object p1, p0, Lorg/apache/http/impl/auth/AuthSchemeBase;->challengeState:Lorg/apache/http/auth/ChallengeState;

    .line 73
    return-void
.end method


# virtual methods
.method public authenticate(Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/Header;
    .registers 5
    .param p1, "credentials"    # Lorg/apache/http/auth/Credentials;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/auth/AuthenticationException;
        }
    .end annotation

    .prologue
    .line 136
    invoke-virtual {p0, p1, p2}, Lorg/apache/http/impl/auth/AuthSchemeBase;->authenticate(Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;)Lorg/apache/http/Header;

    move-result-object v0

    return-object v0
.end method

.method public getChallengeState()Lorg/apache/http/auth/ChallengeState;
    .registers 2

    .prologue
    .line 156
    iget-object v0, p0, Lorg/apache/http/impl/auth/AuthSchemeBase;->challengeState:Lorg/apache/http/auth/ChallengeState;

    return-object v0
.end method

.method public isProxy()Z
    .registers 3

    .prologue
    .line 147
    iget-object v0, p0, Lorg/apache/http/impl/auth/AuthSchemeBase;->challengeState:Lorg/apache/http/auth/ChallengeState;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lorg/apache/http/impl/auth/AuthSchemeBase;->challengeState:Lorg/apache/http/auth/ChallengeState;

    sget-object v1, Lorg/apache/http/auth/ChallengeState;->PROXY:Lorg/apache/http/auth/ChallengeState;

    if-ne v0, v1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method protected abstract parseChallenge(Lorg/apache/http/util/CharArrayBuffer;II)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/auth/MalformedChallengeException;
        }
    .end annotation
.end method

.method public processChallenge(Lorg/apache/http/Header;)V
    .registers 11
    .param p1, "header"    # Lorg/apache/http/Header;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/auth/MalformedChallengeException;
        }
    .end annotation

    .prologue
    .line 90
    const-string v6, "Header"

    invoke-static {p1, v6}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 91
    invoke-interface {p1}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v0

    .line 92
    .local v0, "authheader":Ljava/lang/String;
    const-string v6, "WWW-Authenticate"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_39

    .line 93
    sget-object v6, Lorg/apache/http/auth/ChallengeState;->TARGET:Lorg/apache/http/auth/ChallengeState;

    iput-object v6, p0, Lorg/apache/http/impl/auth/AuthSchemeBase;->challengeState:Lorg/apache/http/auth/ChallengeState;

    .line 102
    :goto_15
    instance-of v6, p1, Lorg/apache/http/FormattedHeader;

    if-eqz v6, :cond_5f

    move-object v6, p1

    .line 103
    check-cast v6, Lorg/apache/http/FormattedHeader;

    invoke-interface {v6}, Lorg/apache/http/FormattedHeader;->getBuffer()Lorg/apache/http/util/CharArrayBuffer;

    move-result-object v2

    .line 104
    .local v2, "buffer":Lorg/apache/http/util/CharArrayBuffer;
    check-cast p1, Lorg/apache/http/FormattedHeader;

    .end local p1    # "header":Lorg/apache/http/Header;
    invoke-interface {p1}, Lorg/apache/http/FormattedHeader;->getValuePos()I

    move-result v4

    .line 114
    .local v4, "pos":I
    :goto_26
    invoke-virtual {v2}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v6

    if-ge v4, v6, :cond_7b

    invoke-virtual {v2, v4}, Lorg/apache/http/util/CharArrayBuffer;->charAt(I)C

    move-result v6

    invoke-static {v6}, Lorg/apache/http/protocol/HTTP;->isWhitespace(C)Z

    move-result v6

    if-eqz v6, :cond_7b

    .line 115
    add-int/lit8 v4, v4, 0x1

    goto :goto_26

    .line 94
    .end local v2    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    .end local v4    # "pos":I
    .restart local p1    # "header":Lorg/apache/http/Header;
    :cond_39
    const-string v6, "Proxy-Authenticate"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_46

    .line 95
    sget-object v6, Lorg/apache/http/auth/ChallengeState;->PROXY:Lorg/apache/http/auth/ChallengeState;

    iput-object v6, p0, Lorg/apache/http/impl/auth/AuthSchemeBase;->challengeState:Lorg/apache/http/auth/ChallengeState;

    goto :goto_15

    .line 97
    :cond_46
    new-instance v6, Lorg/apache/http/auth/MalformedChallengeException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unexpected header name: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/apache/http/auth/MalformedChallengeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 106
    :cond_5f
    invoke-interface {p1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v5

    .line 107
    .local v5, "s":Ljava/lang/String;
    if-nez v5, :cond_6d

    .line 108
    new-instance v6, Lorg/apache/http/auth/MalformedChallengeException;

    const-string v7, "Header value is null"

    invoke-direct {v6, v7}, Lorg/apache/http/auth/MalformedChallengeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 110
    :cond_6d
    new-instance v2, Lorg/apache/http/util/CharArrayBuffer;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    invoke-direct {v2, v6}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    .line 111
    .restart local v2    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    invoke-virtual {v2, v5}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 112
    const/4 v4, 0x0

    .restart local v4    # "pos":I
    goto :goto_26

    .line 117
    .end local v5    # "s":Ljava/lang/String;
    .end local p1    # "header":Lorg/apache/http/Header;
    :cond_7b
    move v1, v4

    .line 118
    .local v1, "beginIndex":I
    :goto_7c
    invoke-virtual {v2}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v6

    if-ge v4, v6, :cond_8f

    invoke-virtual {v2, v4}, Lorg/apache/http/util/CharArrayBuffer;->charAt(I)C

    move-result v6

    invoke-static {v6}, Lorg/apache/http/protocol/HTTP;->isWhitespace(C)Z

    move-result v6

    if-nez v6, :cond_8f

    .line 119
    add-int/lit8 v4, v4, 0x1

    goto :goto_7c

    .line 121
    :cond_8f
    move v3, v4

    .line 122
    .local v3, "endIndex":I
    invoke-virtual {v2, v1, v3}, Lorg/apache/http/util/CharArrayBuffer;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 123
    .restart local v5    # "s":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/AuthSchemeBase;->getSchemeName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_b7

    .line 124
    new-instance v6, Lorg/apache/http/auth/MalformedChallengeException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Invalid scheme identifier: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/apache/http/auth/MalformedChallengeException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 127
    :cond_b7
    invoke-virtual {v2}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v6

    invoke-virtual {p0, v2, v4, v6}, Lorg/apache/http/impl/auth/AuthSchemeBase;->parseChallenge(Lorg/apache/http/util/CharArrayBuffer;II)V

    .line 128
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 161
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/AuthSchemeBase;->getSchemeName()Ljava/lang/String;

    move-result-object v0

    .line 162
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_d

    .line 163
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 165
    :goto_c
    return-object v1

    :cond_d
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method
