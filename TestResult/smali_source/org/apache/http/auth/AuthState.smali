.class public Lorg/apache/http/auth/AuthState;
.super Ljava/lang/Object;
.source "AuthState.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private authOptions:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lorg/apache/http/auth/AuthOption;",
            ">;"
        }
    .end annotation
.end field

.field private authScheme:Lorg/apache/http/auth/AuthScheme;

.field private authScope:Lorg/apache/http/auth/AuthScope;

.field private credentials:Lorg/apache/http/auth/Credentials;

.field private state:Lorg/apache/http/auth/AuthProtocolState;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    sget-object v0, Lorg/apache/http/auth/AuthProtocolState;->UNCHALLENGED:Lorg/apache/http/auth/AuthProtocolState;

    iput-object v0, p0, Lorg/apache/http/auth/AuthState;->state:Lorg/apache/http/auth/AuthProtocolState;

    .line 60
    return-void
.end method


# virtual methods
.method public getAuthOptions()Ljava/util/Queue;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Queue",
            "<",
            "Lorg/apache/http/auth/AuthOption;",
            ">;"
        }
    .end annotation

    .prologue
    .line 125
    iget-object v0, p0, Lorg/apache/http/auth/AuthState;->authOptions:Ljava/util/Queue;

    return-object v0
.end method

.method public getAuthScheme()Lorg/apache/http/auth/AuthScheme;
    .registers 2

    .prologue
    .line 93
    iget-object v0, p0, Lorg/apache/http/auth/AuthState;->authScheme:Lorg/apache/http/auth/AuthScheme;

    return-object v0
.end method

.method public getAuthScope()Lorg/apache/http/auth/AuthScope;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 207
    iget-object v0, p0, Lorg/apache/http/auth/AuthState;->authScope:Lorg/apache/http/auth/AuthScope;

    return-object v0
.end method

.method public getCredentials()Lorg/apache/http/auth/Credentials;
    .registers 2

    .prologue
    .line 100
    iget-object v0, p0, Lorg/apache/http/auth/AuthState;->credentials:Lorg/apache/http/auth/Credentials;

    return-object v0
.end method

.method public getState()Lorg/apache/http/auth/AuthProtocolState;
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Lorg/apache/http/auth/AuthState;->state:Lorg/apache/http/auth/AuthProtocolState;

    return-object v0
.end method

.method public hasAuthOptions()Z
    .registers 2

    .prologue
    .line 135
    iget-object v0, p0, Lorg/apache/http/auth/AuthState;->authOptions:Ljava/util/Queue;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lorg/apache/http/auth/AuthState;->authOptions:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public invalidate()V
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 159
    invoke-virtual {p0}, Lorg/apache/http/auth/AuthState;->reset()V

    .line 160
    return-void
.end method

.method public isValid()Z
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 167
    iget-object v0, p0, Lorg/apache/http/auth/AuthState;->authScheme:Lorg/apache/http/auth/AuthScheme;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public reset()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 68
    sget-object v0, Lorg/apache/http/auth/AuthProtocolState;->UNCHALLENGED:Lorg/apache/http/auth/AuthProtocolState;

    iput-object v0, p0, Lorg/apache/http/auth/AuthState;->state:Lorg/apache/http/auth/AuthProtocolState;

    .line 69
    iput-object v1, p0, Lorg/apache/http/auth/AuthState;->authOptions:Ljava/util/Queue;

    .line 70
    iput-object v1, p0, Lorg/apache/http/auth/AuthState;->authScheme:Lorg/apache/http/auth/AuthScheme;

    .line 71
    iput-object v1, p0, Lorg/apache/http/auth/AuthState;->authScope:Lorg/apache/http/auth/AuthScope;

    .line 72
    iput-object v1, p0, Lorg/apache/http/auth/AuthState;->credentials:Lorg/apache/http/auth/Credentials;

    .line 73
    return-void
.end method

.method public setAuthScheme(Lorg/apache/http/auth/AuthScheme;)V
    .registers 2
    .param p1, "authScheme"    # Lorg/apache/http/auth/AuthScheme;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 179
    if-nez p1, :cond_6

    .line 180
    invoke-virtual {p0}, Lorg/apache/http/auth/AuthState;->reset()V

    .line 184
    :goto_5
    return-void

    .line 183
    :cond_6
    iput-object p1, p0, Lorg/apache/http/auth/AuthState;->authScheme:Lorg/apache/http/auth/AuthScheme;

    goto :goto_5
.end method

.method public setAuthScope(Lorg/apache/http/auth/AuthScope;)V
    .registers 2
    .param p1, "authScope"    # Lorg/apache/http/auth/AuthScope;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 219
    iput-object p1, p0, Lorg/apache/http/auth/AuthState;->authScope:Lorg/apache/http/auth/AuthScope;

    .line 220
    return-void
.end method

.method public setCredentials(Lorg/apache/http/auth/Credentials;)V
    .registers 2
    .param p1, "credentials"    # Lorg/apache/http/auth/Credentials;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 195
    iput-object p1, p0, Lorg/apache/http/auth/AuthState;->credentials:Lorg/apache/http/auth/Credentials;

    .line 196
    return-void
.end method

.method public setState(Lorg/apache/http/auth/AuthProtocolState;)V
    .registers 2
    .param p1, "state"    # Lorg/apache/http/auth/AuthProtocolState;

    .prologue
    .line 86
    if-eqz p1, :cond_5

    .end local p1    # "state":Lorg/apache/http/auth/AuthProtocolState;
    :goto_2
    iput-object p1, p0, Lorg/apache/http/auth/AuthState;->state:Lorg/apache/http/auth/AuthProtocolState;

    .line 87
    return-void

    .line 86
    .restart local p1    # "state":Lorg/apache/http/auth/AuthProtocolState;
    :cond_5
    sget-object p1, Lorg/apache/http/auth/AuthProtocolState;->UNCHALLENGED:Lorg/apache/http/auth/AuthProtocolState;

    goto :goto_2
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 224
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 225
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const-string v1, "state:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/http/auth/AuthState;->state:Lorg/apache/http/auth/AuthProtocolState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ";"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    iget-object v1, p0, Lorg/apache/http/auth/AuthState;->authScheme:Lorg/apache/http/auth/AuthScheme;

    if-eqz v1, :cond_2f

    .line 227
    const-string v1, "auth scheme:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/http/auth/AuthState;->authScheme:Lorg/apache/http/auth/AuthScheme;

    invoke-interface {v2}, Lorg/apache/http/auth/AuthScheme;->getSchemeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ";"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    :cond_2f
    iget-object v1, p0, Lorg/apache/http/auth/AuthState;->credentials:Lorg/apache/http/auth/Credentials;

    if-eqz v1, :cond_38

    .line 230
    const-string v1, "credentials present"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    :cond_38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public update(Ljava/util/Queue;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Queue",
            "<",
            "Lorg/apache/http/auth/AuthOption;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "authOptions":Ljava/util/Queue;, "Ljava/util/Queue<Lorg/apache/http/auth/AuthOption;>;"
    const/4 v1, 0x0

    .line 146
    const-string v0, "Queue of auth options"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notEmpty(Ljava/util/Collection;Ljava/lang/String;)Ljava/util/Collection;

    .line 147
    iput-object p1, p0, Lorg/apache/http/auth/AuthState;->authOptions:Ljava/util/Queue;

    .line 148
    iput-object v1, p0, Lorg/apache/http/auth/AuthState;->authScheme:Lorg/apache/http/auth/AuthScheme;

    .line 149
    iput-object v1, p0, Lorg/apache/http/auth/AuthState;->credentials:Lorg/apache/http/auth/Credentials;

    .line 150
    return-void
.end method

.method public update(Lorg/apache/http/auth/AuthScheme;Lorg/apache/http/auth/Credentials;)V
    .registers 4
    .param p1, "authScheme"    # Lorg/apache/http/auth/AuthScheme;
    .param p2, "credentials"    # Lorg/apache/http/auth/Credentials;

    .prologue
    .line 112
    const-string v0, "Auth scheme"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 113
    const-string v0, "Credentials"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 114
    iput-object p1, p0, Lorg/apache/http/auth/AuthState;->authScheme:Lorg/apache/http/auth/AuthScheme;

    .line 115
    iput-object p2, p0, Lorg/apache/http/auth/AuthState;->credentials:Lorg/apache/http/auth/Credentials;

    .line 116
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/auth/AuthState;->authOptions:Ljava/util/Queue;

    .line 117
    return-void
.end method
