.class public Lorg/apache/http/impl/auth/NTLMScheme;
.super Lorg/apache/http/impl/auth/AuthSchemeBase;
.source "NTLMScheme.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/http/impl/auth/NTLMScheme$State;
    }
.end annotation

.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private challenge:Ljava/lang/String;

.field private final engine:Lorg/apache/http/impl/auth/NTLMEngine;

.field private state:Lorg/apache/http/impl/auth/NTLMScheme$State;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 77
    new-instance v0, Lorg/apache/http/impl/auth/NTLMEngineImpl;

    invoke-direct {v0}, Lorg/apache/http/impl/auth/NTLMEngineImpl;-><init>()V

    invoke-direct {p0, v0}, Lorg/apache/http/impl/auth/NTLMScheme;-><init>(Lorg/apache/http/impl/auth/NTLMEngine;)V

    .line 78
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/impl/auth/NTLMEngine;)V
    .registers 3
    .param p1, "engine"    # Lorg/apache/http/impl/auth/NTLMEngine;

    .prologue
    .line 66
    invoke-direct {p0}, Lorg/apache/http/impl/auth/AuthSchemeBase;-><init>()V

    .line 67
    const-string v0, "NTLM engine"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 68
    iput-object p1, p0, Lorg/apache/http/impl/auth/NTLMScheme;->engine:Lorg/apache/http/impl/auth/NTLMEngine;

    .line 69
    sget-object v0, Lorg/apache/http/impl/auth/NTLMScheme$State;->UNINITIATED:Lorg/apache/http/impl/auth/NTLMScheme$State;

    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMScheme;->state:Lorg/apache/http/impl/auth/NTLMScheme$State;

    .line 70
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMScheme;->challenge:Ljava/lang/String;

    .line 71
    return-void
.end method


# virtual methods
.method public authenticate(Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;)Lorg/apache/http/Header;
    .registers 14
    .param p1, "credentials"    # Lorg/apache/http/auth/Credentials;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/auth/AuthenticationException;
        }
    .end annotation

    .prologue
    .line 122
    const/4 v9, 0x0

    .line 124
    .local v9, "ntcredentials":Lorg/apache/http/auth/NTCredentials;
    :try_start_1
    move-object v0, p1

    check-cast v0, Lorg/apache/http/auth/NTCredentials;

    move-object v9, v0
    :try_end_5
    .catch Ljava/lang/ClassCastException; {:try_start_1 .. :try_end_5} :catch_14

    .line 130
    const/4 v10, 0x0

    .line 131
    .local v10, "response":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/http/impl/auth/NTLMScheme;->state:Lorg/apache/http/impl/auth/NTLMScheme$State;

    sget-object v2, Lorg/apache/http/impl/auth/NTLMScheme$State;->FAILED:Lorg/apache/http/impl/auth/NTLMScheme$State;

    if-ne v1, v2, :cond_36

    .line 132
    new-instance v1, Lorg/apache/http/auth/AuthenticationException;

    const-string v2, "NTLM authentication failed"

    invoke-direct {v1, v2}, Lorg/apache/http/auth/AuthenticationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 125
    .end local v10    # "response":Ljava/lang/String;
    :catch_14
    move-exception v8

    .line 126
    .local v8, "e":Ljava/lang/ClassCastException;
    new-instance v1, Lorg/apache/http/auth/InvalidCredentialsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Credentials cannot be used for NTLM authentication: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/http/auth/InvalidCredentialsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 133
    .end local v8    # "e":Ljava/lang/ClassCastException;
    .restart local v10    # "response":Ljava/lang/String;
    :cond_36
    iget-object v1, p0, Lorg/apache/http/impl/auth/NTLMScheme;->state:Lorg/apache/http/impl/auth/NTLMScheme$State;

    sget-object v2, Lorg/apache/http/impl/auth/NTLMScheme$State;->CHALLENGE_RECEIVED:Lorg/apache/http/impl/auth/NTLMScheme$State;

    if-ne v1, v2, :cond_6e

    .line 134
    iget-object v1, p0, Lorg/apache/http/impl/auth/NTLMScheme;->engine:Lorg/apache/http/impl/auth/NTLMEngine;

    invoke-virtual {v9}, Lorg/apache/http/auth/NTCredentials;->getDomain()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v9}, Lorg/apache/http/auth/NTCredentials;->getWorkstation()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lorg/apache/http/impl/auth/NTLMEngine;->generateType1Msg(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 137
    sget-object v1, Lorg/apache/http/impl/auth/NTLMScheme$State;->MSG_TYPE1_GENERATED:Lorg/apache/http/impl/auth/NTLMScheme$State;

    iput-object v1, p0, Lorg/apache/http/impl/auth/NTLMScheme;->state:Lorg/apache/http/impl/auth/NTLMScheme$State;

    .line 149
    :goto_4e
    new-instance v7, Lorg/apache/http/util/CharArrayBuffer;

    const/16 v1, 0x20

    invoke-direct {v7, v1}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    .line 150
    .local v7, "buffer":Lorg/apache/http/util/CharArrayBuffer;
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/NTLMScheme;->isProxy()Z

    move-result v1

    if-eqz v1, :cond_ac

    .line 151
    const-string v1, "Proxy-Authorization"

    invoke-virtual {v7, v1}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 155
    :goto_60
    const-string v1, ": NTLM "

    invoke-virtual {v7, v1}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 156
    invoke-virtual {v7, v10}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 157
    new-instance v1, Lorg/apache/http/message/BufferedHeader;

    invoke-direct {v1, v7}, Lorg/apache/http/message/BufferedHeader;-><init>(Lorg/apache/http/util/CharArrayBuffer;)V

    return-object v1

    .line 138
    .end local v7    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    :cond_6e
    iget-object v1, p0, Lorg/apache/http/impl/auth/NTLMScheme;->state:Lorg/apache/http/impl/auth/NTLMScheme$State;

    sget-object v2, Lorg/apache/http/impl/auth/NTLMScheme$State;->MSG_TYPE2_RECEVIED:Lorg/apache/http/impl/auth/NTLMScheme$State;

    if-ne v1, v2, :cond_91

    .line 139
    iget-object v1, p0, Lorg/apache/http/impl/auth/NTLMScheme;->engine:Lorg/apache/http/impl/auth/NTLMEngine;

    invoke-virtual {v9}, Lorg/apache/http/auth/NTCredentials;->getUserName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v9}, Lorg/apache/http/auth/NTCredentials;->getPassword()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v9}, Lorg/apache/http/auth/NTCredentials;->getDomain()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v9}, Lorg/apache/http/auth/NTCredentials;->getWorkstation()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/http/impl/auth/NTLMScheme;->challenge:Ljava/lang/String;

    invoke-interface/range {v1 .. v6}, Lorg/apache/http/impl/auth/NTLMEngine;->generateType3Msg(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 145
    sget-object v1, Lorg/apache/http/impl/auth/NTLMScheme$State;->MSG_TYPE3_GENERATED:Lorg/apache/http/impl/auth/NTLMScheme$State;

    iput-object v1, p0, Lorg/apache/http/impl/auth/NTLMScheme;->state:Lorg/apache/http/impl/auth/NTLMScheme$State;

    goto :goto_4e

    .line 147
    :cond_91
    new-instance v1, Lorg/apache/http/auth/AuthenticationException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/http/impl/auth/NTLMScheme;->state:Lorg/apache/http/impl/auth/NTLMScheme$State;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/http/auth/AuthenticationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 153
    .restart local v7    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    :cond_ac
    const-string v1, "Authorization"

    invoke-virtual {v7, v1}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    goto :goto_60
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 86
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRealm()Ljava/lang/String;
    .registers 2

    .prologue
    .line 91
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSchemeName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 81
    const-string v0, "ntlm"

    return-object v0
.end method

.method public isComplete()Z
    .registers 3

    .prologue
    .line 161
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMScheme;->state:Lorg/apache/http/impl/auth/NTLMScheme$State;

    sget-object v1, Lorg/apache/http/impl/auth/NTLMScheme$State;->MSG_TYPE3_GENERATED:Lorg/apache/http/impl/auth/NTLMScheme$State;

    if-eq v0, v1, :cond_c

    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMScheme;->state:Lorg/apache/http/impl/auth/NTLMScheme$State;

    sget-object v1, Lorg/apache/http/impl/auth/NTLMScheme$State;->FAILED:Lorg/apache/http/impl/auth/NTLMScheme$State;

    if-ne v0, v1, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isConnectionBased()Z
    .registers 2

    .prologue
    .line 95
    const/4 v0, 0x1

    return v0
.end method

.method protected parseChallenge(Lorg/apache/http/util/CharArrayBuffer;II)V
    .registers 6
    .param p1, "buffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "beginIndex"    # I
    .param p3, "endIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/auth/MalformedChallengeException;
        }
    .end annotation

    .prologue
    .line 102
    invoke-virtual {p1, p2, p3}, Lorg/apache/http/util/CharArrayBuffer;->substringTrimmed(II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMScheme;->challenge:Ljava/lang/String;

    .line 103
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMScheme;->challenge:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1e

    .line 104
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMScheme;->state:Lorg/apache/http/impl/auth/NTLMScheme$State;

    sget-object v1, Lorg/apache/http/impl/auth/NTLMScheme$State;->UNINITIATED:Lorg/apache/http/impl/auth/NTLMScheme$State;

    if-ne v0, v1, :cond_19

    .line 105
    sget-object v0, Lorg/apache/http/impl/auth/NTLMScheme$State;->CHALLENGE_RECEIVED:Lorg/apache/http/impl/auth/NTLMScheme$State;

    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMScheme;->state:Lorg/apache/http/impl/auth/NTLMScheme$State;

    .line 117
    :cond_18
    :goto_18
    return-void

    .line 107
    :cond_19
    sget-object v0, Lorg/apache/http/impl/auth/NTLMScheme$State;->FAILED:Lorg/apache/http/impl/auth/NTLMScheme$State;

    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMScheme;->state:Lorg/apache/http/impl/auth/NTLMScheme$State;

    goto :goto_18

    .line 110
    :cond_1e
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMScheme;->state:Lorg/apache/http/impl/auth/NTLMScheme$State;

    sget-object v1, Lorg/apache/http/impl/auth/NTLMScheme$State;->MSG_TYPE1_GENERATED:Lorg/apache/http/impl/auth/NTLMScheme$State;

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/auth/NTLMScheme$State;->compareTo(Ljava/lang/Enum;)I

    move-result v0

    if-gez v0, :cond_34

    .line 111
    sget-object v0, Lorg/apache/http/impl/auth/NTLMScheme$State;->FAILED:Lorg/apache/http/impl/auth/NTLMScheme$State;

    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMScheme;->state:Lorg/apache/http/impl/auth/NTLMScheme$State;

    .line 112
    new-instance v0, Lorg/apache/http/auth/MalformedChallengeException;

    const-string v1, "Out of sequence NTLM response message"

    invoke-direct {v0, v1}, Lorg/apache/http/auth/MalformedChallengeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 113
    :cond_34
    iget-object v0, p0, Lorg/apache/http/impl/auth/NTLMScheme;->state:Lorg/apache/http/impl/auth/NTLMScheme$State;

    sget-object v1, Lorg/apache/http/impl/auth/NTLMScheme$State;->MSG_TYPE1_GENERATED:Lorg/apache/http/impl/auth/NTLMScheme$State;

    if-ne v0, v1, :cond_18

    .line 114
    sget-object v0, Lorg/apache/http/impl/auth/NTLMScheme$State;->MSG_TYPE2_RECEVIED:Lorg/apache/http/impl/auth/NTLMScheme$State;

    iput-object v0, p0, Lorg/apache/http/impl/auth/NTLMScheme;->state:Lorg/apache/http/impl/auth/NTLMScheme$State;

    goto :goto_18
.end method
